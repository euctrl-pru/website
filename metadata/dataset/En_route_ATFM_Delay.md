---
layout: default
title: En-route ATFM Delay Dataset
excerpt: Performance Review Unit MetaData Definitions.
keywords: metadata, dataset, performance, data, statistics, economics, air transport, flights, europe, cost efficiency
---
# {{ page.title }}

## Data description
<p>The measure provides an indication of ATFM delays on the ground due to constraints en-route.</p>

<p>In Europe, when traffic demand is anticipated to exceed the available capacity in en route centres or at airports, Air Traffic Control (ATC) units may request the local Flow Management Position (FMP) to instigate an Air Traffic Flow Management (ATFM) measure, or regulation. Aircraft expected to arrive during a period of congestion are given Air Traffic Flow Management delay at their departure airport, under the authority of the Network Manager, in order to regulate the flow of traffic into the constrained downstream en route sector or airport, thus ensuring safety. The resulting ATFM delays are calculated as the difference between the estimated take-off time calculated from the filed flight plan including updates and the calculated take-off time allocated by the central unit of ATFM. The reason for the regulation is indicated by the responsible Flow Management Position (FMP). The delay is attributed to the most constraining ATC unit.</p>

<p>The calculation of En-route ATFM delay is based on a well established and commonly accepted algorithm and has been in use as a commonly agreed proxy for en-route capacity shortfalls since 1999.
</p>

## Column naming and types

| Column name  | Data source    | Label                           | Column description                                                             | Example    |
|--------------|----------------|---------------------------------|--------------------------------------------------------------------------------|------------|
| YEAR         | Network Manger | YEAR                            | Reference year                                                                 | 2015       |
| MONTH_NUM    | Network Manger | MONTH                           | Month (numeric)                                                                | 3          |
| MONTH_MON    | Network Manger | MONTH_MON                       | Month (3-letter code)                                                          | MAR        |
| FLT_DATE     | Network Manger | FLT_DATE                        | Date of flight                                                                 | 17/03/2015 |
| ENTITY_NAME  | PRU            | ENTITY_NAME                     | Entity name                                                                    | FAB CE     |
| ENTITY_TYPE  | PRU            | ENTITY_TYPE                     | Type of the entity to which the data relates (ANSP, FAB, WIDE)                 | FAB        |
| CALC_TYPE    | PRU            | CALC_TYPE                       | The computation of the flight count can be based on FIR or ANSP                | ANSP       |
| FLT_ERT_1    | Network Manger | IFR flights                     | Total IFR flights within the respective airspace                               | 3853       |
| DLY_ERT_1    | Network Manger | En-route ATFM delay             | Minutes of en-route ATFM delay                                                 | 0          |
| DLY_ERT_A_1  | Network Manger | A - Accident/Incident           | Minutes of en-route ATFM delay with delay code A - Accident/Incident           | 0          |
| DLY_ERT_C_1  | Network Manger | C - ATC Capacity                | Minutes of en-route ATFM delay with delay code C - ATC Capacity                | 0          |
| DLY_ERT_D_1  | Network Manger | D - De-icing                    | Minutes of en-route ATFM delay with delay code D - De-icing                    | 0          |
| DLY_ERT_E_1  | Network Manger | E - Equipment (non-ATC)         | Minutes of en-route ATFM delay with delay code E - Equipment (non-ATC)         | 0          |
| DLY_ERT_G_1  | Network Manger | G - Aerodrome Capacity          | Minutes of en-route ATFM delay with delay code G - Aerodrome Capacity          | 0          |
| DLY_ERT_I_1  | Network Manger | I - Industrial Action (ATC)     | Minutes of en-route ATFM delay with delay code I - Industrial Action (ATC)     | 0          |
| DLY_ERT_M_1  | Network Manger | M - Airspace Management         | Minutes of en-route ATFM delay with delay code M - Airspace Management         | 0          |
| DLY_ERT_N_1  | Network Manger | N - Industrial Action (non-ATC) | Minutes of en-route ATFM delay with delay code N - Industrial Action (non-ATC) | 0          |
| DLY_ERT_O_1  | Network Manger | O - Other                       | Minutes of en-route ATFM delay with delay code O - Other                       | 0          |
| DLY_ERT_P_1  | Network Manger | P - Special Event               | Minutes of en-route ATFM delay with delay code P - Special Event               | 0          |
| DLY_ERT_R_1  | Network Manger | R - ATC Routeing                | Minutes of en-route ATFM delay with delay code R - ATC Routeing                | 0          |
| DLY_ERT_S_1  | Network Manger | S - ATC Staffing                | Minutes of en-route ATFM delay with delay code S - ATC Staffing                | 0          |
| DLY_ERT_T_1  | Network Manger | T - Equipment (ATC)             | Minutes of en-route ATFM delay with delay code T - Equipment (ATC)             | 0          |
| DLY_ERT_V_1  | Network Manger | V - Environmental Issues        | Minutes of en-route ATFM delay with delay code V - Environmental Issues        | 0          |
| DLY_ERT_W_1  | Network Manger | W - Weather                     | Minutes of en-route ATFM delay with delay code W - Weather                     | 0          |
| DLY_ERT_NA_1 | Network Manger | NA - Not specified              | Minutes of en-route ATFM delay with delay code NA - Not specified              | 0          |
