---
layout: default
title: ATC pre-departure delay (IATA code 89)
excerpt: Performance Review Unit MetaData Definitions.
keywords: metadata, dataset, performance, data, statistics, economics, air transport, flights, europe, cost efficiency
---
# {{ page.title }}


## Column naming and types

| Column name   | Data source      | Label                         | Column description                                                         | Example    |
|---------------|------------------|-------------------------------|----------------------------------------------------------------------------|------------|
| YEAR          | Network Manager  | YEAR                          | Reference year                                                             | 2014       |
| MONTH_NUM     | Network Manager  | MONTH                         | Month (numeric)                                                            | 1          |
| MONTH_MON     | Network Manager  |                               | Month (3-letter code)                                                      | JAN        |
| FLT_DATE      | Network Manager  | FLT_DATE                      | Date of flight                                                             | 01/01/2014 |
| APT_ICAO      | Network Manager  | APT_ICAO                      | ICAO 4-letter airport designator                                           | EDDM       |
| APT_NAME      | PRU              | APT_NAME                      | Airport name                                                               | Munich     |
| STATE_NAME    | PRU              | STATE_NAME                    |                                                                            | Germany    |
| FLT_DEP_1     | Network Manager  | IFR departures - (NM)         | Number of IFR departures from Network Manager                              |            |
| FLT_DEP_2     | Airport Operator | IFR departures - (APT)        | Number of IFR departures for which data was submitted by airport operators |            |
| DLY_ATC_PRE_2 | Airport Operator | ATC pre-departure delay (APT) | Minutes of delay reported as IATA Code 89                                  |            |
| FLT_DEP_3     | CODA/ Airlines   | IFR departures - (AL)         | Number of IFR departures for which data was submitted by airlines          | 0          |
| DLY_ATC_PRE_3 | CODA/ Airlines   | ATC pre-departure delay (AL)  | Minutes of delay reported as IATA Code 89                                  | 0          |
