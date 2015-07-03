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

## Column naming and types

| Column name       | Data source     | Label       | Column description                                                  | Example  |
|-------------------|-----------------|-------------|---------------------------------------------------------------------|----------|
| YEAR              | Network Manager | YEAR        | Reference year                                                      | 2014     |
| MONTH_NUM         | Network Manager | MONTH       | Month (numeric)                                                     | 1        |
| MONTH_MON         | Network Manager | MONTH_MON   | Month (3-letter code)                                               | JAN      |
| APT_ICAO          | PRU             | APT_ICAO    | ICAO 4-letter airport designator                                    | EBBR     |
| APT_NAME          | PRU             | APT_NAME    | Airport name                                                        | Brussels |
| STATE_NAME        | PRU             | STATE_NAME  | Country in which the airport is located                             | Belgium  |
| ASMA_RADIUS       | PRU             | ASMA_RADIUS | The radius around the airport (in NM) used for the ASMA calculation | 40       |
| FLT_ASMA_UNIMP_2  | NM_Airport      |             | IFR flights with unimpeded reference time                           | 7290     |
| TIME_ASMA_UNIMP_2 | NM_Airport      |             | Total unimpeded reference ASMA time in minutes                      | 60081    |
| TIME_ASMA_ADD_2   | NM_Airport      |             | Total additional ASMA time in minutes                               | 15175    |


### Calculated Field(s)

\begin{align*}
\text{Average additional ASMA time} & = \frac{TIME\_ASMA\_ADD\_2}{FLT\_ASMA\_UNIMP\_2} 
\end{align*}

\begin{align*}
\text{Average unimpeded ASMA time} & = \frac{TIME\_ASMA\_UNIMP\_2}{FLT\_ASMA\_UNIMP\_2} 
\end{align*}