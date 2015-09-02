(function() {
   function dv(){
// TRAFFIC - Controlled flights - MM - CHART
   var crt_flts_MM = new google.visualization.ChartWrapper({
      chartType: 'ComboChart',
      containerId: 'crt_flts_MM',
      dataSourceUrl: 'https://docs.google.com/spreadsheets/d/1Ap6_pXhVLZcgfUcdbqsUBvZaI_AdVsT35XLY1oPKyJ4/edit?usp=sharing&sheet=ERT_FLTS_MM&range=A1:E25&headers=1&tq=where%20A%3D2015',
      options: {   
            chartArea: {left: 50, top: 20, width:'70%',height:'60%'}, 
            title: 'Avg. daily controlled flights (monthly)', titleTextStyle : {color: 'grey', fontSize: 12},
            legend: 'none',       
            series: {
                     0: {type: 'bars', color:'#B9CDE5', targetAxisIndex: 0},
                     1: {type: 'lines', color:'#376092', lineWidth: 2, pointSize: 7, targetAxisIndex: 1}
                  },
            vAxes:{
                     0:{ title:'Avg. daily flights', titleTextStyle : {fontSize: 11, color: 'grey',}, minValue: 20000 ,viewWindow: {min: 20000}, format: 'short'},
                     1:{ title:'year on year (%)',titleTextStyle : {color: '#376092', fontSize: 11}, textStyle:{color:'#376092'}}
                  },
            hAxis: {title: 'Source: PRU Analysis; NM', titleTextStyle: {color: 'grey', fontSize: 10}, type:'string', slantedTextAngle: 90, textStyle: {fontSize: 11}}
            },
      view: {columns: [1,3,4]}
   }); crt_flts_MM.draw();
   }
   google.setOnLoadCallback(dv)
})();