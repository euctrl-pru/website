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

| Column name        | Example   | Description                                                                                         |                    |
|--------------------|-----------|-----------------------------------------------------------------------------------------------------|
| TYPE_MODEL         | CPF       | "The type of trajectory used for the calculation (CPF=actual;                  | FTFM=flight plan)" |
| ENTITY_NAME        | FABEC     | Name of the entity to with the data refers                                                          |                    |
| YEAR               | 2015      | Reference year                                                                                      |                    |
| MONTH_NUM          | 1         | Month (numeric)                                                                                     |                    |
| MONTH_MON          | JAN       | Month (3-letter code)                                                                               |                    |
| DATE_FLT           | 01-Jan-15 | The entry date considered                                                                           |                    |
| FLT_1              | 46.806    | Number of trajectories included in computation (source:NM)                                          |                    |
| DIST_FLOWN_KM_1    | 8 098 978 | Sum of flown distances in kilometre (from start point to end point)                                 |                    |
| DIST_ACHIEVED_KM_1 | 7 982 343 | Sum of achieved distances in kilometre (from start point and end point)                             |                    |
| T10_WORST_last12M  | Y         | For each entity the 10 WORST days over the past 12 months prior to the period end are marked with Y |                    |
| T10_BEST_last12M   | N         | For each entity the 10 BEST days over the past 12 months prior to the period end are marked with Y  |                    |
| T10_WORST_2014     | Y         | For each entity the 10 WORST days in 2014 are marked with Y                                         |                    |
| T10_BEST_2014      | N         | For each entity the 10 BEST days in 2014 are marked with Y                                          |                    |
| T10_WORST_2015     | Y         | For each entity the 10 WORST days in 2015 are marked with Y                                         |                    |
| T10_BEST_2015      | N         | For each entity the 10 BEST days in 2015 are marked with Y                                          |                    |



### Calculated Field

$$
KPI	=F_{km} / A_{km} -1
$$

where $F = flown$ and $A = achieved$.



## SQL

```sql
SELECT 
             model_type as TYPE_MODEL,
             mes_area as ENTITY_NAME,
             To_CHAR (entry_date, 'YYYY') YEAR,            
             EXTRACT (MONTH FROM entry_date) MONTH_NUM,
             TO_CHAR (entry_date, 'MON') MONTH_MON,
             entry_date as DATE_,FLT
             flights as TRAJECTORY_1
             flown_km as FLOWN_KM_1,
             achieved_km as ACHIEVED_KM_1

       FROM PRUTEST.HFE_DAILY
       WHERE mes_area NOT LIKE '===%' and
             mes_area Not like 'Morocco' and
             To_CHAR (entry_date, 'YYYY') >=2014 and
             entry_date <'01-MAY-2015'
             order by 6,1,2

```
