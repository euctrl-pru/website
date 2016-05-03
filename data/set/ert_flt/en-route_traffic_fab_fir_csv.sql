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
  TO_CHAR(ENTRY_DATE,'YYYY') as YEAR,
  UNIT_NAME as ENTITY_NAME,
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
FROM
  PRUDEV.V_PRU_FAC_TDC_DD
WHERE
  UNIT_PRU_TYPE = 'FAB_FIR' and
  UNIT_NAME NOT in ('BLUE MED FAB (+Albania)', 'FAB CE (SES RP1)', 'FAB CE') and
  ENTRY_DATE >= '&WEF' and ENTRY_DATE < '&TIL'
GROUP BY TO_CHAR(ENTRY_DATE,'YYYY'), UNIT_NAME;


SPOOL OFF;
QUIT
