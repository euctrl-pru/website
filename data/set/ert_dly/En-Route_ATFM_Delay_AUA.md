---
layout: default
title: En-Route ATFM Delay Dataset (AUA)
permalink: /references/dataset/En-Route_ATFM_Delay_AUA.html
excerpt: Performance Review Unit MetaData Definitions.
keywords: metadata, dataset, performance, data, statistics, economics, air transport, flights, europe, cost efficiency
---
# {{ page.title }}

## Data description

The [en-route ATFM delay](/references/definition/en-route_atfm_delay.html)
provides an indication of ATFM delays on the ground due to constraints en-route.

In Europe, when traffic demand is anticipated to exceed the available capacity
in en route centres or at airports, Air Traffic Control
([ATC](/references/definition/atc.html)) units may request the local Flow
Management Position ([FMP](/references/definition/fmp.html)) to instigate an Air
Traffic Flow Management (ATFM) measure, or
[regulation](/references/definition/regulation.html).
Aircraft expected to arrive during a period of congestion are given ATFM delay
at their departure airport, under the authority of the
Network Manager, in order to regulate the flow of traffic into the constrained
downstream en route sector or airport, thus ensuring safety.

The calculation of En-route ATFM delay is based on a well established and
commonly accepted algorithm and has been in use as a commonly agreed proxy for
en-route capacity shortfalls since 1999.

## ATFM delay computation

The ATFM delays are calculated as the difference between the estimated
take-off time calculated from the filed flight plan including updates and the
calculated take-off time allocated by the central unit of ATFM.

The reason for the regulation is indicated by the responsible Flow Management
Position (FMP).

The delay is attributed to the most constraining ATC unit.

*Please note that the delays caused by READY to Depart (REA) messages and ATFM slot 
extensions were included in ATFM delays until NM release 20.0. 
As of 4 April 2016, delays due to REA messages and slot extensions are not included 
any longer which reduces the amount of computed ATFM delay.*  


## Computation of traffic

The number of flights is based on ANSP boundaries (which are not necessarily 
coincidental with the FIR or geographical boundaries of the State).

## ANSP definitions

The ANSP level information is based on an aggregation of Air Traffic control 
Unit Airspace (AUA). A list for each ANSP will be provided in due course. 


## Column naming and types

| Column name      | Data source     | Label                           | Reason Group         | Column description                                                             | Example    |
|------------------|-----------------|---------------------------------|----------------------|--------------------------------------------------------------------------------|------------|
| YEAR             | Network Manager | YEAR                            |                      | Reference year                                                                 | 2015       |
| MONTH_NUM        | Network Manager | MONTH                           |                      | Month (numeric)                                                                | 3          |
| MONTH_MON        | Network Manager | MONTH_MON                       |                      | Month (3-letter code)                                                          | MAR        |
| FLT_DATE         | Network Manager | FLT_DATE                        |                      | Date of flight                                                                 | 17/03/2015 |
| ENTITY_NAME      | PRU             | ENTITY_NAME                     |                      | Entity name                                                                    | FAB CE     |
| ENTITY_TYPE      | PRU             | ENTITY_TYPE                     |                      | Type of the entity to which the data relates (ANSP, FAB, AREA)                 | FAB (AUA)  |
| FLT_ERT_1        | Network Manager | Flights                         |                      | Total number of flights within the respective airspace                         | 3853       |
| DLY_ERT_1        | Network Manager | En-route ATFM delay             |                      | Minutes of en-route ATFM delay                                                 | 0          |
| DLY_ERT_A_1      | Network Manager | A - Accident/Incident           | ER Disruptions       | Minutes of en-route ATFM delay with delay code A - Accident/Incident           | 0          |
| DLY_ERT_C_1      | Network Manager | C - ATC Capacity                | ER Capacity (ATC)    | Minutes of en-route ATFM delay with delay code C - ATC Capacity                | 0          |
| DLY_ERT_D_1      | Network Manager | D - De-icing                    | ER Weather           | Minutes of en-route ATFM delay with delay code D - De-icing                    | 0          |
| DLY_ERT_E_1      | Network Manager | E - Equipment (non-ATC)         | ER Disruptions       | Minutes of en-route ATFM delay with delay code E - Equipment (non-ATC)         | 0          |
| DLY_ERT_G_1      | Network Manager | G - Aerodrome Capacity          | ER Capacity          | Minutes of en-route ATFM delay with delay code G - Aerodrome Capacity          | 0          |
| DLY_ERT_I_1      | Network Manager | I - Industrial Action (ATC)     | ER Disruptions (ATC) | Minutes of en-route ATFM delay with delay code I - Industrial Action (ATC)     | 0          |
| DLY_ERT_M_1      | Network Manager | M - Airspace Management         | ER Capacity          | Minutes of en-route ATFM delay with delay code M - Airspace Management         | 0          |
| DLY_ERT_N_1      | Network Manager | N - Industrial Action (non-ATC) | ER Disruptions       | Minutes of en-route ATFM delay with delay code N - Industrial Action (non-ATC) | 0          |
| DLY_ERT_O_1      | Network Manager | O - Other                       | ER Disruptions       | Minutes of en-route ATFM delay with delay code O - Other                       | 0          |
| DLY_ERT_P_1      | Network Manager | P - Special Event               | ER Events            | Minutes of en-route ATFM delay with delay code P - Special Event               | 0          |
| DLY_ERT_R_1      | Network Manager | R - ATC Routeing                | ER Capacity          | Minutes of en-route ATFM delay with delay code R - ATC Routeing                | 0          |
| DLY_ERT_S_1      | Network Manager | S - ATC Staffing                | ER Staffing (ATC)    | Minutes of en-route ATFM delay with delay code S - ATC Staffing                | 0          |
| DLY_ERT_T_1      | Network Manager | T - Equipment (ATC)             | ER Disruptions (ATC) | Minutes of en-route ATFM delay with delay code T - Equipment (ATC)             | 0          |
| DLY_ERT_V_1      | Network Manager | V - Environmental Issues        | ER Capacity          | Minutes of en-route ATFM delay with delay code V - Environmental Issues        | 0          |
| DLY_ERT_W_1      | Network Manager | W - Weather                     | ER Weather           | Minutes of en-route ATFM delay with delay code W - Weather                     | 0          |
| DLY_ERT_NA_1     | Network Manager | NA - Not specified              | ER Disruptions       | Minutes of en-route ATFM delay with delay code NA - Not specified              | 0          |
| FLT_ERT_1_DLY    | Network Manager | FLT_ERT_1_DLY                   |                      | Number of en-route ATFM delayed flights                                        | 0          |
| FLT_ERT_1_DLY_15 | Network Manager | FLT_ERT_1_DLY_15                |                      | Number of en-route ATFM delayed flights (>15 min.)                             | 0          |

## ANSP Composition

<table>
<thead>
<tr>
<th>ANSP_NAME</th>
<th>PRU_ATC_TYPE</th>
<th>AUA_CODE</th>
<th>AUA_NAME</th>
</tr>
</thead>
<tbody>
{% for item in site.data.ansp_composition %}
<tr>
<td>{{ item.ANSP_NAME }}</td>
<td>{{ item.PRU_ATC_TYPE }}</td>
<td>{{ item.AUA_CODE }}</td>
<td>{{ item.AUA_NAME }}</td>
</tr>
{% endfor %}
</tbody>
</table>