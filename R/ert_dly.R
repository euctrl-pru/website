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

# return a list of
#
#
#
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


# FABs
fab_yy <- fir_avg_dly_entity %>% filter(grepl("FAB", entity_name))

fab_dd <- fir_dly_details %>% 
  filter(grepl("FAB", entity_name)) %>%
  filter(!(entity_name %in% c("FAB CE (SES RP1)"))) %>%
  mutate(avg_dd = ifelse(num_flights == 0, 0, delay_total / num_flights))


g <- ggplot(fab_dd, aes(date, avg_dd))
g <- g + geom_line() + scale_x_date(date_labels = "%b-%Y", date_minor_breaks = "1 month")
g <- g + facet_wrap(~entity_name, nrow = 5)
g <- g + labs(title = "Average Daily En-route ATFM Delay",
              y = "Average Delay (min/flight)") +
  theme(axis.text.x = element_text(angle = 40, hjust = 1))
ggsave("R/avg_delay_per_fab.png")


# There are few interesting peaks:
# let's check Aug 2016
fff <- fab_dd %>%
  filter(between(date, as.Date("2016-08-01"), as.Date("2016-08-31")))
g <- ggplot(fff, aes(date, avg_dd))
g <- g + geom_line() + scale_x_date(date_labels = "%d-%b", date_minor_breaks = "1 day")
g <- g + facet_wrap(~entity_name, nrow = 5)
g <- g + labs(title = "Average Daily En-route ATFM Delay: Aug 2016",
              y = "Average Delay (min/flight)") +
  theme(axis.text.x = element_text(angle = 40, hjust = 1))
# annotate SW FAB plot
ddd <- fab_dd %>% 
  filter(between(date, as.Date("2016-08-23"), as.Date("2016-08-23"))) %>%
  filter((entity_name %in% c("SW FAB") & delay_type == "C"))
g <- g + 
  geom_point(data = ddd) +
  geom_text(data = ddd, label = "Strike (Spain)", hjust = 1, nudge_x = 0.1)
ggsave("R/spain_strike_aug_2016.png")


# SES Area
ses_yy <- fir_avg_dly_entity %>% filter(grepl("SES", entity_name))

# Let'splot France
fr_dly <- continental_yy %>% filter(entity_name == "France")

gg_fr <- ggplot(fr_dly, aes(yyyy, avg_dly_yy))
gg_fr <- gg_fr + geom_bar(stat="identity", aes(fill = delay_type)) +
  labs(title = "Yearly Average Daily En-route ATFM Delay: France")
ggsave("R/yearly_avg_delay_cause_France.png")

continental_dly_type_yy <- continental_dd %>%
  mutate(yyyy = year(date)) %>%
  group_by(yyyy, delay_type) %>%
  summarise(delay_per_type = sum(delay), num_flights = sum(num_flights),
            delay_flt = delay_per_type / num_flights)

gg_type <- ggplot(continental_dly_type_yy, aes(yyyy, delay_flt)) +
  geom_bar(stat="identity", aes(fill = delay_type)) +
  labs(title = "Yearly Average Daily En-route ATFM Delays: (continental) States")
ggsave("R/yearly_avg_delay_cause_Continental.png")



# install streamgraph
# see http://www.nytimes.com/interactive/2016/08/08/sports/olympics/history-olympic-dominance-charts.html
# devtools::install_github("hrbrmstr/streamgraph")

# library(streamgraph)
# # streamgraph of total delay per country
# continental_yy %>% streamgraph("entity_name", "avg_dly_yy", "yyyy", interactive=FALSE) %>%
#   sg_axis_x(1, "year", "%Y") %>%
#   sg_legend(show=FALSE)
# #  sg_legend(show=FALSE, label="Country: ")
# 
# ggsave("R/stt_dly_yy_streamgraph.png")


# TODO: stremgraph of the total different delays


##### choropleth
library(rgdal)
library(rgeos)
library(scales)

theme_map <- function(base_size=10, base_family="") {
  require(grid)
  theme_bw(base_size=base_size, base_family=base_family) %+replace%
    theme(axis.line=element_blank(),
          axis.text=element_blank(),
          axis.ticks=element_blank(),
          axis.title=element_blank(),
          panel.background=element_blank(),
          panel.border=element_blank(),
          panel.grid=element_blank(),
          #          panel.grid.major = element_line(colour = "grey"),
          #          panel.grid.minor = element_line(colour = "grey"),
          panel.margin=unit(0, "lines"),
          plot.background=element_blank(),
          legend.justification = c(0,0), 
          legend.position = "left"
    )
}

map = readOGR("R/states.topojson", "states", verbose = FALSE)

#   Albania (LA,AL,8), Armenia (UD,AM,51), Austria (LO,AT,40),
#   Belgium (EB,BE,56), Bosnia and Herzegovina (LQ,BA,70), Bulgaria (LB,BG,100),
#   Croatia (LD,HR,191), Cyprus (LC,CY,196), Czech Republic (LK,CZ,203),
#   Denmark (EK,DK,208),
#   Estonia (EE,EE,233),
#   Finland (EF,FI,246), France (LF,FR,250),
#   Georgia (UG,GE,268), Germany(ED/ET,DE,276), Greece (LG,GR,300),
#   Hungary (LH,HU,348),
#   Ireland (EI,IE,372), Italy (LI,IT,380),
#   Latvia (EV,LV,428), Lithuania (EY,LT,440), Luxembourg (EL,LU,442),
#   Malta (LM,MT,470), Moldova (LU,MD,498), Monaco (LN,MC,492), Montenegro (LY,ME,499),
#   Netherlands (EH,NL,528), Norway (EN,NO,578),
#   Poland (EP,PL,616), Portugal (LP,PT,620),
#   Romania (LR,RO,642),
#   Serbia (LY,RS,688), Slovakia (LZ,SK,703), Slovenia (LJ,SI,705),
#   Spain (LE,ES,724), Sweden (ES,SE,752), Switzerland (LS,CH,756),
#   The former Yugoslav Republic of Macedonia (LW,MK,807), Turkey (LT,TR,792),
#   Ukraine (UK,UA,804), United Kingdom of Great Britain and Northern Ireland (EG,GB,826).

map_name <- data.frame(
  icao  = c("LA", "UD", "LO",
            "EB", "LQ", "LB",
            "LD", "LC", "LK",
            "EK",
            "EE",
            "EF", "LF",
            "UG", "ED", "LG",
            "LH",
            "EI", "LI",
            "EV", "EY", "EL",
            "LM", "LU", "LN", "LY",
            "EH", "EN",
            "EP", "LP",
            "LR",
            "LY", "LZ", "LJ",
            "LE", "ES", "LS",
            "LW", "LT",
            "UK", "EG"
  ),
  id = c("Albania", "Armenia", "Austria",
         "Belgium", "Bosnia and Herzegovina", "Bulgaria",
         "Croatia", "Cyprus", "Czech Republic",
         "Denmark",
         "Estonia",
         "Finland", "France",
         "Georgia", "Germany", "Greece",
         "Hungary",
         "Ireland", "Italy",
         "Latvia", "Lithuania", "Luxembourg",
         "Malta", "Moldova", "Monaco", "Montenegro",
         "Netherlands", "Norway",
         "Poland", "Portugal Continental",
         "Romania",
         "Serbia", "Slovakia", "Slovenia",
         "Spain Continental", "Sweden", "Switzerland",
         "The former Yugoslav Republic of Macedonia", "Turkey",
         "Ukraine", "UK Continental"
  )
)

map_df <- fortify(map)
map_df <- merge(map_df, map_name, by="id")
#map_df <- merge(map_df, csv_tb, by="id")

# find fabs centers
centers <- data.frame(gCentroid(map, byid=TRUE))
centers$state <- map_name$id

map_tb <- tbl_df(map_df)

# read in the state borders
countries = readOGR("graphics/en-route_atfm_delay_fab/world-50m.json", "countries", verbose = FALSE)
countries_df <- fortify(countries)

gg <- ggplot()
# thick white border for states
gg <- gg + geom_map(data=countries_df, map=countries_df,
                    aes(map_id=id, x=long, y=lat, group=group),
                    color="white", size=0.1, alpha=0.35, fill="#bbbbbb")

gg <- gg + geom_map(data=map_df, map=map_df,
                    aes(map_id=id, x=long, y=lat, group=group, fill=efficiency),
                    color="white", size=0.05, alpha = 0.5) +
  scale_fill_distiller(name="Efficiency\n(actual trj, %)", palette = "YlGn", breaks = pretty_breaks(n = 5))

proj.type <- "albers"
proj.stdlats <- c(50.0, 60.0)
proj.orient <- c(0,52.4,0)

gg <- gg + geom_text(data=centers, aes(label=fab, x=x, y=y), size=3)
gg <- gg + coord_map(projection = proj.type, lat0 = 50.0, lat1 = 60.0)

# grid lines
gg <- gg + 
  scale_x_continuous(breaks = seq(-23.0, 28, by = 10)) +
  scale_y_continuous(breaks = seq( 24.0, 80, by = 10))

gg <- gg + labs(x="", y="", title="Horizontal Flight Efficiency - Jan - Aug 2016")
gg <- gg + theme_map()

# EU 
gg <- gg + xlim(-23.0, 28.0)
gg <- gg + ylim( 24.0, 80.0)
gg
