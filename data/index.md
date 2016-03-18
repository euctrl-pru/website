---
layout: default
title: Data
permalink: /data/
excerpt: Performance Review Unit Data Download (Excel and CSV).
keywords: performance, data, statistics, economics, air transport, flights, europe, cost efficiency
dates:
  ert_flt:
    beg: Jan 2014
    end: Feb 2016
  ert_dly:
    beg: Jan 2014
    end: Feb 2016
  hfe:
    beg: Jan 2014
    end: Feb 2016
  hfe_kpi:
    beg: Dec 2014
    end: Feb 2016
  apt_flt:
    beg: Jan 2014
    end: Feb 2016
  apt_dly:
    beg: Jan 2014
    end: Feb 2016
  asma:
    beg: Jan 2014
    end: Jan 2016
  tx_out:
    beg: Jan 2014
    end: Jan 2016
  atc_pre:
    beg: Jan 2014
    end: Jan 2016
  slt_adh:
    beg: Jan 2014
    end: Feb 2016
  ace_opt:
    beg: Jan 2014
    end: Feb 2016
  cplx:
    beg: Jan 2014
    end: Feb 2016
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

<div class="well">

<h2><small>Copyright notice and Disclaimer</small></h2>

<small><span style="text-aligh:left">&copy; {{ site.time | date: '%Y' }} {{ site.owner.name }}.</span></small>

This data is published by the the <small style="font-variant: small-caps;">EUROCONTROL</small> Performance Review Unit
in the interest of the exchange of information.
It may be copied in whole or in part providing that this copyright notice and disclaimer are included.
The information may not be modified without prior written permission from the
<small style="font-variant: small-caps;">EUROCONTROL</small> Performance Review Unit.

The information does not necessarily reflect the official views or policy of
<small style="font-variant: small-caps;">EUROCONTROL</small>,
which makes no warranty, either implied or express, for the information contained in this document,
including its accuracy, completeness or usefulness.

For feedback or questions please contact us at: [Performance Review Unit](mailto:{{ site.owner.email }}) ({{ site.owner.email }}).

<div class="container text-center">
{% include _subscriber-button.html %}
</div>

</div>

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
width: 4em;
}

th:nth-child(5) {
width: 8em;
}
</style>
## Operations

### En-route

|    Data description                                                                                                                       |     Period                                                  |    Excel                          |    CSV                                        |    Metadata                      |
|-------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------|-----------------------------------|-----------------------------------------------|----------------------------------|
| En-route IFR flights<br><small>Daily IFR traffic by entity</small>                                                                        | {{ page.dates.ert_flt.beg }} - {{ page.dates.ert_flt.end }} | [xls {{ page.dwnld_i }}][ERT-FLTxlsx] |                                               | [meta {{ page.info_i }}][ERT-FLTmeta] |
| En-route ATFM delays<br><small>Daily IFR traffic and en-route [ATFM delay](/references/definition/atfm_delay.html) by entity and delay cause</small>                                | {{ page.dates.ert_dly.beg }} - {{ page.dates.ert_dly.end }} | [xls {{ page.dwnld_i }}][ERT-DLYxlsx] |                                               | [meta {{ page.info_i }}][ERT-DLYmeta] |
| Horizontal en-route flight efficiency<br><small>Daily [en-route flight efficiency](/references/methodology/horizontal_flight_efficiency.html) data by entity (actual trajectory & flight plan)</small> | {{ page.dates.hfe.beg }} - {{ page.dates.hfe.end }}         | [xls {{ page.dwnld_i }}][HFExlsx]     | [csv {{ page.fltr_i }} {{ page.ndwk_i }}][HFEcsv] | [meta {{ page.info_i }}][HFEmeta]     |

[ERT-FLTxlsx]: <{{site.url}}/data/set/ert_flt/En-Route_Traffic.xlsm> "ERT-FLT (Excel)"
[ERT-FLTcsv]: <{{site.url}}/404.html> "ERT-FLT (CSV)"
[ERT-FLTmeta]: <{{site.url}}/references/dataset/En-Route_Traffic.html> "ERT-FLT (Meta)"

[ERT-DLYxlsx]: <{{site.url}}/data/set/ert_dly/En-Route_ATFM_Delay.xlsm> "ERT-DLY (Excel)"
[ERT-DLYcsv]: <{{site.url}}/404.html> "ERT-DLY (CSV)"
[ERT-DLYmeta]: <{{site.url}}/references/dataset/En-Route_ATFM_Delay.html> "ERT-DLY (Meta)"

[HFExlsx]: <{{site.url}}/data/set/hfe/Horizontal_Flight_Efficiency.xlsm> "HFE (Excel)"
[HFEcsv]: <{{site.url}}/data/set/hfe/horizontal_flight_efficiency.html> "HFE (CSV)"
[HFEmeta]: <{{site.url}}/references/dataset/Horizontal_Flight_Efficiency.html> "HFE (Meta)"

### Airport/terminal

| Data description                                                                                                              | Period                                                       | Excel                             | CSV                                               | Metadata                         |
|-------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------|-----------------------------------|---------------------------------------------------|----------------------------------|
| Airport traffic<br><small>Daily IFR arrivals and departures by airport</small>                                                | {{ page.dates.apt_flt.beg }} - {{ page.dates.apt_flt.end }}  | [xls {{ page.dwnld_i }}][APT-FLTxlsx] |                                                   | [meta {{ page.info_i }}][APT-FLTmeta] |
| Airport arrival ATFM delays<br><small>Daily IFR arrivals and airport arrival [ATFM delay](/references/definition/atfm_delay.html) by airport and delay category</small> | {{ page.dates.apt_dly.beg }} - {{ page.dates.apt_dly.end }}  | [xls {{ page.dwnld_i }}][APT-DLYxlsx] | [csv {{ page.fltr_i }} {{ page.ndwk_i }}][APT-DLYcsv] | [meta {{ page.info_i }}][APT-DLYmeta] |
| Arrival Sequencing and Metering (ASMA) additional time<br><small>Monthly ASMA [additional](/references/definition/additional_asma_time.html) and [unimpeded](/references/definition/unimpeded_asma_time.html) time</small>           | {{ page.dates.asma.beg }} - {{ page.dates.asma.end }}        | [xls {{ page.dwnld_i }}][ASMAxlsx]    |                                                   | [meta {{ page.info_i }}][ASMAmeta]    |
| Taxi-out additional time<br><small>Monthly taxi out [additional](/references/definition/additional_taxi-out_time.html) and [unimpeded](/references/definition/unimpeded_taxi-out_time.html) time</small>                                     | {{ page.dates.tx_out.beg }} - {{ page.dates.tx_out.end }}    | [xls {{ page.dwnld_i }}][TX-OUTxlsx]  |                                                   | [meta {{ page.info_i }}][TX-OUTmeta]  |
| ATC pre-departure delays<br><small>Daily [ATC pre-departure delay](/references/definition/atc_pre-departure_delay.html) by airport</small>             | {{ page.dates.atc_pre.beg }} - {{ page.dates.atc_pre.end }}  | [xls {{ page.dwnld_i }}][ATC-PRExlsx] |                                                   | [meta {{ page.info_i }}][ATC-PREmeta] |
| ATFM slot adherence<br><small>Daily ATFM slot adherence by airport</small>                                                    | {{ page.dates.slt_adh.beg }} - {{ page.dates.slt_adh.end }}  | [xls {{ page.dwnld_i }}][SLT-ADHxlsx] |                                                   | [meta {{ page.info_i }}][SLT-ADHmeta] |


[APT-FLTxlsx]: <{{site.url}}/data/set/apt_flt/Airport_Traffic.xlsm> "APT-FLT (Excel)"
[APT-FLTcsv]: <{{site.url}}/404.html> "APT-FLT (CSV)"
[APT-FLTmeta]: <{{site.url}}/references/dataset/Airport_Traffic.html>  "APT-FLT (Meta)"

[APT-DLYxlsx]: <{{site.url}}/data/set/apt_dly/Airport_Arrival_ATFM_Delay.xlsm> "APT-DLY (Excel)"
[APT-DLYcsv]: <{{site.url}}/data/set/apt_dly/airport_arrival_atfm_delay.html> "APT-DLY (CSV)"
[APT-DLYmeta]: <{{site.url}}/references/dataset/Airport_Arrival_ATFM_Delay.html> "APT-DLY (Meta)"

[ASMAxlsx]: <{{site.url}}/data/set/asma/ASMA_Additional_Time.xlsm> "ASMA (Excel)"
[ASMAcsv]: <{{site.url}}/404.html> "ASMA (CSV)"
[ASMAmeta]: <{{site.url}}/references/dataset/ASMA_Additional_Time.html> "ASMA (Meta)"

[TX-OUTxlsx]: <{{site.url}}/data/set/tx_out/Taxi-Out_Additional_Time.xlsm> "TX-OUT (Excel)"
[TX-OUTcsv]: <{{site.url}}/404.html> "TX-OUT (CSV)"
[TX-OUTmeta]: <{{site.url}}/references/dataset/Taxi-Out_Additional_Time.html> "TX-OUT (Meta)"

[ATC-PRExlsx]: <{{site.url}}/data/set/atc_pre/ATC_Pre-Departure_Delay.xlsm> "ATC-PRE (Excel)"
[ATC-PREmeta]: <{{site.url}}/references/dataset/ATC_Pre-Departure_Delay.html>  "ATC-PRE (Meta)"

[SLT-ADHxlsx]: <{{site.url}}/data/set/slt_adh/ATFM_Slot_Adherence.xlsm> "SLT-ADH (Excel)"
[SLT-ADHmeta]: <{{site.url}}/references/dataset/ATFM_Slot_Adherence.html> "SLT-ADH (Meta)"

### ATM Cost-Effectiveness (ACE) operational data

| Data description                                                    | Period                                                      | Excel                          | CSV | Metadata |
|---------------------------------------------------------------------|-------------------------------------------------------------|--------------------------------|-----|----------|
| ACE operational data<br><small>Monthly ACE operational data</small> | {{ page.dates.ace_opt.beg }} - {{ page.dates.ace_opt.end }} | [xls {{ page.dwnld_i }}][ACExlsx]  |     |          |

[ACExlsx]: <{{site.url}}/data/set/ace_opt/ACE_Monthly_Operational_Data.xls> "ACE (Excel)"
[ACEcsv]: <{{site.url}}/404.html> "ACE (CSV)"
[ACEmeta]: <{{site.url}}/references/dataset/ACE_Monthly_Operational_Data.html> "ACE (Meta)"

### Traffic complexity scores

| Data description                                             | Period                                                | Excel                          | CSV | Metadata                      |
|--------------------------------------------------------------|-------------------------------------------------------|--------------------------------|-----|-------------------------------|
| Complexity<br><small>Complexity by ANSP</small> | {{ page.dates.cplx.beg }} - {{ page.dates.cplx.end }} | [xls {{ page.dwnld_i }}][CPLXxlsx] |     | [meta {{ page.info_i }}][CPLXmeta] |

[CPLXxlsx]: <{{site.url}}/data/set/clpx/Traffic_Complexity_Scores.xlsm> "CPLX (Excel)"
[CPLXcsv]: <{{site.url}}/404.html> "CPLX (CSV)"
[CPLXmeta]: <{{site.url}}/references/dataset/Traffic_Complexity_Score.html> "CPLX (Meta)"

<br>

{{ page.dwnld_i }} = dataset download.<br>
{{ page.info_i }} = info on dataset.<br>
{{ page.fltr_i }} = filter for dataset and download.<br>
{{ page.ndwk_i }} = experimental, [feedback](mailto:{{ site.owner.email }}) is more than welcome.<br>
{{ page.attn_i }} = not (yet?) available.<br>
