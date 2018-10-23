#############################
# generate ANSP fact sheets #
#############################
library(dplyr)
library(lubridate)
library(stringr)
library(here)
library(sf)
library(knitr)
library(kableExtra)
library(purrr)
library(ggmap)
library(smoothr)

#devtools::install_github("r-lib/clisymbols")
#library(clisymbols)

fill_ansp_holes <- function(data, ansp_shortname) {
  if (ansp_shortname == "ENAIRE") {
    data
  }
  else {
    fill_holes(data, Inf)
  }
}

get_ansp_gis <- function(tbl_gis, ansp_shortname) {
  flt_level <- ifelse(ansp_shortname %in% c("Belgocontrol"), 150, 300)
  ansp_gis <- tbl_gis %>%
    filter(NAME == ansp_shortname) %>%
    filter(MIN_FLIGHT_LEVEL <= flt_level, MAX_FLIGHT_LEVEL >= flt_level) %>%
    fill_ansp_holes(ansp_shortname)

  ansp_gis  
}

generate_ansp_map <- function(ansp_gis, ansp_shortname) {
  ansp_gis.sp <- as(ansp_gis, "Spatial")
  
  bb <- ansp_gis %>% st_bbox(crs = 4326)
  # centroid
  centroid <- ansp_gis %>%
    st_transform(23032) %>%
    st_centroid() %>%
    st_transform(4326) %>%
    st_coordinates() %>%
    as_data_frame() %>%
    `names<-`(c("lon", "lat"))
  
  mbb <- make_bbox(
    lon = c(bb["xmin"], bb["xmax"]),
    lat = c(bb["ymin"], bb["ymax"]),
    f = 0.2
  )
  
  z <- calc_zoom(mbb)
  # z <- 6
  
  m <- get_map(location = centroid, zoom = z, maptype = "toner-lite")
  terrain <- ggmap(m)
  ansp_gis.sp.df <- ansp_gis %>% as("Spatial") %>% fortify
  
  #----------------------------------------------------------------
  # ggmap approach without cropping
  # inspired by
  # https://ryanpeek.github.io/2017-11-21-mapping-with-sf-part-3/
  #----------------------------------------------------------------
  pg <- terrain +
    geom_polygon(
      data = ansp_gis.sp.df,
      aes(x = long, y = lat),
      fill = "blue",
      color = "orange",
      lwd = 0.8,
      alpha = 0.3)
  ggsave(str_c(generate_ansp_base_filename(ansp_shortname), ".png", collapse = ""), path = "static/images/ansp/")
}


generate_ansp_base_filename <- function(ansp_shortname) {
  ansp_shortname %>% str_to_lower() %>% str_replace_all(' ', '-')
}



generate_ansp <- function(ansp_main, ansp_gis, ansp_qfac, ansp_admin) {

  ansp_shortname <- ansp_main$ANSP_short
  

  # prepare the data for factsheet
  to_millions <- function(val) {
    val  %>% `/`(1e6) %>% round(0)
  }
  
  to_thousands <- function(val) {
    val  %>% `/`(1e3) %>% round(0)
  }
  
  year_report <- as.integer(ansp_qfac$YEAR_REPORT)
  year_now <- year_report + 2
  
  total_revenue <- ansp_qfac$REVE_REVENUE %>% to_millions()
  total_cost <-
    (ansp_qfac$COST_COST + ansp_qfac$COST_MET) %>% to_millions() # !!!! CHECK formula
  provision_cost <- ansp_qfac$COST_CONTROLLABLE %>% to_millions()
  total_assets <-
    (
      ansp_qfac$ERT_ASET_OPERAT_FIX + ansp_qfac$ERT_ASET_CONSTR_FIX +
        ansp_qfac$TRM_ASET_CONSTR_FIX + ansp_qfac$TRM_ASET_OPERAT_FIX
    ) %>% to_millions()
  total_capex <- ansp_qfac$ASET_CAPEX  %>% to_millions()
  
  service_gat <- ifelse(ansp_main$GAT == 1, "Y", "X")
  service_oat <- ifelse(ansp_main$OAT == 1, "Y", "X")
  service_uas <- ifelse(ansp_main$UAS == 1, "Y", "X")
  service_las <- ifelse(ansp_main$LAS == 1, "Y", "X")
  service_oce <- ifelse(ansp_main$Oceanic == 1, "Y", "X")
  service_met <- ifelse(ansp_main$Int_Met == 1, "Y", "X")
  
  
  staff_atco <- ansp_qfac$STAF_ATCO # !!!! or ATCO_NB ?
  staff_all <- ansp_qfac$STAF_STAFF_BY_TYPE
  
  ifr_hours_controlled <- ansp_qfac$ANSP_IFR_HR %>% to_thousands()
  apt_movements_controlled <-
    ansp_qfac$ANSP_IFR_AIRP_MVT %>% to_thousands()
  
  ert_max_sectors <- ansp_qfac$ANSP_ACC_MAXC_SECTOR
  atfm_delays <-
    ifelse(is.na(ansp_qfac$TDM), 0, ansp_qfac$TDM) %>% to_thousands()
  
  
  generate_ansp_map(ansp_gis, ansp_shortname)
  
  
  minus <- `-`
  
  tfile <- str_c(here::here(), "/R/ansp-template.Rmd")
  ofile <- str_c(
    "new-",
    ansp_admin$ANSP_short %>% str_to_lower() %>% str_replace_all(' ', '-'),
    ".html"
  )
  odir <- str_c(here::here(), "/content/reference/ansp")
  
  rmarkdown::render(input = tfile,
    output_file = ofile,
    output_dir = odir)
}


# Fixed to ggmap:calc_zoom
# see https://github.com/dkahle/ggmap/pull/141
calc_zoom <- function(lon, lat, data, adjust = 0, f = 0.05)
{
  if (!missing(adjust))
    stopifnot(is.integer(adjust))
  if (missing(data)) {
    if (missing(lat)) {
      bbox <- lon
      errorString <- "if specifying a bounding box, the format should match that of make_bbox."
      if (length(bbox) != 4)
        stop(errorString, call. = FALSE)
      if (!all(names(bbox) == c("left", "bottom", "right",
        "top")))
        stop(errorString, call. = FALSE)
      lon_range <- bbox[c("left", "right")]
      lat_range <- bbox[c("bottom", "top")]
    }
    else {
      if (length(lon) != 2 || length(lat) != 2 || !is.numeric(lon) ||
          !is.numeric(lat))
        stop("if specifying ranges, they both must be of length 2 and numeric.")
      lon_range <- sort(lon)
      lat_range <- sort(lat)
    }
  }
  else {
    lon <- data[, deparse(substitute(lon))]
    lat <- data[, deparse(substitute(lat))]
    bbox <- make_bbox(lon, lat, f = f)
    lon_range <- bbox[c("left", "right")]
    lat_range <- bbox[c("bottom", "top")]
  }
  lonlength <- diff(lon_range)
  latlength <- diff(lat_range)
  zoomlon <- ceiling(log2(360 * 2/lonlength))
  zoomlat <- ceiling(log2(180 * 2/latlength))
  # FIXED: use min() instead of max() in order to include the whole bbox
  zoom <- min(zoomlon, zoomlat)
  zoom + adjust
}






generate_ansp_factsheet <- function(tbl_admin, tbl_main, tbl_qfac, tbl_gis) {
  s <- seq(1:nrow(tbl_admin))
  for (idx in s) {
    ansp_admin <- tbl_admin %>%
      dplyr::filter(row_number() == idx) %>%
      dplyr::slice(1)
    
    ansp_main <- tbl_main %>%
      dplyr::filter(row_number() == idx) %>%
      dplyr::slice(1)
    
    ansp_qfac <- tbl_qfac %>%
      filter(SK_ANSP_ID == ansp_main$ANSP_ID) %>%
      filter(YEAR_DATA == max(YEAR_REPORT),
        YEAR_REPORT == max(YEAR_REPORT))
    
    ansp_shortname <- ansp_admin$ANSP_short
    ansp_gis <- get_ansp_gis(tbl_gis, ansp_shortname)

    generate_ansp(ansp_main, ansp_gis, ansp_qfac, ansp_admin)
  }
}




# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# TODO: define when to refresh the factsheet data 
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
if (FALSE) {
  # read relevant ANSP data from "relevant" ACE Access DB
  ## run the 32 bit script
  pathIn32BitRScript <- str_c(here::here(), "/R/export-ansp-factsheet-msaccess-32bit.R")
  system(str_c(Sys.getenv("R_HOME"), "/bin/i386/Rscript.exe ", pathIn32BitRScript))
}

tbl_admin <- readRDS(str_c(here::here(), "/data-config/tbl_admin.rds")) %>% as_tibble()
tbl_main <- readRDS(str_c(here::here(), "/data-config/tbl_main.rds")) %>% as_tibble()
tbl_qfac <- readRDS(str_c(here::here(), "/data-config/ansp_q_facts.rds")) %>% as_tibble()
tbl_gis <- st_read(str_c(here::here(), "/static/download/gis/ansp-ace-437.geojson"))

generate_ansp_factsheet(tbl_admin, tbl_main, tbl_qfac, tbl_gis)
