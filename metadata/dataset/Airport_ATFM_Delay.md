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
WITH

AIRPORT_CODES AS
(SELECT AIRPORT_LOCATION_ID AS AIRPORT_CODE ,
 SUM(TDM) AS A_TDM_ARR
  FROM PRU_REGULATION_DETAIL
WHERE AIRPORT_ROLE = 'A' AND TO_CHAR(FLT_DATE,'YYYY') >=2014
GROUP BY  AIRPORT_LOCATION_ID
ORDER BY 2),

ARRIVAL_DELAY AS
(

SELECT
  TO_CHAR(FLT_DATE,'YYYY') AS YEAR
, EXTRACT (MONTH FROM FLT_DATE) MONTH_NUM
, TO_CHAR(FLT_DATE,'MON') AS MONTH_MON
, FLT_DATE
, AIRPORT_LOCATION_ID AS AIRPORT_CODE
, TDM AS DLY_APT
, CASE WHEN REASON ='A'THEN NVL (TDM, 0)END DLY_APT_A
, CASE WHEN REASON ='C'THEN NVL (TDM, 0)END DLY_APT_C
, CASE WHEN REASON ='D'THEN NVL (TDM, 0)END DLY_APT_D
, CASE WHEN REASON ='E'THEN NVL (TDM, 0)END DLY_APT_E
, CASE WHEN REASON ='G'THEN NVL (TDM, 0)END DLY_APT_G
, CASE WHEN REASON ='I'THEN NVL (TDM, 0)END DLY_APT_I
, CASE WHEN REASON ='M'THEN NVL (TDM, 0)END DLY_APT_M
, CASE WHEN REASON ='N'THEN NVL (TDM, 0)END DLY_APT_N
, CASE WHEN REASON ='O'THEN NVL (TDM, 0)END DLY_APT_O
, CASE WHEN REASON ='P'THEN NVL (TDM, 0)END DLY_APT_P
, CASE WHEN REASON ='R'THEN NVL (TDM, 0)END DLY_APT_R
, CASE WHEN REASON ='S'THEN NVL (TDM, 0)END DLY_APT_S
, CASE WHEN REASON ='T'THEN NVL (TDM, 0)END DLY_APT_T
, CASE WHEN REASON ='V'THEN NVL (TDM, 0)END DLY_APT_V
, CASE WHEN REASON ='W'THEN NVL (TDM, 0)END DLY_APT_W
, CASE WHEN REASON NOT IN ('A','C','D','E','G','I','M','N','O','P','R','S','T','V','W') THEN NVL (TDM, 0)END DLY_APT_NA
, LAST_UPDATE
, REGULATION_DATE
  FROM PRU_REGULATION_DETAIL
  WHERE AIRPORT_ROLE = 'A'  AND TO_CHAR(FLT_DATE,'YYYY') >=2014 AND
  AIRPORT_LOCATION_ID IN (SELECT AIRPORT_CODE FROM  AIRPORT_CODES)

 )

, ARRIVAL_TRAFFIC AS
(SELECT
 TO_CHAR(P.FLT_DATE,'YYYY') AS YEAR
, EXTRACT (MONTH FROM FLT_DATE) MONTH_NUM
, TO_CHAR(FLT_DATE,'MON') AS MONTH_MON
,P.FLT_DATE
,P.ID
,U.CODE
,U.NAME
,P.TTF_ARR
,P.TTF_DEP

FROM PRUDEV.PRU_FACT_TRAFFIC_AIRSPACE P, PRU_AIRPORT U
    WHERE P.ID = U.ID AND P.TYPE = 'AIRPORT' AND TO_CHAR(P.FLT_DATE,'YYYY') >=2014 AND
    CODE IN (SELECT AIRPORT_CODE FROM  AIRPORT_CODES))

SELECT
 T.YEAR
,T.MONTH_NUM
,T.MONTH_MON
,T.FLT_DATE AS DATE_REG
,T.CODE AS APT_ICAO
,T.NAME AS APT_NAME
,TTF_ARR
,TTF_DEP
,TTF_ARR + TTF_DEP AS TOT_MOV
,NVL(DLY_APT,0) AS DLY_APT
,NVL(DLY_APT_A,0) AS DLY_APT_A
,NVL(DLY_APT_C,0) AS DLY_APT_C
,NVL(DLY_APT_D,0) AS DLY_APT_D
,NVL(DLY_APT_E,0) AS DLY_APT_E
,NVL(DLY_APT_G,0) AS DLY_APT_G
,NVL(DLY_APT_I,0) AS DLY_APT_I
,NVL(DLY_APT_M,0) AS DLY_APT_M
,NVL(DLY_APT_N,0) AS DLY_APT_N
,NVL(DLY_APT_O,0) AS DLY_APT_O
,NVL(DLY_APT_P,0) AS DLY_APT_P
,NVL(DLY_APT_R,0) AS DLY_APT_R
,NVL(DLY_APT_S,0) AS DLY_APT_S
,NVL(DLY_APT_T,0) AS DLY_APT_T
,NVL(DLY_APT_V,0) AS DLY_APT_V
,NVL(DLY_APT_W,0) AS DLY_APT_W
,NVL(DLY_APT_NA,0) AS DLY_APT_NA
--,LAST_UPDATE

FROM ARRIVAL_TRAFFIC T LEFT JOIN ARRIVAL_DELAY D ON (
 T.YEAR = D.YEAR AND T.MONTH_MON = D.MONTH_MON AND T.FLT_DATE = D.FLT_DATE AND T.CODE = D.AIRPORT_CODE)
 WHERE T.YEAR>=2014 --AND T.MONTH=9
 ORDER BY 1,2,3,4
 ```