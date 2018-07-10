library(dplyr)
library(ggplot2)
library(viridis)
library(scales)

source("R/read-ert-dly.R")

ectrl_details_yyyy <- ectrl_details %>%
  group_by(yyyy, delay_group) %>%
  summarise(delay = sum(delay))

ectrl_summaries_yyyy <- ectrl_summaries %>%
  group_by(yyyy) %>%
  summarise(
    flt_tot = sum(flights),
    flt_dly = sum(flights_delayed),
    flt_dly_gt15 = sum(flights_delayed_gt15))


ectrl_yyyy <- inner_join(ectrl_details_yyyy, ectrl_summaries_yyyy, by = "yyyy")

ectrl_yyyy <-  ectrl_yyyy %>% ungroup() %>% mutate(yyyy = ymd(yyyy, truncated = 2L))

g <- ggplot(ectrl_yyyy, aes(x = yyyy, y = delay / flt_tot, fill = delay_group))

ert_dly_yyyy_plot <- g +
  geom_bar(stat = "identity") +
  # scale_x_date(
  #   date_labels = "%Y",
  #   date_breaks = "1 year") +
  scale_x_continuous(breaks = seq(2008, 2017, 1)) +
  scale_fill_viridis(
    discrete = TRUE,
    name = "Delay group",
    breaks = c("W", "E", "D", "C", "Da", "Sa", "Ca"),
    labels = c(
      "Weather", "Events (non ATC)",
      "Disruptions (non ATC)",
      "Capacity (non ATC)",
      "Disruptions (ATC)",
      "Staffing (ATC)",
      "Capacity (ATC)"
    )
  ) +
  labs(
    x = "Year",
    y = "En-route ATFM delay (min/flight)",
    title = "Yearly en-route ATFM delay",
    subtitle = "Split per delay group"
  ) +
  theme(legend.position = c(0.85, 0.8))

ggsave("_assets/images/ert_dly_yyy.png", plot = ert_dly_yyyy_plot)

# library(plotly)
# ggplotly(plot)


## -------------------------------
# add sums for all delays for each year
all_causes <- ectrl_yyyy %>%
  group_by(yyyy) %>%
  summarise(
    delay_group = "all",
    delay = sum(delay),
    flt_tot = sum(flt_tot),
    flt_dly = sum(flt_dly),
    flt_dly_gt15 = sum(flt_dly_gt15)
  )

#ectrl_yyyy <- ectrl_yyyy %>% bind_rows(all_causes) %>% arrange(yyyy)

# reorder delay_group from bigger contributors to lower ones,
# i.e. typically Ca, Sa, Da, C, D, E, W
lvls <- c("Ca", "Sa", "W", "Da", "E", 'C', "D")
lbls <- c(
  "Capacity (ATC)", # Ca
  "Staffing (ATC)", # Sa
  "Weather", # W
  "Disruptions (ATC)", # Da
  "Events (non ATC)", # E
  "Capacity (non ATC)", # C
  "Disruptions (non ATC)" # D
)


ectrl_yyyy <- ectrl_yyyy %>%
  mutate(delay_group = forcats::fct_relevel(delay_group, lvls))



g <- ggplot(ectrl_yyyy, aes(x = yyyy, y = delay / flt_tot, fill = delay_group))

g + geom_line(aes(group = delay_group, colour = delay_group))
yyyy_min <- min(year(ectrl_yyyy$yyyy))
yyyy_max <- max(year(ectrl_yyyy$yyyy))
g + geom_bar(stat = "identity", position = "dodge") +
  scale_x_date(breaks = date_breaks("years"), labels = date_format("%Y")) +
  scale_fill_viridis(
    discrete = TRUE,
    name = "Delay group",
    breaks = lvls,
    labels = lbls
  ) +
  labs(
    x = "Year",
    y = "En-route ATFM delay (min/flight)",
    title = "Yearly en-route ATFM delay",
    subtitle = "Split per delay group"
  ) +
  theme(
    legend.position = c(0.807, 0.82),
    axis.text.x = element_text(angle = 40, hjust = 0.8, vjust = 0.5))
