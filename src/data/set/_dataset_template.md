---
layout: default
title: <title> Dataset
excerpt: Performance Review Unit MetaData Definitions.
keywords: metadata, dataset, performance, data, statistics, economics, air transport, flights, europe, cost efficiency
---
# {{ page.title }}

## Data description

One line summary (ca. 50 chars)

If necessary, a longer and more detailed description with references, diagrams, whatevwer.
It usually covers more than just one line!
Any citation [see {% cite iata:delaycodes %}] will be properly mentioned in the References section (the last in the page.)

A final paragraph on where this dataset is used.

## Column naming and types

| Column name    | Data source    | Label          |  Description                                                    | Example      |
|----------------|----------------|----------------|-----------------------------------------------------------------|--------------|
| YEAR           | Network Manger | YEAR           | Reference year                                                  | 2014         |
| MONTH_NUM      | Network Manger | MONTH          | Month (numeric)                                                 | 1            |
| MONTH_MON      | Network Manger | MONTH_MON      | Month (3-letter code)                                           | JAN          |
| FLT_DATE       | Network Manger | DATE_FLT       | Date of flight                                                  | 05-Jan-2014  |
| ANSP_NAME      | PRU            | ENTITY_NAME    | Entity name                                                     | Belgocontrol |
| ATC_UNIT_NAME  | PRU            | ENTITY_TYPE    | Type of the entity to which the data relates (ANSP, FAB, WIDE)  | Brussels     |
| ATC_UNIT_TYPE  | PRU            | TYPE_CALC      | The computation of the flight count can be based on FIR or ANSP | ACC          |
| FLIGHT_TIME    | NM/PRU         | FLIGHT_TIME    | Flight hours                                                    | 1491.23      |
| INTER_TIME     | NM/PRU         | INTER_TIME     | Hours of interactions                                           | 131          |
| VERTICAL_INTER | NM/PRU         | VERTICAL_INTER | Hours of vertical interactions                                  | 51           |
| HORIZ_INTER    | NM/PRU         | HORIZ_INTER    | Hours of horizontal interactions                                | 73           |
| SPEED_INTER    | NM/PRU         | SPEED_INTER    | Hours of speed interactions                                     | 55           |
| MIN_FL         | Network Manger | MIN_FL         | Minimum flight level                                            | 100          |
| MAX_FL         | Network Manger | MAX_FL         | Maximum flight level                                            | 250          |


### Calculated Field(s)

These formulas describe what is provided by the pivot tables in the Excel spreadsheet

$$
\begin{align*}
\nabla \cdot E = \frac{\rho}{\varepsilon_0} \\
\nabla \cdot B = 0 \\
\nabla \times E = -\frac{\partial B}{\partial t} \\
\nabla \times B = \mu_0 \left( J + \varepsilon_0 \frac{\partial E}{\partial t} \right)
\end{align*}
$$

## References

{% bibliography --cited %}

