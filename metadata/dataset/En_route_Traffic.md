---
layout: default
title: En-route IFR Flights Dataset
excerpt: Performance Review Unit MetaData Definitions.
keywords: metadata, dataset, performance, data, statistics, economics, air transport, flights, europe, cost efficiency
---
# {{ page.title }}

## Data description
<p>The data provides the number of IFR flights within the respective airspace.</p>

## Column naming and types

| Column name | Data source    | Label       | Column description                                              | Example    |
|-------------|----------------|-------------|-----------------------------------------------------------------|------------|
| YEAR        | Network Manger | YEAR        | Reference year                                                  | 2015       |
| MONTH_NUM   | Network Manger | MONTH       | Month (numeric)                                                 | 3          |
| MONTH_MON   | Network Manger | MONTH_MON   | Month (3-letter code)                                           | MAR        |
| FLT_DATE    | Network Manger | FLT_DATE    | Date of flight                                                  | 17/03/2015 |
| ENTITY_NAME | PRU            | ENTITY_NAME | Entity name                                                     | FAB CE     |
| ENTITY_TYPE | PRU            | ENTITY_TYPE | Type of the entity to which the data relates (ANSP, FAB, WIDE)  | FAB        |
| CALC_TYPE   | PRU            | CALC_TYPE   | The computation of the flight count can be based on FIR or ANSP | ANSP       |
| FLT_ERT_1   | Network Manger | IFR flights | Total IFR flights within the respective airspace                | 3853       |

