---
layout: default
title: Horizontal Flight Efficiency Dataset
excerpt: Performance Review Unit MetaData Definitions.
keywords: metadata, dataset, performance, data, statistics, economics, air transport, flights, europe, cost efficiency
---
# {{ page.title }}

period: [2014/01, 2015/04]

~51000 rows (daily values)


## Column naming and types

| Column name        | Data source     | Label       | Column description                                                        | Example   |
|--------------------|-----------------|-------------|---------------------------------------------------------------------------|-----------|
| YEAR               | Network Manager | YEAR        | Reference year                                                            | 2015      |
| MONTH_NUM          | Network Manager |             | Month (numeric)                                                           | 1         |
| MONTH_MON          | Network Manager | MONTH_MON   | Month (3-letter code)                                                     | JAN       |
| FLT_DATE           | Network Manager |             | The entry date considered                                                 | 01-Jan-15 |
| ENTITY_NAME        | Network Manager | ENTITY_NAME | Name of the entity to with the data refers                                | FABEC     |
| ENTITY_TYPE        | Network Manager |             | Type of the entity                                                        | FAB       |
| MODEL_TYPE         | Network Manager | MODEL_TYPE  | The type of trajectory used for calculation (CPF=actual, FTFM=flight plan)| CPF       |
| FLT_1              | Network Manager |             | Number of trajectories included in computation                            | 46 806    |
| DIST_FLOWN_KM_1    | Network Manager |             | Sum of flown distances in kilometre (from start point to end point)       | 8 098 978 |
| DIST_ACHIEVED_KM_1 | Network Manager |             | Sum of achieved distances in kilometre (from start point and end point)   | 7 982 343 |
| T10_RUN_12M        | Network Manager |             |                                                                           | B         |
| T10_YYYY           | Network Manager |             |                                                                           | W         |



### Calculated Field(s)

$$
KPI	=F_{km} / A_{km} -1
$$

where $F = DIST_FLOWN_KM_1$ and $A = DIST_ACHIEVED_KM_1$.
