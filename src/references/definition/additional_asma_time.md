---
layout: default
title: "Additional ASMA Time"
resource: true
entity: definition
needsMath: true
excerpt: Performance Review Unit MetaData Definitions.
keywords: metadata, performance, data, statistics, economics, air transport, flights, europe, cost efficiency
---
# {{ page.title }}

The Additional ASMA time is the difference between the actual ASMA transit time
and the unimpeded ASMA time calculated for non-congested conditions.

## Unit of Measurement
Minute.

## Calculation of the indicator
Let

* $$c$$, a combination of aircraft class, ASMA sectors and arrival runway, as
  described in the technical note for unimpeded ASMA time,
* $$f(c)$$, a flight characterised by a combination $$c$$,
* $$AcASMA(f(c))$$, the actual ASMA transit time for a flight $$f(c)$$, i.e. the
  elapsed time between the last entry of the flight $$f(c)$$ in its ASMA sector and
  its actual landing time (ALDT),
* $$UASMA(c)$$, the unimpeded ASMA time for a combination $$c$$.

The *additional ASMA time*, $$AdASMA(f(c))$$, is calculated for each flight f(c)
as the difference between the actual ASMA transit time AcASMA(f(c)) of the
flight and the unimpeded ASMA time UASMA(c):

$$
AdASAM(f(c)) = AcASMA(f(c)) - UASMA(c)
$$

The additional ASMA time, $$AdASMA(c)$$, for a given combination $$c$$ is the
average of the additional ASMA time, $$AdASMA(f(c))$$ of all the flight $$f(c)$$
characterised by that combination $$c$$.

The additional ASMA time, $$AdASMA$$, for a given airport is the weighted
average of the additional ASMA time, $$AdASMA(c)$$, for all the combinations
$$c$$ at that airport with their probability of occurrence.

## See also

[Additional ASMA time methodology]({{ "/references/methodology/additional_asma_time_pi.html"| prepend: site.baseurl | prepend: site.url }})
