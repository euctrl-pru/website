(function() {
   function dv(){   
// TRAFFIC - En route SU - TABLE
var tbl_flts_YY = new google.visualization.ChartWrapper({
		chartType: 'Table',
		containerId: 'tbl_flts_YY',	
		dataSourceUrl: 'https://docs.google.com/spreadsheets/d/1txmPuoLLfCuuQdWSQfBZmQWPEHD__MVu-Y5xsvWCO3Y/edit?usp=sharing&alt=json&sheet=ERT_SU_CZ&range=A1:D41&headers=1',
		options:{
		//allowHtml: true, 
		width: 550, 
		height: 440, 
		},
		view: {columns: [0,1,2,3] 
		}
	}); tbl_flts_YY.draw(); 
   }
   google.setOnLoadCallback(dv)
})();