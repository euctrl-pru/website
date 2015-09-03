(function() {
   function dv(){   
// ENVIRONMENT - Horizontal flight efficiency - MM - CHART
var crt_hfe_MM = new google.visualization.ChartWrapper({
      chartType: 'LineChart',
      containerId: 'crt_hfe_MM',
      dataSourceUrl: 'https://docs.google.com/spreadsheets/d/1KgOIBF93axvXD6ENQYvEsWHqnA8eW_RvGV4EQlGava4/edit?usp=sharing&sheet=HFE_MM&range=A1:D25&tq=where%20A%3D2015',
      options:{ 
               chartArea: {left: 50, top: 20, width:'55%',height:'60%'},
               title: 'HFE (monthly)', titleTextStyle : {color: 'grey', fontSize: 11},
               legend: {position:'right', textStyle:{color: 'grey', fontSize: 10}},
               series: {
                     0: {type: 'lines', color:'#5D7CBA',lineWidth: 1, pointSize:6},
                     1: {type: 'lines', color:'#C0504D',lineWidth: 1, pointShape:'diamond',pointSize:8}
                  },    
               vAxis: {title: 'inefficiency (%)', titleTextStyle: {color: 'grey', fontSize: 10}, minValue: 0.0, maxValue: 0.06, format: '0.0%'},
               hAxis: {title: 'Source: PRU Analysis', titleTextStyle: {color: 'grey', fontSize: 10}, type:'string', slantedTextAngle: 90, textStyle: {fontSize: 11}}      
               },
      view: {'columns': [1,2,3] }
   }); crt_hfe_MM.draw();   
   }
   google.setOnLoadCallback(dv)
})();