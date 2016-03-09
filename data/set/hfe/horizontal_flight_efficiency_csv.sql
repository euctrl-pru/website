set sqlformat csv;
set term off;
set feedback off;
SET TRIMSPOOL ON;
-- take name from argument 1
spool '&1';


with inp1 as (select cast('31-mar-2016' as date) enddate, 10 bw_days from dual)

, inp2 as (select
extract(year from enddate+1) incomplete_year
, enddate - 364 - correctforleap(enddate) start_running
, enddate end_running
, bw_days / (365 + correctforleap(enddate)) cutoff from inp1)
, output as (
SELECT
 extract(year from od.entry_date) YEAR
,      EXTRACT (MONTH FROM od.entry_date) MONTH_NUM
,      TO_CHAR (od.entry_date, 'MON') MONTH_MON
,      od.entry_date
,      ENTITY_NAME
,      ENTITY_TYPE
,      model_type AS TYPE_MODEL
,      od.flown_km AS DIST_FLOWN_KM
,      od.direct_km as DIST_DIRECT_KM
,      od.achieved_km AS DIST_ACHIEVED_KM
,      CASE
          when entry_date < start_running or entry_date > end_running then 'O'
          WHEN PERCENT_RANK ()
               OVER (PARTITION BY mes_area, model_type, case when entry_date between start_running and end_running then 1 else 0 end
                     ORDER BY od.flown_km / od.achieved_km) <= cutoff
          THEN
             'B' --  || ' (' || start_running || ' to ' || end_running || ')'
          WHEN PERCENT_RANK ()
               OVER (PARTITION BY mes_area, model_type, case when entry_date between start_running and end_running then 1 else 0 end
                     ORDER BY od.flown_km / od.achieved_km) >= 1 - cutoff
          THEN
             'W' -- || ' (' || start_running || ' to ' || end_running || ')'
          else
             'I' -- || ' (' || start_running || ' to ' || end_running || ')'
       END
          T10_RUN_12M
, end_running end_date
,      CASE
          --when extract (year from entry_date) >= incomplete_year then 'O'
          WHEN PERCENT_RANK ()
               OVER (PARTITION BY mes_area, model_type, extract (year from entry_date)
                     ORDER BY od.flown_km / od.achieved_km) <= cutoff
         THEN
             'B'  -- || ' ' || extract (year from entry_date)
          WHEN PERCENT_RANK ()
               OVER (PARTITION BY mes_area, model_type, extract (year from entry_date)
                     ORDER BY od.flown_km / od.achieved_km) >= 1 - cutoff
          THEN
             'W'  -- || ' ' || extract (year from entry_date)
          else
             'I'  -- || ' ' || extract (year from entry_date)
       END
          T10_YYYY
  FROM inp2,
       PRUTEST.HFE_DAILY od
       join PRUTEST.DSH_BRIDGE_NAMES using(mes_area)
  where entry_date <= end_running
  ORDER by 4,5
)

select * from output
where year >= 2014;

spool off;
quit
