---
layout: default
title:  "Borealis HFE Analysis"
date: 2016-06-26 10:09:13 +0100
tags: fra, vertical, efficiency, ifr, flights, europe, eurocontrol
excerpt: "Preliminary analysis of Borealis FRA implementation"
needsMath: true
---

# {{ page.title }}

Borealis is an alliance of nine ANSPs which combined provide air traffic
services for over 3.8 million flights[^1] a year, across 12.5 million $km^2$ of
North European airspace, accounting for 38% of European traffic.

By 2021 Borealis members will have put in place a seamless and integrated
freeroute airspace (FRA) extending from the eastern boundary of the North
Atlantic to the western boundary of Russian airspace, enabling airline and
business aviation customers to take the most cost effective, fuel efficient and
timely routes across the three Functional Airspace Blocks (FABs) and Iceland[^2]
within the airspace managed by the members of the Alliance.

The implementation of Borealis FRA programme is foreseen to be completed in
three steps:

* 2012: Ireland and Danish-Swedish FAB
* 2015: 2012 + North European FAB (NEFAB), except Bodo Oceanic FIR (Figure 1) -
  current
* 2021: 2015 + Bodo Oceanic FIR + United Kingdom + Iceland - in progress

{% figure caption:"Figure 1. Current Borealis FRA status" class:"img-responsive center-block" %}
{% img borealis-fig1.png magick:resize:600x600 alt:'Current Borealis FRA status' %}
{% endfigure %}

Eurocontrol Performance Review Unit (PRU) is interested in monitoring
and analysing the benefits of FRA implementation across Europe in order to
provide necessary assistance in planning and decision making processes to all
interested stakeholders with the overall aim of improving the European ATM
performance.

### Note

This study is also available as a PRU Leaflet, see 
{% cite borealis-fra-leaflet --file aviation %} in the References section below.







## Borealis overall

HFE analysis is based on the comparison of flight trajectories' length with
the corresponding achieved distances, in particular actual and planned
trajectories. The planned trajectory is derived from the flight plans submitted
by airspace users to the Network Manager, while the actual flown trajectory is
based on processed radar track data submitted by ANSPs to the EUROCONTROL. The
full methodology is described in more detail in the metadata which is
available [online][hfepi].

A year-on-year comparison of 2015 (JAN-DEC) and 2016 (JAN-MAY) of the overall
en-route HFE for both the actual trajectories and the filed flight plans for the
airspace managed by Borealis members is shown on Figure 2.

{% figure caption:"Figure 2. Boreal is overall HFE (2015/2016)" class:"img-responsive center-block" %} 
{% img borealis-fig2.png magick:resize:500x500 alt:'Boreal is overall HFE (2015/2016)' %}
{% endfigure %}

An initial upward trend for both measurements is visible. This is particularly
evident for March, when inefficiencies in flight plans increased from 4.05% in
2015 to 4.54% in 2016. Inefficiencies in actual trajectories have also increased
from 2.46% to 2.89% forthe same month.

In order to investigate the reasons for such trends, Figure 3 shows the daily
distribution of HFE for the airspace managed by Borealis members in the first
five months of 2016.

{% figure caption:"Figure 3. Daily distribution of Borealis overall HFE (2016)" class:"img-responsive center-block" %}
{% img borealis-fig3.png magick:resize:800x800 alt:'Daily distribution of Borealis overall HFE (2016)' %}
{% endfigure %}

Five noticeable peaks in 2016 (March 20 & 21, March 31, April 28, May 19 and
May26) were caused by industrial actions in France, which forced many flights
to avoid French airspace. To illustrate this, Figure 4 shows the comparison
of actual trajectories for flights departing from the airspace managed by
Borealis members and arriving in Spain and Portugal on the 14th of March 2016
(nostrike) and 21st of March 2016 (during the strike).
 
{% figure caption:"Figure 4. The impact of French strikes on Borealis HFE" class:"img-responsive center-block" %}
{% img borealis-fig4.png magick:resize:900x900 alt:'The impact of French strikes on Borealis HFE' %}
{% endfigure %}


Geographical dispersion of actual trajectories during the strikes resulted in
an increase of additional distances flown in the airspace managed by
Borealis members, thus generating a great amount of local inefficiencies,
especially in adjacent UK-Ireland FAB.

It is important to note that this analysis is based on only five months of
2016, so the values for the ten best days and the ten worst days are not yet
excluded from the computation, which opens up the possibility for improvements
in reporting annual values.


## Geographical distribution of flight efficiency

While the negative trend is observed in Borealis overall HFE,
geographical distribution of flight inefficiencies (Figure 5) shows that values
vary considerably in different FABs.

{% figure caption:"Figure 5. Geographical distribution of Borealis HFE" class:"img-responsive center-block" %}
{% img borealis-fig5.png magick:resize:800x800 alt:'Geographical distribution of Borealis HFE' %}
{% endfigure %}

It is evident that the main contributor to the overall Borealis inefficiencies
is the UK-Ireland FAB, in most part of which FRA is still not implemented and
which was highly impacted by French strikes.
It is expected that FRAimplementation in the United Kingdom will have a
significant positive impact onthe overall Borealis HFE, considering the great
potential for improvement and high traffic counts in this state.

On the other hand, values for NEFAB and DK-SE FAB show that
inefficiencies remained more or less at the same level, mainly because there is
not much space for improvement. This is particularly evident for DK-SE FAB (FRA
implemented in 2012), where inefficiencies in actual trajectories vary just
slightly above 1%.


## Current Borealis FRA HFE

Considering the recent NEFAB FRA implementation, it is interesting to analyze the
HFE in the FRA airspace currently managed by Borealis members (Ireland, DK-SE FAB
and NEFAB (except Bodo Oceanic FIR)).

Figure 6 shows the monthly values for the two measurements in the current
FRA airspace managed by Borealis before and after the FRA implementation in
NEFAB (12 November 2015). After a small improvement from November 2015 (2.37%)
to January 2016 (2.25%), inefficiencies in flight plans started increasing again
to reach 2.35% in May 2016. Inefficiencies in actual trajectories improved
from 1.46% in November 2015 to 1.28% in May 2016, which is still slightly above
the best result in 2015 (1.27%).

{% figure caption:"Figure 6. Borealis 2015 HFE before and after FRA" class:"img-responsive center-block" %}
{% img borealis-fig6.png magick:resize:500x500 alt:'Borealis 2015 HFE before and after FRA' %}
{% endfigure %}

PRU will continue to monitor the Borealis ATM performance in order to
evaluate the benefits of the FRA implementation as the new implementation steps
become operational.


[hfepi]: <http://ansperformance.eu/references/methodology/horizontal_flight_efficiency_pi.html> "HFE Performance Indicator"



## References

{% bibliography --cited_in_order --file aviation %}


#### Footnotes

[^1]: based on 2015 traffic figures (EUROCONTROL).
[^2]: Performance data for Iceland is currently not available, which is why this
    paper covers only the ATM performance of the three FABs (United
    Kingdom-Ireland FAB, Denmark-Sweden FAB and North European FAB).

