set sqlformat csv;
set term off;
set feedback off;
SET TRIMSPOOL ON;
-- take name from argument 1
spool '&1';


SELECT ANSP_NAME, PRU_ATC_TYPE, AUA_CODE, AUA_NAME
FROM PRUDEV.V_PRU_REL_CFMU_AUA_ANSP
WHERE
(WEF >= '01-JAN-2015' AND TILL > '01-JAN-2020') AND
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
'NAV Portugal (Santa Maria)'
)
ORDER BY LOWER(ANSP_NAME), PRU_ATC_TYPE;

spool off;
quit
