library(tidyverse)
library(stringr)
library(lubridate)

#library(ggseas) # TODO: investigate

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
  dly_details <-  dly_details %>% mutate_at(c("delay_type"), factor)
  
  # make entity type a factor
  dly_details <-  dly_details %>% mutate_at(c("entity_type"), factor)
  
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
fir_ert_dly_all <- load_ert_dly_for(monthpattern = "2013.*",entity = "fir")
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
