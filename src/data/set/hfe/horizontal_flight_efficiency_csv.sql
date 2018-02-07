set sqlformat csv;
set term off;
set feedback off;
SET TRIMSPOOL ON;
-- take name from argument 1
spool '&1';

WITH sd AS (SELECT CAST ('01-jan-2014' AS DATE) start_date FROM DUAL)
SELECT EXTRACT (YEAR FROM entry_date) YEAR
,        EXTRACT (MONTH FROM entry_date) MONTH_NUM
,        TO_CHAR (entry_date, 'MON') MONTH_MON
,        entry_date
,        ENTITY_NAME
,        ENTITY_TYPE
,        model_type AS TYPE_MODEL
,        flown_km AS DIST_FLOWN_KM
,        round(direct_km, 2) AS DIST_DIRECT_KM
,        round(achieved_km, 2) AS DIST_ACHIEVED_KM
FROM PRUTEST.HFE_DAILY JOIN PRUTEST.DSH_BRIDGE_NAMES USING (mes_area)
WHERE entry_date BETWEEN (SELECT start_date FROM sd)
AND (SELECT MAX (TRUNC (entry_date + 1, 'MON') - 1)
end_day
FROM sd, HFE_DAILY
WHERE entry_date >= start_date)
ORDER BY 4, 5;

spool off;
quit
