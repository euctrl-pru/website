---
layout: default
title: Visualisation
permalink: /visualisation/
excerpt: Performance Review Unit interactive dashboard on European Air Transport.
keywords: performance, air transport, flights, europe, cost efficiency
---




<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript"> // load the visualisation API
google.load('visualization', '1', { packages: ['corechart', 'controls'] });
</script>

{% javascript crt_upaYY %}

<script type="text/javascript">
function drawVisualization()
 {

// RUNWAY INCURSIONS - YY - CHART [EU_YY]
	var crt_riYY = new google.visualization.ChartWrapper({
		chartType: 'ComboChart',
		containerId: 'crt_riYY',
		dataSourceUrl: 'https://docs.google.com/spreadsheets/d/1qChhA2bkwkIv5B70cFNOEs4ubuP1xE2gceWcfAJozcg/edit?usp=sharing&sheet=RI&range=A5:F17&hl=en_GB',
		options: { 				 
					title: 'Runway Incursions (RIs)',
					titleTextStyle : {color: 'grey', fontSize: 12},
					legend: {position: 'top', maxLines: 3},
					isStacked : 'true',
					series: {
							0: {type: 'lines', color:'darkgrey', lineWidth: 1, pointSize: 6,targetAxisIndex: 0},
						 	1: {type: 'lines', color:'#5D7CBA', lineWidth: 1, pointSize: 6,targetAxisIndex: 1},
							2: {type: 'bars', color:'#376092', targetAxisIndex: 0 },
 							3: {type: 'bars', color:'#B9CDE5', targetAxisIndex: 0 }
						},
					vAxes:{
							0:{	title:'count',
								titleTextStyle : {color: 'grey', fontSize: 11}, 
								textStyle:{color: 'grey'}},
							1:{	title:'total nr. of reported RIs',
								titleTextStyle : {color: '#5D7CBA', fontSize: 11}, 
								textStyle:{color:'#5D7CBA'}}
							}
					},				
		view: {columns: [0,1,2,4,5]  }
	}); crt_riYY.draw();


// ATM Specific Occurrences - YY - CHART [EU_YY]
	var crt_asoYY = new google.visualization.ChartWrapper({
		chartType: 'ComboChart',
		containerId: 'crt_asoYY',
		dataSourceUrl: 'https://docs.google.com/spreadsheets/d/1qChhA2bkwkIv5B70cFNOEs4ubuP1xE2gceWcfAJozcg/edit?usp=sharing&sheet=ASO&range=A5:H17&hl=en_GB',
		options: { 				 
					title: 'ATM Specific Occurrences',
					titleTextStyle : {color: 'grey', fontSize: 12},
					legend: {position: 'right', maxLines: 3},
					isStacked : 'true',
					series: {
						 	2: {type: 'bars', color:'#B9CDE5'},
							1: {type: 'bars', color:'#376092'},
							0: {type: 'bars', color:'#C0504D'}
						},
					vAxis:{
							0:{	title:'Number of occurrences',
								titleTextStyle : {color: 'grey', fontSize: 11}, 
								textStyle:{color: 'grey'}}
							}
					},				
		view: {columns: [0,7,6,5]  }
	}); crt_asoYY.draw();


// ENVIRONMENT - Horizontal flight efficiency - YY - CHART
var crt_flteffYY = new google.visualization.ChartWrapper({
		chartType: 'ComboChart',	
		containerId: 'crt_flteffYY',
		dataSourceUrl: 'https://docs.google.com/spreadsheets/d/1TrP0AudyY-TcIGMN12QOxSSFqpTYjOoQIRqWUSA4gMQ/edit?usp=sharing&sheet=FLT_EFF_YY&range=A5:G10&hl=en_GB',		
			options:{ 
					width: 500, height: 250, 
					chartArea: {left: 50, top: 30, width:'55%',height:'60%'},
					title: 'Horizontal en route flight efficiency [EU-wide]',
					titleTextStyle : {color: 'grey', fontSize: 11},
					legend: 'right',
					series: {
								0: {type:'bars', color:'#E6B8B7'},
								1: {type:'lines', color:'#C0504D', lineWidth: 1, pointSize: 6},
								2: {type:'bars', color:'#93a7d1'},
							    3: {type:'lines', color:'#5D7CBA', lineWidth: 1, pointSize: 6}
							},
					vAxis: {minValue:0.0, maxValue: 0.06, title: 'inefficiency (%)', format: '0.0%',
							titleTextStyle: {color: 'grey', fontSize: 10}}
							,
					hAxis: {title: 'Actual refers to January-August only', 
							titleTextStyle: {color: 'grey', fontSize: 10}}
				},
				view: {columns: [1,5,6,3,4] , rows: [0,1,2,3,4] }
	}); crt_flteffYY.draw();

// ENVIRONMENT - Horizontal flight efficiency - MM - CHART
var crt_flteffMM = new google.visualization.ChartWrapper({
		chartType: 'LineChart',
		containerId: 'crt_flteffMM',
		dataSourceUrl: 'https://docs.google.com/spreadsheets/d/1TrP0AudyY-TcIGMN12QOxSSFqpTYjOoQIRqWUSA4gMQ/edit?usp=sharing&sheet=FLT_EFF_MM&range=A4:F64&tq=where%20B%3D2015&hl=en_GB',
		options:{ 
					width: 500, height: 250, 
					chartArea: {left: 50, top: 30, width:'55%',height:'60%'},
					title: 'Horizontal en route flight efficiency [2015]',
					titleTextStyle : {color: 'grey', fontSize: 11},
					legend: 'right',
					series: {
							0: {type: 'lines', color:'#5D7CBA',lineWidth: 1, pointSize:6},
							1: {type: 'lines', color:'#C0504D',lineWidth: 1, pointShape:'diamond',pointSize:8}
						},		
					vAxis: {minValue: 0.0,maxValue: 0.06, title: 'inefficiency (%)', format: '0.0%',
							titleTextStyle: {color: 'grey', fontSize: 10}}
				},
		view: {'columns': [3,4,5] }
	}); crt_flteffMM.draw();	
	
// ENVIRONMENT - Horizontal flight efficiency - TABLE
var tbl_ert_flteff = new google.visualization.ChartWrapper({
		chartType: 'Table',
		containerId: 'tbl_ert_flteff',	
		dataSourceUrl: 'https://docs.google.com/spreadsheets/d/1TrP0AudyY-TcIGMN12QOxSSFqpTYjOoQIRqWUSA4gMQ/edit?usp=sharing&sheet=ERT_FLT_EFF_FAB&range=A5:F15&hl=en_GB',
		options:{
		allowHtml: true, 
		width: 470, height: 350, 
		//style: {fontSize: 9}
		},
		view: {columns: [0,1,2,3,4] 
		}
	}); tbl_ert_flteff.draw();
			
}
google.setOnLoadCallback(drawVisualization)
</script>



<section>
<div class="container">
<h2>Hello world</h2>
<p>
Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
</p>	

</div>
</section>

<div class="container">
<section>

<div class="page-header" id="safety">
<h2>Safety <small> - ANS related safety performance</small></h2></div><!--end page header-->	
<p>This section provides a review of ATM-related incidents, reported through the EURCONTROL Annual Summary Template (AST) reporting mechanism.
</p>

<div class="row">

<div class="col-lg-6 text-center">
<div id="visualization_div" style="width:450px; height:350px;"></div><br>
  <div id="toolbar_div"></div>
<p><small>In 2013, the total number of reported Separation Minima Infringements (SMIs) increased by almost 17%, compared to the previous year. This increase is in line with the trend started in 2011. After a continuous increase between 2009 and 2012, risk bearing SMIs decreased again in 2013 to 12% of the total number of reported SMIs. Overall, there was a decrease in the total number of serious incidents for both risk bearing Severity categories in 2013.
</small></p>
</div>  				

<div class="col-lg-6">
<div id="crt_upaYY" style="width:450px; height:350px;"></div><br>
<p><small>The total number of Unauthorised Penetrations of Airspace (UPAs) in 2013, also known as Airspace Infringements (AIs), reported in EUROCONTROL Member States decreased by 31%, compared to 2012. The share of risk bearing (Severity A and B) UPAs, within total reported UPAs, decreased further in 2013 to 1.1%. Both risk bearing categories of UPAs show a decrease in 2013 in terms of total numbers.</small></p>
</div>
</div>

<div class="row">
<div class="col-lg-6">
<div id="crt_riYY" style="width:500px; height:350px;"></div>
<p><small>Total reported Runway Incursions (RI) reported in EUROCONTROL Member States increased by approximately 15% in 2013. In 2013, the risk-bearing RIs (Severity A and B) increased by 53% compared to 2012 which corresponds to 5% of the total number of reported RIs.</small></p>
</div>
<div class="col-lg-6">
<div id="crt_asoYY" style="width:450px; height:350px;"></div>
<p><small>ATM specific occurrences encompass those situations where the ability to provide safe ATM services is affected. Therefore, this type of occurrence typically includes failures that would affect the ANS providers’ capability to deliver safe ATM services. 
The total number of reported ATM specific occurrences in 2013 showed a 7% increase compared to 2012.
</small></p>
</div> 
</div>
</section>



<div class="container">
<section>

<div class="page-header" id="capacity">
<h2>Capacity <small> - ANS related safety performance</small></h2></div><!--end page header-->	

Lorem Ipsum is simply dummy text of the printing and typesetting industry. 

</section>
</div>

<div class="container">
<section>

<div class="page-header" id="environment">
<h2>Environment <small> - ANS related safety performance</small></h2></div><!--end page header-->
		

<div class="row">

<div class="col-lg-6">
<div class="media media-right" id="crt_flteffYY"></div><br>
<div class="media" id="crt_flteffMM"></div>
</div>  				

<div class="col-lg-6 offset-20">
<div class="media" id="tbl_ert_flteff"></div>
</div>

</div>

<div class="row bg-info block-center">
<div class="col-lg-3"><p>Source: PRU analysis; Network Manager</p></div> 
<div class="col-lg-3"><p>Source: January-August</p></div>  				
<div class="col-lg-3">[Download data][HFExlsx]</div>
<div class="col-lg-3">[Meta data][HFEmeta]</div>
</div>

</div>

<div class="container">
<section>

<div class="page-header" id="costeff">
<h2>Cost-efficiency <small> - ANS related safety performance</small></h2></div><!--end page header-->	
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.

</section>
</div>


<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<div id="dashboard_div" style="border: 0px ; margin-top: 1em">
<p style="padding-left: 1em"><strong>Donuts eaten per person</strong></p>
<table class="columns">
<tr>
<td>
<div id="slider_div" style="padding-left: 15px"></div>
</td><td>
<div id="categoryPicker_div"></div>
</td>
</tr><tr>
<td>
<div id="chart_div" style="padding-top: 15px"></div>
</td><td>
<div id="table_div" style="padding-top: 30px"></div>
</td>
</tr>
</table>
</div>

<script type="text/javascript">
  google.load('visualization', '1.0', {'packages':['corechart', 'table', 'gauge', 'controls']});
  google.setOnLoadCallback(drawMainDashboard);

function drawMainDashboard() {
    var dashboard = new google.visualization.Dashboard(
        document.getElementById('dashboard_div'));
    var slider = new google.visualization.ControlWrapper({
      'controlType': 'NumberRangeFilter',
      'containerId': 'slider_div',
      'options': {
        'filterColumnIndex': 2,
        'ui': {
          'labelStacking': 'vertical',
          'label': 'Age Filter:'
        }
      }
    });
    var categoryPicker = new google.visualization.ControlWrapper({
      'controlType': 'CategoryFilter',
      'containerId': 'categoryPicker_div',
      'options': {
        'filterColumnIndex': 1,
        'ui': {
          'labelStacking': 'vertical',
          'label': 'Gender Selection:',
          'allowTyping': false,
          'allowMultiple': false
        }
      }
    });
    var pie = new google.visualization.ChartWrapper({
      'chartType': 'PieChart',
      'containerId': 'chart_div',
      'options': {
        'width': 300,
        'height': 300,
        'legend': 'none',
        'chartArea': {'left': 15, 'top': 15, 'right': 0, 'bottom': 0},
        'pieSliceText': 'label'
      },
      'view': {'columns': [0, 3]}
    });
    var table = new google.visualization.ChartWrapper({
      'chartType': 'Table',
      'containerId': 'table_div',
      'options': {
      }
    });
    var data = google.visualization.arrayToDataTable([
      ['Name', 'Gender', 'Age', 'Donuts eaten'],
      ['Michael' , 'Male', 12, 5],
      ['Elisa', 'Female', 20, 7],
      ['Robert', 'Male', 7, 3],
      ['John', 'Male', 54, 2],
      ['Jessica', 'Female', 22, 6],
      ['Aaron', 'Male', 3, 1],
      ['Margareth', 'Female', 42, 8],
      ['Miranda', 'Female', 33, 6]
    ]);
    dashboard.bind([slider, categoryPicker], [pie, table]);
    dashboard.draw(data);
  }
</script>




[HFExlsx]: <{{site.url}}/data/set/hfe/Horizontal_Flight_Efficiency.xlsm> "HFE (Excel)"
[HFEmeta]: <{{site.url}}/reference/dataset/Horizontal_Flight_Efficiency.html> "HFE (Meta)"











