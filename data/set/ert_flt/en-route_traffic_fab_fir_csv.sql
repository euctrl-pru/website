set sqlformat csv;
set term off;
set feedback off;
SET TRIMSPOOL ON;
-- take name from argument 1
spool '&1';


select
to_char(ENTRY_DATE,'YYYY') as YEAR,
unit_name as ENTITY_NAME,
SUM(TTF_FLT) as FLT_ERT_1,
SUM(TDM_ERT) as DLY_ERT_1,
SUM(TDM_ERT_A) as DLY_ERT_A_1,
SUM(TDM_ERT_C )as DLY_ERT_C_1,
SUM(TDM_ERT_D) as DLY_ERT_D_1,
SUM(TDM_ERT_E) as DLY_ERT_E_1,
SUM(TDM_ERT_G) as DLY_ERT_G_1,
SUM(TDM_ERT_I) as DLY_ERT_I_1,
SUM(TDM_ERT_M) as DLY_ERT_M_1,
SUM(TDM_ERT_N) as DLY_ERT_N_1,
SUM(TDM_ERT_O) as DLY_ERT_O_1,
SUM(TDM_ERT_P) as DLY_ERT_P_1,
SUM(TDM_ERT_R) as DLY_ERT_R_1,
SUM(TDM_ERT_S) as DLY_ERT_S_1,
SUM(TDM_ERT_T) as DLY_ERT_T_1,
SUM(TDM_ERT_V) as DLY_ERT_V_1,
SUM(TDM_ERT_W) as DLY_ERT_W_1,
SUM(TDM_ERT_NA) as DLY_ERT_NA_1
from PRUDEV.V_PRU_FAC_TDC_DD
where UNIT_PRU_TYPE = 'FAB_FIR' and
unit_name NOT in ('BLUE MED FAB (+Albania)', 'FAB CE (SES RP1)', 'FAB CE')
and ENTRY_DATE >= '1-JAN-2015' and ENTRY_DATE <'01-JAN-2016'
group by to_char(ENTRY_DATE,'YYYY'), unit_name;


spool off;
quit
