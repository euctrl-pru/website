(function() {
  var data;
  d3.text("/data/set/ert_flt/En-Route_Traffic_FAB_FIR.csv", function(text) {
    var csvArray = d3.csv.parseRows(text, function (d, i) {
      if (i === 0) {
        return d;
      }
      d[1] = +d[1];
      d[2] = +d[2];
      d[3] = +d[3];
      return d;
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
        //allowHtml: true,
        width: 550,
        height: 240,
      },
      view: { columns: [0, 1, 2, 3] }
    });
    tbl_cap_fir_ert_YY.draw();
  }

  google.setOnLoadCallback(dv);
})();
