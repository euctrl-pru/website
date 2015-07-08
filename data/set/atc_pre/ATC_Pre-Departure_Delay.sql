WITH APT_ONE_LIST AS
    ( SELECT
       'EBAW,EBBR,EBCI,EBLG,EBOS,EDDB,EDDC,EDDE,EDDF,EDDG,EDDH,EDDK,EDDL,EDDM,
        EDDN,EDDP,EDDR,EDDS,EDDT,EDDV,EDDW,EETN,EETU,EFHK,EGBB,EGCC,EGGD,EGGW,
        EGKK,EGLC,EGLL,EGNT,EGPD,EGPF,EGPH,EGSS,EHAM,EHBK,EHGG,EHRD,EIDW,EKCH,
        ELLX,ENBR,ENGM,ENVA,ENZV,EPBY,EPGD,EPKK,EPKT,EPLB,EPLL,EPMO,EPPO,EPRA,
        EPRZ,EPSC,EPWA,EPWR,EPZG,ESGG,ESSA,EVLA,EVRA,EVVA,EYKA,EYPA,EYSA,EYVI,
        GCLP,GCTS,GCXO,LBBG,LBGO,LBPD,LBSF,LBWN,LCLK,LCPH,LDZA,LEAL,LEBB,LEBL,
        LEIB,LEMD,LEMG,LEPA,LEVC,LEZL,LFAQ,LFBA,LFBD,LFBE,LFBH,LFBI,LFBL,LFBO,
        LFBP,LFBT,LFBZ,LFCR,LFGJ,LFJL,LFJR,LFKB,LFKC,LFKF,LFKJ,LFLB,LFLC,LFLL,
        LFLP,LFLS,LFLX,LFLY,LFMD,LFMH,LFMI,LFMK,LFML,LFMN,LFMP,LFMT,LFMU,LFMV,
        LFOB,LFOH,LFOK,LFOT,LFPB,LFPG,LFPN,LFPO,LFQQ,LFRB,LFRD,LFRG,LFRH,LFRK,
        LFRN,LFRO,LFRQ,LFRS,LFRZ,LFSB,LFSD,LFSL,LFST,LFTH,LFTW,LGAV,LHBP,LICC,
        LIMC,LIME,LIML,LIPE,LIPZ,LIRF,LIRN,LJLJ,LJMB,LJPZ,LKKV,LKMT,LKPR,LKTB,
        LMML,LOWG,LOWK,LOWL,LOWS,LOWW,LPAZ,LPFL,LPFR,LPHR,LPMA,LPPD,LPPR,LPPS,
        LPPT,LRBS,LROP,LSGG,LSZH,LZIB,LTBA,LTAI,LTFJ,LTAC,UKBB,LTBJ,EGNX,LYBE,
        LIRA,ESSB,LATI,UDYZ,LQSA,UGTB,LWSK,LUKK,LYPG,

        EGAA,EICK,EINN,EPSY,LDDU,LDLO,LDOS,LDPL,LDRI,LDSB,LDSP,LDZD,LDZL,LFBU,
        LFOP,LFRC,LFSR,LIBC,LIBD,LIBF,LIBG,LIBP,LIBR,LICA,LICD,LICG,LICJ,LICR,
        LICT,LIEA,LIEE,LIEO,LIMA,LIMF,LIMG,LIMJ,LIMP,LIMZ,LIPB,LIPH,LIPK,LIPO,
        LIPQ,LIPR,LIPU,LIPV,LIPX,LIPY,LIQN,LIRI,LIRP,LIRQ,LIRS,LIRU,LIRZ,LOWI,
        LZKZ,LZPP,LZSL,LZTT,LZZI'
    ids FROM dual
    ),

APT_SELECTION as (

  SELECT regexp_substr(ids, '[A-Z]{4}', 1, LEVEL) apt_id
  FROM APT_ONE_LIST
  CONNECT BY instr(ids, ',', 1, LEVEL - 1) > 0
),

APT_2014_LIST AS
    ( SELECT
       'EBBR,EDDN,EFHK,EGBB,EGCC,EGGD,EGSS,EKCH,ENGM,ESGG,ESSA,GCLP,
        GCTS,GCXO,LEAL,LEBB,LEBL,LEMD,LEMG,LEPA,LEVC,LEZL,LFLL,LFPG,
        LFSB,LGAV,LHBP,LICC,LIMC,LIME,LIML,LIPZ,LIRF,LKPR,LMML,LSGG,LSZH'
    ids FROM dual
    ),

APT_SELECTION_2014 as (

  SELECT regexp_substr(ids, '[A-Z]{4}', 1, LEVEL) apt_id
  FROM APT_2014_LIST
  CONNECT BY instr(ids, ',', 1, LEVEL - 1) > 0
),

APT_2015_LIST AS
    ( SELECT
       'EBBR,EDDH,EDDP,EFHK,EGBB,EGCC,EGLL,EGPH,EGSS,EKCH,ENGM,
        ESGG,GCLP,GCTS,GCXO,LBSF,LEAL,LEBB,LEBL,LEMD,LEMG,LEPA,
        LEVC,LEZL,LFLL,LFPG,LFSB,LGAV,LICC,LIME,LIPZ,LIRF,LKPR,
        LMML,LSGG,LSZH'
    ids FROM dual
    ),

APT_SELECTION_2015 as (

  SELECT regexp_substr(ids, '[A-Z]{4}', 1, LEVEL) apt_id
  FROM APT_2015_LIST
  CONNECT BY instr(ids, ',', 1, LEVEL - 1) > 0
),



DATA_NM as (select
p.FLT_DATE AS DATE_FLT,
p.ID,
u.code as APT_ICAO,
u.NAME,
NVL (p.ttf_dep, 0) as FLT_DEP_1
     FROM prudev.pru_fact_traffic_airspace p,
          prudev.pru_airport u
    WHERE p.ID = u.ID AND p.TYPE = 'AIRPORT'
          and FLT_DATE >= '01 JAN 2014' AND FLT_DATE <'01 JUL 2015'
          and u.code IN (SELECT apt_id FROM APT_SELECTION)
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
    WHERE  actual_out >= '01 JAN 2014' AND actual_out <'01 JUN 2015'
           AND ADEP IN (SELECT apt_id FROM APT_SELECTION)
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
    WHERE  ATOT_UTC >= '01 JAN 2014' AND ATOT_UTC <'01 JUN 2015'
           AND SRC_Phase = 'DEP'
           AND C_FLTRUL = 'IFR'
         --  AND adep_icao  IN (SELECT apt_id FROM APT_SELECTION)

          AND ((adep_icao  IN (SELECT apt_id FROM APT_SELECTION_2014) and ATOT_UTC >= '01 JAN 2014' AND ATOT_UTC <'01 JAN 2015')
          OR (adep_icao  IN (SELECT apt_id FROM APT_SELECTION_2015) and ATOT_UTC >= '01 JAN 2015' AND ATOT_UTC <'01 JUN 2015'))
    GROUP BY adep_icao, TO_DATE (ATOT_UTC)
 )

SELECT
     to_char(nm.DATE_FLT, 'YYYY') YEAR
   , to_char(nm.DATE_FLT, 'MM') MONTH_NUM
   , to_char(nm.DATE_FLT, 'MON') MONTH_MON
   , nm.DATE_FLT FLT_DATE
   , nm.APT_ICAO APT_ICAO
   , nm.NAME APT_NAME
   , 'XXXX' STATE_NAME
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
