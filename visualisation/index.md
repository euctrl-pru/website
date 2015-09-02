---
layout: visualisation
title: Visualisation
permalink: /visualisation/
excerpt: Performance Review Unit interactive dashboard on European Air Transport.
keywords: performance, air transport, flights, europe, cost efficiency
---
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript"> // load the visualisation API
google.load('visualization', '1', { packages: ['corechart', 'controls'] });
</script>
{% javascript crt_flts_YY %}
{% javascript crt_flts_MM %}
{% javascript tbl_flts_YY %}
{% javascript crt_saf_smi_YY %}
{% javascript crt_saf_upa_YY %}
{% javascript crt_saf_ri_YY %}
{% javascript crt_saf_aso_YY %}
{% javascript crt_hfe_YY %}
{% javascript crt_hfe_MM %}
{% javascript tbl_hfe_YY %}
{% javascript crt_cap_ert_YY %}
{% javascript crt_cap_ert_MM %}
{% javascript tbl_cap_ert_YY %}
{% javascript crt_cap_apt_YY %}
{% javascript crt_cap_apt_MM %}
{% javascript tbl_cap_apt_YY %}

# Pan-European ANS performance
This data is published by the Performance Review Unit (PRU). Every effort has been made to ensure that the information and analysis contained on this website are as accurate and complete as possible. Despite these precautions, should you find any errors or inconsistencies we would be grateful if you could please bring them to the Performance Review Unit’s attention.

<h2 id="traffic">Traffic</h2>
<h3 id="flts">Controlled flights</h3>

<div class="row">
<div class="col-lg-5">
**EUROCONTROL Area**
<br>
<div id="crt_flts_YY" style="width:400px; height:200px;"></div>
<div id="crt_flts_MM" style="width:400px; height:250px;"></div>
</div>  				
<div class="col-lg-7 offset-10 text-justified">
**Controlled flights by entity (year to date)**
<div id="tbl_flts_YY"></div>
</div>
</div>

<h2 id="safety">Safety</h2>
This section provides a review of ATM-related incidents, reported through the EURCONTROL Annual Summary Template (AST) reporting mechanism. The results refer to ATM-related incidents in EUROCONTROL Member States. 

<div class="row">
<div class="col-lg-6 text-justified">
<div id="crt_saf_smi_YY" style="width:450px; height:250px;"></div>
<div class="well">
<p><i><small>
In 2013, the total number of reported Separation Minima Infringements (SMIs) increased by almost 17%, compared to the previous year. After a continuous increase between 2009 and 2012, risk bearing SMIs decreased again in 2013 to 12% of the total number of reported SMIs. Overall, there was a decrease in the total number of serious incidents for both risk bearing Severity categories in 2013.
</small></i></p>
</div>
</div>  

<div class="col-lg-6 block-center">
<div id="crt_saf_upa_YY" style="width:450px; height:250px;"></div>
<div class="well">
<p><i><small>
The total number of Unauthorised Penetrations of Airspace (UPAs) in 2013, also known as Airspace Infringements (AIs), reported in EUROCONTROL Member States decreased by 31%, compared to 2012. The share of risk bearing (Severity A and B) UPAs, within total reported UPAs, decreased further in 2013 to 1.1%. Both risk bearing categories of UPAs show a decrease in 2013 in terms of total numbers.
</small></i></p>
</div>
</div>
</div>

<div class="row">
<div class="col-lg-6">
<div id="crt_saf_ri_YY" style="width:450px; height:250px;"></div>
<div class="well">
<p><i><small>
Total reported Runway Incursions (RI) reported in EUROCONTROL Member States increased by approximately 15% in 2013. In 2013, the risk-bearing RIs (Severity A and B) increased by 53% compared to 2012 which corresponds to 5% of the total number of reported RIs.
</small></i></p>
</div>
</div>

<div class="col-lg-6">
<div id="crt_saf_aso_YY" style="width:450px; height:250px;"></div>
<div class="well">
<p><i><small>
ATM specific occurrences encompass those situations where the ability to provide safe ATM services is affected. Therefore, this type of occurrence typically includes failures that would affect the ANS providers’ capability to deliver safe ATM services. 
The total number of reported ATM specific occurrences in 2013 showed a 7% increase compared to 2012.
</small></i></p>
</div> 
</div> 
</div>

<h2 id='capacity'>Capacity</h2>
<h3 id="ert_dly">En-route ATFM delays</h3>
<div class="well">
<p><i><small>
Commentary en-route ATFM delay
</small></i></p>
</div>

<div class="row">
<div class="col-lg-5">
**EUROCONTROL Area**
<div id="crt_cap_ert_YY" style="width:400px; height:200px;"></div>
<div id="crt_cap_ert_MM" style="width:400px; height:250px;"></div>
</div>  				
<div class="col-lg-7 offset-10">
**En-route ATFM delays by entity (year to date)**
<div id="tbl_cap_ert_YY"></div>
</div>
</div>

<h3 id="apt_dly">Airport ATFM arrival delays</h3>
<div class="well">
<p><i><small>
Commentary airport ATFM delay
</small></i></p>
</div>

<div class="row">
<div class="col-lg-5">
**EUROCONTROL Area**
<div id="crt_cap_apt_YY" style="width:400px; height:200px;"></div>
<div id="crt_cap_apt_MM" style="width:400px; height:250px;"></div>
</div>  				
<div class="col-lg-7 offset-10">
**Airport ATFM arrival delays by airport (year to date)**
<div id="tbl_cap_apt_YY"></div>
</div>
</div>

<h2 id="environment">Environment</h2> 
<h3 id="hfe">Horizontal en-route flight efficiency</h3>	
<div class="well">
<b>Period: January-August 2015</b>	
<p><i><small>
Horizontal en-route flight efficiency (HFE)
</small></i></p>
</div>

<div class="row">
<div class="col-lg-5">
**EUROCONTROL Area**
<div id="crt_hfe_YY" style="width:400px; height:200px;"></div>
<div id="crt_hfe_MM" style="width:400px; height:250px;"></div>
</div>  				

<div class="col-lg-7 offset-10">
**Horizontal en-route flight efficiency by entity (year to date)**
<div id="tbl_hfe_YY"></div>
</div>
</div>

<h3 id="asma">ASMA additional time</h3>			
*This section is still under development. Please visit us again soon!*

<h3 id="txo">Taxi-out additional time</h3>			
*This section is still under development. Please visit us again soon!*

<h2 id="costeff">Cost Efficiency</h2>
*This section is still under development. Please visit us again soon!*