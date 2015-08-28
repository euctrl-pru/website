(function() {
   function dv(){
      // UNAUTHORISED PENETRATION OF AIRSPACE - YY - CHART [EU_YY]
      var crt_upaYY = new google.visualization.ChartWrapper({
         chartType: 'ComboChart',
         containerId: 'crt_upaYY',
         dataSourceUrl: 'https://docs.google.com/spreadsheets/d/1qChhA2bkwkIv5B70cFNOEs4ubuP1xE2gceWcfAJozcg/edit?usp=sharing&sheet=UPA&range=A5:F17&hl=en_GB',
         options: {
            title: 'Unauthorised Penetration of Airspace (UPAs)',
            titleTextStyle : {color: 'grey', fontSize: 12},
            legend: {position: 'top', maxLines: 2},
            isStacked : 'true',
            series: {
               0: {type: 'lines', color:'darkgrey', lineWidth: 1, pointSize: 6,targetAxisIndex: 0},
               1: {type: 'lines', color:'#5D7CBA', lineWidth: 1, pointSize: 6,targetAxisIndex: 1},
               2: {type: 'bars', color:'#376092', targetAxisIndex: 0 },
               3: {type: 'bars', color:'#B9CDE5', targetAxisIndex: 0 }
            },
            vAxes:{
               0:{   title:'count',
               titleTextStyle : {color: 'grey', fontSize: 11}, 
               textStyle:{color: 'grey'}},
               1:{   title:'total nr. of reported UPAs',
               titleTextStyle : {color: '#5D7CBA', fontSize: 11},
               textStyle:{color:'#5D7CBA'}}
            }
         },
         view: {columns: [0,1,2,4,5]  }
      });
      crt_upaYY.draw();
   }
   google.setOnLoadCallback(dv)
})();