---
layout: default
title: Performance Indicator -- Additional ASMA Time
subtitle: Level 1 and 2 documentation of the Additional ASMA Time performance indicator
excerpt: Performance Review Unit Metadata Definitions.
keywords: hfe, horizontal flight efficiency, metrics, metadata, performance, data, statistics, economics, air transport, flights, europe, cost efficiency
needsMath: true
---
<style>
img + em {
text-align: center;
}

img + em:before {
content: ' ';
display: block;
}
</style>

# {{ page.title }}


# Introduction


## General

This document describes the conceptual, informational, and implementation
independent model of the additional ASMA time performance indicator.

The indicator is used as part of the performance monitoring and reporting under: 

* SES: IR691/2010 {% cite eu:691/2010 --file legislation %} and IR390/2013
  {% cite eu:390/2013 --file legislation %}; and
* EUROCONTROL: performance review reporting {% cite atmap-2009 --file aviation %}.


## Purpose of the document

The purpose of this document is twofold:

1. to present the concept, and underlying logical and mathematical modelling of
   the indicator; and

1. to document the processing and use of data for the calculation of the
   indicator.


## Scope

This document covers the data processing and calculation of the additional ASMA
time performance indicator.

The calculation of this performance indicator is performed according to the
Airport Operator Data Flow standard for data collection and processing, under
the responsibility of the airports division in the QoS department of the PRU,
which is compliant with IR691/2010 and IR390/2013. For the calculation of the
indicator, the Airport Operator Data Flow is combined with trajectory data
provided by the Network Manager.

The associated processes and procedures are documented as part of the PRU
Quality Management System.

This performance indicator is also defined in the Implementing Regulation
(390/2013), Annex I, Section 2 Environment, 2.2 (b).



## Summary of the performance indicator information

* Current version status:  Monitoring.

* Version status and evolution:
  * Conceptual Phase: 2008, phase completed.
  * Technical Development: 2008, phase completed.
  * Prototyping / Validation: 2008, phase completed.
  * Monitoring: RP1 and RP2, active.
  * Target Setting: n/a.
  * Phase Out: n/a.

* Context
  * KPA
    - SES II Performance Scheme: Environment (RP2), Capacity (RP1).
    - PRC/PRU: Efficiency.
  * Focus Area: Airport impact on flight duration.
  * Trade Offs: throughput and ATFM arrival delays.
    Trade-off can be observed between additional ASMA time, ATFM delay and
    runway throughput.
  * Supports the SES II Performance Scheme (IR 691/2010 Annex I - Section 1 3.1
    and Section 2 - 3.1).

* Description: This indicator provides an approximate measure of the average
  inbound queuing time on the inbound traffic flow, during times that the
  airport is congested.

* Formula and Metrics: This indicator is calculated on the basis of data
  availability for actual ASMA entry time (flight entering the area within 40 NM
  radius around the airport) and Actual Landing Time (ALDT). The additional ASMA
  time is the difference between the actual ASMA transit time and the median
  unimpeded ASMA transit time for the group of similar flights. The ASMA
  additional time for the airport is the average of the average ASMA values for
  all flights.

* Units: Minutes per IFR arrival.

* Used in
  * SES (IR691/2010 & IR390/2013): Annual Performance Report.
  * SES eDashboard [ RP1 {% cite prb:dashboardRP1 --file aviation %} and RP2 {% cite prb:dashboardRP2 --file aviation %}]
  * EUROCONTROL: Performance Review Report


## Acronyms and terminology

| Term   | Definition                                |
|--------|-------------------------------------------|
| AC     | Aircraft class                            |
| AdASMA | Additional ASMA Time                      |
| ALDT   | Actual Landing Time                       |
| ASMA   | Arrival Sequencing and Metering Area      |
| ATFM   | Air Traffic Flow Management               |
| ATM    | Air Traffic Management                    |
| ATMAP  | ATM Airport Performance project           |
| ET     | Entry Time                                |
| ICAO   | International Civil Aviation Organization |
| IR691  | COMMISSION REGULATION (EU) No 691/2010    |
| IR390  | COMMISSION REGULATION (EU) No 390/2013    |
| KPA    | Key Performance Area                      |
| KPI    | Key Performance Indicator                 |
| PI     | Performance Indicator                     |
| PRU    | Performance Review Unit                   |
| QoS    | Quality of Service                        |
| RWY    | Runway                                    |
| SEC    | ASMA sector                               |
| SES    | Single European Sky                       |
| TMA    | Terminal Manoeuvring Area                 |

Table: Acronyms and terminology


# Conceptual model

## What we ideally would like to measure

On the conceptual level, the indicator aims to address the operational penalty
associated with techniques used to maximize runway utilisation for inbound
traffic flows at an airport, i.e. the accumulation of additional approach time
resulting from speed control, path stretching and circling in the vicinity of
the airport (use of holding patterns/stacks).


## Concept of runway optimisation

When aircraft cannot fly unimpeded 4D trajectories, there are generally three
places at which queuing takes place, as illustrated in the Figure:

1. At the departure stand (pre-departure queuing to optimise network
   performance)
2. At the departure runway (take-off queuing, e.g. runway holding)
3. In the arrival terminal airspace (arrival queuing in the Arrival Sequencing
   and Metering Area or ASMA, using speed control, stacks, holding, extension of
   approach path etc.)

{% img adasma-01.png magick:resize:500x500 alt:'Outbound and Inbound Traffic Queues from a Flight Phase Perspective' %}
*Outbound and Inbound Traffic Queues from a Flight Phase Perspective*

Uncertainty of approach conditions (e.g. pilot performance, landing clearance
time, approach speed, wind conditions) makes traffic supply to runways a
stochastic phenomenon.

In order to ensure continuous traffic demand at runways and maximise runway
usage, a minimum level of queuing is required. A certain extent of arrival
queuing in airspace is necessary to allow arrival management (sequencing and
metering) to optimise runway utilisation when demand is at or near the
operational capacity.

However, additional time in holding is detrimental to operations efficiency,
fuel consumption and environment. Therefore, a trade-off exists between approach
efficiency and runway throughput.

Optimisation of the runway utilisation may require:

1. Re-sequencing the take-off/ landing order at the runway (first come is not
   first served), and 
2. buffering a sufficient number of aircraft in the queue to be able to fine
   tune the metering (to optimise the separation of aircraft released from the
   queue to the runway.)

In both cases some aircraft will suffer a certain penalty in terms of queuing
time. Higher runway utilisation targets may require higher levels of departure
(take-off) queuing in the manoeuvring area and arrival queuing in airspace. This
effect can be reduced if aircraft are already delivered to the queue in the
right sequence and at the required time intervals.

To reduce cost and environmental impact, the departure and arrival queuing time
should be kept to the minimum needed to achieve the selected runway utilisation
objectives. If possible, any departure and arrival delay that is needed for
other reasons than sequencing and metering should therefore be absorbed at the
departure stand through ATFM delays and local ATC pre-departure delay. If this
is done properly, then measuring outbound and inbound queuing time allows
assessing the “operational cost” associated with sequencing and metering in
function of the selected runway utilisation objectives.


## Conceptual approach

The additional ASMA time is a proxy for the management of the arrival flow,
understood as the average arrival runway queuing time on the inbound traffic
flow, during periods of congestion at airports.

Performance in terms of additional ASMA time is monitored on the basis of
regular reporting in comparison to a nominal reference. Based on regular
reporting, metrics are derived for the respective reporting month. The current
measurements are compared to a nominal reference to address the level of
efficiency. The reference is derived from the statistical analysis of a
reference period sample. This approach is depicted in Figure 2. Based on regular
reporting, metrics are derived for the respective reporting month. The current
measurements are compared to a nominal reference to address the level of
efficiency. The reference is derived from the statistical analysis of a
reference period sample.


{% img adasma-02.png magick:resize:650x650 alt:'Performance Measurement Approach' %}
*Performance Measurement Approach*

The indicator is defined as the difference between the ASMA transit time (actual
ASMA time) and the unimpeded ASMA time, based on ASMA transit times in periods
of low traffic.

$$
{Actual\ ASMA\ Time} = {Unimpeded\ ASMA\ Time} + {Additional\ ASMA\ Time}
$$

The unimpeded reference time is determined based on a statistical analysis of
historic data observed at the airport, averaged for groupings of similar
flights. The additional ASMA time is a measure for the extent of which the
actual ASMA time exceeds the unimpeded reference.



# Logical model

This section describes the underlying logical modelling and drives the
implementation of the additional ASMA time algorithm.


## Assumptions

The purpose of the **additional ASMA time** indicator is to provide an
approximate measure of the **average inbound queuing time** on the inbound
traffic flow, during times that the airport is congested.

The calculation of this indicator is based on generalised ASMA area defined
around an airport. Aircraft are subject to the management of the arrival flow
upon entering the ASMA area. Accordingly, the time spent within the ASMA area,
i.e. the time elapsing between entering the ASMA area (actual ASMA entry time,
ET) and the actual landing time of an arriving flight (ALDT). The generalised
ASMA area is defined by a cylinder of radius 40NM around the airport extending
to unlimited in terms of altitude.

{% img adasma-03.png magick:resize:450x450 alt:'Conceptual approach for Additional ASMA Time' %}
*Conceptual approach for Additional ASMA Time*

Actual ASMA time refers to the period between the point in time when the
aircraft enters the ASMA cylinder for the last time (‘entry time’) and the
landing time. This ensures a consistent measurement for the inbound flow in the
40 NM around an airport. The additional time is measured as the average
additional time beyond the unimpeded ASMA time, which is a statistically
determined reference time based on actual ASMA times in periods of low traffic
demand.

**Note**: The indicator is currently defined for a radius of 40 NM to allow for
comparability across Europe. For monitoring purposes, a supporting metric
considering a radius of 100NM is calculated by PRU (the 40/100NM positions and
timestamps are calculated from data feeds the Network Manager receives from
member states.)

This indicator excludes influence of the following factors:

1. Impact of noise management and terrain clearance aspects: the same effects
   are included in both the impeded and unimpeded transit times; therefore this
   does not show up in the additional time which is the difference between
   impeded and unimpeded.

2. Effect of runway friction deteriorations: periods with such conditions are
   excluded. The calculation algorithm does not explicitly take any weather
   conditions into account.



## Grouping of flights

To reduce the number of combinations of unique entry points and arrival runway,
arriving flights entering the ASMA area within certain limits are grouped
together. The clustering is based on observed arrival flows (i.e. crossing of
flown trajectory with the ASMA cylinder).

The result of this clustering yields the **ASMA sectors** and may not be
confused with the actual TMA or approach sectors around the airport. Each ASMA
sector covers a major arrival flow, and the extent of the sector is based on
visualization of arrival radar tracks (see figure below) and the aforementioned
entry points.

{% img asmasectors.jpg magick:resize:450x450 alt:'ASMA sectors and bearing' %}
*ASMA sectors and bearing*


The indicator is first calculated at disaggregated level, i.e. per comparable
**grouping** of flights with the same combination of **ASMA sector**, **landing
runway** and **aircraft class**. Each grouping of flights has an unimpeded
reference associated.

Taking the weighted average of the values for all groups produces the ASMA
additional time for the airport.



## Overview of the logical model of the Additional and Unimpeded ASMA Times

This section focuses on the algorithm for the calculation of the additional ASMA
time indicator from a logical point of view.

The additional ASMA time calculation is depicted below.

{% img adasma-05.png magick:resize:900x900 alt:'Logical steps of Additional ASMA Time calculation' %}
*Logical steps of Additional ASMA Time calculation*

The unimpeded ASMA time is calculated as depicted below.

{% img adasma-06.png magick:resize:1000x1000 alt:'Logical steps of unimpeded ASMA Time calculation' %}
*Logical steps of unimpeded ASMA Time calculation*



## Logical approach to Additional ASMA Time calculation

The computation of the indicator is based on four consecutive steps:

<style type="text/css">
    .alpha { list-style-type: upper-alpha; }
</style>

{:refdef: .alpha}
1. Filter out the flights with erroneous data and helicopters.
2. The unimpeded times are calculated from a reference dataset in a separate
   process that is explained in the next section, and their values are constant
   for groups of similar flights (same ASMA entry sector, same arrival runway,
   same aircraft class).
3. Calculation of the average additional time for each group of similar flights
   by calculating the additional time for each flight through subtraction of the
   group’s unimpeded time from the actual time each flight spent in ASMA space.
4. The calculation of the average additional ASMA time for the airport which is
   the weighted average of the average additional ASMA times of all groups of
   similar inbound flights. [min/IFR flight].
{: refdef}


## Logical approach to Unimpeded ASMA Time calculation

The unimpeded ASMA time for each flight is taken from the unimpeded reference
tables. These are calculated by averaging the actual ASMA time for the unimpeded
flights from a reference sample (e.g. one year worth of data). The basis of the
algorithm is to determine which flights are unimpeded.

The unimpeded ASMA time corresponds to the ASMA time that an aircraft of a given
triplet, aircraft type – entry sector – runway combination, would spend if no
additional sequencing time would be added, i.e., if the operation would be
unimpeded. The unimpeded times are calculated from a reference data set, and
their values are constant for each triplet combination.

The process steps are described below:

1. The flights with no data or with wrong data are filtered;
2. Actual ASMA time and congestion level are calculated per flight;
3. For each flight and flight groupings of same aircraft type – entry sector –
   runway combination, calculate the saturation level per grouping;
4. From these flights, determine which flights are unimpeded by comparing
   congestion level and saturation level, for each grouping of flights with a
   different AC – SEC – RWY combination;
5. The unimpeded time is calculated as the median of all flights in the grouping
   of combinations AC-SECRWY, for groupings that have at least 20 unimpeded
   flights. No unimpeded reference time is calculated for the groupings that
   have less than 20 unimpeded flights. Night flights are excluded.



# Mathematical model

The aim of this section is to describe how the logical model is modelled
mathematically.

## Mathematical model of the Additional ASMA Time performance indicator

ASMA (Arrival Sequencing and Metering Area) is defined as the airspace within a
radius of 40NM around an airport. The additional ASMA time is a proxy for the
average arrival runway queuing time of the inbound traffic flow, during times
when the airport is congested.

Mathematically, the actual ASMA transit time per flight is calculated as the
difference between the entry time at ASMA cylinder and ALDT. The additional ASMA
time performance indicator is calculated as the difference between the actual
transit time, and a previously computed transit time reference considered as
unimpeded ASMA time.

Throughout this chapter units for each variable are shown in **[**  **]**
brackets.

### Step A: Filtering

Calculation of the additional ASMA time performance indicator is done with the
flight data reported by airports as monthly reporting in combination with data
received from the Network Manager.

{% img adasma-stepA.png magick:resize:750x750 alt:'Step A' %}
*Step A*

The following filter criteria apply:

* flights with no actual ASMA time or an actual ASMA time of more than 2 hours
  are excluded, i.e. flights with $$ {AcASMA} < 120 \ {min}$$ are taken into
  account;

* Helicopters are also excluded from the calculation.


### Step B: Determination of unimpeded time AC-RWY-SEC combination

In this step, flights are assigned a reference unimpeded ASMA time, according to
the grouping of flights they belong. Flights are grouped by $$c_i$$, or
**grouping of flights** with the same combination aircraft class, ASMA sector
and arrival runway (direction of runway, i.e. 12 or 30R), at each airport $$j$$
($$ j = 1 \dotso n$$,  $$n$$ being the total number of airports affected by regulation
IR390/2013).

For example, if there are four aircraft classes landing at the airport $$j$$,
two ASMA sectors and two arrival runways, then there will be $$16 \, c_j$$
groupings of flights.

{% img adasma-stepB.png magick:resize:700x700 alt:'Step B' %}
*Step B*

$${UASMA}(c_i)$$, the **unimpeded ASMA time**, is a calculated constant for each
grouping $$c_i$$ (for calculation see section 4.2) [min]. The unimpeded ASMA
time is the ASMA transit time in non-congested conditions at arrival airport.

### Step C: Calculation of Additional ASMA Time per flight

{% img adasma-stepC.png magick:resize:750x750 alt:'Step C' %}
*Step C*


Let:

* $$f$$ arrival flight,
* $$f_{c_i}$$ Arrival Flight belonging to the grouping $$c_i$$. Each grouping
  $$c_i$$ contains at least one flight.
* $${ET}(f_{c_i})$$ ASMA entry time. The time of last entry of the flight
  $$f_{c_i}$$ in its ASMA sector [time],
* $${ALDT}(f_{c_i})$$ Actual Landing Time of flight $$f_{c_i}$$ [time],

The $${AcASMA}(f_{c_i})$$, the actual ASMA transit time for a flight
$$f_{c_i}$$, is defined as the elapsed time between the time of the __last__ entry
of the flight $$f_{c_i}$$ in its ASMA sector, $${ET}(f_{c_i})$$ [time], and its
Actual Landing Time $${ALDT}(f_{c_i})$$ [time].

$$
{AcASMA}(f_{c_i}) = {ALDT}(f_{c_i}) - {ET}(f_{c_i}), [min]
$$


Then, the **Additional ASMA Time per flight** $${AdASMA}(f_{c_i})$$ is
calculated for each flight $$f_{c_i}$$ as the difference between the Actual ASMA
Transit Time $${AcASMA}(f_{c_i})$$ of the flight and the Unimpeded ASMA Time
$${UASMA}(c_i)$$ for the Grouping $$c_i$$ to which the flight belongs.

$$
{AdASMA}(f_{c_i}) = {AcASMA}(f_{c_i}) - {UASMA}(c_i), [min]
$$


### Step D: Calculation of the Additional ASMA Time per airport

{% img adasma-stepD.png magick:resize:600x600 alt:'Step D' %}
*Step D*

* $$N_j$$ is the total number of IFR arrivals in the data set used for
calculation of the additional ASMA time performance indicator, [count].

The **additional ASMA time for a given airport** $${AdASMA}_j$$ is the average
of the additional ASMA time $${AdASMA}(f_j)$$, for all the flights $$f_j$$ at
that airport that have an unimpeded reference, in the sample $$N_j$$.

$$
{AdASMA}_j = \frac{ {AdASMA}(f_j)}{N_j}, [min/{IFR\ arrival\ flight}].
$$



## Mathematical model of the Unimpeded ASMA Time

The unimpeded ASMA time is the ASMA transit time in non-congested conditions at
arrival airports. The unimpeded ASMA time is used (as a constant number for each
combination of aircraft class, ASMA sector and arrival runway) in the
calculation of the additional ASMA time. The unimpeded ASMA times are calculated
for IFR arriving flights, at each airport.

The following section details the calculation done as part of each step. The
units for each variable are shown in **[** **]** brackets.

### Step 1: Filtering

Reference sample for calculation of unimpeded times for all airports is one
year, normally from (and including) January $$1^{st}$$ until $$31^{st}$$
December. The year depends on the availability of the data.

{% img adasma-step1.png magick:resize:700x700 alt:'Step 1' %}
*Step 1*

A filter is applied so that only flights with $${AcASMA}(f_{c_i}) < 120\, \text{min}$$
are taken into account.

Incomplete records will not be taken into account for the calculation, that is,
records with no landing or Entry Time data.


### Step 2: Computations at flight level: ASMA Time, Congestion level

At flight level, there are two parallel computations that lead to two new
variables: the actual ASMA time (Step 2a) and the congestion level (Step 2b).

#### Step 2a: Calculation of the Actual ASMA Time per flight

Let:

* $$f$$ arrival flight,
* $$f_{c_i}$$ Arrival Flight belonging to the grouping $$c_i$$. Each grouping
  $$c_j$$ contains at least one flight. 
* $${ET}(f_{c_i})$$ ASMA entry time. The time of last entry of the flight
  $$f_{c_i}$$ in its ASMA sector [time],
* $${ALDT}(f_{c_i})$$ Actual Landing Time of flight $$f_{c_i}$$ [time],


{% img adasma-step2a.png magick:resize:400x400 alt:'Step 2a' %}
*Step 2a*

Then, $${AcASMA}(f_{c_i})$$, the Actual ASMA transit time for a flight
$$f_{c_i}$$, is defined as the elapsed time between the time of the last entry
of the flight $$f_{c_i}$$ in its ASMA sector, $${ET}(f_{c_i})$$ [time], and its
actual landing time $${ALDT}(f_{c_i})$$ [time].

#### Step 2b: Determination of Congestion Level per flight

{% img adasma-step2b.png magick:resize:700x700 alt:'Step 2b' %}
*Step 2b*

For each flight $$f_{c_i}$$, a **congestion level** $${seq}(f_{c_i})$$ can be
determined [count]. The congestion level is the number of other landings during
the time interval:
[ASMA entry time $${ET}(f_{c_i})$$, actual landing time $${ALDT}(f_{c_i})$$] and
then subtracting the flight itself. Thus, for all flights $$f$$ landing in that
time interval: 

$$
{seq}(f_{c_i}) = \sum f - 1 \quad \forall f \textrm{ such that } 
\text{ET}(f_{c_i}) \leq \text{ALDT}(f)
\leq \text{ALDT}(f_{c_i})
$$


### Step 3: Computation of the Saturation level

Computation of the saturation level requires the previous determination of the
airport congestion index (Step 3a) and airport arrival throughput $$R_j$$ (Step
3b). The grouping of flight according to their AC-RWY-SEC combination (Step 3c)
allows the calculation of the first unimpeded time estimate U1 (Step 3d) and
latter determination of the saturation level based on the results from each one
of the computations (Step 3e).

{% img adasma-step3.png magick:resize:700x700 alt:'Step 3' %}
*Step 3*

#### Step 3a: determination of airport congestion index

At airport level, a constant known as the congestion limit $${cl}$$ is chosen as:

* $$0.5$$ for all airports.


#### Step 3b: Calculation of Airport Peak Hourly Arrival Throughput

The next step is defining the airport peak hourly arrival throughput, which is a
theoretical hourly rate based on the truncated 20min window prior to the
arrival. The – theoretical – maximum airport arrival throughput is seen as
determinant of the level of traffic saturation and, thus, the threshold at which
effects of congestion can be observed.

For each aircraft landing at airport A, the number of aircraft that landed in
the previous 20 minutes is counted.

{% img adasma-step3b.png magick:resize:450x450 alt:'Step 3b' %}
*Step 3b*

Let $$t_i$$ be the arrival time of the aircraft $$i$$, $$n$$ be the number of
aircraft that have landed in the window $$[t_i − 20, t_i ]$$ and $$f_i$$ the
landing time of the first aircraft in the window. Then, the arrival rate during
this period is given by

$$
\text{hourly rate} = \frac{n - 1}{t_i - f_i}
$$

The numerator of the fraction is expressed as $$n – 1$$ to denote that the
aircraft $$i$$ is excluded for the calculation of the rate.

Therefore, the arrival throughput for each flight $$f_{c_i}$$ is calculated as:


$$
\text{hourly rate}(f_{c_j}) = \frac{count - 1}{base}
$$

where

$$
    {count}  =  \sum f  \quad \textrm{for } f \textrm{ such that} \quad {ALDT}(f_{c_i}) - 20\, \text{min} \leq {ALDT}(f) \leq {ALDT}(f_{c_i})
$$

$$
    {base}  =  {ALDT}(f_{c_i}) - \textrm{min}({ALDT}(f))   \quad \text{where }
    {ALDT}(f) \in [{ALDT}(f_{c_i}) - 20 \, \text{min},  {ALDT}(f_{c_i})]
$$

For example, for a flight landing at 07:04:00hrs, the first preceding arrival is
observed at 06:45:04. The resulting rate base is hence 18:56 minutes. Assuming 9
arrivals would be observed in this window (without counting the flight 07:04:00
flight), this yields a (theoretical) hourly throughput of:

$$
\textrm{hourly departure throughput}(\text{flight}) = \
\frac{9\, \textrm{flights}}{ {18:56}\, \textrm{min}} = \
0.4754 \frac{\textrm{flights}}{\textrm{min}} = \
28.52 \frac{\textrm{flights}}{\textrm{hour}}
$$

The peak hourly arrival throughput of the airport, $$R_j$$ , is calculated as
the 90 percentile of all $$\text{hourly rate}$$ values in the reference sample


$$
R_j = 90^{th} \textrm{percentile}(\textrm{hourly rate}), [\textrm{flights}/\textrm{hour}]
$$


#### Step 3c: Grouping of similar flights by AC-RWY-SEC combination

Flights are grouped by $$c_i$$ , or **Grouping of flights** with the same
combination aircraft class, ASMA sector and arrival runway (direction of runway,
i.e. 12 or 30R), at each airport $$j$$ ($$j = 1 \dots n$$, being $$n$$ the
total number of airports affected by regulation IR390/2013).

For example, if there are four aircraft classes landing at the airport $$j$$, two
ASMA sectors and two arrival runways there will be $$16\, c_i$$ groupings of
flights.


#### Step 3d: Calculation of the first Unimpeded ASMA Time estimate

$$U_1(c_i)$$ is defined as the first Unimpeded ASMA Time estimate for each
grouping of flights $$c_i$$, being the $$20^{th}$$ percentile of all the ASMA
transit times of the flights belonging to that grouping [min].

$$
U_1(c_i) = 20^{th}\textrm{percentile}({AcASMA}(f_{c_i}))
$$

{% img adasma-step3d.png magick:resize:350x350 alt:'Step 3d' %}
*Step 3d*


#### Step 3e: Determination of the Saturation Level per grouping

While the congestion level is a measure for the traffic encountered by an
individual flight, the saturation threshold describes the maximum traffic level
served under non-congested traffic conditions. As an upper bound for the
saturation threshold, the saturation level can be estimated as the maximum
number of aircraft landing under non-congested conditions (expressed by the
first estimate of the unimpeded ASMA time).

Dependent on the previous steps 3b and 3d the saturation level is calculated by
multiplying the estimate of the unimpeded time U1 with the peak hourly
throughput $$R_j$$, to provide an estimation of the (theoretical) maximum number
of arrivals per hour served by the airport without congestion. The result is
rounded to the next unit.

$$L(c_i)$$, the saturation level of the grouping $$c_i$$, is calculated as:
$$L(c_i) = \textrm{round}(\frac{R_j U_1(c_i)}{60})$$



### Step 4: Identification of unimpeded flights

To ensure that a flight is unimpeded, its congestion level needs to be
sufficiently smaller than the saturation level. Departing flights are considered
as non-congested, if their congestion limit is equal or below the saturation
threshold.

However, it needs to be ensured that the data sample is big enough to produce a
statistically relevant sample for the chosen stand/runway combination and robust
estimate of the unimpeded time.

To limit the impact of any congestion effect (and to address the sample size),
the saturation threshold is estimated as a fraction of the saturation level.
This limitation is achieved with the definition of the congestion limit
$${cl}$$, a constant defined in Step 3a.

Based on the previous outputs, the identification of the unimpeded flights is
done: the saturation level, corrected with the congestion limit, is compared to
the congestion level.

{% img adasma-step4.png magick:resize:650x650 alt:'Step 4' %}
*Step 4*

With the aim of designating the unimpeded flights,$${fu}_{c_i}$$ is defined as a
binary variable, denoting that a flight $$f_{c_i}$$ belonging to the grouping
$$c_i$$ is an unimpeded flight. A flight is considered unimpeded if its
congestion level $${seq}(f_{c_i})$$ is less than or equal to the product of
congestion limit $${cl}$$ and the flight’s grouping saturation level $$L(c_i)$$.


### Step 5: Computation of unimpeded time per grouping

$$
{fu}_{c_i} =
\begin{cases}
     1,& \forall f_{c_i} \in \text{seq}(f_{c_i}) \leq 0.5 L_(c_i) \\
    0,& \text{otherwise}
\end{cases}
$$

The unimpeded ASMA time per grouping is computed as the median of the ASMA time
only for the unimpeded flights.

{% img adasma-step5.png magick:resize:700x700 alt:'Step 5' %}
*Step 5*

The unimpeded ASMA time $$\text{UASMA}(c_i)$$ for a grouping $$c_i$$ is a
calculated constant at the airport $$j$$.

In order to derive statistically meaningful and representative unimpeded times
per group, only those groupings with equal or more than 20 flights are retained
in the calculation. For groupings $$c_i$$ that have less than 20 unimpeded
flights $$\text{fu}_{c_i}$$, the associated unimpeded time $$\text{UASMA}(c_i)$$
is not calculated. These groupings 𝑐𝑖 do not have unimpeded times (consequently,
it is not possible to calculate additional ASMA time for those groupings).

Night flights are excluded from the calculation at this point, so only the
flights taking off during day time are considered for the calculation of the
reference unimpeded times. On the standard calculation day time is defined
between 06:30 and 22:00 of airport local time. Calibration of day time
definition may lead to different definition in some of the busiest airports (see
section 5).

For the groupings $$c_i$$ that have 20 or more unimpeded flights, the unimpeded
time is defined as the median of the Actual ASMA Transit Time
$$\text{AcASMA}(f_{c_i})$$, of all unimpeded flights $$\text{fu}_{c_i}$$
belonging to the grouping of flights. 

$$
\text{UASMA}(c_i) =
\begin{cases}
    \textrm{median}(\text{AcASMA}(f_{c_i})),& \forall c_i \in \textrm{count}(\text{fu}_{c_i}) \geq 20 \\
    \textrm{null},& \text{otherwise}
\end{cases}
$$

These times are aggregated in Unimpeded References Tables for the calculation of
the additional ASMA time as described in Section 4.1.

Although unimpeded ASMA time constants for each 𝑐𝑖 are relatively static in
time, regular checks are made to ensure that they remain representative of the
operations for the airport under consideration (see section 5.2). In case a
change of unimpeded times is detected, the causes of that change (i.e. new
procedure implementation, change of TMA design) are investigated. When required,
new unimpeded time constants are calculated. However, because the unimpeded time
constants calculation method is based on statistical analysis of the Actual ASMA
transit time, a period of several months after the change is required before new
robust unimpeded times can be established.



# Calibration of model parameters

This section describes the model parameters that need to be customized for every
airport, and the approach used for obtaining and updating them.

For the additional ASMA time indicator, the parameters that need manual
calibration are the ASMA sectors and the unimpeded times.

## ASMA sectors

For a given runway configuration, the ASMA transit time depends on the direction
from which the ASMA cylinder is entered. For this reason, the ASMA cylinder is
divided into so-called ASMA sectors. The ASMA sectors are defined according to a
statistical cluster analysis of the distribution of the inbound traffic. The
figure shows the sectorization for Heathrow 

{% img asmasectors.jpg magick:resize:350x350 alt:'ASMA sectors and bearing' %}
*ASMA sectors and bearing*

The ASMA entry bearings are checked every month to investigate whether there are
any changes in the arrival flows directions. In case substantial changes in the
arrival flow directions are identified, the differences will be investigated
with the particular airport, and the ASMA sectors will be updated if applicable.


##  Unimpeded times

The base period for the calculation of Unimpeded times (which are constants for
each one of the groupings) is the year 2011, but this can vary across the
different airports.

Unimpeded times are calculated once, over 1 year, and they are kept in a static
reference table.

As part of the manual quality analysis of the results, the unimpeded times are
recalculated every month to investigate whether there are any changes in
unimpeded times. Changes at the airport and the airspace design can have an
impact on the unimpeded times. Only in the cases that the substantial changes
are reported for an airport, the differences will be investigated with the
particular airport. If the change is due to a change in the airport
characteristics that require a new performance reference, the reference
unimpeded times will be modified accordingly.

Because the unimpeded time constants calculation method is based on statistical
analysis of the actual ASMA time, a period of three months after the change is
required before new robust unimpeded times references can be established.

### Example of unimpeded times recalculation

The following represents an example considering an airport XXXX with its
reference unimpeded times based on the full year of 2011.

As part of the monthly values calculation, the unimpeded times will be
recalculated each month (e.g. for June 2014) and compared with the “reference”
ones (based on 2011).

* If the values are considered similar enough, the static values will be kept:
  the airport reference period will still be 2011. The validity of the reference
  unimpeded times based on 2011 will be extended to June 2014)

* If a change is detected in the June 2014 results (the unimpeded times
  recalculated based on June 2014 are significantly different from the 2011
  ones), the issue will be investigated and discussed with the airport, in order
  to decide which new reference to take. If, for example, the change was due to
  a new runway opened in June 2014, the new reference will be the following
  year: June 2014-June 2015. However, if the difference corresponds to a runway
  closure of 3 months, the reference would be modified only for the affected 3
  months.

Two parameters can trigger the renewal of the unimpeded time reference for one
airport, each month:

* The number of flights that do not have unimpeded reference (are not in a
  grouping with more than 20 unimpeded flights) are more than 10% of the total
  traffic of the concerned month.

* The standard deviation of the unimpeded times of all the flights of the month
  is higher than 2 minutes.


## Day Time

Due to extended opening hours in certain airports, day time may be extended for
the filtering of the flights in the unimpeded ASMA time calculation.


# Source data

## Main and secondary data sources

The additional ASMA time indicator is calculated using data provided by the
airport operators and the Network Manager:

* The airport operators provide the Actual Landing times, the aircraft type and
  the runways used for the arrivals.

* The Network Manager (NM) provides the entry points to the ASMA cylinder
  (position and time of entry) coming from the Correlated Position Reports
  (CPR). CPR are built from ANSP radar track data for both 40NM and 100NM. When
  CPR data for ASMA entry point data is not available, the data from NM’s
  Current Tactical Flight Model (CTFM) is used as a substitute. 
  
| Name                             | Source SES (IR691/390) | Alternative Source |
|----------------------------------|------------------------|--------------------|
| Arrival airport                  | Airports               | ANSPs              |
| Actual landing time              | Airports               | ANSPs or NM        |
| Arrival Runway                   | Airports               |                    |
| Aircraft type                    | Airports               |                    |
| Actual ASMA entry time and point | NM (based on ANSP)     | NM (CTFM)          |

Table 3: Data Sources

**Note**: The NM data flow also provides the calculated landing times (from both
CPR and CTFM). Given the quality assurance measures defined for the airport
operator data flow, NM data flow based timestamps will only be used for
complementing the airport operator data flow.


# Quality management

## The Airport Operator Data Flow process

The airport operator data flow (APDF) comprises all data collection, processing,
and performance indicator calculation sub-processes. Reporting entities (i.e.
airport operators) submit their data to EUROCONTROL on a monthly basis and in
compliance with the APDF data specification.

Several activities are performed in the data flow process, involving different
actors, until Performance reports are published. As a summary, a high level
overview of the activities can be found below:

{% img adasma-08.png magick:resize:800x800 alt:'Airport Data Flow process scheme including activities and actors involved' %}
*Airport Data Flow process scheme including activities and actors involved.*


The airport operator data flow can be conceptualised as stages sub-processes:

* APDF\_1 – Data Collection
* APDF\_2 – Data Validation
* APDF\_3 – Data Extract, Transform and Load
* APDF\_4 – Data Merging
* APDF\_5 – Pre-Computation of performance parameters
* APDF\_6 – Calculation of Performance Indicators

Each of the sub-processes are governed by quality assurance measures. The PRU
assumes responsibility for the whole flow in terms of quality assurance. Data
collection and initial validation is performed by CODA. Once the data is loaded,
the data processes within the EUROCONTROL data warehouse are managed by PRISME.
In the final stage, PRU extracts the relevant data and computes the performance
metrics and indicators.

APDF related documentation is published under the PRU Quality Management System.


## Quality Assurance Framework

Quality assessment on airport data flow process is focused towards implementing
a Quality Assurance Framework based on the ISO 9001 standard. The airport
operator data flow process includes several data processing activities, starting
from the moment flight information is provided by the reporting entity until
performance reports are released.

Standard Operating Procedures for all these sub-processes have been established
and is quality controlled.

The documentation is published under the PRU Quality Management System.


## Data Quality Checks

For the APDF the following quality areas have been identified. Quality controls
in support of these quality areas are implemented and regularly monitored as
part of the aforementioned APDF sub-processes. 

{% img adasma-09.png magick:resize:700x700 alt:'Quality Performance Areas and corresponding Quality Indicators' %}
*Quality Performance Areas and corresponding Quality Indicators*


More detail on these quality checks can be found in the Airport Data Flow Data Specifications (see [3]).


## Performance Indicator Quality Checks

The average additional ASMA time per flight grouped by airport and month
represents the main result from the performance indicator calculation process.
In addition, this process provides parameters that are used for data validation
and statistical analysis:

* average unimpeded time

* standard deviation

* Values for 25%,50% and 75% percentiles

* number of flights, number of unimpeded flights and number of flights with
  valid data 

* total additional time, unimpeded time and 25%, 50% and 75% percentile

* completeness and coverage of the traffic sample

These metrics are used for PRU internal validation activities and may trigger
case-by-case analyses if significant variations are observed.


# References

{% bibliography --cited_in_order --file aviation --file legislation %}
[x] Airport Data Flow Data Specifications

