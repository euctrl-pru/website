---
layout: default
title: Taxi-out Additional Time Dataset
excerpt: Performance Review Unit MetaData Definitions.
keywords: metadata, dataset, performance, data, statistics, economics, air transport, flights, europe, cost efficiency
---
# {{ page.title }}

period: [2014/01, 2015/04]

~2000 rows

## Column naming and types

| Column name      | Example  | Pivot Label                   | Description                                                                   |
|------------------|----------|-------------------------------|-------------------------------------------------------------------------------|
| YEAR             | 2014     | YEAR                          | Reference year                                                                |
| MONTH_NUM        | 1        | MONTH                         | Month (numeric)                                                               |
| MONTH_MON        | JAN      |                               | Month (3-letter code)                                                         |
| APT_COUNTRY      | Belgium  | APT_COUNTRY                   | Country in which the airport is located                                       |
| APT_ICAO         | EBBR     | APT_ICAO                      | ICAO 4-letter airport designator                                              |
| APT_NAME         | Brussels | APT_NAME                      | Airport name                                                                  |
| FLT_TXO_UNIMP_2  | 7290     |                               | IFR flights with unimpeded reference time (source: Airport Operator)          |
| TIME_TXO_UNIMP_2 | 60081    |                               | Total unimpeded reference taxi-out time in minutes (source: Airport Operator) |
| TIME_TXO_ADD_2   | 15175    |                               | Total additional taxi-out time in minutes (source: Airport Operator)          |
|                  |          | Avg. unimpeded taxi-out time  | =TIME_TXO_UNIMP_2 /FLT_TXO_UNIMP_2                                            |
|                  |          | Avg. additional taxi-out time | =TIME_TXO_ADD_2 /FLT_TXO_UNIMP_2                                              |