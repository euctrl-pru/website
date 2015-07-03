set sqlformat csv;
set term off;
set feedback off;
SET TRIMSPOOL ON;
-- take name from argument 1
spool '&1';

with

AIRPORT_SELECTION as
(select airport_location_id as airport_code ,
 sum(tdm) as A_TDM_ARR
  from PRU_REGULATION_DETAIL
where airport_role = 'A' and to_char(flt_date,'YYYY') >=2014
group by  airport_location_id
order by 2),

ARRIVAL_DELAY as
(

select
  flt_date
, airport_location_id as airport_code
, sum(NVL (tdm, 0)) as DLY_APT
, sum(CASE WHEN reason ='A'THEN NVL (tdm, 0) END) DLY_APT_A
, sum(CASE WHEN reason ='C'THEN NVL (tdm, 0)END) DLY_APT_C
, sum(CASE WHEN reason ='D'THEN NVL (tdm, 0)END) DLY_APT_D
, sum(CASE WHEN reason ='E'THEN NVL (tdm, 0)END) DLY_APT_E
, sum(CASE WHEN reason ='G'THEN NVL (tdm, 0)END) DLY_APT_G
, sum(CASE WHEN reason ='I'THEN NVL (tdm, 0)END) DLY_APT_I
, sum(CASE WHEN reason ='M'THEN NVL (tdm, 0)END) DLY_APT_M
, sum(CASE WHEN reason ='N'THEN NVL (tdm, 0)END) DLY_APT_N
, sum(CASE WHEN reason ='O'THEN NVL (tdm, 0)END) DLY_APT_O
, sum(CASE WHEN reason ='P'THEN NVL (tdm, 0)END) DLY_APT_P
, sum(CASE WHEN reason ='R'THEN NVL (tdm, 0)END) DLY_APT_R
, sum(CASE WHEN reason ='S'THEN NVL (tdm, 0)END) DLY_APT_S
, sum(CASE WHEN reason ='T'THEN NVL (tdm, 0)END) DLY_APT_T
, sum(CASE WHEN reason ='V'THEN NVL (tdm, 0)END) DLY_APT_V
, sum(CASE WHEN reason ='W'THEN NVL (tdm, 0)END) DLY_APT_W
, sum(CASE WHEN reason NOT IN ('A','C','D','E','G','I','M','N','O','P','R','S','T','V','W') THEN NVL (tdm, 0)END) DLY_APT_NA
, last_update
, regulation_date
  from PRU_REGULATION_DETAIL
  where airport_role = 'A'  and to_char(flt_date,'YYYY') >=2014 and
  airport_location_id in (select airport_code from  AIRPORT_SELECTION)
  group by flt_date, airport_location_id, last_update, regulation_date

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
,NVL (p.ttf_arr, 0) as ttf_arr
,NVL (p.ttf_dep, 0) as ttf_dep

FROM prudev.pru_fact_traffic_airspace p, pru_airport u
    WHERE p.ID = u.ID AND p.TYPE = 'AIRPORT' and to_char(p.flt_date,'YYYY') >=2014 and
    code in (select airport_code from  AIRPORT_SELECTION))

select
 t.year
,t.MONTH_NUM
,t.MONTH_MON
,t.flt_date as DATE_REG
, ' XXXXX'  as APT_COUNTRY
,t.code as APT_ICAO
,t.name as APT_NAME
,NVL (t.ttf_arr, 0) as FLT_ARR_1
,NVL (t.ttf_dep, 0) as FLT_DEP_1
,NVL (t.ttf_arr, 0) + NVL (t.ttf_dep, 0) as FLT_TOT_1
,nvl(DLY_APT,0) as DLY_APT_1
,nvl(DLY_APT_A,0) as DLY_APT_A_1
,nvl(DLY_APT_C,0) as DLY_APT_C_1
,nvl(DLY_APT_D,0) as DLY_APT_D_1
,nvl(DLY_APT_E,0) as DLY_APT_E_1
,nvl(DLY_APT_G,0) as DLY_APT_G_1
,nvl(DLY_APT_I,0) as DLY_APT_I_1
,nvl(DLY_APT_M,0) as DLY_APT_M_1
,nvl(DLY_APT_N,0) as DLY_APT_N_1
,nvl(DLY_APT_O,0) as DLY_APT_O_1
,nvl(DLY_APT_P,0) as DLY_APT_P_1
,nvl(DLY_APT_R,0) as DLY_APT_R_1
,nvl(DLY_APT_S,0) as DLY_APT_S_1
,nvl(DLY_APT_T,0) as DLY_APT_T_1
,nvl(DLY_APT_V,0) as DLY_APT_V_1
,nvl(DLY_APT_W,0) as DLY_APT_W_1
,nvl(DLY_APT_NA,0) as DLY_APT_NA_1
from arrival_traffic t left join arrival_delay d on (
 t.flt_date = d.flt_date and t.code = d.airport_code)
 where t.flt_date>='01-JAN-2014' and t.flt_date<'01-JUN-2015'
 -- and ROWNUM <= 150
 order by 1,2,3,4;

spool off;
quit