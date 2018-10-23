library(lubridate)
library(magrittr)
library(stringr)

cfmu_airac_epoch <- function() {
  ymd("1984-09-27", tz = "UTC")
}

cfmu_airac_epoch_number <- function() {
  184
}

# retur a CFMU AIRAC number given a (UTC) date "YYYY-mm-dd"
cfmu_airac <- function(date) {
  d <- ymd(date, tz = "UTC")
  extra_days <- ((cfmu_airac_epoch() %--% d) %/% days(1)) %% 28
  cy_beg <- (d - days(extra_days))
  num_cycles <- ((cfmu_airac_epoch() %--% cy_beg) %/% days(1)) %/% 28
  num_cycles
}

cfmu_airac_interval <- function(cfmu_airac) {
  a_beg <- cfmu_airac_epoch() + ddays((cfmu_airac) * 28)
  a_end <- a_beg + ddays(28)
  a_beg %--% a_end
}

# AIRAC epoch as from ICAO Doc 8126 section 2.6.2 b)
# https://www.icao.int/NACC/Documents/Meetings/2014/ECARAIM/REF09-Doc8126.pdf
airac_epoch <- function() {
  ymd("1998-01-29", tz = "UTC")
}

airac <- function(date) {
  d <- ymd(date, tz = "UTC")
  y_beg <- floor_date(d, "year")
  extra_days <- (cfmu_airac_epoch() %--% d) %/% days(1) %% 28
  num_cycles <- ((y_beg %--% d) %/% days(1) - extra_days) %/% 28 + 1
  cy <- sprintf("%02d", num_cycles)
  yy <- format(d, "%y")
  paste0(yy, cy)
}

# print the effective date of the first AIRAC for year `year`
airac_year_epoch <- function(year) {
  y_beg <- ymd(str_c(year, "-01-01"), tz = "UTC")
  # days since last effective date
  extra_days <- (airac_epoch() %--% y_beg) %/% days(1) %% 28
  y_beg - days(extra_days) + days(28)
}


airac_interval <- function(airac) {
  year <- ymd(str_c(str_sub(airac, 1, 2), "-01-01"), tz = "UTC") %>% year()
  cycle <- as.integer(str_sub(airac, 3, 4))
  y_epoch <- airac_year_epoch(year)
  a_beg <- y_epoch + ddays((cycle - 1) * 28)
  a_end <- a_beg + ddays(28)
  a_beg %--% a_end
}
