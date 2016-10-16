With data as (
select * FROM PRUDEV.V_PRU_FAC_TDC_DD
WHERE ENTRY_DATE >= '1-JAN-2011' and ENTRY_DATE <'01-SEP-2016'
)


SELECT
to_char(ENTRY_DATE,'YYYY') as YEAR,
EXTRACT (MONTH FROM ENTRY_DATE) MONTH_NUM,
to_char(ENTRY_DATE,'MON') as MONTH_MON,
ENTRY_DATE as FLT_DATE,
case unit_name
        when 'EUROCONTROL' then 'EUROCONTROL Area (MS)'
        when 'SES Performance Scheme SES-RP1 based on ANSP' then 'SES Area (RP1)'
end ENTITY_NAME,
'AREA (AUA)' as ENTITY_TYPE,
TTF_FLT as FLT_ERT_1,
TDM_ERT as DLY_ERT_1,
TDM_ERT_A as DLY_ERT_A_1,
TDM_ERT_C as DLY_ERT_C_1,
TDM_ERT_D as DLY_ERT_D_1,
TDM_ERT_E as DLY_ERT_E_1,
TDM_ERT_G as DLY_ERT_G_1,
TDM_ERT_I as DLY_ERT_I_1,
TDM_ERT_M as DLY_ERT_M_1,
TDM_ERT_N as DLY_ERT_N_1,
TDM_ERT_O as DLY_ERT_O_1,
TDM_ERT_P as DLY_ERT_P_1,
TDM_ERT_R as DLY_ERT_R_1,
TDM_ERT_S as DLY_ERT_S_1,
TDM_ERT_T as DLY_ERT_T_1,
TDM_ERT_V as DLY_ERT_V_1,
TDM_ERT_W as DLY_ERT_W_1,
TDM_ERT_NA as DLY_ERT_NA_1,
TDF_ERT as FLT_ERT_1_DLY,
TDF_15_ERT as FLT_ERT_1_DLY_15
FROM data
where
(UNIT_PRU_TYPE = 'ZONE' and unit_id in (58)) or
(UNIT_PRU_TYPE = 'ZONE_ANSP' and unit_id in (55))

UNION ALL

SELECT
to_char(ENTRY_DATE,'YYYY') as YEAR,
EXTRACT (MONTH FROM ENTRY_DATE) MONTH_NUM,
to_char(ENTRY_DATE,'MON') as MONTH_MON,
ENTRY_DATE as FLT_DATE,
unit_name as ENTITY_NAME,
'ANSP (AUA)' as ENTITY_TYPE,
TTF_FLT as FLT_ERT_1,
TDM_ERT as DLY_ERT_1,
TDM_ERT_A as DLY_ERT_A_1,
TDM_ERT_C as DLY_ERT_C_1,
TDM_ERT_D as DLY_ERT_D_1,
TDM_ERT_E as DLY_ERT_E_1,
TDM_ERT_G as DLY_ERT_G_1,
TDM_ERT_I as DLY_ERT_I_1,
TDM_ERT_M as DLY_ERT_M_1,
TDM_ERT_N as DLY_ERT_N_1,
TDM_ERT_O as DLY_ERT_O_1,
TDM_ERT_P as DLY_ERT_P_1,
TDM_ERT_R as DLY_ERT_R_1,
TDM_ERT_S as DLY_ERT_S_1,
TDM_ERT_T as DLY_ERT_T_1,
TDM_ERT_V as DLY_ERT_V_1,
TDM_ERT_W as DLY_ERT_W_1,
TDM_ERT_NA as DLY_ERT_NA_1,
TDF_ERT as FLT_ERT_1_DLY,
TDF_15_ERT as FLT_ERT_1_DLY_15
FROM data
where
UNIT_PRU_TYPE = 'ANSP' and
unit_name NOT in ('NATS','NATS (Oceanic)','HungaroControl',
'Avinor (Continental)','Avinor (Oceanic)','NAV Portugal (Santa Maria)',
'UNKNOWN','MILITARY','AIRPORT','PIA','BHANSA', 'KFOR (HungaroControl)' )

order by 4,5