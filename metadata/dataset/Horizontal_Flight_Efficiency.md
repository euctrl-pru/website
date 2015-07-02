---
layout: default
title: Horizontal Flight Efficiency Dataset
excerpt: Performance Review Unit MetaData Definitions.
keywords: metadata, dataset, performance, data, statistics, economics, air transport, flights, europe, cost efficiency
---
# {{ page.title }}

## Data description
Horizontal en-route flight efficiency compares the length of actual or planned flight trajectories
to the corresponding “achieved” distance.

The achieved distance apportions the Great Circle Distance (GCD) between two points within
the European airspace (reference area).
If the origin/ destination airport is located outside of European airspace, the entry/exit point
into the reference area is used for the calculation.

The planned trajectory is derived from the flight plans submitted by airspace users to the Network Manager.
The actual flown trajectory is based on processed radar track data (Correlated Position Reports)
submitted by ANSPs to the EUROCONTROL Enhanced Tactical Flow Management System (ETFMS).

The methodology is fully consistent with the SES Performance Scheme.

## Column naming and types

| Column name      | Data source     | Label       |  Description                                                                                       | Example        |
|------------------|-----------------|-------------|----------------------------------------------------------------------------------------------------|----------------|
| YEAR             | Network Manager | YEAR        | Reference year                                                                                     | 2015           |
| MONTH_NUM        | Network Manager |             | Month (numeric)                                                                                    | 1              |
| MONTH_MON        | Network Manager | MONTH_MON   | Month (3-letter code)                                                                              | JAN            |
| ENTRY_DATE       | Network Manager |             | The entry date considered                                                                          | 31-Jan-15      |
| ENTITY_NAME      | Network Manager | ENTITY_NAME | Name of the entity to with the data refers                                                         | UK-Ireland FAB |
| ENTITY_TYPE      | Network Manager |             | Type of the entity                                                                                 | FAB            |
| MODEL_TYPE       | Network Manager | MODEL_TYPE  | The type of trajectory used for the calculation (CPF=actual, FTFM=flight plan)                     | FTFM           |
| DIST_FLOWN_KM    | Network Manager |             | Sum of flown distances in kilometre                                                                | 1208007        |
| DIST_ACHIEVED_KM | Network Manager |             | Sum of achieved distances in kilometre                                                             | 1148839        |
| T10_RUN_12M      | Network Manager | T10_RUN_12M | ‘B’ (‘W’) if the day is one of the ten best (worst) days for the entity in the previous ten months | B              |
| T10_YYYY         | Network Manager | T10_YYYY    | ‘B’ (‘W’) if the day is one of the ten best (worst) days for the entity in the calendar year       | B              |


### Calculated Field(s)
The indicator is calculated as the ratio of the two sums (length of trajectories and achieved distances),
over all flights considered:

$$
{HFE}_j = ( \frac{\sum_{f,p} L_{fjp}}{\sum_{f,p} H_{fjp}} - 1 ) %
$$

where $L$ is the length of the trajectory and $H$ is the achieved distance;
the index $f$ is the flight, $j$ is the airspace and $p$ is the portion considered.

From the table above $L$ is $DIST\_FLOWN\_KM\_1$, while $H$ is $DIST\_ACHIEVED\_KM\_1$.