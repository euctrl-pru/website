set sqlformat csv;
set term off;
set feedback off;
SET TRIMSPOOL ON;
-- take name from argument 1
spool '&1';

WITH APT_ONE_LIST AS
    ( SELECT
       'EBAW,EBBR,EBCI,EBLG,EBOS,EDDB,EDDC,EDDE,EDDF,EDDG,EDDH,EDDK,EDDL,EDDM,EDDN,EDDP,EDDR,EDDS,
        EDDT,EDDV,EDDW,EETN,EETU,EFHK,EGBB,EGCC,EGGW,EGHI,EGKB,EGKK,EGLC,EGLF,EGLL,EGNX,EGPD,EGPF,
        EGPH,EGSS,EHAM,EHBK,EHGG,EHRD,EICK,EIDW,EINN,EKCH,ELLX,ENBR,ENGM,ENHD,ENVA,ENZV,EPBY,EPGD,
        EPKK,EPKT,EPLB,EPLL,EPMO,EPPO,EPRA,EPRZ,EPSC,EPSY,EPWA,EPWR,EPZG,ESSA,ESSB,EVLA,EVRA,EVVA,
        EYKA,EYPA,EYSA,EYVI,GCLP,GCRR,GCXO,LATI,LBSF,LCLK,LCPH,LDZA,LDZL,LEBL,LEIB,LEMD,LEMG,LEPA,
        LFAQ,LFBA,LFBD,LFBE,LFBH,LFBI,LFBL,LFBO,LFBP,LFBT,LFBZ,LFCR,LFGJ,LFJL,LFJR,LFKB,LFKC,LFKF,LFKJ,
        LFLB,LFLC,LFLI,LFLL,LFLP,LFLS,LFLX,LFLY,LFMD,LFMH,LFMI,LFMK,LFML,LFMN,LFMP,LFMT,LFMU,LFMV,LFOB,
        LFOH,LFOK,LFOT,LFPB,LFPG,LFPN,LFPO,LFQQ,LFRB,LFRD,LFRG,LFRH,LFRK,LFRM,LFRN,LFRO,LFRQ,LFRS,
        LFRZ,LFSB,LFSL,LFST,LFTH,LFTW,LGAV,LGIR,LGKF,LGKO,LGKR,LGMK,LGPZ,LGRP,LGSA,LGSK,LGSR,LGTS,
        LGZA,LHBP,LICC,LIMC,LIML,LIPZ,LIRA,LIRF,LIRP,LJLJ,LJMB,LJPZ,LKKV,LKMT,LKPR,LKTB,LMML,LOWG,LOWI,
        LOWK,LOWL,LOWS,LOWW,LPFR,LPPR,LPPT,LQSA,LRBS,LROP,LSGG,LSGS,LSZH,LTAC,LTAI,LTBA,LTBJ,LTFJ,
        LUKK,LWSK,LYBE,LYPG,LZIB,UDYZ,UGTB,UKBB'
    ids FROM dual
    ),

APT_SELECTION as (

  SELECT regexp_substr(ids, '[A-Z]{4}', 1, LEVEL) apt_id
  FROM APT_ONE_LIST
  CONNECT BY instr(ids, ',', 1, LEVEL - 1) > 0
),

APT_ATFM_DLY as
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
  from PRU_REGULATION_DETAIL
  where airport_role = 'A'
  AND flt_date >= '01 JAN 2014'
  AND airport_location_id IN (SELECT apt_id FROM APT_SELECTION)
  group by flt_date, airport_location_id

 ),

ARR_FLTS as
(
SELECT 
 p.flt_date
,p.ID
,u.code
,R.PRU_APT_NAME as NAME
,R.PRU_STATE_NAME as STATE_NAME
,NVL (p.ttf_arr, 0) as ttf_arr
,NVL (p.ttf_dep, 0) as ttf_dep

FROM prudev.pru_fact_traffic_airspace p, pru_airport u, dsh_rel_airport_country r
    WHERE p.ID = u.ID AND p.TYPE = 'AIRPORT'
    AND p.flt_date >= '01 JAN 2014'
    AND R.APT_ICAO = U.CODE
    AND u.code IN (SELECT apt_id FROM APT_SELECTION)
    )

select
  to_char(t.flt_date,'YYYY') as YEAR
, EXTRACT (MONTH FROM t.flt_date) MONTH_NUM
, to_char(t.flt_date,'MON') as MONTH_MON
,t.flt_date as FLT_DATE
,t.code as APT_ICAO
,t.name as APT_NAME
,STATE_NAME
,NVL (t.ttf_arr, 0) as FLT_ARR_1
,nvl(DLY_APT,0) as DLY_APT_1
,nvl(DLY_APT_A,0) as DLY_APT_ARR_A_1
,nvl(DLY_APT_C,0) as DLY_APT_ARR_C_1
,nvl(DLY_APT_D,0) as DLY_APT_ARR_D_1
,nvl(DLY_APT_E,0) as DLY_APT_ARR_E_1
,nvl(DLY_APT_G,0) as DLY_APT_ARR_G_1
,nvl(DLY_APT_I,0) as DLY_APT_ARR_I_1
,nvl(DLY_APT_M,0) as DLY_APT_ARR_M_1
,nvl(DLY_APT_N,0) as DLY_APT_ARR_N_1
,nvl(DLY_APT_O,0) as DLY_APT_ARR_O_1
,nvl(DLY_APT_P,0) as DLY_APT_ARR_P_1
,nvl(DLY_APT_R,0) as DLY_APT_ARR_R_1
,nvl(DLY_APT_S,0) as DLY_APT_ARR_S_1
,nvl(DLY_APT_T,0) as DLY_APT_ARR_T_1
,nvl(DLY_APT_V,0) as DLY_APT_ARR_V_1
,nvl(DLY_APT_W,0) as DLY_APT_ARR_W_1
,nvl(DLY_APT_NA,0) as DLY_APT_ARR_NA_1
from ARR_FLTS t left join APT_ATFM_DLY d on (t.flt_date = d.flt_date and t.code = d.airport_code)
 where t.flt_date>='01-JAN-2014' and t.flt_date<'01-SEP-2015'
 order by 1,2,3,4,5;


spool off;
quit