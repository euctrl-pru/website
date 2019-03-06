With 

DATA_NM as (select
p.FLT_DATE AS DATE_FLT,
p.ID, 
u.code as APT_ICAO, 
u.NAME,
Z.PRU_APT_NAME as APT_NAME,
Z.PRU_STATE_NAME as STATE_NAME,
NVL (p.ttf_dep, 0) as FLT_DEP_1
     FROM prudev.pru_fact_traffic_airspace p,
          prudev.pru_airport u, PRUDEV.DSH_REL_AIRPORT_COUNTRY z
    WHERE p.ID = u.ID AND
          z.APT_ICAO = u.code(+) AND
          p.TYPE = 'AIRPORT' 
          and FLT_DATE >= '01 JAN 2014' AND FLT_DATE <'01 AUG 2015'   
          and u.code IN (SELECT apt_icao FROM PRUDEV.DSH_REL_AIRPORT_COUNTRY) 
          ),

DATA_CODA AS (
select
       ADEP AS APT_ICAO_3
     , TO_DATE (actual_out) FLT_DATE_3
     , count(actual_out) as FLT_DEP_3                                                                   
     , SUM(CASE WHEN dly1 IN ('89') THEN NVL (time1, 0) ELSE 0 END)
     + SUM(CASE WHEN dly2 IN ('89') THEN NVL (time2, 0) ELSE 0 END)
     + SUM(CASE WHEN dly3 IN ('89') THEN NVL (time3, 0) ELSE 0 END)                        
     + SUM(CASE WHEN dly4 IN ('89') THEN NVL (time4, 0) ELSE 0 END)
     + SUM(CASE WHEN dly5 IN ('89') THEN NVL (time5, 0) ELSE 0 END) AS IATA_89_3   
                         
     ,SUM(CASE
        WHEN dly1 IS NULL AND dly2 IS NULL AND (actual_out - std) * 1440 > 4
           THEN (actual_out - std) * 1440 ELSE 0 END) AS no_code_3
                         
     ,SUM(CASE
        WHEN dly1 IS NOT NULL OR dly2 IS NOT NULL
           THEN   NVL (time1, 0) + NVL (time2, 0) + NVL (time3, 0) + NVL (time4, 0) + NVL (time5, 0) ELSE 0 END) AS TOT_DLY_3
    FROM acars.pru_acars_flight
    WHERE  actual_out >= '01 JAN 2014' AND actual_out <'01 AUG 2015'
           AND ADEP IN (SELECT apt_icao FROM PRUDEV.DSH_REL_AIRPORT_COUNTRY)
    GROUP BY ADEP, TO_DATE (actual_out)
 ),
       
            
DATA_APT AS (
select
       adep_icao AS APT_ICAO_2
     , TO_DATE (ATOT_UTC) FLT_DATE_2
     , SUM (CASE WHEN SRC_Phase IN ('DEP') AND C_FLTRUL IN ('IFR') THEN NVL (1, 0) ELSE 0 END) as FLT_DEP_IFR_2                                                                
     , SUM(CASE WHEN C_DLY1  IN ('89') THEN NVL (C_DLY_TIME1, 0) ELSE 0 END)
     + SUM(CASE WHEN C_DLY2  IN ('89') THEN NVL (C_DLY_TIME2, 0) ELSE 0 END)
     + SUM(CASE WHEN C_DLY3  IN ('89') THEN NVL (C_DLY_TIME3, 0) ELSE 0 END)                        
     + SUM(CASE WHEN C_DLY4  IN ('89') THEN NVL (C_DLY_TIME4, 0) ELSE 0 END)
     + SUM(CASE WHEN C_DLY5  IN ('89') THEN NVL (C_DLY_TIME5, 0) ELSE 0 END) AS IATA_89_2   
                         
     ,SUM(CASE
        WHEN C_DLY1 IS NULL AND C_DLY2 IS NULL AND (ATOT_UTC - STD_UTC) * 1440 > 4
           THEN (ATOT_UTC - STD_UTC) * 1440 ELSE 0 END) AS no_code_2
                         
     ,SUM(CASE
        WHEN C_DLY1 IS NOT NULL OR C_DLY2 IS NOT NULL
           THEN   NVL (C_DLY_TIME1, 0) + NVL (C_DLY_TIME2, 0) + NVL (C_DLY_TIME3, 0) + NVL (C_DLY_TIME4, 0) + NVL (C_DLY_TIME5, 0) ELSE 0 END) AS TOT_DLY_2
    FROM SWH_SRC.S_APDS_FLIGHT_IR691
    WHERE  ATOT_UTC >= '01 JAN 2014' AND ATOT_UTC <'01 AUG 2015'
           AND SRC_Phase = 'DEP' 
           AND C_FLTRUL = 'IFR' 
         --  AND adep_icao  IN (SELECT apt_id FROM APT_SELECTION)
         
          AND ((adep_icao  IN (SELECT apt_icao FROM PRUDEV.DSH_REL_AIRPORT_COUNTRY where APT_2014_VAL =1) and ATOT_UTC >= '01 JAN 2014' AND ATOT_UTC <'01 JAN 2015')
          OR (adep_icao  IN (SELECT apt_icao FROM PRUDEV.DSH_REL_AIRPORT_COUNTRY where APT_2015_VAL =1) and ATOT_UTC >= '01 JAN 2015' AND ATOT_UTC <'01 AUG 2015'))
    GROUP BY adep_icao, TO_DATE (ATOT_UTC)
 )
 
SELECT 
     to_char(nm.DATE_FLT, 'YYYY') YEAR
   , to_char(nm.DATE_FLT, 'MM') MONTH_NUM
   , to_char(nm.DATE_FLT, 'MON') MONTH_MON
   , nm.DATE_FLT FLT_DATE
   , nm.APT_ICAO APT_ICAO
   , nm.APT_NAME
   , nm.STATE_NAME
   , FLT_DEP_1
   , FLT_DEP_IFR_2
   , IATA_89_2
   , FLT_DEP_3
   , IATA_89_3
from DATA_NM nm, DATA_CODA coda, DATA_APT apt

WHERE     nm.APT_ICAO = coda.APT_ICAO_3(+) 
      AND nm.APT_ICAO = apt.APT_ICAO_2(+) 
      AND nm.DATE_FLT = coda.FLT_DATE_3(+)
      AND nm.DATE_FLT = apt.FLT_DATE_2(+)     
ORDER by 4,5
