---
layout: default
title: Data by Performance Area
permalink: /data/performancearea/
excerpt: Performance Review Unit Data Download (Excel and CSV).
keywords: performance, data, statistics, economics, air transport, flights, europe, cost efficiency
dates:
  ert_dly_aua_po:
    beg: Jan 2016
    end: Dec 2017
  ert_dly_fir_po:
    beg: Jan 2016
    end: Dec 2017
  apt_dly_po:
    beg: Jan 2016
    end: Dec 2017
  ert_dly_aua:
    beg: Jan 2011
    end: Sep 2018
  ert_dly_fir:
    beg: Jan 2013
    end: Sep 2018
  hfe:
    beg: Jan 2014
    end: Sep 2018
  apt_flt:
    beg: Jan 2014
    end: Sep 2018
  apt_dly:
    beg: Jan 2014
    end: Sep 2018
  asma:
    beg: Jan 2014
    end: Aug 2018
  cdo:
    beg: Jan 2015
    end: Sep 2018
  tx_out:
    beg: Jan 2014
    end: Aug 2018
  atc_pre:
    beg: Jan 2014
    end: Aug 2018
  slt_adh:
    beg: Jan 2014
    end: Sep 2018
  ace_opt:
    beg: Jan 2017
    end: Sep 2018
  cplx:
    beg: &cplxbeg Jan 2014
    end: &cplxend Dec 2016
  cplx1:
    beg: &cplx1beg Jan 2017
    end: &cplx1end Sep 2018


dwnld_i: <i class="fa pru fa-download"></i>
info_i: <i class="fa pru fa-info-circle"></i>
ndwk_i: <i class="fa pru fa-flask"></i>
fltr_i: <i class="fa pru fa-filter"></i>
attn_i: <i class="fa pru fa-exclamation-triangle"></i>
---
<style>
  i.fa.pru {color: #337ab7;}
</style>
{::options parse_block_html="true" /}

# Pan-European ANS Performance data repository


<style>
td {
  white-space: nowrap;
}
th:nth-child(2) {
width: 11em;
}

th:nth-child(3) {
width: 5em;
}

th:nth-child(4) {
width: 5em;
}

th:nth-child(5) {
width: 8em;
}
</style>

<style>
.table-responsive {
        overflow-x: visible; 
    }
</style>

### {% img prcq-operations-enroute.png magick:resize:50x50 alt:'Operations En-route' class:'leadimg' %} Operations En-route

<div class="table-responsive">
<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">Data description</th>
      <th scope="col">Period</th>
      <th scope="col">Excel</th>
      <th scope="col">CSV</th>
      <th scope="col">Meta</th>
      <th scope="col"><a href="{{ "/references/acronym/ganp.html" | prepend: site.baseurl | prepend: site.url }}">ICAO GANP</a></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">En-route IFR flights and <a href="{{ "/references/methodology/ATFM_delay_calculation.html" | prepend: site.baseurl | prepend: site.url }}">ATFM delays</a> 
      <a href="{{ "/references/acronym/aua.html" | prepend: site.baseurl | prepend: site.url }}">(AUA)</a> - without post ops adjustments<br><small>by entity and delay cause (AUA based)</small></th>
      <td>Jan 2011 - Feb 2019</td>
      <td><a href="{{ "/data/set/ert_dly/En-Route_ATFM_Delay_AUA.xlsm" | prepend: site.baseurl | prepend: site.url }}"><span class="glyphicon glyphicon-download"></span></a> </td>
      <td></td>
      <td><a href="{{ "/references/dataset/En-Route_ATFM_Delay_FIR.html" | prepend: site.baseurl | prepend: site.url }}"><span class="glyphicon glyphicon-info-sign"></span></a> </td>
      <td><a href="https://www4.icao.int/ganpportal/ASBU/KPI?IDs=7" target="_blank">KPI 07</a></td>
    </tr>
    
    <tr class="table-info">
      <th scope="row">En-route IFR flights and <a href="{{ "/references/methodology/ATFM_delay_calculation.html" | prepend: site.baseurl | prepend: site.url }}">ATFM delays</a> 
      <a href="{{ "/references/acronym/aua.html" | prepend: site.baseurl | prepend: site.url }}">(AUA)</a> - incl. <a href="http://www.eurocontrol.int/publications/post-operations-performance-adjustment-process" target="_blank">post ops adjustments</a><br><small>by entity and delay cause (AUA based)</small></th>
      <td>Jan 2016 - Dec 2017</td>
      <td><a href="{{ "/data/set/ert_dly/En-Route_ATFM_Delay_AUA_post_ops.xlsm" | prepend: site.baseurl | prepend: site.url }}"><span class="glyphicon glyphicon-download"></span></a> </td>
      <td></td>
      <td><a href="{{ "/references/dataset/En-Route_ATFM_Delay_AUA.html" | prepend: site.baseurl | prepend: site.url }}"><span class="glyphicon glyphicon-info-sign"></span></a> </td>
      <td><a href="https://www4.icao.int/ganpportal/ASBU/KPI?IDs=7" target="_blank">KPI 07</a></td>
    </tr>

    <tr>
      <th scope="row">En-route IFR flights and <a href="{{ "/references/methodology/ATFM_delay_calculation.html" | prepend: site.baseurl | prepend: site.url }}">ATFM delays</a> 
      <a href="{{ "/references/acronym/fir.html" | prepend: site.baseurl | prepend: site.url }}">(FIR)</a> - without post ops adjustments<br><small>by entity and delay cause (FIR based)</small></th>
      <td>Jan 2016 - Feb 2019</td>
      <td><a href="{{ "/data/set/ert_dly/En-Route_ATFM_Delay_FIR.xlsm" | prepend: site.baseurl | prepend: site.url }}"><span class="glyphicon glyphicon-download"></span></a> </td>
      <td></td>
      <td><a href="{{ "/references/dataset/En-Route_ATFM_Delay_FIR.html" | prepend: site.baseurl | prepend: site.url }}"><span class="glyphicon glyphicon-info-sign"></span></a> </td>
      <td><a href="https://www4.icao.int/ganpportal/ASBU/KPI?IDs=7" target="_blank">KPI 07</a></td>
    </tr>

    <tr class="table-info">
      <th scope="row">En-route IFR flights and <a href="{{ "/references/methodology/ATFM_delay_calculation.html" | prepend: site.baseurl | prepend: site.url }}">ATFM delays</a> 
      <a href="{{ "/references/acronym/fir.html" | prepend: site.baseurl | prepend: site.url }}">(FIR)</a> - incl. <a href="http://www.eurocontrol.int/publications/post-operations-performance-adjustment-process" target="_blank">post ops adjustments</a><br><small>by entity and delay cause (FIR based)</small></th>
      <td>Jan 2016 - Dec 2017</td>
      <td><a href="{{ "/data/set/ert_dly/En-Route_ATFM_Delay_FIR_post_ops.xlsm" | prepend: site.baseurl | prepend: site.url }}"><span class="glyphicon glyphicon-download"></span></a> </td>
      <td></td>
      <td><a href="{{ "/references/dataset/En-Route_ATFM_Delay_FIR.html" | prepend: site.baseurl | prepend: site.url }}"><span class="glyphicon glyphicon-info-sign"></span></a> </td>
      <td><a href="https://www4.icao.int/ganpportal/ASBU/KPI?IDs=7" target="_blank">KPI 07</a></td>
    </tr>

    <tr>
      <th scope="row"><a href="{{ "/references/methodology/horizontal_flight_efficiency_pi.html" | prepend: site.baseurl | prepend: site.url }}">Horizontal en-route flight efficiency</a> 
      <br><small>by entity (HFE actual trajectory and flight plan, KEP and KEA indicators)</small>
      <br><small><span style="color:darkred">Please note that the data for January 2019 is not yet available</span></small></th>
      <td>Jan 2014 - Feb 2019</td>
      <td><a href="{{ "/data/set/hfe/Horizontal_Flight_Efficiency.xlsm" | prepend: site.baseurl | prepend: site.url }}"><span class="glyphicon glyphicon-download"></span></a> </td>
      <td><a href="{{ "/data/set/hfe/horizontal_flight_efficiency.html" | prepend: site.baseurl | prepend: site.url }}"><span class="glyphicon glyphicon-download"></span></a></td>
      <td><a href="{{ "/references/dataset/Horizontal_Flight_Efficiency.html" | prepend: site.baseurl | prepend: site.url }}"><span class="glyphicon glyphicon-info-sign"></span></a> </td>
      <td><a href="https://www4.icao.int/ganpportal/ASBU/KPI?IDs=4" target="_blank">KPI 04</a>,
          <a href="https://www4.icao.int/ganpportal/ASBU/KPI?IDs=5" target="_blank">KPI 05</a></td>
    </tr>
  </tbody>
</table>
</div>

### {% img prcq-operations-airport.png magick:resize:50x50 alt:'Operations at Airports' class:'leadimg' %} Operations at Airports

<div class="table-responsive">
<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">Data description</th>
      <th scope="col">Period</th>
      <th scope="col">Excel</th>
      <th scope="col">CSV</th>
      <th scope="col">Meta</th>
      <th scope="col"><a href="{{ "/references/acronym/ganp.html" | prepend: site.baseurl | prepend: site.url }}">ICAO GANP</a></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">Airport arrival <a href="{{ "/references/methodology/ATFM_delay_calculation.html" | prepend: site.baseurl | prepend: site.url }}">ATFM delays</a> - without post ops adjustments<br><small>by airport and delay cause</small></th>
      <td>Jan 2016 - Feb 2019</td>
      <td><a href="{{ "/data/set/apt_dly/Airport_Arrival_ATFM_Delay.xlsm" | prepend: site.baseurl | prepend: site.url }}"><span class="glyphicon glyphicon-download"></span></a> </td>
      <td><a href="{{ "/data/set/apt_dly/airport_arrival_atfm_delay.html" | prepend: site.baseurl | prepend: site.url }}"><span class="glyphicon glyphicon-download"></span></a> </td>
      <td><a href="{{ "/references/dataset/Airport_Arrival_ATFM_Delay.html" | prepend: site.baseurl | prepend: site.url }}"><span class="glyphicon glyphicon-info-sign"></span></a> </td>
      <td><a href="https://www4.icao.int/ganpportal/ASBU/KPI?IDs=12" target="_blank">KPI 12</a></td>
    </tr>
    <tr class="table-info">
      <th scope="row">Airport arrival <a href="{{ "/references/methodology/ATFM_delay_calculation.html" | prepend: site.baseurl | prepend: site.url }}">ATFM delays</a> - incl. <a href="http://www.eurocontrol.int/publications/post-operations-performance-adjustment-process" target="_blank">post ops adjustments</a><br><small>by airport and delay cause</small></th>
      <td>Jan 2016 - Dec 2017</td>
      <td><a href="{{ "/data/set/apt_dly/Airport_Arrival_ATFM_Delay_post_ops.xlsm" | prepend: site.baseurl | prepend: site.url }}"><span class="glyphicon glyphicon-download"></span></a></td>
      <td></td>
      <td><a href="{{ "/references/dataset/Airport_Arrival_ATFM_Delay.html" | prepend: site.baseurl | prepend: site.url }}"><span class="glyphicon glyphicon-info-sign"></span></a></td>
      <td><a href="https://www4.icao.int/ganpportal/ASBU/KPI?IDs=12" target="_blank">KPI 12</a></td>
    </tr>
    <tr>
      <th scope="row">Airport traffic<br><small>daily IFR arrivals and departures by airport</small></th>
      <td>Jan 2016 - Feb 2019</td>
      <td><a href="{{ "/data/set/apt_flt/Airport_Traffic.xlsm" | prepend: site.baseurl | prepend: site.url }}"><span class="glyphicon glyphicon-download"></span></a> </td>
      <td></td>
      <td><a href="{{ "/references/dataset/Airport_Traffic.html" | prepend: site.baseurl | prepend: site.url }}"><span class="glyphicon glyphicon-info-sign"></span></a></td>
      <td></td>
    </tr>
    <tr>
      <th scope="row">Arrival Sequencing and Metering (ASMA) additional time<br><small>Monthly ASMA <a href="{{ "/references/definition/additional_asma_time.html" | prepend: site.baseurl | prepend: site.url }}">additional</a> and <a href="{{ "/references/definition/unimpeded_asma_time.html" | prepend: site.baseurl | prepend: site.url }}">unimpeded</a> time</small></th>
      <td>Jan 2014- Jan 2019</td>
      <td><a href="{{ "/data/set/asma/ASMA_Additional_Time.xlsm" | prepend: site.baseurl | prepend: site.url }}"><span class="glyphicon glyphicon-download"></span></a></td>
      <td></td>
      <td><a href="{{ "/references/dataset/ASMA_Additional_Time.html" | prepend: site.baseurl | prepend: site.url }}"><span class="glyphicon glyphicon-info-sign"></span></a></td>
      <td><a href="https://www4.icao.int/ganpportal/ASBU/KPI?IDs=8" target="_blank">KPI 08</a></td>
    </tr>
    <tr>
      <th scope="row">Vertical flight efficiency - Continuous climb and descent operations<br><small>Monthly continuous climb and descent data</small></th>
      <td>Jan 2015 - Feb 2019</td>
      <td><a href="{{ "/data/set/cdo_cco/Vertical_Flight_Efficiency_cdo_cco.xlsm" | prepend: site.baseurl | prepend: site.url }}"><span class="glyphicon glyphicon-download"></span></a> </td>
      <td></td>
      <td><a href="{{ "/references/dataset/Continuous_Climb_Descent.html" | prepend: site.baseurl | prepend: site.url }}"><span class="glyphicon glyphicon-info-sign"></span></a> </td>
      <td><a href="https://www4.icao.int/ganpportal/ASBU/KPI?IDs=17" target="_blank">KPI 17</a>,
          <a href="https://www4.icao.int/ganpportal/ASBU/KPI?IDs=19" target="_blank">KPI 19</a>
      </td>
    </tr>
    <tr>
      <th scope="row">Taxi-out additional time<br><small>Monthly taxi-out <a href="{{ "/references/definition/additional_taxi-out_time.html" | prepend: site.baseurl | prepend: site.url }}">additional</a> and <a href="{{ "/references/definition/unimpeded_taxi-out_time.html" | prepend: site.baseurl | prepend: site.url }}">unimpeded</a> time</small></th>
      <td>Jan 2014- Jan 2019</td>
      <td><a href="{{ "/data/set/tx_out/Taxi-Out_Additional_Time.xlsm" | prepend: site.baseurl | prepend: site.url }}"><span class="glyphicon glyphicon-download"></span></a> </td>
      <td></td>
      <td><a href="{{ "/references/dataset/Taxi-Out_Additional_Time.html" | prepend: site.baseurl | prepend: site.url }}"><span class="glyphicon glyphicon-info-sign"></span></a> </td>
      <td><a href="https://www4.icao.int/ganpportal/ASBU/KPI?IDs=2" target="_blank">KPI 02</a></td>
    </tr>
    <tr>
      <th scope="row"> ATC pre-departure delays<br><small>daily <a href="{{ "/references/definition/atc_pre-departure_delay.html" | prepend: site.baseurl | prepend: site.url }}">ATC pre-departure delay</a> by airport</small></th>
      <td>Jan 2016- Jan 2019</td>
      <td><a href="{{ "/data/set/atc_pre/ATC_Pre-Departure_Delay.xlsm" | prepend: site.baseurl | prepend: site.url }}"><span class="glyphicon glyphicon-download"></span></a> </td>
      <td></td>
      <td><a href="{{ "/references/dataset/ATC_Pre-Departure_Delay.html" | prepend: site.baseurl | prepend: site.url }}"><span class="glyphicon glyphicon-info-sign"></span></a> </td>
      <td></td>
    </tr>
    <tr>
      <th scope="row">ATFM slot adherence<br><small>daily ATFM slot adherence by airport</small></th>
      <td>Jan 2016 - Feb 2019</td>
      <td><a href="{{ "/data/set/slt_adh/ATFM_Slot_Adherence.xlsm" | prepend: site.baseurl | prepend: site.url }}"><span class="glyphicon glyphicon-download"></span></a> </td>
      <td></td>
      <td><a href="{{ "/references/dataset/ATFM_Slot_Adherence.html" | prepend: site.baseurl | prepend: site.url }}"><span class="glyphicon glyphicon-info-sign"></span></a> </td>
      <td><a href="https://www4.icao.int/ganpportal/ASBU/KPI?IDs=3" target="_blank">KPI 03</a></td>
    </tr>
  </tbody>
</table>
</div>

### {% img prcq-traffic.png magick:resize:50x50 alt:'Traffic' class:'leadimg' %} Traffic

<div class="table-responsive">
<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">Data description</th>
      <th scope="col">Period</th>
      <th scope="col">Excel</th>
      <th scope="col">CSV</th>
      <th scope="col">Meta</th>
      <th scope="col"><a href="{{ "/references/acronym/ganp.html" | prepend: site.baseurl | prepend: site.url }}">ICAO GANP</a></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">Complexity (based on <a href="{{ "/references/acronym/bada.html" | prepend: site.baseurl | prepend: site.url }}">BADA</a> version 3.6)<br><small>Complexity by ANSP</small></th>
      <td>Jan 2014 - Dec 2016</td>
      <td><a href="{{ "/data/set/cplx/Traffic_Complexity_Scores_1.xlsm" | prepend: site.baseurl | prepend: site.url }}"><span class="glyphicon glyphicon-download"></span></a> </td>
      <td></td>
      <td><a href="{{ "/references/dataset/Traffic_Complexity_Score.html" | prepend: site.baseurl | prepend: site.url }}"><span class="glyphicon glyphicon-info-sign"></span></a> </td>
      <td></td>
    </tr>
    <tr>
      <th scope="row">Complexity (based on <a href="{{ "/references/acronym/bada.html" | prepend: site.baseurl | prepend: site.url }}">BADA</a> version 3.13.1)<br><small>Complexity by ANSP</small></th>
      <td>Jan 2017 - Jan 2019</td>
      <td><a href="{{ "/data/set/cplx/Traffic_Complexity_Scores_2.xlsm" | prepend: site.baseurl | prepend: site.url }}"><span class="glyphicon glyphicon-download"></span></a> </td>
      <td></td>
      <td><a href="{{ "/references/dataset/Traffic_Complexity_Score.html" | prepend: site.baseurl | prepend: site.url }}"><span class="glyphicon glyphicon-info-sign"></span></a> </td>
      <td></td>
    </tr>  
  </tbody>
</table>
</div>


### {% img prcq-economics.png magick:resize:50x50 alt:'ATM Cost-Effectiveness (ACE) operational data' class:'leadimg' %} ATM Cost-Effectiveness (ACE) operational data

<div class="table-responsive">
<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">Data description</th>
      <th scope="col">Period</th>
      <th scope="col">Excel</th>
      <th scope="col">CSV</th>
      <th scope="col">Meta</th>
      <th scope="col"><a href="{{ "/references/acronym/ganp.html" | prepend: site.baseurl | prepend: site.url }}">ICAO GANP</a></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">ACE operational data<br><small>Monthly ACE operational data</small></th>
      <td>Jan 2017 - Jan 2019</td>
      <td><a href="{{ "/data/set/ace_opt/ACE_Monthly_Operational_Data.xlsm" | prepend: site.baseurl | prepend: site.url }}"><span class="glyphicon glyphicon-download"></span></a> </td>
      <td></td>
      <td><a href="{{ "/references/dataset/ACE_Monthly_Operational_Data.html" | prepend: site.baseurl | prepend: site.url }}">specs</a> </td>
      <td></td>
    </tr>
  </tbody>
</table>
</div>
<br>

<div class="container text-center">
{% include _subscriber-button.html %}
</div>