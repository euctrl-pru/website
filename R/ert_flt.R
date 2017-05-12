#!/usr/bin/env Rscript

"Export en-route daily traffic to CSV.

Usage: ert_flt_export [-h] [-t TYPE] WEF TIL

  -h --help             show this help text
  -t TYPE, --type=TYPE  the TYPE of entity; one of country, ansp, fab [default: ansp]
" -> doc

suppressMessages(library(docopt))

# retrieve the command-line arguments
opts <- docopt(doc)

typ <- c("ansp", "country", "fab")

if (!(opts$type %in% typ)) {
  cat("Error: incorrect TYPE, it must be one of", paste0(typ, collapse = ", "), "\n")
  cat(doc, "\n")
  q(status = -1)
} else {
  type <- opts$type
}

suppressMessages(library(lubridate))
suppressMessages(library(purrr))

safe_ymd <- safely(ymd)
wef <- safe_ymd(opts$WEF, quiet = TRUE)
til <- safe_ymd(opts$TIL, quiet = TRUE)

if (is.null(wef$result) || is.null(til$result)) {
  cat("Error: invalid WEF and/or TIL, it must be in YYYY-MM-DD format", "\n")
  cat(doc, "\n")
  q(status = -1)
} else {
  wef <- format(wef$result, "%Y-%m-%d")
  til <- format(til$result, "%Y-%m-%d")
}

usr <- Sys.getenv("PRU_DEV_USR")
pwd <- Sys.getenv("PRU_DEV_PWD")
dbn <- Sys.getenv("PRU_DEV_DBNAME")

if (usr == "") {
  cat("Error: you should at least set your DB user via PRU_DEV_USR")
  q(status = -1)
}

library('ROracle')
library(stringr)
library(dplyr)
library(readr)


# NOTE: to be set before you create your ROracle connection!
# See http://www.oralytics.com/2015/05/r-roracle-and-oracle-date-formats_27.html
tz <- "UDT"
Sys.setenv("TZ" = tz)
Sys.setenv("ORA_SDTZ" = "UTC")

drv <- dbDriver("Oracle")
con <- dbConnect(drv, usr, pwd, dbname='porape5')

sqlq_ansp <- "WITH DATA as (
SELECT * FROM PRUDEV.V_PRU_FAC_TDC_DD
WHERE ENTRY_DATE >= TO_DATE(?WEF, 'YYYY-MM-DD') and ENTRY_DATE < TO_DATE(?TIL, 'YYYY-MM-DD')
)


SELECT
TO_CHAR(ENTRY_DATE,'YYYY') as YEAR,
EXTRACT (MONTH FROM ENTRY_DATE) MONTH_NUM,
TO_CHAR(ENTRY_DATE,'MON') as MONTH_MON,
ENTRY_DATE as FLT_DATE,
CASE UNIT_NAME
WHEN 'EUROCONTROL' THEN 'EUROCONTROL Area (MS)'
WHEN 'SES Performance Scheme SES-RP1 based on ANSP' THEN 'SES Area (RP1)'
END ENTITY_NAME,
'AREA (AUA)' as ENTITY_TYPE,
TTF_FLT as FLT_ERT_1,
TDM_ERT as DLY_ERT_1,
TDM_ERT_A as DLY_ERT_A_1,
TDM_ERT_C as DLY_ERT_C_1,
TDM_ERT_D as DLY_ERT_D_1,
TDM_ERT_E as DLY_ERT_E_1,
TDM_ERT_G as DLY_ERT_G_1,
TDM_ERT_I as DLY_ERT_I_1,
TDM_ERT_M as DLY_ERT_M_1,
TDM_ERT_N as DLY_ERT_N_1,
TDM_ERT_O as DLY_ERT_O_1,
TDM_ERT_P as DLY_ERT_P_1,
TDM_ERT_R as DLY_ERT_R_1,
TDM_ERT_S as DLY_ERT_S_1,
TDM_ERT_T as DLY_ERT_T_1,
TDM_ERT_V as DLY_ERT_V_1,
TDM_ERT_W as DLY_ERT_W_1,
TDM_ERT_NA as DLY_ERT_NA_1
FROM data
WHERE
(UNIT_PRU_TYPE = 'ZONE' and UNIT_ID IN (58)) OR
(UNIT_PRU_TYPE = 'ZONE_ANSP' and UNIT_ID IN (55))

UNION ALL

SELECT
TO_CHAR(ENTRY_DATE,'YYYY') as YEAR,
EXTRACT (MONTH FROM ENTRY_DATE) MONTH_NUM,
TO_CHAR(ENTRY_DATE,'MON') as MONTH_MON,
ENTRY_DATE as FLT_DATE,
CASE UNIT_NAME
WHEN 'SES Performance Scheme SES-RP2 based on FIR' THEN 'SES Area (RP2)'
END ENTITY_NAME,
'AREA (FIR)' as ENTITY_TYPE,
TTF_FLT as FLT_ERT_1,
TDM_ERT as DLY_ERT_1,
TDM_ERT_A as DLY_ERT_A_1,
TDM_ERT_C as DLY_ERT_C_1,
TDM_ERT_D as DLY_ERT_D_1,
TDM_ERT_E as DLY_ERT_E_1,
TDM_ERT_G as DLY_ERT_G_1,
TDM_ERT_I as DLY_ERT_I_1,
TDM_ERT_M as DLY_ERT_M_1,
TDM_ERT_N as DLY_ERT_N_1,
TDM_ERT_O as DLY_ERT_O_1,
TDM_ERT_P as DLY_ERT_P_1,
TDM_ERT_R as DLY_ERT_R_1,
TDM_ERT_S as DLY_ERT_S_1,
TDM_ERT_T as DLY_ERT_T_1,
TDM_ERT_V as DLY_ERT_V_1,
TDM_ERT_W as DLY_ERT_W_1,
TDM_ERT_NA as DLY_ERT_NA_1
FROM DATA
WHERE
(UNIT_PRU_TYPE = 'ZONE_FIR' and UNIT_ID IN (56))
and ENTRY_DATE >= '1-JAN-2015'

UNION ALL

SELECT
TO_CHAR(ENTRY_DATE,'YYYY') as YEAR,
EXTRACT (MONTH FROM ENTRY_DATE) MONTH_NUM,
TO_CHAR(ENTRY_DATE,'MON') as MONTH_MON,
ENTRY_DATE as FLT_DATE,
UNIT_NAME as ENTITY_NAME,
'FAB (FIR)' as ENTITY_TYPE,
TTF_FLT as FLT_ERT_1,
TDM_ERT as DLY_ERT_1,
TDM_ERT_A as DLY_ERT_A_1,
TDM_ERT_C as DLY_ERT_C_1,
TDM_ERT_D as DLY_ERT_D_1,
TDM_ERT_E as DLY_ERT_E_1,
TDM_ERT_G as DLY_ERT_G_1,
TDM_ERT_I as DLY_ERT_I_1,
TDM_ERT_M as DLY_ERT_M_1,
TDM_ERT_N as DLY_ERT_N_1,
TDM_ERT_O as DLY_ERT_O_1,
TDM_ERT_P as DLY_ERT_P_1,
TDM_ERT_R as DLY_ERT_R_1,
TDM_ERT_S as DLY_ERT_S_1,
TDM_ERT_T as DLY_ERT_T_1,
TDM_ERT_V as DLY_ERT_V_1,
TDM_ERT_W as DLY_ERT_W_1,
TDM_ERT_NA as DLY_ERT_NA_1
FROM DATA
WHERE
UNIT_PRU_TYPE = 'FAB_FIR' and
UNIT_NAME NOT IN ('BLUE MED FAB (+Albania)') and
ENTRY_DATE >= '1-JAN-2015'

UNION ALL

SELECT
TO_CHAR(ENTRY_DATE,'YYYY') as YEAR,
EXTRACT (MONTH FROM ENTRY_DATE) MONTH_NUM,
TO_CHAR(ENTRY_DATE,'MON') as MONTH_MON,
ENTRY_DATE as FLT_DATE,
UNIT_NAME as ENTITY_NAME,
'ANSP (AUA)' as ENTITY_TYPE,
TTF_FLT as FLT_ERT_1,
TDM_ERT as DLY_ERT_1,
TDM_ERT_A as DLY_ERT_A_1,
TDM_ERT_C as DLY_ERT_C_1,
TDM_ERT_D as DLY_ERT_D_1,
TDM_ERT_E as DLY_ERT_E_1,
TDM_ERT_G as DLY_ERT_G_1,
TDM_ERT_I as DLY_ERT_I_1,
TDM_ERT_M as DLY_ERT_M_1,
TDM_ERT_N as DLY_ERT_N_1,
TDM_ERT_O as DLY_ERT_O_1,
TDM_ERT_P as DLY_ERT_P_1,
TDM_ERT_R as DLY_ERT_R_1,
TDM_ERT_S as DLY_ERT_S_1,
TDM_ERT_T as DLY_ERT_T_1,
TDM_ERT_V as DLY_ERT_V_1,
TDM_ERT_W as DLY_ERT_W_1,
TDM_ERT_NA as DLY_ERT_NA_1
FROM DATA
WHERE
UNIT_PRU_TYPE = 'ANSP' and
UNIT_NAME NOT IN ('NATS','NATS (Oceanic)','HungaroControl',
'Avinor (Continental)','Avinor (Oceanic)','NAV Portugal (Santa Maria)',
'UNKNOWN','MILITARY','AIRPORT','PIA','BHANSA', 'KFOR (HungaroControl)',
'Israel AA', 'ONDA' )
ORDER BY 4,5
"


sqlq_fab_fir <- "SELECT
  TO_CHAR(ENTRY_DATE,'YYYY') as YEAR,
  EXTRACT (MONTH FROM ENTRY_DATE) MONTH_NUM,
  TO_CHAR(ENTRY_DATE,'MON') as MONTH_MON,
  ENTRY_DATE as FLT_DATE,
  UNIT_NAME  as ENTITY_NAME,
  TTF_FLT    as FLT_ERT_1,
  TDM_ERT    as DLY_ERT_1,
  TDM_ERT_A  as DLY_ERT_A_1,
  TDM_ERT_C  as DLY_ERT_C_1,
  TDM_ERT_D  as DLY_ERT_D_1,
  TDM_ERT_E  as DLY_ERT_E_1,
  TDM_ERT_G  as DLY_ERT_G_1,
  TDM_ERT_I  as DLY_ERT_I_1,
  TDM_ERT_M  as DLY_ERT_M_1,
  TDM_ERT_N  as DLY_ERT_N_1,
  TDM_ERT_O  as DLY_ERT_O_1,
  TDM_ERT_P  as DLY_ERT_P_1,
  TDM_ERT_R  as DLY_ERT_R_1,
  TDM_ERT_S  as DLY_ERT_S_1,
  TDM_ERT_T  as DLY_ERT_T_1,
  TDM_ERT_V  as DLY_ERT_V_1,
  TDM_ERT_W  as DLY_ERT_W_1,
  TDM_ERT_NA as DLY_ERT_NA_1
FROM
  PRUDEV.V_PRU_FAC_TDC_DD
WHERE
  UNIT_PRU_TYPE = 'FAB_FIR' and
  UNIT_NAME NOT in ('BLUE MED FAB (+Albania)', 'FAB CE (SES RP1)', 'FAB CE') and
  ENTRY_DATE >= TO_DATE(?WEF, 'YYYY-MM-DD') and ENTRY_DATE < TO_DATE(?TIL, 'YYYY-MM-DD')
ORDER BY FLT_DATE, ENTITY_NAME
"
if (type == "ansp") {
  sqlq <- sqlq_ansp
} else if (type == "fab") {
  sqlq <- sqlq_fab_fir
} else if (type == "country") {
  
} else {
  cat("Error: invalida TYPE,", type)
  q(status = -1)
}

query <- sqlInterpolate(con, sqlq, WEF = wef, TIL = til)
flt <- dbSendQuery(con, query)
data <- fetch(flt, n = -1) 

dbDisconnect(con)
Sys.unsetenv("TZ")
Sys.unsetenv("ORA_SDTZ")

data <- data %>%
  as.tbl() %>%
  mutate(
    YEAR = as.integer(YEAR),
    MONTH_NUM = as.integer(MONTH_NUM),
    FLT_ERT_1 = as.integer(FLT_ERT_1),
    DLY_ERT_1 = as.integer(DLY_ERT_1),
    DLY_ERT_A_1 = as.integer(DLY_ERT_A_1),
    DLY_ERT_C_1 = as.integer(DLY_ERT_C_1),
    DLY_ERT_D_1 = as.integer(DLY_ERT_D_1),
    DLY_ERT_E_1 = as.integer(DLY_ERT_E_1),
    DLY_ERT_G_1 = as.integer(DLY_ERT_G_1),
    DLY_ERT_I_1 = as.integer(DLY_ERT_I_1),
    DLY_ERT_M_1 = as.integer(DLY_ERT_M_1),
    DLY_ERT_N_1 = as.integer(DLY_ERT_N_1),
    DLY_ERT_O_1 = as.integer(DLY_ERT_O_1),
    DLY_ERT_P_1 = as.integer(DLY_ERT_P_1),
    DLY_ERT_R_1 = as.integer(DLY_ERT_R_1),
    DLY_ERT_S_1 = as.integer(DLY_ERT_S_1),
    DLY_ERT_T_1 = as.integer(DLY_ERT_T_1),
    DLY_ERT_V_1 = as.integer(DLY_ERT_V_1),
    DLY_ERT_W_1 = as.integer(DLY_ERT_W_1),
    DLY_ERT_NA_1 = as.integer(DLY_ERT_NA_1)
  ) %>%
  arrange(FLT_DATE, ENTITY_NAME)



mySave <- function(df, ftype) {
  y <- unique(df$YEAR)
  write_csv(df, str_c("data/csv/ert_", ftype, "_", y, ".csv.bz2"), na = "")
  df
}

# use purrr::partial to pass ftype
s <- partial(mySave, ftype = "flt")

data %>% group_by(YEAR) %>% do(s(.))

