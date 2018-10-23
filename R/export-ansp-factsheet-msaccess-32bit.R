# TO BE RUN by R 32-bits
library(dplyr)
library(stringr)
library(lubridate)
library(readr)
library(RODBC)
library(here)

# as from July use YYYY - 2 for the relevant Access file
tdy <- today()
yyyy <- tdy %>% year()

year <- ifelse(tdy %>% month() >= 7, yyyy - 2, yyyy - 3)

ace_factsheet <- str_glue(
  "G:/HQ/dgof-pru/Data/Application/Ace/ACE\ Factsheet/{year}/Database/ACE_{year}_factsheet.mdb",
  year = year)

con <- odbcConnectAccess2007(ace_factsheet)

sqlFetch(con, "Tbl_ACE_Admin", as.is = FALSE, stringsAsFactors = FALSE) %>% 
  as_tibble() %>% 
  write_rds(path = str_c(here(), "/data-config/tbl_admin.rds"))

sqlFetch(con,"Tbl_Main", as.is = FALSE, stringsAsFactors = FALSE) %>% 
  as_tibble() %>% 
  write_rds(str_c(here(), "/data-config/tbl_main.rds"))

sqlFetch(con,"ANSP_Q_FACT_FACTSHEET", as.is = FALSE, stringsAsFactors = FALSE) %>% 
  as_tibble() %>% 
  write_rds(str_c(here(), "/data-config/ansp_q_facts.rds"))



odbcClose(con)

# THIS crashes R session!!!!
# ace_graphics <- str_glue(
#   "G:/HQ/dgof-pru/Data/Application/Ace/ACE\ Factsheet/{year}/Database/ACE_graphic.mdb",
#   year = year)
# con <- odbcConnectAccess2007(ace_graphics)
# 
# sqlFetch(con, "Tbl_ACE_Graphics", as.is = FALSE, stringsAsFactors = FALSE) %>% 
#   as_tibble() %>% 
#   write_rds(path = str_c(here(), "/data-config/tbl_graphics.rds"))
# 
# odbcClose(con)
