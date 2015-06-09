---
layout: default
title: ACE Monthly Dataset
excerpt: Performance Review Unit MetaData Definitions.
keywords: metadata, dataset, performance, data, statistics, economics, air transport, flights, europe, cost efficiency
---
# {{ page.title }}

period: [2014/01, 2015/04]

ANSP rows: 624.

Airport rows: ~9000.

Unit rows: ~6000

## ANSP

### Column naming and types

| Column name      | Example  | Pivot Label                     | Description                                                                                 |
|------------------|----------|---------------------------------|---------------------------------------------------------------------------------------------|
| YEAR             | 2014     | YEAR                            | Reference year                                                                              |
| MONTH_NUM        | 1        | MONTH                           | Month (numeric)                                                                             |
| ANSP_NAME        | DSNA     | ANSP_NAME                       | Name of the Air Navigation Service Provider (ANSP)                                          |
| FLT_1            | 189824   | IFR flights                     | Number of IFR flights (source:NM)                                                           |
| DIST_KM_1        | 99055061 |                                 | Distance in kilometer (source:NM)                                                           |
| DUR_MIN_1        | 8511400  |                                 | Duration in minutes (source:NM)                                                             |
| FLT_DLY_1        | 4360     |                                 | IFR flights with ATFM delay (source:NM)                                                     |
| FLT_DLY_15_1     | 2565     |                                 | IFR flights with ATFM delay >15 min. (source:NM)                                            |
| DLY_1            | 105137   | ATFM delay                      | Minutes of ATFM delay (source: NM)                                                          |
| DLY_15_1         | 89409    | ATFM delay > 15 min             | Minutes of ATFM delay >15 minutes (source: NM)                                              |
| FLT_DLY_APT_1    | 1014     |                                 | IFR flights with airport ATFM delay (source:NM)                                             |
| FLT_DLY_APT_15_1 | 643      |                                 | IFR flights with airport ATFM delay >15 min. (source:NM)                                    |
| DLY_APT_1        | 25611    |                                 | Minutes of airport ATFM delay (source: NM)                                                  |
| DLY_APT_15_1     | 22362    |                                 | Minutes of airport ATFM delay >15 minutes (source: NM)                                      |
| FLT_DLY_ERT_1    | 3346     |                                 | IFR flights with en-route ATFM delay (source:NM)                                            |
| FLT_DLY_ERT_15_1 | 1922     |                                 | IFR flights with en-route ATFM delay >15 min. (source:NM)                                   |
| DLY_ERT_1        | 79526    | En-route ATFM delay             | Minutes of en-route ATFM delay (source: NM)                                                 |
| DLY_ERT_15_1     | 67047    | En-route ATFM delay > 15 min    | Minutes of en-route ATFM delay >15 minutes (source: NM)                                     |
| DLY_ERT_A_1      | 0        | A - Accident/Incident           | Minutes of en-route ATFM delay with delay code A - Accident/Incident (source: NM)           |
| DLY_ERT_C_1      | 22081    | C - ATC Capacity                | Minutes of en-route ATFM delay with delay code C - ATC Capacity (source: NM)                |
| DLY_ERT_D_1      | 0        | D - De-icing                    | Minutes of en-route ATFM delay with delay code D - De-icing (source: NM)                    |
| DLY_ERT_E_1      | 0        | E - Equipment (non-ATC)         | Minutes of en-route ATFM delay with delay code E - Equipment (non-ATC) (source: NM)         |
| DLY_ERT_G_1      | 1065     | G - Aerodrome Capacity          | Minutes of en-route ATFM delay with delay code G - Aerodrome Capacity (source: NM)          |
| DLY_ERT_I_1      | 50843    | I - Industrial Action (ATC)     | Minutes of en-route ATFM delay with delay code I - Industrial Action (ATC) (source: NM)     |
| DLY_ERT_M_1      | 157      | M - Airspace Management         | Minutes of en-route ATFM delay with delay code M - Airspace Management (source: NM)         |
| DLY_ERT_N_1      | 0        | N - Industrial Action (non-ATC) | Minutes of en-route ATFM delay with delay code N - Industrial Action (non-ATC) (source: NM) |
| DLY_ERT_O_1      | 153      | O - Other                       | Minutes of en-route ATFM delay with delay code O - Other (source: NM)                       |
| DLY_ERT_P_1      | 0        | P - Special Event               | Minutes of en-route ATFM delay with delay code P - Special Event (source: NM)               |
| DLY_ERT_R_1      | 0        | R - ATC Routeing                | Minutes of en-route ATFM delay with delay code R - ATC Routeing (source: NM)                |
| DLY_ERT_S_1      | 2220     | S - ATC Staffing                | Minutes of en-route ATFM delay with delay code S - ATC Staffing (source: NM)                |
| DLY_ERT_T_1      | 2925     | T - Equipment (ATC)             | Minutes of en-route ATFM delay with delay code T - Equipment (ATC) (source: NM)             |
| DLY_ERT_V_1      | 0        | V - Environmental Issues        | Minutes of en-route ATFM delay with delay code V - Environmental Issues (source: NM)        |
| DLY_ERT_W_1      | 82       | W - Weather                     | Minutes of en-route ATFM delay with delay code W - Weather (source: NM)                     |
| DLY_ERT_NA_1     | 0        | NA - Not specified              | Minutes of en-route ATFM delay with delay code NA - Not specified (source: NM)              |

: colums for ACE ANSP dataset



### SQL

```sql
Select 
  year as Year
, month as Month_NUM
, ACE_NAME as ANSP_NAME
, TTF_FLT as FLT_1
, SYN_DISTANCE_KM as DIST_KM_1
,SYN_OCC_DURATION_MIN as DUR_MIN_1
,SYN_TDF as DLY_FLT_1
,SYN_TDF_15 as DLY_FLT_15_1
,SYN_TDM as DLY_1
,SYN_TDM_15 as DLY_15_1
,SYN_ARP_TDF as APT_DLY_FLT_1
,SYN_ARP_TDF_15 as APT_DLY_FLT_15_1
,SYN_ARP_TDM as APT_DLY_1
,SYN_ARP_TDM_15 as APT_DLY_15_1
,SYN_ERT_TDF as ERT_DLY_FLT_1
,SYN_ERT_TDF_15 as ERT_DLY_FLT_15_1
,SYN_ERT_TDM as ERT_DLY_1
,SYN_ERT_TDM_15 as ERT_DLY_15_1
,SYN_ERT_TDM_A as ERT_DLY_A_1
,SYN_ERT_TDM_C as ERT_DLY_C_1
,SYN_ERT_TDM_D as ERT_DLY_D_1
,SYN_ERT_TDM_E as ERT_DLY_E_1
,SYN_ERT_TDM_G as ERT_DLY_G_1
,SYN_ERT_TDM_I as ERT_DLY_I_1
,SYN_ERT_TDM_M as ERT_DLY_M_1
,SYN_ERT_TDM_N as ERT_DLY_N_1
,SYN_ERT_TDM_O as ERT_DLY_O_1
,SYN_ERT_TDM_P as ERT_DLY_P_1
,SYN_ERT_TDM_R as ERT_DLY_R_1
,SYN_ERT_TDM_S as ERT_DLY_S_1
,SYN_ERT_TDM_T as ERT_DLY_T_1
,SYN_ERT_TDM_V as ERT_DLY_V_1
,SYN_ERT_TDM_W as ERT_DLY_W_1
,SYN_ERT_TDM_NA as ERT_DLY_NA_1


from PRUDEV.V_ACE_MM_ANSP_OPERAT_MIX
Where 

 --TYPE='STAT_AUA' and 
 year >=2014

order by 1,2
```



## Airport

### Column naming and types

| Column name     | Example            | Pivot Label                   | Description                                                      |
|-----------------|--------------------|-------------------------------|------------------------------------------------------------------|
| YEAR            | 2014               | YEAR                          | Reference year                                                   |
| MONTH_NUM       | 1                  | MONTH                         | Month (numeric)                                                  |
| ANSP_NAME       | PANSA              | ANSP_NAME                     | Name of the Air Navigation Service Provider (ANSP)               |
| APT_NAME        | Leszno/Strzyzewice | APT_NAME                      | Airport name                                                     |
| APT_ICAO        | EPLS               | APT_ICAO                      | ICAO 4-letter airport designator                                 |
| APT_ICAO_2ND    | EPLS               | APT_ICAO_2ND                  | ICAO 4-letter airport designator (Airport Secondary ICAO Code)   |
| TYP_APT_SERVICE | AFIS               | TYP_APT_SERVICE               | Type of service provided at the respective aerodrome (TWR, AFIS) |
| FLT_ARR_1       | 2                  |                               | Number of IFR arrivals (source:NM)                               |
| FLT_DEP_1       | 2                  |                               | Number of IFR departures (source:NM)                             |
| FLT_TOT_1       | 4                  | Airport movements (arr + dep) | Number total IFR movements (source:NM)                           |


### SQL

```sql
Select 
  year as YEAR
, month as Month_NUM
, ANSP_NAME as ANSP_NAME
, PRU_AIRPORT_NAME as APT_NAME
, PRIMARY_ICAO_CODE as APT_ICAO
, AIRPORT_CODE as APT_ICAO_2nd
, TYPE_OF_SERVICE as TYP_APT_SERVICE
, TTF_ARR as FLT_ARR_1
, TTF_DEP as FLT_DEP_1
, TTF_ARR + TTF_DEP as FLT_TOT_1

from PRUDEV.V_ACE_MM_AIRPORT_OPERAT_DATA a
Where year >=2014

order by 1,2
```


## Unit

### Column naming and types

| Column name      | Example        | Pivot Label                     | Description                                                                                 |
|------------------|----------------|---------------------------------|---------------------------------------------------------------------------------------------|
| YEAR             | 2014           | YEAR                            | Reference year                                                                              |
| MONTH_NUM        | 1              | MONTH                           | Month (numeric)                                                                             |
| ANSP_NAME        | Austro Control | ANSP_NAME                       | Name of the Air Navigation Service Provider (ANSP)                                          |
| ENTITY_NAME      | Wien           | ENTITY_NAME                     | ATC Unit Airspace (AUA) name                                                                |
| ENTITY_TYPE      | ACC            | ENTITY_TYPE                     | Type of entity for which the information is provided                                        |
| ENTITY_CODE      | LOVVACC        | ENTITY_CODE                     | Code of the entity for which the information is provided                                    |
| FLT_1            | 45612          | IFR flights                     | Number of IFR flights (source:NM)                                                           |
| DIST_KM_1        | 10012600,94    |                                 | Distance in kilometer (source:NM)                                                           |
| DUR_MIN_1        | 772729         |                                 | Duration in minutes (source:NM)                                                             |
| FLT_DLY_1        | 556            |                                 | IFR flights with ATFM delay (source:NM)                                                     |
| FLT_DLY_15_1     | 322            |                                 | IFR flights with ATFM delay >15 min. (source:NM)                                            |
| DLY_1            | 11262          | ATFM delay                      | Minutes of ATFM delay (source: NM)                                                          |
| DLY_15_1         | 9209           | ATFM delay > 15 min             | Minutes of ATFM delay >15 minutes (source: NM)                                              |
| FLT_DLY_APT_1    | 501            |                                 | IFR flights with airport ATFM delay (source:NM)                                             |
| FLT_DLY_APT_15_1 | 300            |                                 | IFR flights with airport ATFM delay >15 min. (source:NM)                                    |
| DLY_APT_1        | 10481          |                                 | Minutes of airport ATFM delay (source: NM)                                                  |
| DLY_APT_15_1     | 8716           |                                 | Minutes of airport ATFM delay >15 minutes (source: NM)                                      |
| FLT_DLY_ERT_1    | 55             |                                 | IFR flights with en-route ATFM delay (source:NM)                                            |
| FLT_DLY_ERT_15_1 | 22             |                                 | IFR flights with en-route ATFM delay >15 min. (source:NM)                                   |
| DLY_ERT_1        | 781            | En-route ATFM delay             | Minutes of en-route ATFM delay (source: NM)                                                 |
| DLY_ERT_15_1     | 493            | En-route ATFM delay > 15 min    | Minutes of en-route ATFM delay >15 minutes (source: NM)                                     |
| DLY_ERT_A_1      | 0              | A - Accident/Incident           | Minutes of en-route ATFM delay with delay code A - Accident/Incident (source: NM)           |
| DLY_ERT_C_1      | 0              | C - ATC Capacity                | Minutes of en-route ATFM delay with delay code C - ATC Capacity (source: NM)                |
| DLY_ERT_D_1      | 0              | D - De-icing                    | Minutes of en-route ATFM delay with delay code D - De-icing (source: NM)                    |
| DLY_ERT_E_1      | 0              | E - Equipment (non-ATC)         | Minutes of en-route ATFM delay with delay code E - Equipment (non-ATC) (source: NM)         |
| DLY_ERT_G_1      | 0              | G - Aerodrome Capacity          | Minutes of en-route ATFM delay with delay code G - Aerodrome Capacity (source: NM)          |
| DLY_ERT_I_1      | 781            | I - Industrial Action (ATC)     | Minutes of en-route ATFM delay with delay code I - Industrial Action (ATC) (source: NM)     |
| DLY_ERT_M_1      | 0              | M - Airspace Management         | Minutes of en-route ATFM delay with delay code M - Airspace Management (source: NM)         |
| DLY_ERT_N_1      | 0              | N - Industrial Action (non-ATC) | Minutes of en-route ATFM delay with delay code N - Industrial Action (non-ATC) (source: NM) |
| DLY_ERT_O_1      | 0              | O - Other                       | Minutes of en-route ATFM delay with delay code O - Other (source: NM)                       |
| DLY_ERT_P_1      | 0              | P - Special Event               | Minutes of en-route ATFM delay with delay code P - Special Event (source: NM)               |
| DLY_ERT_R_1      | 0              | R - ATC Routeing                | Minutes of en-route ATFM delay with delay code R - ATC Routeing (source: NM)                |
| DLY_ERT_S_1      | 0              | S - ATC Staffing                | Minutes of en-route ATFM delay with delay code S - ATC Staffing (source: NM)                |
| DLY_ERT_T_1      | 0              | T - Equipment (ATC)             | Minutes of en-route ATFM delay with delay code T - Equipment (ATC) (source: NM)             |
| DLY_ERT_V_1      | 0              | V - Environmental Issues        | Minutes of en-route ATFM delay with delay code V - Environmental Issues (source: NM)        |
| DLY_ERT_W_1      | 0              | W - Weather                     | Minutes of en-route ATFM delay with delay code W - Weather (source: NM)                     |
| DLY_ERT_NA_1     | 0              | NA - Not specified              | Minutes of en-route ATFM delay with delay code NA - Not specified (source: NM)              |


### SQL

```sql
Select 
  year as Year
, month as Month_NUM
, ACE_NAME as ANSP_NAME
, NAME as ENTITY_NAME
, PRU_ATC_TYPE as ENTITY_TYPE
, NEW_CODE as ENTITY_CODE
, TTF_FLT as FLT_1
, SYN_DISTANCE_KM as DIST_KM_1
,SYN_OCC_DURATION_MIN as DUR_MIN_1
,SYN_TDF as DLY_FLT_1
,SYN_TDF_15 as DLY_FLT_15_1
,SYN_TDM as DLY_1
,SYN_TDM_15 as DLY_15_1
,SYN_ARP_TDF as APT_DLY_FLT_1
,SYN_ARP_TDF_15 as APT_DLY_FLT_15_1
,SYN_ARP_TDM as APT_DLY_1
,SYN_ARP_TDM_15 as APT_DLY_15_1
,SYN_ERT_TDF as ERT_DLY_FLT_1
,SYN_ERT_TDF_15 as ERT_DLY_FLT_15_1
,SYN_ERT_TDM as ERT_DLY_1
,SYN_ERT_TDM_15 as ERT_DLY_15_1
,SYN_ERT_TDM_A as ERT_DLY_A_1
,SYN_ERT_TDM_C as ERT_DLY_C_1
,SYN_ERT_TDM_D as ERT_DLY_D_1
,SYN_ERT_TDM_E as ERT_DLY_E_1
,SYN_ERT_TDM_G as ERT_DLY_G_1
,SYN_ERT_TDM_I as ERT_DLY_I_1
,SYN_ERT_TDM_M as ERT_DLY_M_1
,SYN_ERT_TDM_N as ERT_DLY_N_1
,SYN_ERT_TDM_O as ERT_DLY_O_1
,SYN_ERT_TDM_P as ERT_DLY_P_1
,SYN_ERT_TDM_R as ERT_DLY_R_1
,SYN_ERT_TDM_S as ERT_DLY_S_1
,SYN_ERT_TDM_T as ERT_DLY_T_1
,SYN_ERT_TDM_V as ERT_DLY_V_1
,SYN_ERT_TDM_W as ERT_DLY_W_1
,SYN_ERT_TDM_NA as ERT_DLY_NA_1

from PRUDEV.V_ACE_MM_UNIT_OPERAT_MIX
Where 

 --TYPE='STAT_AUA' and 
 year >=2014

order by 1,2
```