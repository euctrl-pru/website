---
layout: default
title: Horizontal Flight Efficiency Dataset
permalink: /references/dataset/Horizontal_Flight_Efficiency.html
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

## FAB definitions

The FAB level information is based on an aggregation of Flight Information Regions (FIRs) (ENTITY_TYPE = FAB (FIR)).

| FAB Name         | FIRs included                                                                                                                                  |
|------------------|------------------------------------------------------------------------------------------------------------------------------------------------|
| Baltic FAB       | EPWWFIR, EYVLFIR, EYVLUIR                                                                                                                      |
| BLUE MED FAB     | LCCCFIR, LCCCUIR, LGGGFIR, LGGGUIR, LIBBFIR, LIBBUIR, LIMMFIR, LIMMUIR, LIRRFIR, LIRRUIR, LMMMFIR, LMMMUIR                                     |
| DANUBE FAB       | LBSRFIR, LRBBFIR                                                                                                                               |
| DK-SE FAB        | EKDKFIR, ESAAFIR                                                                                                                               |
| FABEC            | EBBUFIR, EBURUIR, EDGGFIR, EDMMFIR, EDUUUIR, EDVVUIR, EDWWFIR, EHAAFIR, LFBBFIR, LFEEFIR, LFFFFIR, LFFFUIR, LFMMFIR, LFRRFIR, LSASFIR, LSASUIR |
| FAB CE           | LDZOFIR, LHCCFIR, LJLAFIR, LKAAFIR, LOVVFIR, LQSBFIR, LQSBUIR, LZBBFIR                                                                         |
| FAB CE (SES RP1) | LHCCFIR, LJLAFIR, LKAAFIR, LOVVFIR, LZBBFIR                                                                                                    |
| FAB CE (SES RP2) | LDZOFIR, LHCCFIR, LJLAFIR, LKAAFIR, LOVVFIR, LZBBFIR                                                                                           |
| NEFAB            | EETTFIR, EFINFIR, EFINUIR, ENOBFIR, ENORFIR, EVRRFIR                                                                                           |
| SW FAB           | GCCCFIR, GCCCUIR, LECBFIR, LECBUIR, LECMFIR, LECMUIR, LPPCFIR                                                                                  |
| UK-Ireland FAB   | EGPXFIR, EGPXUIR, EGTTFIR, EGTTUIR, EISNFIR, EISNUIR                                                                                           |


## Column naming and types

| Column name      | Data source     | Label            | Column description                                                                                | Example   |
|------------------|-----------------|------------------|---------------------------------------------------------------------------------------------------|-----------|
| YEAR             | Network Manager | YEAR             | Reference year                                                                                    | 2014      |
| MONTH_NUM        | Network Manager | MONTH_NUM        | Month (numeric)                                                                                   | 9         |
| MONTH_MON        | Network Manager | MONTH_MON        | Month (3-letter code)                                                                             | SEP       |
| ENTRY_DATE       | Network Manager | ENTRY_DATE       | The entry date considered                                                                         | 06-Sep-14 |
| ENTITY_NAME      | Network Manager | ENTITY_NAME      | Name of the entity to with the data refers                                                        | FABEC     |
| ENTITY_TYPE      | Network Manager | ENTITY_TYPE      | Type of the entity                                                                                | FAB (FIR) |
| MODEL_TYPE       | Network Manager | MODEL_TYPE       | The type of trajectory used for the calculation (CPF=actual, FTFM=flight plan)                    | FTFM      |
| DIST_FLOWN_KM    | Network Manager | DIST_FLOWN_KM    | Sum of flown distances in kilometre                                                               | 8699586   |
| DIST_DIRECT_KM   | Network Manager | DIST_DIRECT_KM   | Sum of direct flown distances in kilometre                                                        | 8405033   |
| DIST_ACHIEVED_KM | Network Manager | DIST_ACHIEVED_KM | Sum of achieved distances in kilometre                                                            | 8255220   |
| T10_RUN_12M      | Network Manager | T10_RUN_12M      | ‘B’ (‘W’) if the day is one of the ten best (worst) days for the entity in the previous 12 months | B         |
| END_DATE         | Network Manager | END_DATE         | End date of the running 12 month  (T10_RUN_12M)                                                   | 42216     |
| T10_YYYY         | Network Manager | T10_YYYY         | ‘B’ (‘W’) if the day is one of the best (worst) days for the entity in the calendar year (the number of days increases proportionally to reach 10 at the end of the year) | B         |


### Calculated Field(s)
The indicator is calculated as the ratio of the two sums (length of trajectories and achieved distances),
over all flights considered:

$$
{HFE}_j = ( \frac{\sum_{f,p} L_{fjp}}{\sum_{f,p} H_{fjp}} - 1 ) %
$$

where $L$ is the length of the trajectory and $H$ is the achieved distance;
the index $f$ is the flight, $j$ is the airspace and $p$ is the portion considered.

From the table above $L$ is $DIST\_FLOWN\_KM$, while $H$ is $DIST\_ACHIEVED\_KM$.