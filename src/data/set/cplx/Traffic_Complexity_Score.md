---
layout: default
needsMath: true
title: Traffic Complexity Score Dataset
permalink: /references/dataset/Traffic_Complexity_Score.html
excerpt: Performance Review Unit MetaData Definitions.
keywords: metadata, dataset, performance, data, statistics, economics, air transport, flights, europe, cost efficiency
published: true
---

# {{ page.title }}

## Data description

The PRU, in close collaboration with ANSPs, has defined a set of complexity indicators that
can be applied in ANSP benchmarking.
The complexity indicators are computed on a systematic basis for each day of the year.
The complexity indicators are based on the concept of “interactions” arising when there are
two aircraft in the same “place” at the same time.
Hence, the **Complexity Score** is a measure of the potential number of interactions between
aircraft defined as the total duration of all interactions (in minutes) per flight-hour
controlled in a given volume of airspace.
The **Complexity Score** is the product of two components: Traffic density and Structural index.

The traffic density is expressed in **Adjusted density** which measures the (uneven) distribution
of traffic throughout the airspace (i.e. taking into account the relative concentration).
The measure relies on dividing the airspace volume into a discrete grid of 20 nautical mile cells.
An interaction is defined as the simultaneous presence of two aircraft in a cell of 20x20 nautical
miles and 3,000 feet in height.

The structural index originates from horizontal, vertical, and speed interactions and is computed
as the sum of the three indicators.

**Horizontal interactions index:** A measure of the complexity of the flow structure based on
the potential interactions between aircraft on different headings.
The indicator is defined as the ratio of the duration of horizontal interactions to the total
duration of all interactions.

{% img cplx_horizontal.png alt:"Horizontal interactions" title:"Horizontal interactions" magick:resize:150x150 %}

**Vertical interactions index:** A measure of the complexity arising from aircraft in vertical
evolution based on the potential interactions between climbing, cruising and descending aircraft.
The indicator is defined as the ratio of the duration of vertical interactions to the total
duration of all interactions.

{% img cplx_vertical.png alt:"Vertical interactions" title:"Vertical interactions" magick:resize:150x150 %}

**Speed interactions indicator:** A measure of the complexity arising from the aircraft mix
based on the potential interactions between aircraft of different speeds.
The indicator is defined as the ratio of the duration of speed interactions to the
total duration of all interactions.

{% img cplx_speed.png alt:"Speed interactions" title:"Speed interactions" magick:resize:150x150 %}

More information on the methodology used for the computation of the complexity score
see {% cite complexitymetrics --file aviation %} in the References.

## Column naming and types

| Column name        | Data source     | Label              |  Description                                                    | Example          |
|--------------------|-----------------|--------------------|-----------------------------------------------------------------|------------------|
| YEAR               | Network Manager | YEAR               | Reference year                                                  | 2014             |
| MONTH_NUM          | Network Manager | MONTH              | Month (numeric)                                                 | 1                |
| MONTH_MON          | Network Manager | MONTH_MON          | Month (3-letter code)                                           | JAN              |
| FLT_DATE           | Network Manager | DATE_FLT           | Date of flight                                                  | 12-01-2014       |
| ENTITY_NAME        | PRU             | ENTITY_NAME        | Entity name                                                     | Slovenia Control |
| ENTITY_TYPE        | PRU             | ENTITY_TYPE        | Type of the entity to which the data relates (ANSP, FAB, AREA)  | ANSP (AUA)       |
| CPLX_FLIGHT_HRS    | NM/PRU          | CPLX_FLIGHT_HRS    | Complexity flight hours                                         | 89.4             |
| CPLX_INTER         | NM/PRU          | CPLX_INTER         | Complexity interactions (hours of interactions)                 | 9.4              |
| VERTICAL_INTER_HRS | NM/PRU          | VERTICAL_INTER_HRS | Hours of vertical interactions                                  | 1.0              |
| HORIZ_INTER_HRS    | NM/PRU          | HORIZ_INTER_HRS    | Hours of horizontal interactions                                | 5.8              |
| SPEED_INTER_HRS    | NM/PRU          | SPEED_INTER_HRS    | Hours of speed interactions                                     | 1.5              |


### Calculated Field(s)

$$
\begin{align*}

\text{Adjusted Density}        & = \frac{CPLX\_INTER}{CPLX\_FLIGHT\_HRS} 60 \\
\text{Vertical interactions}   & = \frac{VERTICAL\_INTER\_HRS}{CPLX\_FLIGHT\_HRS} 60 \\
\text{Horizontal interactions} & = \frac{HORIZ\_INTER\_HRS}{CPLX\_FLIGHT\_HRS} 60 \\
\text{Speed interactions}      & = \frac{SPEED\_INTER\_HRS}{CPLX\_FLIGHT\_HRS} 60 \\
\text{Vertical Score}          & = \frac{VERTICAL\_INTER\_HRS}{CPLX\_INTER} \\
\text{Horizontal Score}        & = \frac{HORIZ\_INTER\_HRS}{CPLX\_INTER} \\
\text{Speed Score}             & = \frac{SPEED\_INTER\_HRS}{CPLX\_INTER} \\
\text{Structural Index}        & = \frac{VERTICAL\_INTER\_HRS + HORIZ\_INTER\_HRS + SPEED\_INTER\_HRS}{CPLX\_INTER} \\
\text{Complexity Score}        & = \frac{VERTICAL\_INTER\_HRS + HORIZ\_INTER\_HRS + SPEED\_INTER\_HRS}{CPLX\_FLIGHT\_HRS} 60

\end{align*}
$$

## References

{% bibliography --cited_in_order --file aviation %}
