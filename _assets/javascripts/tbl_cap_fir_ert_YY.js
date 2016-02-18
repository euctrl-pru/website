(function() {
  var data;
  var twodecimals = d3.format(".2n");
  d3.text("/data/set/ert_flt/En-Route_Traffic_FAB_FIR.csv", function(text) {
    var csvArray = d3.csv.parseRows(text, function (d, i) {
      if (i === 0) {
          return ["Year","FAB","Flights","Delay [min.]", "Avg. per Flight"];
      }
      d[0] = +d[0]; // YYYY
      d[2] = +d[2]; // # of flights
      d[3] = +d[3]; // total minutes of delay
      var avg = d[2] == 0 ? 0 : d[3] / d[2];

      return [
        d[0],
        d[1],
        d[2],
        d[3],
        twodecimals(avg)
      ];
    });

    data = new google.visualization.arrayToDataTable(csvArray);
  });

  function dv() {
    // CAPACITY - En-route ATFM delays FAB (FIR) - TABLE
    var tbl_cap_fir_ert_YY = new google.visualization.ChartWrapper({
      chartType: 'Table',
      containerId: 'tbl_cap_fir_ert_YY',
      dataTable: data,
      options: {
          // allowHtml: true,
          width: 550,
          height: 240,
          sort: 'enable',
          sortColumn: 0,
          sortAscending: false
      },
        view: { columns: [0, 1, 2, 3, 4] }
    });
    tbl_cap_fir_ert_YY.draw();
  }

  google.setOnLoadCallback(dv);
})();
