---
layout: default
title: ASMA Additional Time Dataset
excerpt: Performance Review Unit MetaData Definitions.
keywords: metadata, dataset, performance, data, statistics, economics, air transport, flights, europe, cost efficiency
---
# {{ page.title }}

## Data description
The additional ASMA time is a proxy for the average arrival runway queuing time on the inbound
traffic flow, during congestion periods at airports.

It is the difference between the actual ASMA time of a flight and a statistically determined
unimpeded ASMA time based on ASMA times in periods of low traffic demand.

Uncertainty of approach conditions (e.g. pilot performance, landing clearance time, approach speed,
wind conditions) makes traffic supply to runways a stochastic phenomenon.
In order to ensure continuous traffic demand at runways and maximise runway usage, a minimum level
of queuing is required.
However, additional time in holding is detrimental to operations efficiency, fuel consumption and environment.
Therefore, there exists a trade-off between approach efficiency and runway throughput.

As an output of the ATMAP Group, additional ASMA time has been in use as a commonly agreed proxy
for airport inefficiency in the approach phase since 2008 and is compliant with the PI definition
in the Performance Regulation (691/2010).

## Column naming and types

| Column name       | Data source     | Label       |  Description                                                        | Example  |
|-------------------|-----------------|-------------|---------------------------------------------------------------------|----------|
| YEAR              | Network Manager | YEAR        | Reference year                                                      | 2014     |
| MONTH_NUM         | Network Manager | MONTH       | Month (numeric)                                                     | 1        |
| MONTH_MON         | Network Manager |             | Month (3-letter code)                                               | JAN      |
| APT_ICAO          | Network Manager | APT_ICAO    | ICAO 4-letter airport designator                                    | EBBR     |
| APT_NAME          | PRU             | APT_NAME    | Airport name                                                        | Brussels |
| STATE_NAME        | PRU             | APT_COUNTRY | Country in which the airport is located                             | Belgium  |
| ASMA_RADIUS       | PRU             | ASMA_RADIUS | The radius around the airport (in NM) used for the ASMA calculation | 40       |
| FLT_ASMA_UNIMP_2  | NM/Airport      |             | IFR flights with unimpeded reference time                           | 7290     |
| TIME_ASMA_UNIMP_2 | NM/Airport      |             | Total unimpeded reference ASMA time in minutes                      | 60081    |
| TIME_ASMA_ADD_2   | NM/Airport      |             | Total additional ASMA time in minutes                               | 15175    |


### Calculated Field(s)

\begin{align*}
\text{Average additional ASMA time} & = \frac{TIME\_ASMA\_ADD\_2}{FLT\_ASMA\_UNIMP\_2} 
\end{align*}

\begin{align*}
\text{Average unimpeded ASMA time} & = \frac{TIME\_ASMA\_UNIMP\_2}{FLT\_ASMA\_UNIMP\_2} 
\end{align*}