(function() {
   function dv(){   
   // ENVIRONMENT - Horizontal flight efficiency - YY - CHART
   var crt_hfe_YY = new google.visualization.ChartWrapper({
         chartType: 'ComboChart',   
         containerId: 'crt_hfe_YY',
         dataSourceUrl: 'https://docs.google.com/spreadsheets/d/1KgOIBF93axvXD6ENQYvEsWHqnA8eW_RvGV4EQlGava4/edit?usp=sharing&sheet=HFE_YY&range=A1:C9',     
            options:{  
                  chartArea: {left: 50, top: 30, width:'55%',height:'60%'},
                  title: 'HFE (year to date)', titleTextStyle : {color: 'grey', fontSize: 11},
                  legend: {position:'right', textStyle:{color: 'grey', fontSize: 10}},
                  series: {
                           0: {type:'lines', color:'#5D7CBA',lineWidth: 1, pointSize: 6},
                           1: {type: 'lines', color:'#C0504D',lineWidth: 1, pointShape:'diamond',pointSize:8}
                        },
                  vAxis: {title: 'inefficiency (%)', titleTextStyle: {color: 'grey', fontSize: 10}, minValue:0.0, maxValue: 0.06, format: '0.0%'},
                  hAxis: {title: 'Source: PRU Analysis', titleTextStyle: {color: 'grey', fontSize: 10}}
                     },
               view: {columns: [0,1,2] }
      }); crt_hfe_YY.draw();
   }
   google.setOnLoadCallback(dv)
})();