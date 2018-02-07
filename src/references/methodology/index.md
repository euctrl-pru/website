---
layout: default
title: Methodology
permalink: /references/methodology/
excerpt: Performance Review Unit MetaData Definitions.
keywords: metadata, performance, data, statistics, economics, air transport, flights, europe, cost efficiency
attn_i: <i class="fa pru fa-exclamation-triangle"></i>
---
<style>
  i.fa.pru {color: #337ab7;}
</style>

# {{ page.title }}

In order to encourage collaboration, transparency and reproducibility of performance indicators,
please find below methodological information related to the computation of the indicators used
in our website:

* En-route
  * [ATFM delay computation][atfmdelay]
  * [Horizontal Flight Efficiency performance indicators][hfe]
  * [En-route Vertical Flight Efficiency][ervfe]

* Airport
  * [Unimpeded ASMA Time metric][uasma]
  * [Additional ASMA Time performance indicator][aasma]
  * [Unimpeded Taxi-out Time metric][tasma]
  * [Vertical Flight Efficiency during Climb and Descent][cdvfe]
  * [Airport Capacity Utilisation][acu]

* Data Dimensions used in the processing of data. {{ page.attn_i }}

<br><br>
{{ page.attn_i }} = not (yet?) available.<br>


[atfmdelay]: <{{ "/references/methodology/ATFM_delay_calculation.html" | prepend: site.baseurl | prepend: site.url }}> "ATFM delay computation"
[hfe]: <{{ "/references/methodology/horizontal_flight_efficiency_pi.html" | prepend: site.baseurl | prepend: site.url }}> "Horizontal Flight Efficiency performance indicators"
[ervfe]: <{{ "/references/methodology/en-route_vertical_flight_efficiency_pi.html" | prepend: site.baseurl | prepend: site.url }}> "En-route Vertical Flight Efficiency"

[uasma]: <{{ "/references/methodology/unimpeded_asma_time.html" | prepend: site.baseurl | prepend: site.url }}> "Unimpeded ASMA Time metric"
[aasma]: <{{ "/references/methodology/additional_asma_time_pi.html" | prepend: site.baseurl | prepend: site.url }}> "Additional ASMA Time performance indicator"
[tasma]: <{{ "/references/methodology/unimpeded_taxi-out_time.html" | prepend: site.baseurl | prepend: site.url }}> "Unimpeded Taxi-out Time metric"
[cdvfe]: <{{ "/references/methodology/cd_vertical_flight_efficiency_pi.html" | prepend: site.baseurl | prepend: site.url }}> "Vertical Flight Efficiency during Climb and Descent"
[acu]: <{{ "/references/methodology/airport_capacity_utilisation.html" | prepend: site.baseurl | prepend: site.url }}> "Airport Capacity Utilisation"