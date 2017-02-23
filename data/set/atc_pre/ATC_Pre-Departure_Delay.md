---
layout: default
title: ATC Pre-Departure Delay (IATA code 89) Dataset
permalink: /references/dataset/ATC_Pre-Departure_Delay.html
excerpt: Performance Review Unit MetaData Definitions.
keywords: metadata, dataset, performance, data, statistics, economics, air transport, flights, europe, cost efficiency
---
# {{ page.title }}

## Data description

The
[ATC pre-departure delay]({{ "/references/definition/atc_pre-departure_delay.html"  | prepend: site.baseurl | prepend: site.url }})
is a proxy for ATC induced delays at the departure stand to avoid queuing at the
departure runway.

The data is based on
[IATA delay code 89]({{ "/references/definition/IATA_code_89.html"  | prepend: site.baseurl | prepend: site.url }})
[see {% cite iata:delaycodes --file aviation %}] which, besides delays caused by
local ATC constraints, also includes delays due to late push-back approval and some other
reasons which may introduce a certain level of bias.
Work is in progress to allow for a better identification of the different causal factors.

## Column naming and types

| Column name   | Data Source      | Label                         | Description                                                                | Example      |
|---------------|------------------|-------------------------------|----------------------------------------------------------------------------|--------------|
| YEAR          | Network Manager  | YEAR                          | Reference year                                                             | 2014         |
| MONTH_NUM     | Network Manager  | MONTH_NUM                     | Month (numeric)                                                            | 01           |
| MONTH_MON     | Network Manager  | MONTH_MON                     | Month (3-letter code)                                                      | JAN          |
| FLT_DATE      | Network Manager  | FLT_DATE                      | Date of flight                                                             | 01-Jan-2014  |
| APT_ICAO      | Network Manager  | APT_ICAO                      | ICAO 4-letter airport designator                                           | EDDK         |
| APT_NAME      | PRU              | APT_NAME                      | Airport name                                                               | Cologne-Bonn |
| STATE_NAME    | PRU              | STATE_NAME                    | Name of the State in which the airport is located                          | Germany      |
| FLT_DEP_1     | Network Manager  | IFR departures - (NM)         | Number of IFR departures from Network Manager                              | 66           |
| FLT_DEP_IFR_2 | Airport Operator | IFR departures - (APT)        | Number of IFR departures for which data was submitted by airport operators | 66           |
| DLY_ATC_PRE_2 | Airport Operator | ATC pre-departure delay (APT) | Minutes of delay reported as IATA Code 89                                  | 0            |
| FLT_DEP_3     | CODA/ Airlines   | IFR departures - (AL)         | Number of IFR departures for which data was submitted by airlines          | 52           |
| DLY_ATC_PRE_3 | CODA/ Airlines   | ATC pre-departure delay (AL)  | Minutes of delay reported as IATA Code 89                                  | 2            |

## References

{% bibliography --file aviation --cited_in_order %}
