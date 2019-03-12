---
layout: default
title: Airport Capacity Utilisation Methodology
subtitle: Methodology
excerpt: Performance Review Unit Metadata Definitions.
keywords: airport, capacity, utilisation, metrics, performance, data, statistics, economics, air transport, flights, europe
needsMath: true
---

# {{ page.title }}

## Overview

Various methods exist to address the determination of the airport capacity.
However, there are only a limited number of empirical approaches addressing
the capacity utilisation at airports.

A convenient way to summarise the range of operational capacities (i.e. runway
system throughputs) are Capacity Coverage Charts (CCC)
{% cite  neufville-odoni-2003 --locator 402 --file aviation %}.
While an airport has a theoretical maximum capacity, the
practical capacity is considered to be established in order to limit the
average delay to a reasonable level. The latter may also be impacted by local
constraints or requirements of the capacity declaration process.


{% figure caption:"Figure 1: Capacity Coverage Chart." class:"img-responsive center-block" %}
{% img ccc.png magick:resize:400x400 alt:'Capacity Coverage Chart' %}
{% endfigure %}


The capacity coverage chart (i.e. CCC) describes the ordered set of observed
throughputs at an airport. As depicted in the figure above, the CCC varies
dependent on the traffic, enviromental factors, and/or operational
constraints. Ordering the observed (hourly) throughputs for the airport
establishes a generally decreasing step function over the time horizon (e.g.
expressed in terms of observation hours or % of time).


{% cite apt-capacity-utilisation --file aviation %} describe a procedure to quantify
the level of capacity utilisation comparing two characteristic throughput values.
These characteristic values, i.e. basic load index (BLI) and peak load index (PLI),
are based on the observed operational throughput of the airport.

{% figure caption:"Figure 2: Capacity Coverage Chart and PLI calculation." class:"img-responsive center-block" %}
{% img pli_bli.png magick:resize:400x400 alt:'Capacity Coverage Chart and PLI calculation' %}
{% endfigure %}

The Base Load Index (BLI) refers to the share of time an airport operates above a defined base
level (15% of the reference capacity) and the Peak Load index (PLI) provides an indication
of the share of time the airport operates above peak level (80% of reference capacity).

Considering the achieved levels of throughput across the European top 30 airports,
a diverse picture emerges.
While a number of airports show the classical throughput peaking behaviour with a consistent
base level throughout (0.65 < BLI < 0.8), London Heathrow (LHR) in the top right corner
shows a clear exceptional capacity utilisation.

{% figure caption:"Figure 3: BLI over PLI for major European airports." class:"img-responsive center-block" %}
{% img pli_bli_prr.png magick:resize:400x400 alt:'BLI over PLI for major European airports' %}
{% endfigure %}

For a more detailed explanation of the methodology see {% cite apt-capacity-utilisation --file aviation %}.

## See Also

* [Basic Load Index (BLI)][bli].
* [Peak Load Index (PLI)][pli].


# Bibliography

{% bibliography --cited_in_order --file aviation %}


[bli]: <{{ "/references/acronym/bli.html" | prepend: site.baseurl | prepend: site.url }}> "Basic Load Index"
[pli]: <{{ "/references/acronym/pli.html" | prepend: site.baseurl | prepend: site.url }}> "Peak Load Index"
