---
layout: default
title: Data
permalink: /data/
excerpt: Performance Review Unit Data Download.
keywords: performance, data, statistics, economics, air transport, flights, europe, cost efficiency
---
# ANS Performance Data repository

## Copyright notice and Disclaimer

This data is published by the Performance Review Unit in the interest of the exchange of information.
It may be copied in whole or in part providing that the copyright notice and disclaimer are included.
The information may not be modified without prior written permission from the Performance Review Unit.

The data provided is used within the EU and Eurocontrol context.

The information does not necessarily reflect the official views or policy of EUROCONTROL,
which makes no warranty, either implied or express, for the information contained in this document,
neither does it assume any legal liability or responsibility for the accuracy, completeness or usefulness
of this information.


<br><br>
For feedback or questions please contact us at: [Performance Review Unit](mailto:{{ site.owner.email }}) ({{ site.owner.email }}).
<br><br>

<span class="glyphicon glyphicon-exclamation-sign"></span> = under construction.

<style>
th:nth-child(2) {
width: 11em;
}

th:nth-child(3) {
width: 10em;
}

th:nth-child(4) {
width: 11em;
}

th:nth-child(5) {
width: 10em;
}
</style>
## Operations

### En-route

| Data description                                                                                                                          | Available data      | Excel download                 | Tailored extracts               | Meta data                     |
|-------------------------------------------------------------------------------------------------------------------------------------------|---------------------|--------------------------------|---------------------------------|-------------------------------|
| En-route IFR flights<br><small>Daily IFR traffic by entity</small>                                                                        | Jan 2014 - May 2015 | [ERT-FLT (Excel)][ERT-FLTxlsx] | [ERT-FLT (extract)<span class="glyphicon glyphicon-exclamation-sign"></span>][ERT-FLTcsv] | [ERT-FLT (Meta)][ERT-FLTmeta] |
| En-route ATFM delays<br><small>Daily IFR traffic and en-route ATFM delay by entity and delay cause</small>                                | Jan 2014 - May 2015 | [ERT-DLY (Excel)][ERT-DLYxlsx] | [ERT-DLY (extract)<span class="glyphicon glyphicon-exclamation-sign"></span>][ERT-DLYcsv] | [ERT-DLY (Meta)][ERT-DLYmeta] |
| Horizontal en-route flight efficiency<br><small>Daily en-route flight efficiency data by entity (actual trajectory & flight plan)</small> | Jan 2014 - May 2015 | [HFE (Excel)][HFExlsx]         | [HFE (extract)<span class="glyphicon glyphicon-exclamation-sign"></span>][HFEcsv]         | [HFE (Meta)][HFEmeta]         |


[ERT-FLTxlsx]: <https://docs.google.com/spreadsheets/d/1slEnGjXKCqOI-pbHz5N8ELwA-NmvYQxiTFMOfDt8Rjs/export?format=xlsx> "ERT-FLT (Excel)"
[ERT-FLTcsv]: <{{site.url}}/404.html> "ERT-FLT (CSV)"
[ERT-FLTmeta]: <{{site.url}}/metadata/dataset/En_route_Traffic.html> "ERT-FLT (Meta)"

[ERT-DLYxlsx]: <https://docs.google.com/spreadsheets/d/1slEnGjXKCqOI-pbHz5N8ELwA-NmvYQxiTFMOfDt8Rjs/export?format=xlsx> "DLY-FLT (Excel)"
[ERT-DLYcsv]: <{{site.url}}/404.html> "DLY-FLT (CSV)"
[ERT-DLYmeta]: <{{site.url}}/metadata/dataset/En_route_ATFM_Delay.html> "DLY-FLT (Meta)"

[HFExlsx]: <https://drive.google.com/uc?export=download&id=0B9A6maXsk_-cTDdUT0lEOGdaM1U> "HFE (Excel)"
[HFEcsv]: <{{site.url}}/404.html> "HFE (CSV)"
[HFEmeta]: <{{site.url}}/metadata/dataset/Horizontal_Flight_Efficiency.html> "HFE (Meta)"


### Airport/terminal

| Data description                                                                                                              | Available data       | Excel download                 | Tailored extracts               | Meta data                     |
|-------------------------------------------------------------------------------------------------------------------------------|----------------------|--------------------------------|---------------------------------|-------------------------------|
| Airport traffic<br><small>Daily IFR arrivals and departures by airport</small>                                                | Jan 2014 - May 2015  | [APT-FLT (Excel)][APT-FLTxlsx] | [APT-FLT (extract)<span class="glyphicon glyphicon-exclamation-sign"></span>][APT-FLTcsv] | [APT-FLT (Meta)][APT-FLTmeta] |
| Airport arrival ATFM delays<br><small>Daily IFR arrivals and airport arrival ATFM delay by airport and delay category</small> | Jan 2014 - May 2015  | [APT-DLY (Excel)][APT-DLYxlsx] | [APT-DLY (extract)][APT-DLYcsv] | [APT-DLY (Meta)][APT-DLYmeta] |
| Arrival Sequencing and Metering (ASMA) additional time<br><small>Monthly ASMA additional and unimpeded time</small>           | Jan 2014 - Apr. 2015 | [ASMA (Excel)][ASMAxlsx]       | [ASMA (extract)<span class="glyphicon glyphicon-exclamation-sign"></span>][ASMAcsv]       | [ASMA (Meta)][ASMAmeta]       |
| Taxi-out additional time<br><small>Monthly taxi out additional and unimpeded time</small>                                     | Jan 2014 - Apr 2015  | [TX-OUT (Excel)][TX-OUTxlsx]   | [TX-OUT (extract)<span class="glyphicon glyphicon-exclamation-sign"></span>][TX-OUTcsv]   | [TX-OUT (Meta)][TX-OUTmeta]   |
| ATC pre-departure delays (ICAO code 89)<br><small>Daily ATC pre-departure delay (IATA code 89) by airport</small>             | Jan 2014 - May 2015  | [ATC-PRE (Excel)][ATC-PRExlsx] |                                 | [ATC-PRE (Meta)][ATC-PREmeta] |
| ATFM slot adherence<br><small>Daily ATFM slot adherence by airport</small>                                                    | Jan 2014 - May 2015  | [SLT-ADH (Excel)][SLT-ADHxlsx] |                                 | [SLT-ADH (Meta)][SLT-ADHmeta] |


[APT-FLTxlsx]: <https://docs.google.com/spreadsheets/d/13ussBrCF688P_7M3hARaiqdk262tJLUKG8HzJryY69g/export?format=xlsx> "APT-FLT (Excel)"
[APT-FLTcsv]: <{{site.url}}/404.html> "APT-FLT (CSV)"
[APT-FLTmeta]: <{{site.url}}/metadata/dataset/Airport_Traffic.html>  "APT-FLT (Meta)"

[APT-DLYxlsx]: <https://docs.google.com/spreadsheets/d/13ussBrCF688P_7M3hARaiqdk262tJLUKG8HzJryY69g/export?format=xlsx> "APT-DLY (Excel)"
[APT-DLYcsv]: <arrival_atfm_delay.html> "APT-DLY (CSV)"
[APT-DLYmeta]: <{{site.url}}/metadata/dataset/Airport_ATFM_Delay.html> "APT-DLY (Meta)"

[ASMAxlsx]: <https://docs.google.com/spreadsheets/d/1rS6NlkUOd3gcZK5WtuWAK-XdO6XMLRHEqOlYEpp37eA/export?format=xlsx> "ASMA (Excel)"
[ASMAcsv]: <{{site.url}}/404.html> "ASMA (CSV)"
[ASMAmeta]: <{{site.url}}/metadata/dataset/ASMA_Additional_Time.html> "ASMA (Meta)"

[TX-OUTxlsx]: <https://docs.google.com/spreadsheets/d/1zXqUBH-XlL8Yb0MSQ9CYACK6E4HlBWGp-c70PVEUCkM/export?format=xlsx> "TX-OUT (Excel)"
[TX-OUTcsv]: <{{site.url}}/404.html> "TX-OUT (CSV)"
[TX-OUTmeta]: <{{site.url}}/metadata/dataset/Taxi-out_Additional_Time.html> "TX-OUT (Meta)"

[ATC-PRExlsx]: <https://docs.google.com/spreadsheets/d/13ussBrCF688P_7M3hARaiqdk262tJLUKG8HzJryY69g/export?format=xlsx> "ATC-PRE (Excel)"
[ATC-PREmeta]: <{{site.url}}/metadata/dataset/ATC_Pre_Departure.html>  "ATC-PRE (Meta)"

[SLT-ADHxlsx]: <https://docs.google.com/spreadsheets/d/13ussBrCF688P_7M3hARaiqdk262tJLUKG8HzJryY69g/export?format=xlsx> "SLT-ADH (Excel)"
[SLT-ADHmeta]: <{{site.url}}/metadata/dataset/ATFM_Slot_Adherence.html> "SLT-ADH (Meta)"

### ATM Cost-Effectiveness (ACE) operational data

| Data description                                                    | Available data      | Excel download          | Tailored extracts       | Meta data             |
|---------------------------------------------------------------------|---------------------|-------------------------|-------------------------|-----------------------|
| ACE operational data<br><small>Monthly ACE operational data</small> | Jan 2008 - Dec 2014 | [ACE (Excel)][ACExlsx]  | [ACE (extract)][ACEcsv] | [ACE (Meta)][ACEmeta] |

[ACExlsx]: <https://docs.google.com/spreadsheets/d/1GBJWcW5rwlvP1wIUwPVwtT3zMjdvbrWcfn5CSvJhses/export?format=xlsx> "ACE (Excel)"
[ACEcsv]: <ace.html> "ACE (CSV)"
[ACEmeta]: <{{site.url}}/metadata/dataset/ACE_Operational_Data.html> "ACE (Meta)"

### Traffic complexity scores

| Data description                                                             | Available data      | Excel download | Tailored extracts | Meta data   |
|------------------------------------------------------------------------------|---------------------|----------------|-------------------|-------------|
| Complexity<br><small>Complexity by ANSP and ATC unit</small> | Jan 2014 - May 2015 | [CPLX (Excel)][CPLXxlsx]   | [CPLX (extract)<span class="glyphicon glyphicon-exclamation-sign"></span>][CPLXcsv] | [CPLX (Meta)][CPLXmeta] |

[CPLXxlsx]: <https://docs.google.com/spreadsheets/d/1GBJWcW5rwlvP1wIUwPVwtT3zMjdvbrWcfn5CSvJhses/export?format=xlsx> "CPLX (Excel)"
[CPLXcsv]: <{{site.url}}/404.html> "CPLX (CSV)"
[CPLXmeta]: <{{site.url}}/metadata/dataset/Traffic_Complexity_Score.html> "CPLX (Meta)"

<br>