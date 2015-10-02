(function() {
   var dataFile    = 'apt_dly.json'; // HACK: It's CSV, but GitHub Pages only gzip's JSON at the moment.)
   var years; // the years in the dataset
   var countries; // the country names in the dataset
   var airports; // the (ICAO) airport IDs in the dataset
   var data;
   var loading = d3.selectAll("#loading");

   function filteredCSV(data) {
      var fields = [
         "YEAR",
         "MONTH_NUM",
         "MONTH_MON",
         "FLT_DATE",
         "APT_ICAO",
         "APT_NAME",
         "STATE_NAME",
         "FLT_ARR_1",
         "DLY_APT_1",
         "DLY_APT_ARR_A_1",
         "DLY_APT_ARR_C_1",
         "DLY_APT_ARR_D_1",
         "DLY_APT_ARR_E_1",
         "DLY_APT_ARR_G_1",
         "DLY_APT_ARR_I_1",
         "DLY_APT_ARR_M_1",
         "DLY_APT_ARR_N_1",
         "DLY_APT_ARR_O_1",
         "DLY_APT_ARR_P_1",
         "DLY_APT_ARR_R_1",
         "DLY_APT_ARR_S_1",
         "DLY_APT_ARR_T_1",
         "DLY_APT_ARR_V_1",
         "DLY_APT_ARR_W_1",
         "DLY_APT_ARR_NA_1"
      ];

      json2csv({ data: data, fields: fields }, function(err, csv) {
         if (err) console.log(err);
         var blob = new Blob([csv], {type: "text/csv"});
         saveAs(blob, "arrival_atfcm_delay.csv");
      });
   }


   queue()
      .defer(d3.csv, dataFile)
      .await(function(error, arr) {
         var dateFormat = d3.time.format("%m-%Y"),
         fullDateFormat = d3.time.format("%d-%b-%y");

         arr.forEach(function(d, i) {
            d.YEAR = +d.YEAR;
            d.MONTH_NUM = +d.MONTH_NUM;
            // d.FLT_DATE stays a string as read from file
            d.date = fullDateFormat.parse(d.FLT_DATE);
            d.APT_NAME = d.APT_NAME ? d.APT_NAME.trim() : '';
            d.APT_NAME = d.APT_NAME.length ? d.APT_NAME : 'ZZZ';
            d.APT_ICAO = d.APT_ICAO ? d.APT_ICAO : 'ZZZZ';
            d.STATE_NAME = d.STATE_NAME ? d.STATE_NAME.trim() : '';
            d.STATE_NAME = d.STATE_NAME.length ? d.STATE_NAME : 'ZZZ';
            d.FLT_ARR_1 = d.FLT_ARR_1 ? +d.FLT_ARR_1 : 0;
            d.DLY_APT_1 = d.DLY_APT_1 ? +d.DLY_APT_1: 0;
            d.DLY_APT_ARR_A_1 = d.DLY_APT_ARR_A_1 ? +d.DLY_APT_ARR_A_1 : 0;
            d.DLY_APT_ARR_C_1 = d.DLY_APT_ARR_C_1 ? +d.DLY_APT_ARR_C_1 : 0;
            d.DLY_APT_ARR_D_1 = d.DLY_APT_ARR_D_1 ? +d.DLY_APT_ARR_D_1 : 0;
            d.DLY_APT_ARR_E_1 = d.DLY_APT_ARR_E_1 ? +d.DLY_APT_ARR_E_1 : 0;
            d.DLY_APT_ARR_G_1 = d.DLY_APT_ARR_G_1 ? +d.DLY_APT_ARR_G_1 : 0;
            d.DLY_APT_ARR_I_1 = d.DLY_APT_ARR_I_1 ? +d.DLY_APT_ARR_I_1 : 0;
            d.DLY_APT_ARR_M_1 = d.DLY_APT_ARR_M_1 ? +d.DLY_APT_ARR_M_1 : 0;
            d.DLY_APT_ARR_N_1 = d.DLY_APT_ARR_N_1 ? +d.DLY_APT_ARR_N_1 : 0;
            d.DLY_APT_ARR_O_1 = d.DLY_APT_ARR_O_1 ? +d.DLY_APT_ARR_O_1 : 0;
            d.DLY_APT_ARR_P_1 = d.DLY_APT_ARR_P_1 ? +d.DLY_APT_ARR_P_1 : 0;
            d.DLY_APT_ARR_R_1 = d.DLY_APT_ARR_R_1 ? +d.DLY_APT_ARR_R_1 : 0;
            d.DLY_APT_ARR_S_1 = d.DLY_APT_ARR_S_1 ? +d.DLY_APT_ARR_S_1 : 0;
            d.DLY_APT_ARR_T_1 = d.DLY_APT_ARR_T_1 ? +d.DLY_APT_ARR_T_1 : 0;
            d.DLY_APT_ARR_V_1 = d.DLY_APT_ARR_V_1 ? +d.DLY_APT_ARR_V_1 : 0;
            d.DLY_APT_ARR_W_1 = d.DLY_APT_ARR_W_1 ? +d.DLY_APT_ARR_W_1 : 0;
            d.DLY_APT_ARR_NA_1 = d.DLY_APT_ARR_NA_1 ? +d.DLY_APT_ARR_NA_1 : 0;
         });

         var xf = crossfilter(arr);
         var all = xf.groupAll();
         var arrDate = xf.dimension(function(d){return d.date;});

         var arrYear = xf.dimension(function(d){return d.YEAR;});
         var arrYearGroup = arrYear.group(Math.floor);

         var arrCountry = xf.dimension(function(d){return d.STATE_NAME;});
         var arrCountryGroup = arrCountry.group();

         var arrAirport = xf.dimension(function(d){return d.APT_ICAO;});
         var arrAirportGroup = arrAirport.group();


         // YEARS DROPDOWN
         // add an "All Years" item to the year dropdown menu
         d3.select("#arr-year")
            .append("option")
            .text("All Years")
            .attr("value", "-1");

         // fill the year dropdown menu with the available years from the dataset
         years = _.pluck(arrYearGroup.top(Infinity),"key");
         years.sort();
         years = years.map(function(d,i){return {id: i, 'text': d};});
         $("#arr-year").select2({
            data: years,
            minimumResultsForSearch: Infinity
         });

         // call filterByYear when a new selection is made
         $("#arr-year").on("change", function() {
            filterByYear(this.value);
         });

         // Countries DROPDOWN
         // add an "All Countries" item to the ansps dropdown menu
         d3.select("#arr-country")
            .append("option")
            .text("All Countries")
            .attr("value", "-1");

         // fill the countries dropdown menu with the available country names from the dataset
         countries = _.pluck(arrCountryGroup.top(Infinity),"key");
         countries.sort();
         countries = countries.map(function(d,i){return {id: i, 'text': d};});
         $("#arr-country").select2({
            data: countries
         });

         // call filterByCountry when a new selection is made
         $("#arr-country").on("change", function() {
            filterByCountry(this.value);
         });

         // AIRPORTS DROPDOWN
         // add an "All Airports" item to the airports dropdown menu
         d3.select("#arr-apt")
            .append("option")
            .text("All Airports")
            .attr("value", "-1");

         // fill the year dropdown menu with the available years from the dataset
         airports = _.pluck(arrAirportGroup.top(Infinity),"key");
         airports.sort();
         airports = airports.map(function(d,i){return {id: i, 'text': d};});
         $("#arr-apt").select2({
            data: airports
         });

         // call filterByAirport when a new selection is made
         $("#arr-apt").on("change", function() {
            filterByAirport(this.value);
         });


         loading.classed("hidden", true);


         // create a table to preview (a subset of) the filtered values
         var format = d3.format('02d');
         var dataTable = dc.dataTable('#arr-data-table')
            .dimension(arrDate)
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
               label: 'Country',
               format: function (d) {
                  return d.STATE_NAME;
               }
            },
            "FLT_DATE",
            "APT_ICAO",
            "APT_NAME",
            "FLT_ARR_1",
            "DLY_APT_1",
            "DLY_APT_ARR_A_1",
            "DLY_APT_ARR_C_1",
            "DLY_APT_ARR_D_1",
            "DLY_APT_ARR_E_1",
            "DLY_APT_ARR_G_1",
            "DLY_APT_ARR_I_1",
            "DLY_APT_ARR_M_1",
            "DLY_APT_ARR_N_1",
            "DLY_APT_ARR_O_1",
            "DLY_APT_ARR_P_1",
            "DLY_APT_ARR_R_1",
            "DLY_APT_ARR_S_1",
            "DLY_APT_ARR_T_1",
            "DLY_APT_ARR_V_1",
            "DLY_APT_ARR_W_1",
            "DLY_APT_ARR_NA_1"
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
         $("#arr-download").click(function() {
            filteredCSV(arrYear.top(Infinity));
         })
      });

      function filterByYear(val) {
         arrYear.filterAll();
         if (val == -1) {
         }
         else {
            arrYear.filter(function(d) {return d == +years[val].text});
         }
         dc.redrawAll();
      }

      function filterByCountry(val) {
         arrCountry.filterAll();
         if (val == -1) {
         }
         else {
            arrCountry.filter(function(d) {return d === countries[val].text});
         }
         dc.redrawAll();
      }

      function filterByAirport(val) {
         arrAirport.filterAll();
         if (val == -1) {
         }
         else {
            arrAirport.filter(function(d) {return d === airports[val].text});
         }
         dc.redrawAll();
      }
   });
})();
