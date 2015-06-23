---
layout: default
title: Taxi-out Additional Time Dataset
excerpt: Performance Review Unit MetaData Definitions.
keywords: metadata, dataset, performance, data, statistics, economics, air transport, flights, europe, cost efficiency
---
# {{ page.title }}

## Column naming and types

| Column name      | Data source     | Label       | Column description                                 | Example  |
|------------------|-----------------|-------------|----------------------------------------------------|----------|
| YEAR             | Network Manager | YEAR        | Reference year                                     | 2014     |
| MONTH_NUM        | Network Manager | MONTH       | Month (numeric)                                    | 1        |
| MONTH_MON        | Network Manager |             | Month (3-letter code)                              | JAN      |
| APT_ICAO         | Network Manager | APT_ICAO    | ICAO 4-letter airport designator                   | EBBR     |
| APT_NAME         | PRU             | APT_NAME    | Airport name                                       | Brussels |
| STATE_NAME       | PRU             | APT_COUNTRY | Country in which the airport is located            | Belgium  |
| FLT_TXO_UNIMP_2  | NM/airport      |             | IFR flights with unimpeded reference time          | 7290     |
| TIME_TXO_UNIMP_2 | NM/airport      |             | Total unimpeded reference taxi-out time in minutes | 60081    |


### Calculated Field(s)

\begin{align*}
\text{Average unimpeded taxi-out time} & = \frac{TIME\_TXO\_UNIMP\_2}{FLT\_TXO\_UNIMP\_2} \\
\text{Average additional taxi-out time} & = \frac{TIME\_TXO\_ADD\_2}{FLT\_TXO\_UNIMP\_2}
\end{align*}
