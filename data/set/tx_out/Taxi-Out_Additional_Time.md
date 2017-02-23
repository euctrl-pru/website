---
layout: default
needsMath: true
title: Taxi-Out Additional Time Dataset
permalink: /references/dataset/Taxi-Out_Additional_Time.html
excerpt: Performance Review Unit MetaData Definitions.
keywords: metadata, dataset, performance, data, statistics, economics, air transport, flights, europe, cost efficiency
---
# {{ page.title }}

## Data description

The [additional taxi-out time]({{ "/references/definition/additional_taxi-out_time.html" | prepend: site.baseurl | prepend: site.url }})
is a proxy for the average departure runway
queuing time on the outbound traffic flow during congestion periods at airports.

It is the difference between the actual taxi-out time of a flight and a
statistically determined
[unimpeded taxi-out time]({{ "/references/definition/unimpeded_taxi-out_time.html" | prepend: site.baseurl | prepend: site.url }})
based on taxi-out times in periods of low traffic demand.

When monitoring taxi-out performance at airports, it is important to note that
the goal is not to reduce taxi time to the unimpeded reference time - as this
could negatively impact on runway throughput - but rather to reduce additional
taxi-out time and associated fuel burn to the necessary minimum.

## Column naming and types

| Column name      | Data source     | Label            | Column description                                 | Example  |
|------------------|-----------------|------------------|----------------------------------------------------|----------|
| YEAR             | Network Manager | YEAR             | Reference year                                     | 2014     |
| MONTH_NUM        | Network Manager | MONTH_NUM        | Month (numeric)                                    | 1        |
| MONTH_MON        | Network Manager | MONTH_MON        | Month (3-letter code)                              | JAN      |
| APT_ICAO         | Network Manager | APT_ICAO         | ICAO 4-letter airport designator                   | EBBR     |
| APT_NAME         | PRU             | APT_NAME         | Airport name                                       | Brussels |
| STATE_NAME       | PRU             | STATE_NAME       | State in which the airport is located              | Belgium  |
| FLT_TXO_UNIMP_2  | NM/airport      | FLT_TXO_UNIMP_2  | IFR flights with unimpeded reference time          | 7290     |
| TIME_TXO_UNIMP_2 | NM/airport      | TIME_TXO_UNIMP_2 | Total unimpeded reference taxi-out time in minutes | 60081    |
| TIME_TXO_ADD_2   | NM/airport      | TIME_TXO_ADD_2   | Total additional taxi-out time in minutes          | 15175    |


### Calculated Field(s)

$$
\begin{align*}
\text{Average unimpeded taxi-out time} & = \frac{TIME\_TXO\_UNIMP\_2}{FLT\_TXO\_UNIMP\_2} \\
\text{Average additional taxi-out time} & = \frac{TIME\_TXO\_ADD\_2}{FLT\_TXO\_UNIMP\_2}
\end{align*}
$$
