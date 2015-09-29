(function() {
   function dv() {
      // CAPACITY - En-route ATFM delay - YY - CHART
      var crt_ertSU_YY = new google.visualization.ChartWrapper(
         {
            chartType: 'ComboChart',
            containerId: 'crt_ertSU_YY',
            dataSourceUrl: 'https://docs.google.com/spreadsheets/d/1txmPuoLLfCuuQdWSQfBZmQWPEHD__MVu-Y5xsvWCO3Y/edit?usp=sharing&sheet=ERT_SU_YY&range=A1:D9&headers=1&hl=en_GB',
            options: {
               chartArea: { left: 50, top: 20, width: '70%', height: '65%' },
               title: 'Avg. daily service units (yearly)',
               titleTextStyle: { color: 'grey', fontSize: 12 },
               legend: 'none',
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
                     color: '#376092',
                     lineWidth: 2,
                     pointSize: 7,
                     targetAxisIndex: 1
                  }
               },
               vAxes:{
                  0: {
                     title:'Avg. daily service units',
                     titleTextStyle : { color: 'grey', fontSize: 11 },
                     minValue: 20000,
                     viewWindow: { min: 20000 },
                     format: 'short',
                     gridlines: {color: 'transparent'}
                  },
                  1: {
                     title:'year on year (%)',
                     titleTextStyle: { color: '#376092', fontSize: 11 },
                     textStyle: { color: '#376092' }
                  }
               },
               hAxis: {
                  title: 'Source: CRCO',
                  titleTextStyle: { color: 'grey', fontSize: 10 }
               }
            },
            view: { columns: [0, 2, 3]}
         }
      );
      crt_ertSU_YY.draw();
   }

   google.setOnLoadCallback(dv);

})();