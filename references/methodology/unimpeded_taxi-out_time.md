---
layout: default
title: Unimpeded Taxi-out Time - Technical Note
excerpt: Performance Review Unit MetaData Definitions.
keywords: asma, airport, metrics, metadata, performance, data, statistics, economics, air transport, flights, europe, cost efficiency
needsMath: true
---

# {{ page.title }}

## Introduction

The *actual taxi-out time* of a flight is the time elapsed between the off-block
time of this flight and its take-off time.
  
The *unimpeded taxi-out time* is the taxi-out time in non congested conditions
at airports.  The unimpeded taxi-out time is used in the calculation of the
[additional taxi-out time](/references/definition/additional_taxi-out_time.html).

This technical note describes the methodology used in order to calculate the
unimpeded taxi-out time.


## General approach
The computation of the unimpeded taxi-out time is based on the statistical
analysis of flights in non congested conditions.
 
In order to determine whether a flight is unimpeded or not, its *congestion
level* is computed as the number of preceding movements (arrivals and
departures) that occur between the off-block of the flight up to its own
take-off.

The graphic here below illustrates the evolution of the actual taxi-out time as
a function of the congestion level. In this picture, the range between the first
quartile (bottom bar of each rectangle), third quartile (top bar) and the median
(medium line) is depicted for each level of congestion.

{% figure caption:"Congestion level vs. saturation level" title:"Congestion level vs. saturation level" class:"img-responsive center-block" %}
{% img saturationlevel.jpg alt:"Congestion level vs. saturation level" title:"Congestion level vs. saturation level" %}
{% endfigure %}

As shown in this figure, as soon as a certain level of congestion is reached (at
the inflection point of the curve), the actual taxi-out time increases linearly
with the level of congestion (red line passing through the origin). Beyond that
inflection point, the actual taxi-out time is directly proportional to the
number of movements ahead. At a low level of congestion (before the inflection
point), the actual taxi-out time tends to be constant (horizontal red line).
This constant actual taxi-out time is considered to be the unimpeded taxi-out
time required by any flight to taxi out and take off. The intersection between
the two red lines corresponds to the *saturation level*.

The greater the level of congestion compared to the saturation level, the
greater the likelihood of a flight's being delayed due to traffic ahead.
Therefore, to ensure that a flight is unimpeded, its congestion level needs to
be sufficiently small compared to the saturation level. However, it needs to be
ensured that the flight sample is big enough to produce a robust estimate of
unimpeded ASMA time. Considering a flight as unimpeded if its congestion level
is smaller than 50% of the saturation level has proved to be a good compromise
between this two conflicting facts.

Night flights may be subject to special procedures that are not representative
of daytime operations. Therefore flights between 6:00 and 22:00 only are used
for the calculation of unimpeded taxi-out time.

A different unimpeded taxi-out time is determined for each combination:

* departure runway; and, 
* departure stand (or group of stands);

Although unimpeded taxi-out time is relatively static in time, regular checks
are made to ensure that it remains representative of the operations for the
airport under consideration. In case a change of unimpeded taxi-out time is
detected, the causes of that change (new procedure implementation, change in use
of infrastructure) are investigated. When required, new unimpeded times are
calculated. However, because this method is based on statistical analysis of the
actual taxi-out time, a period of several months after the change is required
before new robust unimpeded taxi-out times can be established.

## Determination of the taxi out unimpeded time

### Methodological assumptions

Based on this definition of taxi-out time (from off-block time to take-off time), taxi-out time includes:
* possible push-day delay,
* possible remote de-icing time, and
* departure runway occupancy time.


### Input data required

The following input data are required in order to calculate the actual taxi-out time:

| Acronym | Description | Source |
| ADEP | Departure airport code using the standard ICAO 4-letter code as defined in ICAO Doc. 7910. | Airport data |
| AOBT | *Actual off-block time* means the actual date and time the aircraft has vacated the parking position (pushed back or on its own power). | Airport data |
| ATOT | *Actual take off time* means the actual date and time that an aircraft has taken off from the runway (wheels-up). | Airport data |
| DRWY | ‘Departure runway designator’ means the ICAO designator of the runway used for take-off (e.g. 10L). | Airport data |
| DSTND | The designator of the departure stand, i.e. the last parking position where the aircraft was parked before departing from the airport. | Airport data |


### Group of stands

Actual taxi-out time depends on the distance between the departure stand and the
departure runway. Because of the great number of possible stand-runway
combinations, stands are grouped at some airports.


### Unimpeded taxi-out time calculation

Unimpeded taxi-out time is calculated in five steps:

1. *Input data quality check*

    * Off-block and take-off times received from airports are cross-checked for
      consistency and completeness, as described in the
      [Quality assessment] section here below.
    * Detection and filtering of statistical outliers:
      * Flights with a negative actual taxi-out time are rejected from the
        traffic sample;
      * Flights with a actual taxi-out time greater than 5 hours are rejected
        from the traffic sample.

1. *For each departing flight of the traffic sample*

    * Computation of the actual taxi-out time, that is the difference between
      the actual off-block time (AOBT) and the actual take-off time (ATOT).
    * Determination of the congestion level by counting the number of other
      take-offs and landings during the time interval ]off-block time, take-off
      time[ of the respective flight.
    * Determination of the airport throughput (total number of movements,
      both take-offs and landings included, at the airport) observed in the hour
      preceding the actual off-block time (AOBT).
    * Determination of the couple (departure runway, group of stands) which the
      respective flight belongs to.

1. *Determination of the saturation level*

    * Estimation of the peak airport throughput ($$R$$) of the airport using the 
      90th percentile of the airport throughput within the preceding hour of
      all flights in the reference sample.
      For each couple (departure runway, group of stands):
      * Computation of a first estimation of the unimpeded taxi-out time ($$U_1$$)
        using the 20th percentile of the actual taxi-out times of the flights
        belonging to that couple.
      * Computation of the saturation level ($$L$$):
        
        $$
        L= U_1 \cdot \frac{R}{60}
        $$

1. *Identification of the unimpeded flights*
   
   For each group (departure stand(s); departure runway):

     * Selection of flights with a
       
       $$
       {congestion\ index} <= 0.5 * {saturation\ level}
       $$

1. *Computation of the unimpeded taxi-out time*
   
   For each group (departure stand(s); departure runway):

    * If the number of unimpeded flights in the group is less than 10,
      no unimpeded taxi-out time time is computed for that couple;
    * If the number of unimpeded flights is greater or equal to 10,
      the unimpeded taxi-out time for this couple is defined as the median
      of the observed actual taxi-out times of the unimpeded flights.

## Quality Assessment

### Input data validation

<!--to be completed further to coordination with CODA-->

* Consistency analysis between the off-block times (AOBT) received from airports
  and airlines;
* Consistency analysis between the take-off times (ATOT) received from airports,
  airlines and NM.

### Unimpeded taxi-out time validation

The following checks are performed to test the validity of the results:

#### Coverage
  
The percentage of flights with valid data and for which it was possible
to define an unimpeded reference time should be at least 90%.

#### Distribution of residual errors

[Additional taxi-out time](/references/definition/additional_taxi-out_time.html)
for unimpeded flights should have a distribution centered around zero and with
a standard deviation below 3 minutes.

{% figure caption:"Distribution of residual errors" class:"img-responsive center-block" %}
{% img check1.jpg alt:"Distribution of residual errors" title:"Distribution of residual errors" %}
{% endfigure %}



#### Evolution of the additional taxi-out time with the congestion level
  
In order to be able to consolidate in a single graph for a given airport
with different groups (departure stand and departure runway) and different
saturation levels the data has to be normalised. 

For this reason a congestion index is defined as 

$$
{congestion\ index}  = 100 * \frac{congestion\ level}{saturation\ level}
$$

By construction, a value of 100 always corresponds to saturation independent
of the departure stand or runway used.

{% figure caption:"Evolution of the additional time with the congestion level" class:"img-responsive center-block" %}
{% img check3.jpg alt:"Evolution of the additional time with the congestion level" title:"Evolution of the additional time with the congestion level" magick:resize:300x300 %}
{% endfigure %}


The additional time as a function of the congestion index should:

* remains close to zero for a low level of congestion; and, 
* tends to a linear relationship when the congestion index is above 100.



### Unimpeded taxi-out time Monitoring

[Additional taxi-out time](/references/definition/additional_taxi-out_time.html)
for unimpeded flights should remain close to zero.
A change in the unimpeded taxi-out time might indicate a change in operational
procedures or use of infrastructure during the reference period under
consideration.
In such a case, new unimpeded taxi-out times will be calculated in order
to consider the impact of these changes. 

{% figure caption:"Verification of monthly statistics" class:"img-responsive center-block" %}
{% img check2.jpg alt:"Verification of monthly statistics" title:"Verification of monthly statistics" magick:resize:300x300 %}
{% endfigure %}


Every month the following checks are carried out for each of the airports:

* Percentage of flights with valid data and associated unimpeded times should
  remain greater than 90%.
* For unimpeded flights,
  * the median of the [additional taxi-out times](/references/definition/additional_taxi-out_time.html)
    distribution should remain within the interval $$ \mathopen] -1 minute, +1 minute \mathclose[ $$,
  * The standard deviation of the
    [additional taxi-out times](/references/definition/additional_taxi-out_time.html)
    distribution should be smaller than 3 minutes, and
  * P75-P25 should be smaller than 3 minutes.

If one of these conditions is not met, new unimpeded taxi-out times are calculated.

