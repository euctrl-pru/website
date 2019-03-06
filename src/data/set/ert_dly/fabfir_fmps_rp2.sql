SELECT UNIT_TYPE,
UNIT_NAME,
CFMU_TVS_CODE
FROM PRUDEV.V_PRU_REL_CFMU_TVS_UNIT
WHERE     unit_type = 'FAB_FIR'
AND unit_id NOT IN (15, 4)  -- RP2 only (15: FAB CE (SES RP1) and 4: FAB CE excluded)
AND till_rel_1 >= '01-jan-2015'
AND till_rel_2 > '01-jan-2015'
AND till_rel_3 >= '01-jan-2015'
AND till_rel_4 >= ' 01-jan-2015'
