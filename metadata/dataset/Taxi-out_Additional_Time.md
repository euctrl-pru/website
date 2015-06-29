---
layout: default
title: Taxi-out Additional Time Dataset
excerpt: Performance Review Unit MetaData Definitions.
keywords: metadata, dataset, performance, data, statistics, economics, air transport, flights, europe, cost efficiency
---
# {{ page.title }}

## Data description
The **additional taxi-out time** is a proxy for the average departure runway queuing time on the outbound traffic flow, during congestion periods at airports.

It is the difference between the actual taxi-out time of a flight and a statistically determined unimpeded taxi-out time based on taxi-out times in periods of low traffic demand.

<p>Uncertainty of take-off clearance time and aircraft arriving time at runway holding stop bars makes traffic supply to runways a stochastic phenomenon. In order to ensure continuous traffic demand at runways and maximise runway usage, a minimum level of queuing is required. However, additional time is detrimental to taxi-out efficiency, fuel consumption and environment. Therefore, there exists a trade-off between taxi-out efficiency and runway throughput.</p>

<p>When monitoring taxi-out performance at airports, it is important to note that the goal is not to reduce taxi time to the unimpeded reference time - as this could negatively impact on runway throughput - but rather to reduce additional taxi-out time and associated fuel burn to the necessary minimum.</p>

<p>As an output of the ATMAP Group, additional taxi-out time has been in use as a commonly agreed proxy for airport inefficiency in the taxi-out phase since 2008 and is compliant with the PI definition in the Performance Regulation (691/2010).</p>

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
