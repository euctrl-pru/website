## Plot a heatmap of number of flight thru the years

library(tidyverse)
# library(dplyr)
# library(readr)
# library(stringr)
# library(purrr)
library(lubridate)
# library(tidyr)
# library(forcats)



ftype <- "fir"
csvs <- dir(
  path = "static/download/csv", 
  pattern = str_c("ert_dly_",ftype,"_\\d{4}\\.csv\\.bz2"),
  full.names = TRUE)


get_ert_dly <- function(path) {
  col_types <- cols(
    # HACK: read doubles by default and then cast to integer
    # FIX: fix on write_csv
    .default = col_double(),
    YEAR = col_integer(),
    MONTH_NUM = col_integer(),
    MONTH_MON = col_character(),
    FLT_DATE = col_datetime(format = ""),
    ENTITY_NAME = col_character(),
    ENTITY_TYPE = col_character()
  )
  
  read_csv(path, col_types = col_types) %>%
    mutate(
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
}


all <- csvs %>%
  map(get_ert_dly) %>%
  bind_rows()

## ---- ert-dly-renaming
all <- all %>% 
  rename(
    date = FLT_DATE,
    yyyy = YEAR,
    mm = MONTH_NUM,
    entity_name = ENTITY_NAME,
    flights = FLT_ERT_1) %>%
  select(date, yyyy, mm, entity_name, flights) %>% 
  mutate(
    date = ymd(date),
    entity_name = as_factor(entity_name),
    dd = day(date),
    wk = week(date),
    week = week(date),
    wd = wday(date, week_start = 1),
    weekday = wday(date, week_start = 1, label = TRUE, abbr = TRUE),
    weekday = fct_relevel(weekday, c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")),
    month = month(date, label = TRUE, abbr = TRUE),
    month = as_factor(month),
    month = fct_relevel(month, c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"))
  ) %>% 
  # ok here we group by year and month and then calculate the week of the month 
  # we are currently in
  dplyr::group_by(yyyy, mm) %>% 
  dplyr::mutate(wmonth = 1 + week - min(week)) %>% 
  dplyr::ungroup() 
  


# ---- plot-preparation
flt_spain <- all %>% filter(entity_name == "Spain")


ggplot(flt_spain, aes(x = week, y = wd, fill = flights)) + 
  geom_tile(colour = "white") + 
  facet_wrap(~ yyyy, ncol = 1) + 
  scale_fill_gradient(low = "red", high = "yellow") +
  # scale_fill_gradientn(colours = c("#D61818","#FFAE63","#FFFFBD","#B5E384")) + 
  labs(
    title = "Calendar heatmap of number of flight",
    x = "Week of Month",
    y = NULL)

