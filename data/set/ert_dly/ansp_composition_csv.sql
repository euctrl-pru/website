SET SQLFORMAT CSV;
SET TERM OFF;
SET VERIFY OFF;
SET FEEDBACK OFF;
SET TRIMSPOOL ON;
-- take output file name from argument 1
DEFINE OUTFILE = '&1'

-- take period from argument 2
DEFINE INSTANT = '&2'
SPOOL '&OUTFILE';



SELECT ANSP_NAME, PRU_ATC_TYPE, AUA_CODE, AUA_NAME
FROM PRUDEV.V_PRU_REL_CFMU_AUA_ANSP
WHERE
(WEF <= '&INSTANT' AND TILL >= '&INSTANT') AND
ANSP_NAME NOT IN (
    'MILITARY',
    'UNKNOWN',
    'AIRPORT',
    'BHANSA',
    'Avinor (Continental)',
    'Avinor (Oceanic)',
    'HungaroControl',
    'KFOR (HungaroControl)',
    'NATS',
    'NATS (Oceanic)',
    'NAV Portugal (Santa Maria)',
    'Israel AA',
    'ONDA'
)
ORDER BY LOWER(AUA_CODE), PRU_ATC_TYPE;

spool off;
quit
