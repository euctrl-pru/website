---
---
layout: default
title: Airport Traffic Dataset
excerpt: Performance Review Unit MetaData Definitions.
keywords: metadata, dataset, performance, data, statistics, economics, air transport, flights, europe, cost efficiency
---
# {{ page.title }}


## Column naming and types

| Column name | Data source      | Label                           | Column description               | Example    |
|-------------|------------------|---------------------------------|----------------------------------|------------|
| YEAR        | Network Manager  | YEAR                            | Reference year                   | 2014       |
| MONTH_NUM   | Network Manager  | MONTH                           | Month (numeric)                  | 1          |
| MONTH_MON   | Network Manager  |                                 | Month (3-letter code)            | JAN        |
| DATE_FLT    | Network Manager  | DATE_FLT                        | Date of flight                   | 01/01/2014 |
| APT_ICAO    | Network Manager  | APT_ICAO                        | ICAO 4-letter airport designator | EDDM       |
| APT_NAME    | PRU              | APT_NAME                        | Airport name                     | Munich     |
| STATE_NAME  | PRU              | STATE_NAME                      |                                  | Germany    |
| FLT_DEP_1   | Network Manager  | IFR departures - (NM)           | Number of IFR departures         | 278        |
| FLT_ARR_1   | Network Manager  | IFR arrivals - (NM)             | Number of IFR arrivals           | 241        |
| FLT_TOT_1   | Network Manager  | IFR flights (arr + dep) - (NM)  | Number total IFR movements       | 519        |
| FLT_DEP_2   | Airport Operator | IFR departures - (APT)          | Number of IFR departures         | 278        |
| FLT_ARR_2   | Airport Operator | IFR arrivals - (APT)            | Number of IFR arrivals           | 241        |
| FLT_TOT_2   | Airport Operator | IFR flights (arr + dep) - (APT) | Number total IFR movements       | 519        |
