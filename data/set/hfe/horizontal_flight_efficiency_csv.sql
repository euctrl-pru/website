set sqlformat csv;
set term off;
set feedback off;
SET TRIMSPOOL ON;
-- take name from argument 1
spool '&1';


with days as (select distinct trunc(entry_date +1, 'MON') -1 end_day from HFE_DAILY where entry_date >= '31-dec-2014')

, inp
              AS (SELECT DISTINCT
                         mes_area
,                        end_day
,                        CASE model_type
                            WHEN 'FTFM' THEN 'KEP'
                            WHEN 'CPF' THEN 'KEA'
                            ELSE 'ERR'
                         END
                            key_indicator
,                        entry_date
,                        flown_km
,                        achieved_km
,                        CASE
                            WHEN DENSE_RANK ()
                                 OVER (PARTITION BY mes_area, end_day, model_type
                                       ORDER BY flown_km / achieved_km) <=
                                    10
                            THEN
                               'EL'
                            WHEN DENSE_RANK ()
                                 OVER (PARTITION BY mes_area, end_day, model_type
                                       ORDER BY flown_km / achieved_km) >
                                    365 + correctforleap(end_day) - 10
                            THEN
                               'EH'
                            ELSE
                               'I'
                         END
                            cat
                    FROM days join  HFE_DAILY on(
                        entry_date > end_day - 365 - correctforleap(end_day)
                         AND entry_date <= end_day)
                         )

,             inter
              AS (SELECT DISTINCT
                         mes_area
,                        end_day
,                        key_indicator
,                        cat
,                          SUM (flown_km)
                              OVER (PARTITION BY mes_area, end_day, key_indicator)
                         / SUM (achieved_km)
                              OVER (PARTITION BY mes_area, end_day, key_indicator)
                            hfe
,                          SUM (
                              flown_km)
                           OVER (
                              PARTITION BY mes_area, end_day, key_indicator, cat)
                         / SUM (
                              achieved_km)
                           OVER (
                              PARTITION BY mes_area, end_day, key_indicator, cat)
                            hfe_cat
,                        LISTAGG (entry_date, ', ')
                         WITHIN GROUP (ORDER BY entry_date)
                         OVER (PARTITION BY mes_area, end_day, key_indicator, cat)
                            dates_cat
                    FROM inp)
, output as (
         SELECT entity_name
         , entity_type
,               end_day
,               key_indicator
,               ROUND ( (i.hfe - 1) * 100, 2) hfe
,               ROUND ( (i.hfe_cat - 1) * 100, 2) corrected
,               l.dates_cat excluded_low
,               ROUND ( (l.hfe_cat - 1) * 100, 2) best_hfe
,               h.dates_cat excluded_high
,               ROUND ( (h.hfe_cat - 1) * 100, 2) worst_hfe

           FROM inter i join PRUTEST.DSH_BRIDGE_NAMES using(mes_area)
                JOIN inter l USING (mes_area, end_day, key_indicator)
                JOIN inter h USING (mes_area, end_day, key_indicator)
          WHERE l.cat = 'EL' AND h.cat = 'EH' AND i.cat = 'I'
          ;
)

select * from output
where year >= 2014;

spool off;
quit
