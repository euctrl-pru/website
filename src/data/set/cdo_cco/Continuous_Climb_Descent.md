---
layout: default
needsMath: false
title: Continuous climb and descent Dataset
permalink: /references/dataset/Continuous_Climb_Descent.html
excerpt: Performance Review Unit MetaData Definitions.
keywords: metadata, dataset, performance, data, statistics, economics, air transport, flights, europe, cost efficiency
---
# {{ page.title }}

## Data description
This data provides the results of the analysis of vertical flight profiles
during climb and descent at airports.
The methodology is desto measure and observe vertical flight efficiency
without highlighting specific reasons for the observed behaviour.
More detailed case studies are needed to find out reasons for particular
observations.

## Methodology

The methodology being applied for the characterisation of CCO/CDO is described
in the relevant [methodology page][cdo_cco_meth].


## Column naming and types

| Column name            | Data source     | Label                  | Column description                                                                         | Example  |
|------------------------|-----------------|------------------------|--------------------------------------------------------------------------------------------|----------|
| YEAR                   | Network Manager | YEAR                   | Reference year                                                                             | 2014     |
| MONTH_NUM              | Network Manager | MONTH                  | Month (numeric)                                                                            | 1        |
| MONTH_MON              | Network Manager | MONTH_MON              | Month (3-letter code)                                                                      | JAN      |
| Airport                | Network Manager | Airport                | ICAO 4-letter airport designator                                                           | EBBR     |
| APT_NAME               | PRU             | APT_NAME               | Airport name                                                                               | Brussels |
| STATE_NAME             | PRU             | STATE_NAME             | Name of the country in which the airport is located                                        | Belgium  |
| NBR_FLIGHTS            | PRU             | NBR_FLIGHTS            | Number of flights                                                                          | 4523     |
| AVG_DIST_LEVEL_NM      | PRU             | AVG_DIST_LEVEL_NM      | Average distance flown level per flight in Nautical miles                                  | 2.6      |
| AVG_TIME_LEVEL_SECONDS | PRU             | AVG_TIME_LEVEL_SECONDS | Average time flown level per flight in seconds                                             | 1.4      |
| MEDIAN_CDO_ALT         | PRU             | MEDIAN_CDO_ALT         | Median CDO altitude in feet                                                                | 7290     |
| PERC_CDO_FLIGHTS       | PRU             | PERC_CDO_FLIGHTS       | Percentage of flights that are considered CDO (and don't have any considered level flight) | 75.6%    |
| MEDIAN_CCO_ALT         | PRU             | MEDIAN_CCO_ALT         | Median CCO altitude in feet                                                                | 7290     |
| PERC_CCO_FLIGHTS       | PRU             | PERC_CCO_FLIGHTS       | Percentage of flights that are considered CCO (and don't have any considered level flight) | 75.6%    |


[cdo_cco_meth]: <{{ "/references/methodology/cd_vertical_flight_efficiency_pi.html" | prepend: site.baseurl | prepend: site.url }}> "Vertical flight efficiency during climb and descent methodology"