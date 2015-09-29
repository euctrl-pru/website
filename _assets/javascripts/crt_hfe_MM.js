(function() {
   function dv() {
      // ENVIRONMENT - Horizontal flight efficiency - MM - CHART
      var crt_hfe_MM = new google.visualization.ChartWrapper(
         {
            chartType: 'LineChart',
            containerId: 'crt_hfe_MM',
            dataSourceUrl: 'https://docs.google.com/spreadsheets/d/1KgOIBF93axvXD6ENQYvEsWHqnA8eW_RvGV4EQlGava4/edit?usp=sharing&sheet=HFE_MM&range=A1:H25&tq=where%20A%3D1',
            options: {
               chartArea: { left: 50, top: 20, width: '55%', height: '60%' },
                  title: 'Horiz. en-route flight eff. (monthly)',
                  titleTextStyle: { color: 'grey', fontSize: 11 },
                  legend: {
                     position: 'right',
                     textStyle: { color: 'grey', fontSize: 10 }
                  },
                  series: {
                     0: {
                        type: 'lines',
                        color: '#5D7CBA',
                        lineWidth: 1,
                        pointSize: 3
                     },
                     1: {
                        type: 'lines',
                        color: '#C0504D',
                        lineWidth: 1,
                        pointSize: 3,
                        pointShape: 'diamond'
                     },
                     2: {
                        type: 'lines',
                        color: '#5D7CBA',
                        lineWidth: 2,
                        pointSize: 3,
                        lineDashStyle: [6, 3]
                     },
                     3: {
                        type: 'lines',
                        color:'#C0504D',
                        lineWidth: 2,
                        pointSize: 3,
                        lineDashStyle: [6, 3],
                        pointShape:'diamond'
                     }
                  },
               vAxis: {
                  title: 'inefficiency (%)',
                  titleTextStyle: { color: 'grey', fontSize: 10 },
                  minValue: 0.0,
                  maxValue: 0.06,
                  viewWindow: { min: 0.02, max: 0.05 },
                  format: '0.0%'
               },
               hAxis: {
                  title: 'Source: PRU Analysis',
                  titleTextStyle: { color: 'grey', fontSize: 10 },
                  type: 'string',
                  slantedTextAngle: 90,
                  textStyle: { fontSize: 11 }
               }
            },
            view: { 'columns': [1, 2, 3, 6, 7] }
         }
      );
      crt_hfe_MM.draw();
   }

   google.setOnLoadCallback(dv);
})();
