set sqlformat csv;
set term off;
set feedback off;
SET TRIMSPOOL ON;
-- take name from argument 1
spool '&1';



SELECT TO_CHAR (t.cplx_date, 'YYYY') year,
            EXTRACT (MONTH FROM t.cplx_date) MONTH_NUM,
            TO_CHAR (t.cplx_date, 'MON') MONTH_MON,
            cplx_date as FLT_DATE,
            u.ansp_name ENTITY_NAME,
            'ANSP (AUA)' ENTITY_TYPE,
            SUM (ft)/12 CPLX_FLIGHT_HRS,
            SUM (tx)/12 CPLX_INTER_HRS,
            SUM (txv)/12 VERTICAL_INTER_HRS,
            SUM (txh)/12 HORIZ_INTER_HRS,
            SUM (txs)/12 SPEED_INTER_HRS
       FROM aua_complexity t, prudev.V_PRU_REL_CFMU_AUA_ANSP u
      WHERE     t.unit_code = u.aua_code
            AND fl >= 100
            AND t.cplx_date BETWEEN u.wef AND u.till
            AND u.ANSP_ACE_CODE IS NOT NULL
   --  AND u.pru_atc_type <> 'OAC'
   --  AND u.ansp_name NOT IN ('MILITARY', 'AIRPORT', 'UNKNOWN')
   GROUP BY TO_CHAR (t.cplx_date, 'YYYY'),
            EXTRACT (MONTH FROM t.cplx_date),
            TO_CHAR (t.cplx_date, 'MON'),
            cplx_date,
            u.ansp_name
   ORDER BY 4



spool off;
quit
