(function() {
   function dv() {
      // SAFETY - RUNWAY INCURSIONS - YY - CHART [EU_YY]
      var crt_saf_ri_YY = new google.visualization.ChartWrapper({
         chartType: 'ComboChart',
         containerId: 'crt_saf_ri_YY',
         dataSourceUrl: 'https://docs.google.com/spreadsheets/d/1qChhA2bkwkIv5B70cFNOEs4ubuP1xE2gceWcfAJozcg/edit?usp=sharing&sheet=RI&range=A5:F16',
         options: {
            title: 'Runway Incursions (RIs)',
            titleTextStyle : { color: 'grey', fontSize: 12 },
            chartArea: { left: 50, top: 50, width: '70%', height: '55%' },
            legend: {
               position: 'top',
               maxLines: 2,
               textStyle: { color: 'grey', fontSize: 10 }
            },
            isStacked : 'true',
            series: {
               0: { type: 'lines', color: 'darkgrey', lineWidth: 1, pointSize: 6,targetAxisIndex: 0 },
               1: { type: 'lines', color: '#5D7CBA', lineWidth: 1, pointSize: 6,targetAxisIndex: 1 },
               2: { type: 'bars',  color: '#376092', targetAxisIndex: 0 },
               3: { type: 'bars',  color: '#B9CDE5', targetAxisIndex: 0 }
            },
            vAxes:{
               0: {
                  title:'count',
                  titleTextStyle: { color: 'grey', fontSize: 11 },
                  textStyle: { color: 'grey' }
               },
               1: {
                  title:'Total nr. of Reported RIs',
                  titleTextStyle: { color: 'grey', fontSize: 11 },
                  textStyle: { color:'grey' }
               }
            },
            hAxis: {
               title: 'Source: SRC Intermediate Report 2015',
               titleTextStyle: { color: 'grey', fontSize: 11 },
               type: 'string',
               slantedTextAngle: 40,
               textStyle: { fontSize: 11 }
            }
         },
         view: { columns: [0, 1, 2, 4, 5] }
      });
      crt_saf_ri_YY.draw();
   }

   google.setOnLoadCallback(dv);
})();