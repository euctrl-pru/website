---
layout: default
title: Data
permalink: /data/
excerpt: Performance Review Unit Data Download (Excel and CSV).
keywords: performance, data, statistics, economics, air transport, flights, europe, cost efficiency
dwnld_i: <span class="glyphicon glyphicon-download-alt"></span>
info_i: <span class="glyphicon glyphicon-info-sign"></span>
ndwk_i: <span class="glyphicon glyphicon-wrench"></span>
fltr_i: <span class="glyphicon glyphicon-filter"></span>
---
# Pan-European ANS Performance data repository
<div class="well">
<h2><small>Copyright notice and Disclaimer</small></h2>

<p>This data is published by the Performance Review Unit in the interest of the exchange of information.
It may be copied in whole or in part providing that the copyright notice and disclaimer are included.
The information may not be modified without prior written permission from the Performance Review Unit.

The data provided is used within the EU and Eurocontrol context.

The information does not necessarily reflect the official views or policy of EUROCONTROL,
which makes no warranty, either implied or express, for the information contained in this document,
neither does it assume any legal liability or responsibility for the accuracy, completeness or usefulness
of this information.</p>

<br>
For feedback or questions please contact us at: [Performance Review Unit](mailto:{{ site.owner.email }}) ({{ site.owner.email }}).

<div class="container text-center">
<a href="mailto:pru@eurocontrol.int?subject=Subscribe: PRU information point&amp;body=Please%20add%20me%20to%20the%20mailing%20list%20to%20get%20informed%20about%20information%20updates." class="btn btn-primary btn-sm">Subscribe to get informed about updates</a>
</div>

</div>

<span class="glyphicon glyphicon-exclamation-sign"></span> = under construction.<br>
{{ page.ndwk_i }} = experimental, [feedback](mailto:{{ site.owner.email }}) is more than welcome.


<style>
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

| Data description                                                                                                                          | Period              | Excel                             | CSV  | Metadata                         |
|-------------------------------------------------------------------------------------------------------------------------------------------|---------------------|-----------------------------------|------|----------------------------------|
| En-route IFR flights<br><small>Daily IFR traffic by entity</small>                                                                        | Jan 2014 - Aug 2015 | [{{ page.dwnld_i }}][ERT-FLTxlsx] |      | [{{ page.info_i }}][ERT-FLTmeta] |
| En-route ATFM delays<br><small>Daily IFR traffic and en-route ATFM delay by entity and delay cause</small>                                | Jan 2014 - Aug 2015 | [{{ page.dwnld_i }}][ERT-DLYxlsx] |      | [{{ page.info_i }}][ERT-DLYmeta] |
| Horizontal en-route flight efficiency<br><small>Daily en-route flight efficiency data by entity (actual trajectory & flight plan)</small> | Jan 2014 - Aug 2015 | [{{ page.dwnld_i }}][HFExlsx]     |      | [{{ page.info_i }}][HFEmeta]     |


[ERT-FLTxlsx]: <{{site.url}}/data/set/ert_flt/En-Route_Traffic.xlsm> "ERT-FLT (Excel)"
[ERT-FLTcsv]: <{{site.url}}/404.html> "ERT-FLT (CSV)"
[ERT-FLTmeta]: <{{site.url}}/references/dataset/En-Route_Traffic.html> "ERT-FLT (Meta)"

[ERT-DLYxlsx]: <{{site.url}}/data/set/ert_dly/En-Route_ATFM_Delay.xlsm> "ERT-DLY (Excel)"
[ERT-DLYcsv]: <{{site.url}}/404.html> "ERT-DLY (CSV)"
[ERT-DLYmeta]: <{{site.url}}/references/dataset/En-Route_ATFM_Delay.html> "ERT-DLY (Meta)"

[HFExlsx]: <{{site.url}}/data/set/hfe/Horizontal_Flight_Efficiency.xlsm> "HFE (Excel)"
[HFEcsv]: <{{site.url}}/404.html> "HFE (CSV)"
[HFEmeta]: <{{site.url}}/references/dataset/Horizontal_Flight_Efficiency.html> "HFE (Meta)"


### Airport/terminal

| Data description                                                                                                              | Period               | Excel                             | CSV                                               | Metadata                         |
|-------------------------------------------------------------------------------------------------------------------------------|----------------------|-----------------------------------|---------------------------------------------------|----------------------------------|
| Airport traffic<br><small>Daily IFR arrivals and departures by airport</small>                                                | Jan 2014 - Aug 2015  | [{{ page.dwnld_i }}][APT-FLTxlsx] |                                                   | [{{ page.info_i }}][APT-FLTmeta] |
| Airport arrival ATFM delays<br><small>Daily IFR arrivals and airport arrival ATFM delay by airport and delay category</small> | Jan 2014 - Aug 2015  | [{{ page.dwnld_i }}][APT-DLYxlsx] | [{{ page.fltr_i }} {{ page.ndwk_i }}][APT-DLYcsv] | [{{ page.info_i }}][APT-DLYmeta] |
| Arrival Sequencing and Metering (ASMA) additional time<br><small>Monthly ASMA additional and unimpeded time</small>           | Jan 2014 - Jul 2015  | [{{ page.dwnld_i }}][ASMAxlsx]    |                                                   | [{{ page.info_i }}][ASMAmeta]    |
| Taxi-out additional time<br><small>Monthly taxi out additional and unimpeded time</small>                                     | Jan 2014 - Jul 2015  | [{{ page.dwnld_i }}][TX-OUTxlsx]  |                                                   | [{{ page.info_i }}][TX-OUTmeta]  |
| ATC pre-departure delays (IATA code 89)<br><small>Daily ATC pre-departure delay (IATA code 89) by airport</small>             | Jan 2014 - Jul 2015  | [{{ page.dwnld_i }}][ATC-PRExlsx] |                                                   | [{{ page.info_i }}][ATC-PREmeta] |
| ATFM slot adherence<br><small>Daily ATFM slot adherence by airport</small>                                                    | Jan 2014 - Aug 2015  | [{{ page.dwnld_i }}][SLT-ADHxlsx] |                                                   | [{{ page.info_i }}][SLT-ADHmeta] |


[APT-FLTxlsx]: <{{site.url}}/data/set/apt_flt/Airport_Traffic.xlsm> "APT-FLT (Excel)"
[APT-FLTcsv]: <{{site.url}}/404.html> "APT-FLT (CSV)"
[APT-FLTmeta]: <{{site.url}}/references/dataset/Airport_Traffic.html>  "APT-FLT (Meta)"

[APT-DLYxlsx]: <{{site.url}}/data/set/apt_dly/Airport_Arrival_ATFM_Delay.xlsm> "APT-DLY (Excel)"
[APT-DLYcsv]: <set/apt_dly/airport_arrival_atfm_delay.html> "APT-DLY (CSV)"
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

| Data description                                                    | Period              | Excel                          | CSV | Metadata |
|---------------------------------------------------------------------|---------------------|--------------------------------|-----|----------|
| ACE operational data<br><small>Monthly ACE operational data</small> | Jan 2014 - Aug 2015 | [{{ page.dwnld_i }}][ACExlsx]  |     |          |

[ACExlsx]: <{{site.url}}/data/set/ace_opt/ACE_Monthly_Operational_Data.xls> "ACE (Excel)"
[ACEcsv]: <{{site.url}}/404.html> "ACE (CSV)"
[ACEmeta]: <{{site.url}}/references/dataset/ACE_Monthly_Operational_Data.html> "ACE (Meta)"

### Traffic complexity scores

| Data description                                             | Period              | Excel                          | CSV | Metadata                      |
|--------------------------------------------------------------|---------------------|--------------------------------|-----|-------------------------------|
| Complexity<br><small>Complexity by ANSP and ATC unit</small> | Jan 2014 - Aug 2015 | to be available soon           |     | [{{ page.info_i }}][CPLXmeta] |

[CPLXxlsx]: <{{site.url}}/404.html> "CPLX (Excel)"
[CPLXcsv]: <{{site.url}}/404.html> "CPLX (CSV)"
[CPLXmeta]: <{{site.url}}/references/dataset/Traffic_Complexity_Score.html> "CPLX (Meta)"

<br>