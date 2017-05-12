---
layout: default
title: Unimpeded ASMA Time - Technical Note
excerpt: Performance Review Unit MetaData Definitions.
keywords: asma, airport, metrics, metadata, performance, data, statistics, economics, air transport, flights, europe, cost efficiency
needsMath: true
---

# {{ page.title }}


## Introduction

The actual time spent by a flight between its last entry in the
[ASMA]({{ "/references/acronym/asma.html" | prepend: site.baseurl | prepend: site.url }}) (Entry-time at 40 NM upstream -
$$A_{LET}$$) and the actual landing time
([$$A_{ALDT}$$]({{ "/references/acronym/aldt.html" | prepend: site.baseurl | prepend: site.url }})) is denoted
*[ASMA transit time]({{ "/references/definition/asma_transit_time.html" | prepend: site.baseurl | prepend: site.url }})*
($$A_{TT}$$).

$$
A_{TT} = A_{LET} - A_{ALDT}
$$

The *[unimpeded ASMA time]({{ "/references/definition/unimpeded_asma_time.html" | prepend: site.baseurl | prepend: site.url }})* is the
ASMA transit time in non congested conditions at arrival airports.
The unimpeded ASMA time is used in the calculation of the
[Arrival sequencing and metering area (ASMA) additional time]({{ "/references/definition/additional_asma_time.html" | prepend: site.baseurl | prepend: site.url }}).

This technical note describes the methodology used in order to calculate the
unimpeded ASMA time.

## General approach
The computation of the unimpeded ASMA time is based on the statistical analysis
of flights in non congested conditions.
 
In order to determine whether a flight is unimpeded or not, its *congestion
level* is computed as the number of other aircraft ahead in the arrival queue,
i.e. the number of aircraft that landed between the time the flight under
consideration crossed the ASMA border and its own landing.

The graphic here below illustrates the evolution of the ASMA transit time as a
function of the congestion level. In this picture, the range between the first
quartile (bottom bar of each rectangle), third quartile (top bar) and the median
(medium line) is depicted for each level of congestion.

{% figure caption:"Congestion level vs. saturation level" class:"img-responsive center-block" %}
{% img saturationlevel.jpg alt:"Congestion level vs. saturation level" magick:resize:400x400 %}
{% endfigure %}

As shown in this figure, as soon as a certain level of congestion is reached (at
the inflection point of the curve), the ASMA transit time increases linearly
with the level of congestion (red line passing through the origin). Beyond that
inflection point, the ASMA transit time is directly proportional to the number
of aircraft ahead. At a low level of congestion (before the inflection point),
the ASMA transit time tends to be constant (horizontal red line). This constant
ASMA transit time is considered to be the unimpeded time required by any flight
to approach and land on the runway from the ASMA border. The intersection
between the two red lines corresponds to the *saturation level*.

The greater the level of congestion compared to the saturation level, the
greater the likelihood of a flight's being delayed due to traffic ahead.
Therefore, to ensure that a flight is unimpeded, its congestion level needs to
be sufficiently small compared to the saturation level. However, it needs to be
ensured that the flight sample is big enough to produce a robust estimate of
unimpeded ASMA time. Considering a flight as unimpeded if its congestion level
is smaller than 50% of the saturation level has proved to be a good compromise
between this two conflicting facts.

Night flights may be subject to special procedures that are not representative
of daytime operations. In addition, when the airport is subject of a curfew, the
first flights in the morning might be delayed in order to land after the curfew
end time. In order to avoid that both night flights and 'first post-curfew'
flights bias the traffic sample, flights between 6:30 and 22:00 only are used
for the calculation of unimpeded ASMA time.

A different unimpeded ASMA time is determined for each combination of:

* landing runway;
* angular sector in which the flight enters the ASMA cylinder; and, 
* aircraft class;

Although unimpeded ASMA time is relatively static in time, regular checks are
made to ensure that it remains representative of the operations for the airport
under consideration. In case a change of unimpeded time is detected, the causes
of that change (new procedure implementation, change of TMA design) are
investigated. When required, new unimpeded times are calculated. However,
because this method is based on statistical analysis of the actual ASMA transit
time, a period of several months after the change is required before new robust
unimpeded times can be established.

## Determination of the unimpeded ASMA time

### Methodological assumptions

In this methodology, it is assumed that 

* priority is given to approaches rather than departures and, consequently,
  departures do not affect congestion level for unimpeded ASMA time.

### Input data required

The following input data are required in order to calculate the actual ASMA transit time: 

| Acronym | Description | Source |
|---------|-------------|--------|
| ASMA entry-point	| Date-time + bearing from airport reference point (long. & lat.) | Actual trajectory from [Correlated Position Report (CPR)]({{ "/references/acronym/cpr.html" | prepend: site.baseurl | prepend: site.url }}) provided by NM |
| Aircraft type	| Aircraft ICAO designator | Network Manager |
| ALDT 	| ‘Actual landing time’ (ALDT) means the actual date and time when the aircraft has landed (touch down). | Airport  data |
| Arrival runway designator | ICAO designator of the runway used for landing (e.g. 10L). | Airport  data |

### Aircraft Classification

Because aircraft have different approach performances, aircraft are classified,
based on their ICAO designator, into:

* Heavy (H), 
* Medium Jet (MJ),
* Medium Turbo Prop (MT), 
* Light jet (LJ), 
* Light turbo prop (LT), and 
* Light piston (LP).

In most of the cases helicopters do not interfere with other traffic. It was
however experienced, in some cases, that helicoper traffic had to follow the
published procedures and be sequenced with other aircraft. In order not to
consider a flight that could be delayed by preceding helicopter traffic as
unimpeded, helicopter movements are counted in the congestion index. Helicopter
movements are however not counted in the computation of the throughput used for
the saturation level.


### Determination of the ASMA entry sectors

For a given runway configuration, the ASMA transit time depends on the direction
from which the ASMA cylinder is entered. For this reasons the ASMA cylinder is
divided into *ASMA sectors*. The ASMA sectors are defined further to statistical
clustering analysis of traffic distribution, as illustrated here below.

{% figure caption:"Determination on the ASMA sectors" class:"img-responsive center-block" %}
{% img asmasectors.jpg alt:"Determination on the ASMA sectors" magick:resize:600x600 %}
{% endfigure %}


### Unimpeded ASMA time calculation

Unimpeded ASMA times are calculated in five steps:

1. Input data quality check
   - Landing times and ASMA-entry points are cross-checked for consistency and
     completeness, as described in the 
     [[#Quality assessment|Quality assessment]] section here below.
   - Detection and filtering of statistical outliers:
   - Flights with a transit time longer than 120 minutes are removed from the sample. 

1. For each arrival flight of the traffic sample
   - Computation of the transit time between the ASMA entry-point and the actual
     landing time (ALDT).
   - Determination of the congestion level by counting the number of other
     landings during the time interval ASMA entry time,
     ALDT of the respective flight.
   - Determination of the arrival throughput (total number of landings at the
     airport) observed in the hour preceding the the actual landing time (ALDT).
   - Determination of the triplet (arrival runway, aircraft class, ASMA sector)
     which the respective flight belongs to.

1. Determination of the saturation level
   - Estimation of the peak arrival throughput ($$R$$) of the airport using the 90th
     percentile of the arrival throughput within the preceding hour of all
     flights in the reference sample.
     For each triplet (arrival runway, aircraft class, ASMA sector):
     * Computation of a first unimpeded ASMA time estimate ($$U1$$) using the 20th
       percentile of all the ASMA transit times of the flights belonging to that
       triplet.
     * Computation of the saturation level ($$L$$): 
       $$ L = U1 * R / 60 $$

1. Identification of the unimpeded flights
   For each triplet (arrival runway, aircraft class, ASMA sector):
   * Selection of flights with a $${congestion\ index} <= 0.5 * {saturation\ level}$$

1. Computation of the unimpeded time
   For each triplet (arrival runway, aircraft class, ASMA sector):
   * If the number of unimpeded flights in the group is less than 20, no
     unimpeded ASMA time is computed for that triplet;
   * If the number of unimpeded flights is greater or equal to 20, the unimpeded
     time for this triplet is defined as the median of the observed transit
     times of the unimpeded flights.

## Quality Assessment

### Input data validation

* Consistency analysis between the landing times received from airports and the
  landing times computed by
  [ETFMS]({{ "/references/acronym/etfms.html" | prepend: site.baseurl | prepend: site.url }})
  system;
* Completeness analysis of the *Correlated Positions reports for a Flight (CPF)* trajectory;
* Existence of the aircraft type ICAO Code to be matched with *aircraft class*.


### Unimpeded ASMA time validation

The following checks are performed to test the validity of the results:

* *Coverage test*
  The percentage of flights with valid data and for which it was possible to
  define an unimpeded reference time should be greater or equal to 90%.

* *Distribution of residual errors*
  *Additional ASMA times* for unimpeded flights should have a distribution
  centered around zero and with a standard deviation smaller than 3 minutes.

{% figure caption:"Distribution of residual errors" class:"img-responsive center-block" %}
{% img check1.jpg alt:"Distribution of residual errors" magick:resize:300x300 %}
{% endfigure %}

* Evolution of the additional ASMA time with the congestion level*
  In order to be able to consolidate in a single graph for a given airport with
  different triplet (arrival runway, aircraft class, ASMA sector) and different
  saturation levels, the data has to be normalised.

  For this reason a $$congestion index$$ is defined as 

  $$ {congestion\ index}  = 100 * \frac{congestion\ level}{saturation\ level} $$

  A value of 100 of the congestion index corresponds to a saturation level
  independent of arrival runway and ASMA Sector.

{% figure caption:"Evolution of the additional time with the congestion level" class:"img-responsive center-block" %}
{% img check3.jpg alt:"Evolution of the additional time with the congestion level" magick:resize:300x300 %}
{% endfigure %}

  As a function of the congestion index, the *additional ASMA times* should:
  * remain close to zero for low level of congestion (congestion index smaller than 100), and 
  * increase linearly for congestion index greater than 100.


### Unimpeded ASMA times Monitoring

*Additional ASMA times* for unimpeded flights should remain close to zero. A
change in the unimpeded time might indicate a change in operational procedures
or a re-design of the TMA during the reference period under consideration. In
such a case, new unimpeded ASMA times will be calculated in order to consider
the impact of these changes.

{% figure caption:"Verification of monthly statistics" class:"img-responsive center-block" %}
{% img check2.jpg alt:"Verification of monthly statistics" magick:resize:300x300 %}
{% endfigure %}



Every month the following checks are carried out for each airport:

* The percentage of flight with valid data and associated unimpeded times should
  remain greater than 90%.
* For unimpeded flights,
  - the median of the *Additional ASMA times* distribution should remain within
    the interval $$]-1 minute, +1 minute[$$,
  - the standard deviation of the *Additional ASMA times* distribution should be
    smaller than 3 minutes, and
  - P75-P25 should be smaller than 3 minutes.

If one of these conditions is not met, reasons for the changes are investigated
and new unimpeded ASMA times are calculated if required.
