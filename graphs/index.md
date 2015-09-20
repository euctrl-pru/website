---
layout: default
title: Graphs
permalink: /graphs/
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

<div class="row">
<div class="col-lg-5">
**EUROCONTROL Area**
<br>
<div id="crt_flts_YY" style="width:400px; height:200px;"></div>
<div id="crt_flts_MM" style="width:400px; height:250px;"></div>
</div>
<div class="col-lg-7 offset-10 text-justified">
**Flights by entity (Jan.-Aug. 2015)**
<div id="tbl_flts_YY"></div>
</div>
</div>

<h2 id="safety">Safety</h2>
*This section is still under development. Please visit us again soon!*


<h2 id='capacity'>Capacity</h2>
<h3 id="ert_dly">En-route ATFM delays</h3>

<div class="row">
<div class="col-lg-5">
**EUROCONTROL Area**
<div id="crt_cap_ert_YY" style="width:400px; height:200px;"></div>
<div id="crt_cap_ert_MM" style="width:400px; height:250px;"></div>
</div>
<div class="col-lg-7 offset-10">
**En-route ATFM delays by entity (Jan.-Aug. 2015)**
<div id="tbl_cap_ert_YY"></div>
</div>
</div>

<h3 id="apt_dly">Airport ATFM arrival delays</h3>

<div class="row">
<div class="col-lg-5">
**EUROCONTROL Area**
<div id="crt_cap_apt_YY" style="width:400px; height:200px;"></div>
<div id="crt_cap_apt_MM" style="width:400px; height:250px;"></div>
</div>
<div class="col-lg-7 offset-10">
**Airport ATFM arrival delays by airport (Jan.-Aug. 2015)**
<div id="tbl_cap_apt_YY"></div>
</div>
</div>

<h2 id="environment">Environment</h2>
<h3 id="hfe">Horizontal en-route flight efficiency (HFE)</h3>

<div class="row">
<div class="col-lg-5">
**EUROCONTROL Area**
<div id="crt_hfe_YY" style="width:400px; height:200px;"></div>
<div id="crt_hfe_MM" style="width:400px; height:250px;"></div>
</div>

<div class="col-lg-7 offset-10">
**Horizontal en-route flight efficiency by entity (Jan.-Aug. 2015)**
<div id="tbl_hfe_YY"></div>
</div>
</div>

<h3 id="asma">ASMA additional time</h3>
*This section is still under development. Please visit us again soon!*

<h3 id="txo">Taxi-out additional time</h3>
*This section is still under development. Please visit us again soon!*

<h2 id="costeff">Cost Efficiency</h2>
*This section is still under development. Please visit us again soon!*
