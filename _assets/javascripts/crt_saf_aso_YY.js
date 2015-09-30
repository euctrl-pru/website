(function() {
   function dv() {
      // SAFETY - ATM Specific Technical Events - YY - CHART [EU_YY]
      var crt_saf_aso_YY = new google.visualization.ChartWrapper({
         chartType: 'ComboChart',
         containerId: 'crt_saf_aso_YY',
         dataSourceUrl: 'https://docs.google.com/spreadsheets/d/1qChhA2bkwkIv5B70cFNOEs4ubuP1xE2gceWcfAJozcg/edit?usp=sharing&sheet=ASO&range=A5:H16',
         options: {
            title: 'ATM Specific Occurrences (ATM-S)',
            titleTextStyle : { color: 'grey', fontSize: 12 },
            chartArea: { left: 50, top: 50, width: '70%', height: '55%' },
            legend: {
               position: 'top',
               maxLines: 3,
               textStyle: { color: 'grey', fontSize: 10 }
            },
            isStacked : 'true',
            series: {
               2: { type: 'bars', color: '#B9CDE5' },
               1: { type: 'bars', color: '#376092' },
               0: { type: 'bars', color: '#C0504D' }
            },
            vAxis: {
               title: 'Number of Occurrences',
               titleTextStyle: { color: 'grey', fontSize: 11 },
               textStyle: { color: 'grey' }
            },
            hAxis: {
               title: 'Source: SRC Intermediate Report 2015',
               titleTextStyle: { color: 'grey', fontSize: 11 },
               type: 'string',
               slantedTextAngle: 40,
               textStyle: { fontSize: 11 }
            }
         },
         view: { columns: [0, 7, 6, 5] }
      });
      crt_saf_aso_YY.draw();
   }

   google.setOnLoadCallback(dv);
})();