---
layout: default
title: Traffic Complexity Score Dataset
permalink: /references/dataset/Traffic_Complexity_Score.html
excerpt: Performance Review Unit MetaData Definitions.
keywords: metadata, dataset, performance, data, statistics, economics, air transport, flights, europe, cost efficiency
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

**Vertical interactions index:** A measure of the complexity arising from aircraft in vertical
evolution based on the potential interactions between climbing, cruising and descending aircraft.
The indicator is defined as the ratio of the duration of vertical interactions to the total
duration of all interactions.

**Speed interactions indicator:** A measure of the complexity arising from the aircraft mix
based on the potential interactions between aircraft of different speeds.
The indicator is defined as the ratio of the duration of speed interactions to the
total duration of all interactions.

More information on the methodologies used for the computation of the complexity score
see [@complexitymetrics] in the References.

## Column naming and types

| Column name    | Data source     | Label          |  Description                                                    | Example      |
|----------------|-----------------|----------------|-----------------------------------------------------------------|--------------|
| YEAR           | Network Manager | YEAR           | Reference year                                                  | 2014         |
| MONTH_NUM      | Network Manager | MONTH          | Month (numeric)                                                 | 1            |
| MONTH_MON      | Network Manager | MONTH_MON      | Month (3-letter code)                                           | JAN          |
| FLT_DATE       | Network Manager | DATE_FLT       | Date of flight                                                  | 05-Jan-2014  |
| ANSP_NAME      | PRU             | ENTITY_NAME    | Entity name                                                     | Belgocontrol |
| ATC_UNIT_NAME  | PRU             | ENTITY_TYPE    | Type of the entity to which the data relates (ANSP, FAB, WIDE)  | Brussels     |
| ATC_UNIT_TYPE  | PRU             | TYPE_CALC      | The computation of the flight count can be based on FIR or ANSP | ACC          |
| FLIGHT_TIME    | NM/PRU          | FLIGHT_TIME    | Flight hours                                                    | 1491         |
| INTER_TIME     | NM/PRU          | INTER_TIME     | Hours of interactions                                           | 131          |
| VERTICAL_INTER | NM/PRU          | VERTICAL_INTER | Hours of vertical interactions                                  | 51           |
| HORIZ_INTER    | NM/PRU          | HORIZ_INTER    | Hours of horizontal interactions                                | 73           |
| SPEED_INTER    | NM/PRU          | SPEED_INTER    | Hours of speed interactions                                     | 55           |
| MIN_FL         | Network Manager | MIN_FL         | Minimum flight level                                            | 100          |
| MAX_FL         | Network Manager | MAX_FL         | Maximum flight level                                            | 250          |


### Calculated Field(s)

\begin{align*}
\text{Adjacient Density}     & = round( \frac{INTER\_TIME}{FLIGHT\_TIME} 60, 3) \\
\text{Vertical Index (VI)}   & = round( \frac{VERTICAL\_INTER}{INTER\_TIME}, 3) \\
\text{Horizontal Index (HI)} & = round( \frac{HORIZ\_INTER}{INTER\_TIME}, 3) \\
\text{Speed Index (SI)}      & = round(\frac{SPEED\_INTER}{INTER\_TIME}, 3) \\
\text{Structural Index}      & = VI + HI + SI \\
\text{Complexity Score}      & = round(\frac{VERTICAL\_INTER + HORIZ\_INTER + SPEED\_INTER}{FLIGHT\_TIME} 60, 3)
\end{align*}

# References