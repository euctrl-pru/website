library(tidyverse)
library(stringr)
library(lubridate)

#library(ggseas) # TODO: investigate

# get the list of CSV files for en-route ATFM delay
get_ert_dly <- function(path) {
  col_types <- cols(
    YEAR = col_integer(),
    MONTH_NUM = col_integer(),
    MONTH_MON = col_character(),
    FLT_DATE = col_date(format = "%d-%b-%y"),
    ENTITY_NAME= col_character(),
    ENTITY_TYPE = col_character(),
    FLT_ERT_1 = col_integer(),
    DLY_ERT_1 = col_integer(),
    DLY_ERT_A_1 = col_integer(),
    DLY_ERT_C_1 = col_integer(),
    DLY_ERT_D_1 = col_integer(),
    DLY_ERT_E_1 = col_integer(),
    DLY_ERT_G_1 = col_integer(),
    DLY_ERT_I_1 = col_integer(),
    DLY_ERT_M_1 = col_integer(),
    DLY_ERT_N_1 = col_integer(),
    DLY_ERT_O_1 = col_integer(),
    DLY_ERT_P_1 = col_integer(),
    DLY_ERT_R_1 = col_integer(),
    DLY_ERT_S_1 = col_integer(),
    DLY_ERT_T_1 = col_integer(),
    DLY_ERT_V_1 = col_integer(),
    DLY_ERT_W_1 = col_integer(),
    DLY_ERT_NA_1 = col_integer(),
    FLT_ERT_1_DLY = col_integer(),
    FLT_ERT_1_DLY_15 = col_integer()
  ) 
  read_csv(path, col_types = col_types) %>%
    select(
      # yyyy = YEAR, mm = MONTH_NUM,
      date = FLT_DATE, 
      #day = day(date),
      entity_name = ENTITY_NAME, entity_type = ENTITY_TYPE,
      num_flights = FLT_ERT_1,
      delay_total = DLY_ERT_1,
      A = DLY_ERT_A_1,
      C = DLY_ERT_C_1,
      D = DLY_ERT_D_1,
      E = DLY_ERT_E_1,
      G = DLY_ERT_G_1,
      I = DLY_ERT_I_1,
      M = DLY_ERT_M_1,
      N = DLY_ERT_N_1,
      O = DLY_ERT_O_1,
      P = DLY_ERT_P_1,
      R = DLY_ERT_R_1,
      S = DLY_ERT_S_1,
      `T` = DLY_ERT_T_1,
      V = DLY_ERT_V_1,
      W = DLY_ERT_W_1,
      `NA` = DLY_ERT_NA_1,
      delayed_flights = FLT_ERT_1_DLY,
      delayed_flights_gt15 = FLT_ERT_1_DLY_15
    ) %>%
    arrange(date, entity_name)
}

# read in ert_dly file (FIR by default)
load_ert_dly_for <- function(entity = "fir") {
  file_pattern <- str_c("ert_dly_", entity, "_.*.csv$")
  csvs <- list.files(path = "data/csv", pattern = file_pattern, full.names = TRUE)
  all <- lapply(csvs, get_ert_dly)
  ert_dly <- bind_rows(all)
  # make entity (name) var into factor
  ert_dly <- ert_dly %>% mutate_each(funs(factor), entity_name)
  return(ert_dly)
}


# TIDY!!!
# There are 3 groups of datasets (they are both calculated by COUNTRY FIRs kind of geography):
# 1. daily summary values;
#     a. datestamp, entity (id), # of flights,
#     b. datestamp, entity (id), # of flights delayed,
#     c. datestamp, entity (id), # flights delays > 15min
#     d. datestamp, entity (id), total_delay
#
# 2. daily details;
#     e. datestamp, entity, delay_type (A, C, D, E, G, ...), delay
#
# 3. entities;
#    * id, name, type (country, fab, area)
#
# NOTE: entities of different type are geograpfically overlapping, i.e. FIR or FAB or SES Area
get_summaries <- function(df) {
  # is it correct to ZERO NAs?
  dly_summaries <- df %>% 
    select(date, entity_name, num_flights, delayed_flights, delayed_flights_gt15) %>%
    mutate(delayed_flights = ifelse(is.na(delayed_flights), 0, delayed_flights)) %>%
    mutate(delayed_flights_gt15 = ifelse(is.na(delayed_flights_gt15), 0, delayed_flights_gt15))
  
  dly_summaries
}

get_details <- function(df) {
  dly_details <- df %>% 
    select(-delayed_flights, -delayed_flights_gt15) %>%
    gather(key = delay_type, value = delay, A:`NA`)
  
  # make delay_type factors
  dly_details <-  dly_details %>% mutate_each(funs(factor), delay_type)
  
  # make entity type a factor
  dly_details <-  dly_details %>% mutate_each(funs(factor), entity_type)
  
  # IS IT CORRECT to ZERO NAs????
  # zero delay_total cells which are NA
  dly_details <- dly_details %>%
    mutate(delay = ifelse(is.na(delay), 0, delay)) %>%
    mutate(delay_total = ifelse(is.na(delay_total), 0, delay_total))
  
  dly_details
}


get_averages <- function(details_df) {  
  avg_dly_entity <- details_df %>%
    mutate(yyyy = year(date)) %>%
    group_by(entity_name, delay_type, yyyy) %>%
    summarise(flt_entity_yy = sum(num_flights),
              dly_entity_yy = sum(delay_total),
              avg_dly_yy = dly_entity_yy / flt_entity_yy)
  
  avg_dly_entity
}


####### FIR ########
fir_ert_dly_all <- load_ert_dly_for(entity = "fir")
fir_dly_details <- get_details(fir_ert_dly_all)
fir_avg_dly_entity <- get_averages(fir_dly_details)
fir_dly_summaries <- get_summaries(fir_ert_dly_all)

# state yearly
fir_dly_stt_yy <- fir_avg_dly_entity %>% 
  filter(!grepl("COUNTRY", entity_name))

# (continental) States
continental_yy <- fir_dly_stt_yy %>%
  filter(!(entity_name %in% c("Portugal", "Portugal Santa Maria"))) %>%
  filter(!(entity_name %in% c("Spain", "Spain Canarias"))) %>%
  filter(!(entity_name %in% c("United Kingdom")))

continental_dd <- fir_dly_details %>%
  filter(!(entity_name %in% c("Portugal", "Portugal Santa Maria"))) %>%
  filter(!(entity_name %in% c("Spain", "Spain Canarias"))) %>%
  filter(!(entity_name %in% c("United Kingdom")))

continental_dly_type_yy <- continental_dd %>%
  mutate(yyyy = year(date)) %>%
  group_by(yyyy, delay_type) %>%
  summarise(delay_per_type = sum(delay), num_flights = sum(num_flights),
            delay_flt = delay_per_type / num_flights)


# FABs
fab_yy <- fir_avg_dly_entity %>% filter(grepl("FAB", entity_name))

fab_dd <- fir_dly_details %>% 
  filter(grepl("FAB", entity_name)) %>%
  filter(!(entity_name %in% c("FAB CE (SES RP1)"))) %>%
  mutate(avg_dd = ifelse(num_flights == 0, 0, delay_total / num_flights))


# SES Area
ses_yy <- fir_avg_dly_entity %>% filter(grepl("SES", entity_name))
