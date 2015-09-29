(function() {
   function dv() {
      // TRAFFIC - En route service units - MM - CHART
      var crt_ertSU_MM = new google.visualization.ChartWrapper(
         {
            chartType: 'ComboChart',
            containerId: 'crt_ertSU_MM',
            dataSourceUrl: 'https://docs.google.com/spreadsheets/d/1txmPuoLLfCuuQdWSQfBZmQWPEHD__MVu-Y5xsvWCO3Y/edit?usp=sharing&sheet=ERT_SU_MM&range=A1:F25&headers=1&tq=where%20A%3D1',
            options: {
               title: 'Avg. daily service units (monthly)',
               titleTextStyle: { color: 'grey', fontSize: 12 },
               chartArea: { left: 50, top: 50, width: '70%', height: '55%' },
               legend: {
                  position: 'top',
                  maxLines: 2,
                  textStyle: { color: 'grey', fontSize: 10}
               },
               series: {
                  0: {
                     type: 'lines',
                     color:'#B9CDE5',
                     lineWidth: 2,
                     pointSize: 7,
                     targetAxisIndex: 0
                  },
                  1: {
                     type: 'lines',
                     color:'#376092',
                     lineWidth: 2,
                     pointSize: 7,
                     targetAxisIndex: 1
                  },
                  2: {
                     type: 'lines',
                     color:'#777777',
                     lineWidth: 3,
                     lineDashStyle: [6, 3],
                     targetAxisIndex: 0
                  }
               },
               vAxes:{
                  0: {
                     title:'Avg. daily service units',
                     titleTextStyle: { fontSize: 11, color: 'grey' },
                     minValue: 20000,
                     viewWindow: { min: 20000 },
                     format: 'short'
                  },
                  1: {
                     title: 'cum. change vs prev. year (%)',
                     titleTextStyle: { color: '#376092', fontSize: 11},
                     textStyle:{color:'#376092'}
                  }
               },
               hAxis: {
                  title: 'Source: CRCO',
                  titleTextStyle: { color: 'grey', fontSize: 10 },
                  type:'string',
                  slantedTextAngle: 40,
                  textStyle: { fontSize: 11 }
               }
            },
            view: {columns: [1, 3, 4,5 ]}
         }
      );
      crt_ertSU_MM.draw();
   }

   google.setOnLoadCallback(dv);

})();