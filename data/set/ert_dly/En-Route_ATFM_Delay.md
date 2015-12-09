---
layout: default
title: En-Route ATFM Delay Dataset
permalink: /references/dataset/En-Route_ATFM_Delay.html
excerpt: Performance Review Unit MetaData Definitions.
keywords: metadata, dataset, performance, data, statistics, economics, air transport, flights, europe, cost efficiency
---
# {{ page.title }}

## Data description
The measure provides an indication of ATFM delays on the ground due to constraints en-route.

In Europe, when traffic demand is anticipated to exceed the available capacity in en route centres
or at airports, Air Traffic Control (ATC) units may request the local Flow Management Position (FMP)
to instigate an Air Traffic Flow Management (ATFM) measure, or regulation.
Aircraft expected to arrive during a period of congestion are given Air Traffic Flow Management
delay at their departure airport, under the authority of the Network Manager,
in order to regulate the flow of traffic into the constrained downstream en route sector or airport,
thus ensuring safety.
The resulting ATFM delays are calculated as the difference between the estimated take-off time
calculated from the filed flight plan including updates and the calculated take-off time allocated
by the central unit of ATFM.
The reason for the regulation is indicated by the responsible Flow Management Position (FMP).
The delay is attributed to the most constraining ATC unit.

The calculation of En-route ATFM delay is based on a well established and commonly accepted
algorithm and has been in use as a commonly agreed proxy for en-route capacity shortfalls since 1999.

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

| Column name  | Data source     | Label                           | Reason Group         | Column description                                                             | Example    |
|--------------|-----------------|---------------------------------|----------------------|--------------------------------------------------------------------------------|------------|
| YEAR         | Network Manager | YEAR                            |                      | Reference year                                                                 | 2015       |
| MONTH_NUM    | Network Manager | MONTH                           |                      | Month (numeric)                                                                | 3          |
| MONTH_MON    | Network Manager | MONTH_MON                       |                      | Month (3-letter code)                                                          | MAR        |
| FLT_DATE     | Network Manager | FLT_DATE                        |                      | Date of flight                                                                 | 17-MAR-2015|
| ENTITY_NAME  | PRU             | ENTITY_NAME                     |                      | Entity name                                                                    | FAB CE     |
| ENTITY_TYPE  | PRU             | ENTITY_TYPE                     |                      | Type of the entity to which the data relates (ANSP, FAB, AREA)                 | FAB (AUA)  |
| FLT_ERT_1    | Network Manager | Flights                         |                      | Total number of flights within the respective airspace                         | 3853       |
| DLY_ERT_1    | Network Manager | En-route ATFM delay             |                      | Minutes of en-route ATFM delay                                                 | 0          |
| DLY_ERT_A_1  | Network Manager | A - Accident/Incident           | ER Disruptions       | Minutes of en-route ATFM delay with delay code A - Accident/Incident           | 0          |
| DLY_ERT_C_1  | Network Manager | C - ATC Capacity                | ER Capacity (ATC)    | Minutes of en-route ATFM delay with delay code C - ATC Capacity                | 0          |
| DLY_ERT_D_1  | Network Manager | D - De-icing                    | ER Weather           | Minutes of en-route ATFM delay with delay code D - De-icing                    | 0          |
| DLY_ERT_E_1  | Network Manager | E - Equipment (non-ATC)         | ER Disruptions       | Minutes of en-route ATFM delay with delay code E - Equipment (non-ATC)         | 0          |
| DLY_ERT_G_1  | Network Manager | G - Aerodrome Capacity          | ER Capacity          | Minutes of en-route ATFM delay with delay code G - Aerodrome Capacity          | 0          |
| DLY_ERT_I_1  | Network Manager | I - Industrial Action (ATC)     | ER Disruptions (ATC) | Minutes of en-route ATFM delay with delay code I - Industrial Action (ATC)     | 0          |
| DLY_ERT_M_1  | Network Manager | M - Airspace Management         | ER Capacity          | Minutes of en-route ATFM delay with delay code M - Airspace Management         | 0          |
| DLY_ERT_N_1  | Network Manager | N - Industrial Action (non-ATC) | ER Disruptions       | Minutes of en-route ATFM delay with delay code N - Industrial Action (non-ATC) | 0          |
| DLY_ERT_O_1  | Network Manager | O - Other                       | ER Disruptions       | Minutes of en-route ATFM delay with delay code O - Other                       | 0          |
| DLY_ERT_P_1  | Network Manager | P - Special Event               | ER Events            | Minutes of en-route ATFM delay with delay code P - Special Event               | 0          |
| DLY_ERT_R_1  | Network Manager | R - ATC Routeing                | ER Capacity          | Minutes of en-route ATFM delay with delay code R - ATC Routeing                | 0          |
| DLY_ERT_S_1  | Network Manager | S - ATC Staffing                | ER Staffing (ATC)    | Minutes of en-route ATFM delay with delay code S - ATC Staffing                | 0          |
| DLY_ERT_T_1  | Network Manager | T - Equipment (ATC)             | ER Disruptions (ATC) | Minutes of en-route ATFM delay with delay code T - Equipment (ATC)             | 0          |
| DLY_ERT_V_1  | Network Manager | V - Environmental Issues        | ER Capacity          | Minutes of en-route ATFM delay with delay code V - Environmental Issues        | 0          |
| DLY_ERT_W_1  | Network Manager | W - Weather                     | ER Weather           | Minutes of en-route ATFM delay with delay code W - Weather                     | 0          |
| DLY_ERT_NA_1 | Network Manager | NA - Not specified              | ER Disruptions       | Minutes of en-route ATFM delay with delay code NA - Not specified              | 0          |
