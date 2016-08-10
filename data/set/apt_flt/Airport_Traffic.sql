With DATA_691 as (
select
     to_date(AP_MVT_TIME_UTC) as DATE_FLT   
    ,SRC_AIRPORT APT_ICAO  
    ,SUM (CASE WHEN SRC_Phase IN ('DEP') AND AP_C_FLTRUL IN ('IFR') THEN NVL (1, 0) ELSE 0 END) as FLT_DEP_IFR_2     
    ,SUM (CASE WHEN SRC_Phase IN ('ARR') AND AP_C_FLTRUL IN ('IFR') THEN NVL (1, 0) ELSE 0 END) as FLT_ARR_IFR_2
    ,SUM (CASE WHEN SRC_Phase IN ('ARR') AND AP_C_FLTRUL IN ('IFR') THEN NVL (1, 0) ELSE 0 END) + SUM (CASE WHEN SRC_Phase IN ('DEP') AND AP_C_FLTRUL IN ('IFR') THEN NVL (1, 0) ELSE 0 END)  FLT_TOT_IFR_2
    ,SUM (CASE WHEN SRC_Phase IN ('DEP') AND AP_C_FLTRUL IN ('VFR') THEN NVL (1, 0) ELSE 0 END) as FLT_DEP_VFR_2     
    ,SUM (CASE WHEN SRC_Phase IN ('ARR') AND AP_C_FLTRUL IN ('VFR') THEN NVL (1, 0) ELSE 0 END) as FLT_ARR_VFR_2
    ,SUM (CASE WHEN SRC_Phase IN ('ARR') AND AP_C_FLTRUL IN ('VFR') THEN NVL (1, 0) ELSE 0 END) + SUM (CASE WHEN SRC_Phase IN ('DEP') AND AP_C_FLTRUL IN ('VFR') THEN NVL (1, 0) ELSE 0 END)  FLT_TOT_VFR_2 
from SWH_FCT.FAC_APDS_FLIGHT_IR691 
      WHERE ((SRC_AIRPORT   IN (SELECT apt_icao FROM PRUDEV.DSH_REL_AIRPORT_COUNTRY where APT_2014_VAL =1) and AP_MVT_TIME_UTC >= '01 JAN 2014' AND AP_MVT_TIME_UTC <'01 JAN 2015')
      OR (SRC_AIRPORT   IN (SELECT apt_icao FROM PRUDEV.DSH_REL_AIRPORT_COUNTRY where APT_2015_VAL =1) and AP_MVT_TIME_UTC >= '01 JAN 2015' AND AP_MVT_TIME_UTC <'01 JUN 2016'))

 --   AND ADEP_ICAO <> ADES_ICAO -- remove circular flights
    group by to_date(AP_MVT_TIME_UTC) ,SRC_AIRPORT
   ), 
   
DATA_NM as (select
p.FLT_DATE AS DATE_FLT,
p.ID, 
u.code as APT_ICAO, 
u.NAME,
Z.PRU_APT_NAME as APT_NAME,
Z.PRU_STATE_NAME as STATE_NAME,
NVL (p.ttf_dep, 0) as FLT_DEP_1, 
NVL (p.ttf_arr, 0) as FLT_ARR_1,
NVL (p.ttf_arr, 0) + NVL (p.ttf_dep, 0) as FLT_TOT_1 
     FROM prudev.pru_fact_traffic_airspace p,
          prudev.pru_airport u, PRUDEV.DSH_REL_AIRPORT_COUNTRY z
    WHERE p.ID = u.ID AND 
           z.APT_ICAO = u.code(+) AND
           p.TYPE = 'AIRPORT' 
          and u.code IN (SELECT apt_icao FROM PRUDEV.DSH_REL_AIRPORT_COUNTRY) 
          and FLT_DATE >= '01 JAN 2014' AND FLT_DATE <'01 JUL 2016'    
          ),
DATA as 
(Select 
     to_char(n.DATE_FLT, 'YYYY') YEAR
   , to_char(n.DATE_FLT, 'MM') MONTH_NUM
   , to_char(n.DATE_FLT, 'MON') MONTH_MON
   , n.DATE_FLT FLT_DATE
   , n.APT_ICAO APT_ICAO
   , n.APT_NAME
   , n.STATE_NAME
   , FLT_DEP_1
   , FLT_ARR_1
   , FLT_TOT_1
   , FLT_DEP_IFR_2
   , FLT_ARR_IFR_2
   , FLT_TOT_IFR_2
from DATA_691 a, DATA_NM n 

WHERE  n.DATE_FLT >= '01 JAN 2014' AND n.DATE_FLT <'01 JUL 2016' and  
n.APT_ICAO = a.APT_ICAO(+) AND n.DATE_FLT = a.DATE_FLT(+) )

SELECT YEAR
 ,MONTH_NUM 
 ,MONTH_MON 
 ,FLT_DATE 
 ,APT_ICAO 
 ,APT_NAME
 ,STATE_NAME
 ,FLT_DEP_1
 ,FLT_ARR_1
 ,FLT_TOT_1
 ,FLT_DEP_IFR_2
 ,FLT_ARR_IFR_2
 ,FLT_TOT_IFR_2
from DATA
ORDER by 4,5;
