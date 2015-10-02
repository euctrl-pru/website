(function() {
   var dataFile    = 'hfe.json'; // HACK: It's CSV, but GitHub Pages only gzip's JSON at the moment.)
   var years;    // the years in the dataset
   var entities; // the entity names in the dataset
   var models;   // the flight profile model types in the dataset
   var data;
   var loading = d3.selectAll("#loading");

   function filteredCSV(data) {
      var fields = [
         "YEAR",
         "MONTH_NUM",
         "MONTH_MON",
         "ENTRY_DATE",
         "ENTITY_NAME",
         "ENTITY_TYPE",
         "TYPE_MODEL",
         "DIST_FLOWN_KM",
         "DIST_ACHIEVED_KM",
         "T10_RUN_12M",
         "T10_YYYY"
      ];

      json2csv({ data: data, fields: fields }, function(err, csv) {
         if (err) console.log(err);
         var blob = new Blob([csv], {type: "text/csv"});
         saveAs(blob, "horizontal_flight_efficiency.csv");
      });
   }


   queue()
      .defer(d3.csv, dataFile)
      .await(function(error, hfe) {
         var dateFormat = d3.time.format("%m-%Y"),
         fullDateFormat = d3.time.format("%d-%b-%y");

         hfe.forEach(function(d, i) {
            d.YEAR = +d.YEAR;
            d.MONTH_NUM = +d.MONTH_NUM;
            // ENTRY_DATE stays like read, for CSV save not having to format it.
            d.date = fullDateFormat.parse(d.ENTRY_DATE);
            d.ENTITY_NAME = d.ENTITY_NAME ? d.ENTITY_NAME.trim() : '';
            d.ENTITY_NAME = d.ENTITY_NAME.length ? d.ENTITY_NAME : 'ZZZ';
            d.ENTITY_TYPE = d.ENTITY_TYPE ? d.ENTITY_TYPE.trim() : '';
            d.ENTITY_TYPE = d.ENTITY_TYPE.length ? d.ENTITY_TYPE : 'ZZZ';
            d.DIST_FLOWN_KM = d.DIST_FLOWN_KM ? +d.DIST_FLOWN_KM : 0;
            d.DIST_ACHIEVED_KM = d.DIST_ACHIEVED_KM ? +d.DIST_ACHIEVED_KM: 0;
         });

         var xf = crossfilter(hfe);
         var all = xf.groupAll();
         var hfeDate = xf.dimension(function(d){return d.date;});

         var hfeYear = xf.dimension(function(d){return d.YEAR;});
         var hfeYearGroup = hfeYear.group(Math.floor);

         var hfeEntity = xf.dimension(function(d){return d.ENTITY_NAME;});
         var hfeEntityGroup = hfeEntity.group();

         var hfeModel = xf.dimension(function(d){return d.TYPE_MODEL;});
         var hfeModelGroup = hfeModel.group();


         // YEARS DROPDOWN
         // add an "All Years" item to the year dropdown menu
         d3.select("#hfe-year")
            .append("option")
            .text("All Years")
            .attr("value", "-1");

         // fill the year dropdown menu with the available years from the dataset
         years = _.pluck(hfeYearGroup.top(Infinity),"key");
         years.sort();
         years = years.map(function(d,i){return {id: i, 'text': d};});
         $("#hfe-year").select2({
            data: years,
            minimumResultsForSearch: Infinity
         });

         // call filterByYear when a new selection is made
         $("#hfe-year").on("change", function() {
            filterByYear(this.value);
         });

         // Entities DROPDOWN
         // add an "All Countries" item to the ansps dropdown menu
         d3.select("#hfe-entity")
            .append("option")
            .text("All Entities")
            .attr("value", "-1");

         // fill the entities dropdown menu with the available entity names from the dataset
         entities = _.pluck(hfeEntityGroup.top(Infinity),"key");
         entities.sort();
         entities = entities.map(function(d,i){return {id: i, 'text': d};});
         $("#hfe-entity").select2({
            data: entities
         });

         // call filterByEntity when a new selection is made
         $("#hfe-entity").on("change", function() {
            filterByEntity(this.value);
         });

         // Models DROPDOWN
         // add an "All Profile Models" item to the models dropdown menu
         d3.select("#hfe-model")
            .append("option")
            .text("All Profile Models")
            .attr("value", "-1");

         // fill the model dropdown menu with the available models from the dataset
         models = _.pluck(hfeModelGroup.top(Infinity),"key");
         models.sort();
         models = models.map(function(d,i){return {id: i, 'text': d};});
         $("#hfe-model").select2({
            data: models
         });

         // call filterByModel when a new selection is made
         $("#hfe-model").on("change", function() {
            filterByModel(this.value);
         });


         loading.classed("hidden", true);


         // create a table to preview (a subset of) the filtered values
         var format = d3.format('02d');
         var dataTable = dc.dataTable('#hfe-data-table')
            .dimension(hfeDate)
            .group(function (d) {
               var format = d3.format('02d');
               return d.date.getFullYear() + '/' + format((d.date.getMonth() + 1));
            })
            .size(12) // (optional) max number of records to be shown, :default = 25
            .columns([
               {
                  label: 'YYYY/MM',
                  format: function (d) {
                     return d.date.getFullYear() + '/' + format((d.date.getMonth() + 1));
                  }
               },
               {
                  label: 'Date',
                  format: function (d) {
                     return d.ENTRY_DATE;
                  }
               },
               {
                  label: 'Entity',
                  format: function (d) {
                     return d.ENTITY_NAME;
                  }
               },
               "ENTITY_TYPE",
               "TYPE_MODEL",
               "DIST_FLOWN_KM",
               "DIST_ACHIEVED_KM",
               "T10_RUN_12M",
               "T10_YYYY"
            ])
            .sortBy(function (d) {
               return d.date;
            })
            .order(d3.ascending);

      dc.dataCount('.dc-data-count')
         .dimension(xf)
         .group(all)
         // (optional) html, for setting different html for some records and all records.
         // .html replaces everything in the anchor with the html given using the following function.
         // %filter-count and %total-count are replaced with the values obtained.
         .html({
            some:'<strong>%filter-count</strong> selected out of <strong>%total-count</strong> records' +
            ' (only a max of <em>' + dataTable.size() + '</em> shown below.)',
            all:'All <strong>%total-count</strong> records selected'+
            ' (only a max of <em>' + dataTable.size() + '</em> shown below.)'
         });


      dc.renderAll();

      // TODO: finde a better place!
      // action linked to 'Download button'
      $(document).ready(function() {
         $("#hfe-download").click(function() {
            filteredCSV(hfeYear.top(Infinity));
         })
      });

      function filterByYear(val) {
         hfeYear.filterAll();
         if (val == -1) {
         }
         else {
            hfeYear.filter(function(d) {return d == +years[val].text});
         }
         dc.redrawAll();
      }

      function filterByEntity(val) {
         hfeEntity.filterAll();
         if (val == -1) {
         }
         else {
            hfeEntity.filter(function(d) {return d === entities[val].text});
         }
         dc.redrawAll();
      }

      function filterByModel(val) {
         hfeModel.filterAll();
         if (val == -1) {
         }
         else {
            hfeModel.filter(function(d) {return d === models[val].text});
         }
         dc.redrawAll();
      }
   });
})();
