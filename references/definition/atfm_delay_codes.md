---
layout: default
title: ATFM Delay Codes
resource: true
entity: definition
excerpt: Performance Review Unit MetaData Definitions.
keywords: metadata| performance| data| statistics| economics| air transport| flights| europe| cost efficiency
---
# {{ page.title }}

The reason for the regulation is indicated by the responsible Flow Management Position [FMP][fmp].

For post-ops analysis individual delay codes can be included in a ATFM delay group. 

See also [ATFM delay][atfm_delay].




| REF LOC | REGU REASON CODE | REGU REASON NAME | REASON GROUP | ATTRIBUTE |
|---------|------------------|------------------|--------------|-----------|
|Airport|C|ATC Capacity|AD Capacity (ATC)|Airport / TMA|
|Airport|S|ATC Staffing|AD Staffing (ATC)|Airport / TMA|
|Airport|I|Industrial Action (ATC)|AD Disruptions (ATC)|Airport / TMA|
|Airport|T|Equipment (ATC)|AD Disruptions (ATC)|Airport / TMA|
|Airport|G|Aerodrome Capacity|AD Capacity|Airport / TMA|
|Airport|M|Military Activity|AD Capacity|Airport / TMA|
|Airport|R|ATC Routeing|AD Capacity|Airport / TMA|
|Airport|V|Environmental Issues|AD Capacity|Airport / TMA|
|Airport|A|Accident/Incident|AD Disruptions|Airport / TMA|
|Airport|E|Aerodrome Services|AD Disruptions|Airport / TMA|
|Airport|N|Industrial Action (non-ATC)|AD Disruptions|Airport / TMA|
|Airport|NA|Not regulated/Not specified|AD Disruptions|Airport / TMA|
|Airport|O|Other|AD Disruptions|Airport / TMA|
|Airport|P|Special Event|AD Events|Airport / TMA|
|Airport|D|De-icing|AD Weather|Airport / TMA|
|Airport|W|Weather|AD Weather|Airport / TMA|
|En route|C|ATC Capacity|ER Capacity (ATC)|En route|
|En route|S|ATC Staffing|ER Staffing (ATC)|En route|
|En route|I|Industrial Action (ATC)|ER Disruptions (ATC)|En route|
|En route|T|Equipment (ATC)|ER Disruptions (ATC)|En route|
|En route|G|Aerodrome Capacity|ER Capacity|En route|
|En route|M|Military Activity|ER Capacity|En route|
|En route|R|ATC Routeing|ER Capacity|En route|
|En route|V|Environmental Issues|ER Capacity|En route|
|En route|A|Accident/Incident|ER Disruptions|En route|
|En route|E|Aerodrome Services|ER Disruptions|En route|
|En route|N|Industrial Action (non-ATC)|ER Disruptions|En route|
|En route|NA|Not regulated/Not specified|ER Disruptions|En route|
|En route|O|Other|ER Disruptions|En route|
|En route|P|Special Event|ER Events|En route|
|En route|D|De-icing|ER Weather|En route|
|En route|W|Weather|ER Weather|En route|
|na|NA|Not regulated/Not specified|ER Disruptions|En route|

The list of ATFM delay causes can be found out in the [ATFCM Users Manual][atfcmUM]{:target="_blank"}.

[fmp]: <{{ "/references/acronym/fmp.html" | prepend: site.baseurl | prepend: site.url }}> "FMP"
[atfm_delay]: <{{ "/references/definition/atfm_delay.html" | prepend: site.baseurl | prepend: site.url }}> "ATFM delay"
[atfcmUM]: <https://www.eurocontrol.int/sites/default/files/content/documents/nm/network-operations/HANDBOOK/atfcm-users-manual-next.pdf> "ATFCM Users Manual - EUROCONTROL"
