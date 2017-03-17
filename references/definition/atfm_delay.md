---
layout: default
title: ATFM Delay
resource: true
entity: definition
excerpt: Performance Review Unit MetaData Definitions.
keywords: metadata, performance, data, statistics, economics, air transport, flights, europe, cost efficiency
---
# {{ page.title }}

The duration between the last take-off time requested by the aircraft operator
and the take-off slot allocated by the Network Manager following a regulation
communicated by the [FMP][fmp], in relation to an
airport (airport delay) or sector (en-route delay) location.

See also [ATFM delay causes and codes][atfm_code].

## Unit of Measurement

Minute.

## Modification of the ATFM delay calculation (NM release 20.0)

Please note that software release 20.0 of the Network Manager on 04 April 2016
introduced a change to improve the accuracy of the ATFM delay calculation for
operational purposes.

ATFM delays data and graphs in this website take this change into account as of
April 2016.

For more information on the the change in methodology [click here][atfm_dly_rea].


[atfm_dly_rea]: <{{ "/references/methodology/ATFM_delay_calculation.html" | prepend: site.baseurl | prepend: site.url }}> "ATFM Delay calculation changes due to REA"
[fmp]: <{{ "/references/acronym/fmp.html" | prepend: site.baseurl | prepend: site.url }}> "FMP"
[atfm_code]: <{{ "/references/definition/atfm_delay_codes.html" | prepend: site.baseurl | prepend: site.url }}> "ATFM delay causes and codes"
