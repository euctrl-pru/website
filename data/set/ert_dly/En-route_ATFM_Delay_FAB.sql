--FAB (AUA)

with delay as (select
                      ENTRY_DATE
                    , UNIT_ID as ID
                    , UNIT_CODE
                    , UNIT_TYPE
                    , UNIT_NAME
                    , AIRSPACE_TYPE
                    , SYN_TDM_ERT as DLY_ERT
                    , SYN_TDM_ERT_A as DLY_ERT_A
                    , SYN_TDM_ERT_C as DLY_ERT_C
                    , SYN_TDM_ERT_D as DLY_ERT_D
                    , SYN_TDM_ERT_E as DLY_ERT_E
                    , SYN_TDM_ERT_G as DLY_ERT_G
                    , SYN_TDM_ERT_I as DLY_ERT_I
                    , SYN_TDM_ERT_M as DLY_ERT_M
                    , SYN_TDM_ERT_N as DLY_ERT_N
                    , SYN_TDM_ERT_O as DLY_ERT_O
                    , SYN_TDM_ERT_P as DLY_ERT_P
                    , SYN_TDM_ERT_R as DLY_ERT_R
                    , SYN_TDM_ERT_S as DLY_ERT_S
                    , SYN_TDM_ERT_T as DLY_ERT_T
                    , SYN_TDM_ERT_V as DLY_ERT_V
                    , SYN_TDM_ERT_W as DLY_ERT_W
                    , SYN_TDM_ERT_NA as DLY_ERT_NA
                 from V_SYN12_FAC_TDC_UNIT_DD
                 where  unit_type = 'FAB_ANSP'
                    and airspace_type = 'AUA'
                    and entry_date >='01-JAN-2014'),

traffic as ( select
                   flt_date
                 , id
                 , type
                 , ttf_flt
              from pru_fact_traffic_airspace
              where type = 'FAB_ANSP'
                   -- and id = 13
                    and flt_date >='01-JAN-2014')

select
     to_char(t.flt_date,'YYYY') as YEAR
     , EXTRACT (MONTH FROM t.flt_date) MONTH_NUM
     , to_char(t.flt_date,'MON') as MONTH_MON
   , t.flt_date as FLT_DATE
   , d.unit_name as ENTITY_NAME
   , 'FAB (AUA)' as ENTITY_TYPE
   , t.ttf_flt as FLT_ERT_1
   , (nvl(d.DLY_ERT_A,0)+nvl( d.DLY_ERT_C,0)+ nvl(d.DLY_ERT_D,0) + nvl(d.DLY_ERT_E,0)) +
     (nvl(d.DLY_ERT_G,0)+nvl( d.DLY_ERT_I,0)+ nvl(d.DLY_ERT_M,0) + nvl(d.DLY_ERT_N,0)) +
     (nvl(d.DLY_ERT_O,0)+nvl( d.DLY_ERT_P,0)+ nvl(d.DLY_ERT_R,0) + nvl(d.DLY_ERT_S,0)) +
     (nvl(d.DLY_ERT_T,0)+nvl( d.DLY_ERT_V,0)+ nvl(d.DLY_ERT_W,0) + nvl(d.DLY_ERT_NA,0)) as DLY_ERT_1
   , nvl(d.DLY_ERT_A,0) as DLY_ERT_A_1
   , nvl(d.DLY_ERT_C,0) as DLY_ERT_C_1
   , nvl(d.DLY_ERT_D,0) as DLY_ERT_D_1
   , nvl(d.DLY_ERT_E,0) as DLY_ERT_E_1
   , nvl(d.DLY_ERT_G,0) as DLY_ERT_G_1
   , nvl(d.DLY_ERT_I,0) as DLY_ERT_I_1
   , nvl(d.DLY_ERT_M,0) as DLY_ERT_M_1
   , nvl(d.DLY_ERT_N,0) as DLY_ERT_N_1
   , nvl(d.DLY_ERT_O,0) as DLY_ERT_O_1
   , nvl(d.DLY_ERT_P,0) as DLY_ERT_P_1
   , nvl(d.DLY_ERT_R,0) as DLY_ERT_R_1
   , nvl(d.DLY_ERT_S,0) as DLY_ERT_S_1
   , nvl(d.DLY_ERT_T,0) as DLY_ERT_T_1
   , nvl(d.DLY_ERT_V,0) as DLY_ERT_V_1
   , nvl(d.DLY_ERT_W,0) as DLY_ERT_W_1
   , nvl(d.DLY_ERT_NA,0) as DLY_ERT_NA_1
  from traffic t left join delay d on (
     d.id = t.id and d.ENTRY_DATE = t.flt_date)
     where t.flt_date >= '1-JAN-2014' and t.flt_date <'01-JUL-2015'
     AND d.unit_name NOT in ('BLUE MED FAB (+Albania)')
     order by 1,2,3,4
