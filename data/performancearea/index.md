---
layout: default
title: Data by Performance Area
permalink: /data/performancearea/
excerpt: Performance Review Unit Data Download (Excel and CSV).
keywords: performance, data, statistics, economics, air transport, flights, europe, cost efficiency
dates:
  ert_flt:
    beg: Jan 2014
    end: Feb 2017
  ert_dly_aua:
    beg: Jan 2011
    end: Feb 2017
  ert_dly_fir:
    beg: Jan 2013
    end: Feb 2017
  hfe:
    beg: Jan 2014
    end: Feb 2017
  apt_flt:
    beg: Jan 2014
    end: Feb 2017
  apt_dly:
    beg: Jan 2014
    end: Feb 2017
  asma:
    beg: Jan 2014
    end: Jan 2017
  cdo:
    beg: Jan 2015
    end: Feb 2017
  tx_out:
    beg: Jan 2014
    end: Jan 2017
  atc_pre:
    beg: Jan 2014
    end: Jan 2017
  slt_adh:
    beg: Jan 2014
    end: Feb 2017
  ace_opt:
    beg: Jan 2014
    end: Feb 2017
  cplx:
    beg: &cplxbeg Jan 2014
    end: &cplxend Dec 2016

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
## Operations

Please note that software release 20.0 of the Network Manager on 04 April 2016 introduced
a change to improve the accuracy of the ATFM delay calculation for operational purposes.
For more information on the the change in methodology
<a href="{{ "/references/methodology/ATFM_delay_calculation.html" | prepend: site.baseurl | prepend: site.url }}">click here</a>.

### {% img prcq-operations-enroute.png magick:resize:50x50 alt:'Operations En-route' class:'leadimg' %} Operations En-route

| Data description                                             | Period                                                 | Excel                              | CSV | Metadata                           |
|-------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------|-----------------------------------|-----------------------------------------------|----------------------------------|
| En-route IFR flights and ATFM delays [(AUA)][DefAUA] - **[Version 1][DelayREA]** <br><small>Daily IFR traffic and en-route [ATFM delay][ATFMdelay] by entity and delay cause (AUA based)</small>  | {{ page.dates.ert_dly_aua.beg }} - {{ page.dates.ert_dly_aua.end }} | [xls {{ page.dwnld_i }}][ERT-DLY-AUA-v1xlsx] |                                               | [meta {{ page.info_i }}][ERT-DLY-AUA-meta] |
| En-route IFR flights and ATFM delays [(AUA)][DefAUA] - **[Version 2][DelayREA]** <br><small>Daily IFR traffic and en-route [ATFM delay][ATFMdelay] by entity and delay cause (AUA based)</small>  | {{ page.dates.ert_dly_aua.beg }} - {{ page.dates.ert_dly_aua.end }} | [xls {{ page.dwnld_i }}][ERT-DLY-AUA-v2xlsx] |                                               | [meta {{ page.info_i }}][ERT-DLY-AUA-meta] |
| En-route IFR flights and ATFM delays [(FIR)][DefFIR] - **[Version 1][DelayREA]** <br><small>Daily IFR traffic and en-route [ATFM delay][ATFMdelay] by entity and delay cause (FIR based)</small>  | {{ page.dates.ert_dly_fir.beg }} - {{ page.dates.ert_dly_fir.end }} | [xls {{ page.dwnld_i }}][ERT-DLY-FIR-v1xlsx] |                                               | [meta {{ page.info_i }}][ERT-DLY-FIR-meta] |
| En-route IFR flights and ATFM delays [(FIR)][DefFIR] - **[Version 2][DelayREA]** <br><small>Daily IFR traffic and en-route [ATFMd elay][ATFMdelay] by entity and delay cause (FIR based)</small>  | {{ page.dates.ert_dly_fir.beg }} - {{ page.dates.ert_dly_fir.end }} | [xls {{ page.dwnld_i }}][ERT-DLY-FIR-v2xlsx] |                                               | [meta {{ page.info_i }}][ERT-DLY-FIR-meta] |
| Horizontal en-route flight efficiency <br><small>Daily [en-route flight efficiency][DefFE] data by entity (HFE actual trajectory and flight plan, KEP and KEA indicators)</small>                                                           | {{ page.dates.hfe.beg }} - {{ page.dates.hfe.end }}         | [xls {{ page.dwnld_i }}][HFExlsx]     | [csv {{ page.fltr_i }} {{ page.ndwk_i }}][HFEcsv] | [meta {{ page.info_i }}][HFEmeta]     |

<br><small>
**Version 1**: Old methodology for the entire period.
<br>
**Version 2**: New methodology as of 04 April 2016.
</small>

[ATFMdelay]: <{{ "" | prepend: site.baseurl | prepend: site.url }}/references/definition/atfm_delay.html> "ATFM Delay definition"

[ERT-DLY-AUA-v2xlsx]: <{{ "/data/set/ert_dly/En-Route_ATFM_Delay_AUA_v2.xlsm" | prepend: site.baseurl | prepend: site.url }}> "ERT-DLY (Excel)"
[ERT-DLY-AUA-v1xlsx]: <{{ "/data/set/ert_dly/En-Route_ATFM_Delay_AUA_v1.xlsm" | prepend: site.baseurl | prepend: site.url }}> "ERT-DLY (Excel)"
[ERT-DLY-FIR-v2xlsx]: <{{ "/data/set/ert_dly/En-Route_ATFM_Delay_FIR_v2.xlsm" | prepend: site.baseurl | prepend: site.url }}> "ERT-DLY (Excel)"
[ERT-DLY-FIR-v1xlsx]: <{{ "/data/set/ert_dly/En-Route_ATFM_Delay_FIR_v1.xlsm" | prepend: site.baseurl | prepend: site.url }}> "ERT-DLY (Excel)"
[ERT-DLYcsv]: <{{ "/404.html" | prepend: site.baseurl | prepend: site.url }}> "ERT-DLY (CSV)"
[ERT-DLY-AUA-meta]: <{{ "/references/dataset/En-Route_ATFM_Delay_AUA.html" | prepend: site.baseurl | prepend: site.url }}> "ERT-DLY (Meta)"
[ERT-DLY-FIR-meta]: <{{ "/references/dataset/En-Route_ATFM_Delay_FIR.html" | prepend: site.baseurl | prepend: site.url }}> "ERT-DLY (Meta)"

[HFExlsx]: <{{ "/data/set/hfe/Horizontal_Flight_Efficiency.xlsm" | prepend: site.baseurl | prepend: site.url }}> "HFE (Excel)"
[HFEcsv]: <{{ "/data/set/hfe/horizontal_flight_efficiency.html" | prepend: site.baseurl | prepend: site.url }}> "HFE (CSV)"
[HFEmeta]: <{{ "/references/dataset/Horizontal_Flight_Efficiency.html" | prepend: site.baseurl | prepend: site.url }}> "HFE (Meta)"

[DefAUA]: <{{ "/references/acronym/aua.html" | prepend: site.baseurl | prepend: site.url }}> "AUA definition"
[DefFIR]: <{{ "/references/acronym/fir.html" | prepend: site.baseurl | prepend: site.url }}> "FIR definition"
[DefFE]: <{{ "/references/methodology/horizontal_flight_efficiency_pi.html" | prepend: site.baseurl | prepend: site.url }}> "Flight Efficiency performance indicator"
[DelayREA]: <{{ "/references/methodology/ATFM_delay_calculation.html" | prepend: site.baseurl | prepend: site.url }}> "ATFM Delay calculation: handling of REA msg"


### {% img prcq-operations-airport.png magick:resize:50x50 alt:'Operations at Airports' class:'leadimg' %} Operations at Airports

| Data description                                                     | Period                                                       | Excel                              | CSV |  Metadata                         |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------|-----------------------------------------|---------------------------------------------------|----------------------------------|
| Airport arrival ATFM delays - **[Version 1][DelayREA]** <br><small>Daily IFR arrivals and airport arrival [ATFM delay][ATFMdelay] by airport and delay category</small> | {{ page.dates.apt_dly.beg }} - {{ page.dates.apt_dly.end }}  | [xls {{ page.dwnld_i }}][APT-DLY-v1xlsx] |  | [meta {{ page.info_i }}][APT-DLYmeta] |
| Airport arrival ATFM delays - **[Version 2][DelayREA]** <br><small>Daily IFR arrivals and airport arrival [ATFM delay][ATFMdelay] by airport and delay category</small> | {{ page.dates.apt_dly.beg }} - {{ page.dates.apt_dly.end }}  | [xls {{ page.dwnld_i }}][APT-DLY-v2xlsx] | [csv {{ page.fltr_i }} {{ page.ndwk_i }}][APT-DLYcsv] | [meta {{ page.info_i }}][APT-DLYmeta] |
| Airport traffic<br><small>Daily IFR arrivals and departures by airport</small>                                                                                          | {{ page.dates.apt_flt.beg }} - {{ page.dates.apt_flt.end }}  | [xls {{ page.dwnld_i }}][APT-FLTxlsx]   |                                                   | [meta {{ page.info_i }}][APT-FLTmeta] |
| Arrival Sequencing and Metering (ASMA) additional time<br><small>Monthly ASMA [additional][ASMAadditional] and [unimpeded][ASMAunimpeded] time</small>                  | {{ page.dates.asma.beg }} - {{ page.dates.asma.end }}        | [xls {{ page.dwnld_i }}][ASMAxlsx]    |                                                   | [meta {{ page.info_i }}][ASMAmeta]    |
| Vertical flight efficiency - Continuous climb and descent operations<br><small>Monthly continuous climb and descent data</small>                  | {{ page.dates.cdo.beg }} - {{ page.dates.cdo.end }}        | [xls {{ page.dwnld_i }}][CDOxlsx]    |                                                   | [meta {{ page.info_i }}][CDOmeta]    |
| Taxi-out additional time<br><small>Monthly taxi out [additional][TX-OUTadditional] and [unimpeded][TX-OUTunimpeded] time</small>  | {{ page.dates.tx_out.beg }} - {{ page.dates.tx_out.end }}    | [xls {{ page.dwnld_i }}][TX-OUTxlsx]  |                                                   | [meta {{ page.info_i }}][TX-OUTmeta]  |
| ATC pre-departure delays<br><small>Daily [ATC pre-departure delay][ATCpredepdelay] by airport</small>                         | {{ page.dates.atc_pre.beg }} - {{ page.dates.atc_pre.end }}  | [xls {{ page.dwnld_i }}][ATC-PRExlsx] |                                                   | [meta {{ page.info_i }}][ATC-PREmeta] |
| ATFM slot adherence<br><small>Daily ATFM slot adherence by airport</small>                                                    | {{ page.dates.slt_adh.beg }} - {{ page.dates.slt_adh.end }}  | [xls {{ page.dwnld_i }}][SLT-ADHxlsx] |                                                   | [meta {{ page.info_i }}][SLT-ADHmeta] |

<br><small>
**Version 1**: Old methodology for the entire period.
<br>
**Version 2**: New methodology as of 04 April 2016.
</small>

[ASMAadditional]: <{{ "/references/definition/additional_asma_time.html" | prepend: site.baseurl | prepend: site.url }}> "ASMA Additional Time definition"
[ASMAunimpeded]: <{{ "/references/definition/unimpeded_asma_time.html" | prepend: site.baseurl | prepend: site.url }}> "ASMA Unimpeded Time definition"
[TX-OUTadditional]: <{{ "/references/definition/additional_taxi-out_time.html" | prepend: site.baseurl | prepend: site.url }}> "Taxi-out Additional Time definition"
[TX-OUTunimpeded]: <{{ "/references/definition/unimpeded_taxi-out_time.html" | prepend: site.baseurl | prepend: site.url }}> "Taxi-out Unimpeded Time definition"
[ATCpredepdelay]: <{{ "/references/definition/atc_pre-departure_delay.html" | prepend: site.baseurl | prepend: site.url }}> "ATC Pre-departure Delay definition"

[APT-FLTxlsx]: <{{ "/data/set/apt_flt/Airport_Traffic.xlsm" | prepend: site.baseurl | prepend: site.url }}> "APT-FLT (Excel)"
[APT-FLTcsv]: <{{ "/404.html" | prepend: site.baseurl | prepend: site.url }}> "APT-FLT (CSV)"
[APT-FLTmeta]: <{{ "/references/dataset/Airport_Traffic.html" | prepend: site.baseurl | prepend: site.url }}>  "APT-FLT (Meta)"

[APT-DLY-v2xlsx]: <{{ "/data/set/apt_dly/Airport_Arrival_ATFM_Delay_v2.xlsm" | prepend: site.baseurl | prepend: site.url }}> "APT-DLY (Excel)"
[APT-DLY-v1xlsx]: <{{ "/data/set/apt_dly/Airport_Arrival_ATFM_Delay_v1.xlsm" | prepend: site.baseurl | prepend: site.url }}> "APT-DLY (Excel)"
[APT-DLYcsv]: <{{ "/data/set/apt_dly/airport_arrival_atfm_delay.html" | prepend: site.baseurl | prepend: site.url }}> "APT-DLY (CSV)"
[APT-DLYmeta]: <{{ "/references/dataset/Airport_Arrival_ATFM_Delay.html" | prepend: site.baseurl | prepend: site.url }}> "APT-DLY (Meta)"

[ASMAxlsx]: <{{ "/data/set/asma/ASMA_Additional_Time.xlsm" | prepend: site.baseurl | prepend: site.url }}> "ASMA (Excel)"
[ASMAcsv]: <{{ "/404.html" | prepend: site.baseurl | prepend: site.url }}> "ASMA (CSV)"
[ASMAmeta]: <{{ "/references/dataset/ASMA_Additional_Time.html" | prepend: site.baseurl | prepend: site.url }}> "ASMA (Meta)"

[CDOxlsx]: <{{ "/data/set/cdo_cco/Vertical_Flight_Efficiency_cdo_cco.xlsm" | prepend: site.baseurl | prepend: site.url }}> "CDO/CCO (Excel)"
[CDOcsv]: <{{ "/404.html" | prepend: site.baseurl | prepend: site.url }}> "CDO/CCO (CSV)"
[CDOmeta]: <{{ "/references/dataset/Continuous_Climb_Descent.html" | prepend: site.baseurl | prepend: site.url }}> "CDO/CCO (Meta)"

[TX-OUTxlsx]: <{{ "/data/set/tx_out/Taxi-Out_Additional_Time.xlsm" | prepend: site.baseurl | prepend: site.url }}> "TX-OUT (Excel)"
[TX-OUTcsv]: <{{ "/404.html" | prepend: site.baseurl | prepend: site.url }}> "TX-OUT (CSV)"
[TX-OUTmeta]: <{{ "/references/dataset/Taxi-Out_Additional_Time.html" | prepend: site.baseurl | prepend: site.url }}> "TX-OUT (Meta)"

[ATC-PRExlsx]: <{{ "/data/set/atc_pre/ATC_Pre-Departure_Delay.xlsm" | prepend: site.baseurl | prepend: site.url }}> "ATC-PRE (Excel)"
[ATC-PREmeta]: <{{ "/references/dataset/ATC_Pre-Departure_Delay.html" | prepend: site.baseurl | prepend: site.url }}>  "ATC-PRE (Meta)"

[SLT-ADHxlsx]: <{{ "/data/set/slt_adh/ATFM_Slot_Adherence.xlsm" | prepend: site.baseurl | prepend: site.url }}> "SLT-ADH (Excel)"
[SLT-ADHmeta]: <{{ "/references/dataset/ATFM_Slot_Adherence.html" | prepend: site.baseurl | prepend: site.url }}> "SLT-ADH (Meta)"

### ATM Cost-Effectiveness (ACE) operational data

| Data description                                                     | Period                                                       | Excel                              | CSV |  Metadata                         |
|----------------------------------------------------------------------|--------------------------------------------------------------|------------------------------------|-----|-----------------------------------|
| ACE operational data<br><small>Monthly ACE operational data</small>  | {{ page.dates.ace_opt.beg }} - {{ page.dates.ace_opt.end }}  | [xls {{ page.dwnld_i }}][ACExlsx]  |     | [specs {{ page.info_i }}][ACEurl] |

[ACExlsx]: <{{ "/data/set/ace_opt/ACE_Monthly_Operational_Data.xls" | prepend: site.baseurl | prepend: site.url }}> "ACE (Excel)"
[ACEcsv]: <{{ "/404.html" | prepend: site.baseurl | prepend: site.url }}> "ACE (CSV)"
[ACEmeta]: <{{ "/references/dataset/ACE_Monthly_Operational_Data.html" | prepend: site.baseurl | prepend: site.url }}> "ACE (Meta)"
[ACEurl]: <http://www.eurocontrol.int/documents/economic-information-disclosure-specification> "ACE specs"

### {% img prcq-traffic.png magick:resize:50x50 alt:'Traffic' class:'leadimg' %} Traffic

| Data description                                             | Period                                                 | Excel                              | CSV | Metadata                           |
|--------------------------------------------------------------|--------------------------------------------------------|------------------------------------|-----|------------------------------------|
| Complexity<br><small>Complexity by ANSP</small>              | {{ page.dates.cplx.beg }} - {{ page.dates.cplx.end }}  | [xls {{ page.dwnld_i }}][CPLXxlsx] |    | [meta {{ page.info_i }}][CPLXmeta] |

[CPLXxlsx]: <{{ "/data/set/cplx/Traffic_Complexity_Scores.xlsm" | prepend: site.baseurl | prepend: site.url }}> "CPLX (Excel)"
[CPLXcsv]: <{{ "/404.html" | prepend: site.baseurl | prepend: site.url }}> "CPLX (CSV)"
[CPLXmeta]: <{{ "/references/dataset/Traffic_Complexity_Score.html" | prepend: site.baseurl | prepend: site.url }}> "CPLX (Meta)"

<br>

{{ page.dwnld_i }} = dataset download.<br>
{{ page.info_i }} = info on dataset.<br>
{{ page.fltr_i }} = filter for dataset and download.<br>
{{ page.ndwk_i }} = experimental, [feedback](mailto:{{ site.owner.email }}) is more than welcome.<br>
{{ page.attn_i }} = not (yet?) available.<br>


<div class="container text-center">
{% include _subscriber-button.html %}
</div>
