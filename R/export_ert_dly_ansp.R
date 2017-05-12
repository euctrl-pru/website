#!/usr/bin/env Rscript

"Export to CSV daily en-route ATFM delays for ANSP (AUA based).

Usage: export_ert_dly_ansp [-h] WEF TIL

  -h --help             show this help text

Arguments:
  WEF  date from when to export data, format YYYY-MM-DD
  TIL  date till when to export data, format YYYY-MM-DD (non-inclusive)
" -> doc

suppressMessages(library(docopt))

# retrieve the command-line arguments
opts <- docopt(doc)

suppressMessages(library(lubridate))

wef <- ymd(opts$WEF, quiet = TRUE)
til <- ymd(opts$TIL, quiet = TRUE)


if (is.na(wef) || is.na(til)) {
  cat("Error: invalid WEF and/or TIL, it must be in YYYY-MM-DD format", "\n")
  q(status = -1)
} else {
  wef <- format(wef, "%Y-%m-%d")
  til <- format(til, "%Y-%m-%d")
}



usr <- Sys.getenv("PRU_DEV_USR")
pwd <- Sys.getenv("PRU_DEV_PWD")
dbn <- Sys.getenv("PRU_DEV_DBNAME")

if (usr == "") {
  cat("Error: you should at least set your DB user via PRU_DEV_USR")
  q(status = -1)
}

suppressMessages(library('ROracle'))
suppressMessages(library(stringr))
suppressMessages(library(dplyr))
suppressMessages(library(readr))
suppressMessages(library(purrr))


# NOTE: to be set before you create your ROracle connection!
# See http://www.oralytics.com/2015/05/r-roracle-and-oracle-date-formats_27.html
tz <- "UDT"
Sys.setenv("TZ" = tz)
Sys.setenv("ORA_SDTZ" = "UTC")

drv <- dbDriver("Oracle")
con <- dbConnect(drv, usr, pwd, dbname = dbn)

sqlq <- "WITH data AS (
SELECT * FROM PRUDEV.V_PRU_FAC_TDC_DD
WHERE ENTRY_DATE >= TO_DATE(?WEF, 'YYYY-MM-DD') AND ENTRY_DATE < TO_DATE(?TIL, 'YYYY-MM-DD')
)


SELECT
TO_CHAR(ENTRY_DATE,'YYYY') AS YEAR,
EXTRACT (MONTH FROM ENTRY_DATE) MONTH_NUM, TO_CHAR(ENTRY_DATE,'MON') AS MONTH_MON,
ENTRY_DATE AS FLT_DATE,
CASE UNIT_NAME
WHEN 'EUROCONTROL' THEN 'EUROCONTROL Area (MS)'
WHEN 'SES Performance Scheme SES-RP1 based on ANSP' THEN 'SES Area (RP1)'
END ENTITY_NAME,
'AREA (AUA)' as ENTITY_TYPE,
TTF_FLT AS FLT_ERT_1,
TDM_ERT as DLY_ERT_1,
TDM_ERT_A AS DLY_ERT_A_1,
TDM_ERT_C AS DLY_ERT_C_1,
TDM_ERT_D AS DLY_ERT_D_1,
TDM_ERT_E AS DLY_ERT_E_1,
TDM_ERT_G AS DLY_ERT_G_1,
TDM_ERT_I AS DLY_ERT_I_1,
TDM_ERT_M AS DLY_ERT_M_1,
TDM_ERT_N AS DLY_ERT_N_1,
TDM_ERT_O AS DLY_ERT_O_1,
TDM_ERT_P AS DLY_ERT_P_1,
TDM_ERT_R AS DLY_ERT_R_1,
TDM_ERT_S AS DLY_ERT_S_1,
TDM_ERT_T AS DLY_ERT_T_1,
TDM_ERT_V AS DLY_ERT_V_1,
TDM_ERT_W AS DLY_ERT_W_1,
TDM_ERT_NA AS DLY_ERT_NA_1,
TDF_ERT AS FLT_ERT_1_DLY,
TDF_15_ERT AS FLT_ERT_1_DLY_15
FROM data
WHERE
(UNIT_PRU_TYPE = 'ZONE' AND UNIT_ID IN (58)) OR
(UNIT_PRU_TYPE = 'ZONE_ANSP' AND UNIT_ID IN (55))

UNION ALL

SELECT
TO_CHAR(ENTRY_DATE,'YYYY') AS YEAR,
EXTRACT (MONTH FROM ENTRY_DATE) MONTH_NUM, TO_CHAR(ENTRY_DATE,'MON') AS MONTH_MON,
ENTRY_DATE AS FLT_DATE,
UNIT_NAME AS ENTITY_NAME,
'ANSP (AUA)' as ENTITY_TYPE,
TTF_FLT AS FLT_ERT_1,
TDM_ERT AS DLY_ERT_1,
TDM_ERT_A AS DLY_ERT_A_1,
TDM_ERT_C AS DLY_ERT_C_1,
TDM_ERT_D AS DLY_ERT_D_1,
TDM_ERT_E AS DLY_ERT_E_1,
TDM_ERT_G AS DLY_ERT_G_1,
TDM_ERT_I AS DLY_ERT_I_1,
TDM_ERT_M AS DLY_ERT_M_1,
TDM_ERT_N AS DLY_ERT_N_1,
TDM_ERT_O AS DLY_ERT_O_1,
TDM_ERT_P AS DLY_ERT_P_1,
TDM_ERT_R AS DLY_ERT_R_1,
TDM_ERT_S AS DLY_ERT_S_1,
TDM_ERT_T AS DLY_ERT_T_1,
TDM_ERT_V AS DLY_ERT_V_1,
TDM_ERT_W AS DLY_ERT_W_1,
TDM_ERT_NA AS DLY_ERT_NA_1,
TDF_ERT AS FLT_ERT_1_DLY,
TDF_15_ERT AS FLT_ERT_1_DLY_15
FROM data
WHERE
UNIT_PRU_TYPE = 'ANSP' AND
UNIT_NAME NOT IN ('NATS','NATS (Oceanic)','HungaroControl',
'Avinor (Continental)','Avinor (Oceanic)','NAV Portugal (Santa Maria)',
'UNKNOWN','MILITARY','AIRPORT','PIA','BHANSA', 'KFOR (HungaroControl)', 'Israel AA', 'ONDA' )

ORDER BY 4,5"


query <- sqlInterpolate(con, sqlq, WEF = wef, TIL = til)
flt <- dbSendQuery(con, query)
data <- fetch(flt, n = -1) 

data <- data %>%
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

dbDisconnect(con)
Sys.unsetenv("TZ")
Sys.unsetenv("ORA_SDTZ")

mySave <- function(df) {
  y <- unique(df$YEAR)
  write_csv(df, str_c("data/csv/ert_dly_ansp_", y, ".csv.bz2"), na = "")
  df
}

data %>% group_by(YEAR) %>% do(mySave(.))
