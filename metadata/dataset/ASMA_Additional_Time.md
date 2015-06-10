---
layout: default
title: ASMA Additional Time Dataset
excerpt: Performance Review Unit MetaData Definitions.
keywords: metadata, dataset, performance, data, statistics, economics, air transport, flights, europe, cost efficiency
---
# {{ page.title }}

period: [2014/01, 2015/04]

~1000 rows


## Column naming and types

| Column name       | Example  |  Pivot Label              | Description                                                               |
|-------------------|----------|---------------------------|---------------------------------------------------------------------------|
| YEAR              | 2014     | YEAR                      | Reference year                                                            |
| MONTH_NUM         | 1        | MONTH                     | Month (numeric)                                                           |
| MONTH_MON         | JAN      |                           | Month (3-letter code)                                                     |
| APT_COUNTRY       | Belgium  | APT_COUNTRY               | Country in which the airport is located                                   |
| APT_ICAO          | EBBR     | APT_ICAO                  | ICAO 4-letter airport designator                                          |
| APT_NAME          | Brussels | APT_NAME                  | Airport name                                                              |
| ASMA_RADIUS       |          |                           |                                                                           |
| FLT_ASMA_UNIMP_2  | 7290     |                           | IFR flights with unimpeded reference time (source: Airport Operator)      |
| TIME_ASMA_UNIMP_2 | 60081    |                           | Total unimpeded reference ASMA time in minutes (source: Airport Operator) |
| TIME_ASMA_ADD_2   | 15175    |                           | Total additional ASMA time in minutes (source: Airport Operator)          |
|                   |          | Avg. unimpeded ASMA time  | =TIME_ASMA_UNIMP_2/FLT_ASMA_UNIMP_2                                       |
|                   |          | Avg. additional ASMA time | =TIME_ASMA_ADD_2/FLT_ASMA_UNIMP_2                                         |