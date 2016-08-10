SET SQLFORMAT CSV;
SET TERM OFF;
SET VERIFY OFF;
SET FEEDBACK OFF;
SET TRIMSPOOL ON;
-- take output file name from argument 1
DEFINE OUTFILE = '&1'

-- take period from argument 2 and 3
DEFINE WEF = '&2'
DEFINE TIL = '&3'

SPOOL '&OUTFILE';

SELECT 
       to_char(a.ADEP_DAY_FLT_DATE,'YYYY') YEAR,
       EXTRACT (MONTH FROM a.ADEP_DAY_FLT_DATE) MONTH_NUM, 
       to_char(a.ADEP_DAY_FLT_DATE,'MON') as MONTH_MON,
       trunc(a.ADEP_DAY_FLT_DATE) FLT_DATE,
       a.ADEP_DAY_ADEP APT_ICAO,
       R.PRU_APT_NAME as APT_NAME,
       R.PRU_STATE_NAME as STATE_NAME,
       sum(a.ADEP_DAY_ALL_TRF) FLT_DEP_1,  
      -- sum(a.ADEP_DAY_RG_TRF) REG_TRAF,  
      -- sum(a.ADEP_DAY_FSA_TRF) ACT_ALL_TRAF,
       sum(a.ADEP_DAY_FSA_RG_TRF) FLT_DEP_REG_1,
       sum(a.FSA_ERGTRF) FLT_DEP_OUT_EARLY_1, 
       sum(a.ADEP_DAY_FSA_RG_TRF)-(sum(a.FSA_ERGTRF)+sum(a.FSA_LRGTRF)) FLT_DEP_IN_1,
       sum(a.FSA_LRGTRF) FLT_DEP_OUT_LATE_1
FROM  ARU_SYN.AGG_DEP_DAY a, dsh_rel_airport_country r
WHERE a.ADEP_DAY_FLT_DATE  >='&WEF' 
  and a.ADEP_DAY_FLT_DATE  < '&TIL' 
  AND a.ADEP_DAY_ADEP IN (SELECT apt_icao FROM PRUDEV.DSH_REL_AIRPORT_COUNTRY) 
  AND a.ADEP_DAY_ADEP = R.APT_ICAO
GROUP BY a.ADEP_DAY_ADEP, 
         a.ADEP_DAY_FLT_DATE,
         R.PRU_APT_NAME,
         R.PRU_STATE_NAME
ORDER BY 4,5;

SPOOL OFF;
QUIT


