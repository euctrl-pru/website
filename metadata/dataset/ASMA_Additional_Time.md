---
layout: default
title: ASMA Additional Time Dataset
excerpt: Performance Review Unit MetaData Definitions.
keywords: metadata, dataset, performance, data, statistics, economics, air transport, flights, europe, cost efficiency
---
# {{ page.title }}


## Column naming and types

| Column name       | Data source     | Label       | Column description                                                  | Example  |
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
\text{Average unimpeded ASMA time} & = \frac{TIME\_ASMA\_UNIMP\_2}{FLT\_ASMA\_UNIMP\_2} \\
\text{Avgerage additional ASMA time} & = \frac{TIME\_ASMA\_ADD\_2}{FLT\_ASMA\_UNIMP\_2}
\end{align*}
