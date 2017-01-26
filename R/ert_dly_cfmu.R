dd <- read_csv("R/ert_dly_hh_cfmu.csv")

dd <- dd %>% 
  mutate(
    ERT_CSGV   = ERT_C_DLY + ERT_S_DLY + ERT_G_DLY + ERT_V_DLY,
    ERT_IRT    = ERT_I_DLY + ERT_R_DLY + ERT_T_DLY,
    ERT_DW     = ERT_D_DLY + ERT_W_DLY,
    ERT_AEMNOP = ERT_A_DLY + ERT_E_DLY + ERT_M_DLY + ERT_N_DLY + ERT_O_DLY + ERT_P_DLY,
    ER_Capacity_C = ERT_C_DLY,
    ER_Staffing_S = ERT_S_DLY,
    ER_Disruptions_TI = ERT_T_DLY + ERT_I_DLY,
    ER_Capacity_RVGM = ERT_R_DLY + ERT_V_DLY + ERT_G_DLY + ERT_M_DLY,
    ER_Disruptions_ANOE_NA = ERT_A_DLY +ERT_N_DLY + ERT_O_DLY + ERT_E_DLY,
    ER_Weather_WD = ERT_W_DLY + ERT_D_DLY,
    ER_Event_P = ERT_P_DLY) %>%
  select(YEAR, MONTH,
         DURATION_HR,
         APT_DLY, ERT_DLY,
         TDF_ERT,
         TDM, TDM_ARP, TDM_ERT,
         TTF_FLT,
         ERT_CSGV, ERT_IRT, ERT_DW, ERT_AEMNOP,
         ER_Capacity_C, ER_Capacity_RVGM,
         ER_Disruptions_ANOE_NA, ER_Disruptions_TI,
         ER_Event_P,
         ER_Staffing_S,
         ER_Weather_WD)

dds <- dd %>% 
  group_by(YEAR) %>% 
  summarise(sum_ttf_flt = sum(TTF_FLT),
            sum_duration_hr = sum(DURATION_HR),
            sum_tdm = sum(TDM),
            sum_tdm_ert = sum(TDM_ERT),
            sum_ert_dly = sum(ERT_DLY),
            sum_ert_csgv = sum(ERT_CSGV),
            sum_ert_irt = sum(ERT_IRT),
            sum_ert_dw= sum(ERT_DW),
            sum_tdm_arp = sum(TDM_ARP),
            sum_apt_dly = sum(APT_DLY),
            sum_ert_aemnop = sum(ERT_AEMNOP),
            sum_er_capacity_c = sum(ER_Capacity_C),
            sum_er_staffing_s = sum(ER_Staffing_S),
            sum_er_disruptions_ti = sum(ER_Disruptions_TI),
            sum_er_capacity_rvgm = sum(ER_Capacity_RVGM),
            sum_er_disruptions_anoe_na = sum(ER_Disruptions_ANOE_NA),
            sum_er_weather_wd = sum(ER_Weather_WD),
            sum_er_event_p = sum(ER_Event_P)) %>%

