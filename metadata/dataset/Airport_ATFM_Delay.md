---
layout: default
title: Airport ATFM Delay Dataset
excerpt: Performance Review Unit MetaData Definitions.
keywords: metadata, dataset, performance, data, statistics, economics, air transport, flights, europe, cost efficiency
---
# {{ page.title }}

period: [2014/01, 2015/04]

~84000 rows


## Column naming and types

| Column name  | Example    | Pivot Label                           | Description                                                                                |
|--------------|------------|---------------------------------------|--------------------------------------------------------------------------------------------|
| YEAR         | 2014       | YEAR                                  | Reference year                                                                             |
| MONTH_NUM    | 1          | MONTH                                 | Month (numeric)                                                                            |
| MONTH_MON    | JAN        |                                       | Month (3-letter code)                                                                      |
| DATE_REG     | 01-01-2014 | DATE_REG                              | Date when the ATFM regulation was issued                                                   |
| APT_COUNTRY  | Germany    | APT_COUNTRY                           |                                                                                            |
| APT_ICAO     | EDDM       | APT_ICAO                              | ICAO 4-letter airport designator                                                           |
| APT_NAME     | Munich     | APT_NAME                              | Airport name                                                                               |
| FLT_ARR_1    | 241        | IFR arrivals (source: NM)             | Number of IFR arrivals (source:NM)                                                         |
| FLT_DEP_1    | 278        | IFR departures (source: NM)           | Number of IFR departures (source:NM)                                                       |
| FLT_TOT_1    | 519        | IFR flights (arr + dep) - (source:NM) | Number total IFR movements (source:NM)                                                     |
| DLY_APT_1    | 0          | Airport ATFM arrival delay            | Minutes of airport ATFM delay (source: NM)                                                 |
| DLY_APT_A_1  | 0          | A - Accident/Incident                 | Minutes of airport ATFM delay with delay code A - Accident/Incident (source: NM)           |
| DLY_APT_C_1  | 0          | C - ATC Capacity                      | Minutes of airport ATFM delay with delay code C - ATC Capacity (source: NM)                |
| DLY_APT_D_1  | 0          | D - De-icing                          | Minutes of airport ATFM delay with delay code D - De-icing (source: NM)                    |
| DLY_APT_E_1  | 0          | E - Equipment (non-ATC)               | Minutes of airport ATFM delay with delay code E - Equipment (non-ATC) (source: NM)         |
| DLY_APT_G_1  | 0          | G - Aerodrome Capacity                | Minutes of airport ATFM delay with delay code G - Aerodrome Capacity (source: NM)          |
| DLY_APT_I_1  | 0          | I - Industrial Action (ATC)           | Minutes of airport ATFM delay with delay code I - Industrial Action (ATC) (source: NM)     |
| DLY_APT_M_1  | 0          | M - Airspace Management               | Minutes of airport ATFM delay with delay code M - Airspace Management (source: NM)         |
| DLY_APT_N_1  | 0          | N - Industrial Action (non-ATC)       | Minutes of airport ATFM delay with delay code N - Industrial Action (non-ATC) (source: NM) |
| DLY_APT_O_1  | 0          | O - Other                             | Minutes of airport ATFM delay with delay code O - Other (source: NM)                       |
| DLY_APT_P_1  | 0          | P - Special Event                     | Minutes of airport ATFM delay with delay code P - Special Event (source: NM)               |
| DLY_APT_R_1  | 0          | R - ATC Routeing                      | Minutes of airport ATFM delay with delay code R - ATC Routeing (source: NM)                |
| DLY_APT_S_1  | 0          | S - ATC Staffing                      | Minutes of airport ATFM delay with delay code S - ATC Staffing (source: NM)                |
| DLY_APT_T_1  | 0          | T - Equipment (ATC)                   | Minutes of airport ATFM delay with delay code T - Equipment (ATC) (source: NM)             |
| DLY_APT_V_1  | 0          | V - Environmental Issues              | Minutes of airport ATFM delay with delay code V - Environmental Issues (source: NM)        |
| DLY_APT_W_1  | 0          | W - Weather                           | Minutes of airport ATFM delay with delay code W - Weather (source: NM)                     |
| DLY_APT_NA_1 | 0          | NA - Not specified                    | Minutes of airport ATFM delay with delay code NA - Not specified (source: NM)              |


## SQL

```sql
with 

Selec as 
(select airport_location_id as airport_code ,
 sum(tdm) as A_TDM_ARR
  from PRU_REGULATION_DETAIL
where airport_role = 'A' and to_char(flt_date,'YYYY') >=2014
group by  airport_location_id
order by 2),

arrival_delay as 
(

select 
  to_char(flt_date,'YYYY') as YEAR
, EXTRACT (MONTH FROM flt_date) MONTH_NUM 
, to_char(flt_date,'MON') as MONTH_MON
, flt_date 
, airport_location_id as airport_code 
, tdm as DLY_APT
, CASE WHEN reason ='A'THEN NVL (tdm, 0)END DLY_APT_A
, CASE WHEN reason ='C'THEN NVL (tdm, 0)END DLY_APT_C
, CASE WHEN reason ='D'THEN NVL (tdm, 0)END DLY_APT_D
, CASE WHEN reason ='E'THEN NVL (tdm, 0)END DLY_APT_E
, CASE WHEN reason ='G'THEN NVL (tdm, 0)END DLY_APT_G
, CASE WHEN reason ='I'THEN NVL (tdm, 0)END DLY_APT_I
, CASE WHEN reason ='M'THEN NVL (tdm, 0)END DLY_APT_M
, CASE WHEN reason ='N'THEN NVL (tdm, 0)END DLY_APT_N
, CASE WHEN reason ='O'THEN NVL (tdm, 0)END DLY_APT_O
, CASE WHEN reason ='P'THEN NVL (tdm, 0)END DLY_APT_P
, CASE WHEN reason ='R'THEN NVL (tdm, 0)END DLY_APT_R
, CASE WHEN reason ='S'THEN NVL (tdm, 0)END DLY_APT_S
, CASE WHEN reason ='T'THEN NVL (tdm, 0)END DLY_APT_T
, CASE WHEN reason ='V'THEN NVL (tdm, 0)END DLY_APT_V
, CASE WHEN reason ='W'THEN NVL (tdm, 0)END DLY_APT_W
, CASE WHEN reason NOT IN ('A','C','D','E','G','I','M','N','O','P','R','S','T','V','W') THEN NVL (tdm, 0)END DLY_APT_NA
, last_update 
, regulation_date
  from PRU_REGULATION_DETAIL
  where airport_role = 'A'  and to_char(flt_date,'YYYY') >=2014 and
  airport_location_id in (select airport_code from  selec)

 )
 
, arrival_traffic as  
(SELECT 
 to_char(p.flt_date,'YYYY') as YEAR 
, EXTRACT (MONTH FROM flt_date) MONTH_NUM 
, to_char(flt_date,'MON') as MONTH_MON
,p.flt_date   
,p.ID 
,u.code 
,u.NAME
,p.ttf_arr 
,p.ttf_dep 

FROM prudev.pru_fact_traffic_airspace p, pru_airport u
    WHERE p.ID = u.ID AND p.TYPE = 'AIRPORT' and to_char(p.flt_date,'YYYY') >=2014 and 
    code in (select airport_code from  selec))

select
 t.year
,t.MONTH_NUM
,t.MONTH_MON 
,t.flt_date as DATE_REG 
,t.code as APT_ICAO
,t.name as APT_NAME
,ttf_arr
,ttf_dep
,ttf_arr + ttf_dep as tot_mov
,nvl(DLY_APT,0) as DLY_APT
,nvl(DLY_APT_A,0) as DLY_APT_A
,nvl(DLY_APT_C,0) as DLY_APT_C
,nvl(DLY_APT_D,0) as DLY_APT_D
,nvl(DLY_APT_E,0) as DLY_APT_E
,nvl(DLY_APT_G,0) as DLY_APT_G
,nvl(DLY_APT_I,0) as DLY_APT_I
,nvl(DLY_APT_M,0) as DLY_APT_M
,nvl(DLY_APT_N,0) as DLY_APT_N
,nvl(DLY_APT_O,0) as DLY_APT_O
,nvl(DLY_APT_P,0) as DLY_APT_P
,nvl(DLY_APT_R,0) as DLY_APT_R
,nvl(DLY_APT_S,0) as DLY_APT_S
,nvl(DLY_APT_T,0) as DLY_APT_T
,nvl(DLY_APT_V,0) as DLY_APT_V
,nvl(DLY_APT_W,0) as DLY_APT_W
,nvl(DLY_APT_NA,0) as DLY_APT_NA
,last_update 

from arrival_traffic t left join arrival_delay d on ( 
 t.year = d.year and t.month_MON = d.month_MON and t.flt_date = d.flt_date and t.code = d.airport_code)
 where t.year>=2014 --and t.month=9
 order by 1,2,3,4

ai
```