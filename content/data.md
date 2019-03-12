---
title: Data
categories:
  - download
  - data

ndwk_i: <i class="fa pru fa-flask"></i>
fltr_i: <i class="fa pru fa-filter"></i>
attn_i: <i class="fa pru fa-exclamation-triangle"></i>
---

## <img src="/images/prcq-operations-enroute.png" width="40" height="40" alt="Operations En-route"> Operations En-route

| Data description                                                                                                                                                                                                  | Period                                                                                           | <i class="fas fa-file-excel"></i>                                       | CSV                                         | Info                                |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------|---------------------------------------------|---------------------------------------------|-----------------------------------------|
| En-route IFR flights and ATFM delays [(AUA)][DefAUA]<br><em>no post ops adjustments</em><br><small>Daily IFR traffic and en-route [ATFM delay][ATFMdelay] by entity and delay cause (AUA based)</small>                | {{% getdata "dwnld" "ert_dly_aua_beg" %}} - {{% getdata "dwnld" "ert_dly_aua_end" %}}            | [{{% dwnld_i %}}][ERT-DLY-AUAxlsx]      |                                             | [{{% info_i %}}][ERT-DLY-AUA-meta] |
| En-route IFR flights and ATFM delays [(AUA)][DefAUA]<br><em>[with post ops adjustments][PostOps]</em><br><small>Daily IFR traffic and en-route [ATFM delay][ATFMdelay] by entity and delay cause (AUA based)</small>       | {{% getdata "dwnld" "ert_dly_aua_post_beg" %}} - {{% getdata "dwnld" "ert_dly_aua_post_end" %}}  | [{{% dwnld_i %}}][ERT-DLY-AUA-postxlsx] |                                             | [{{% info_i %}}][ERT-DLY-AUA-meta] |
| En-route IFR flights and ATFM delays [(FIR)][DefFIR]<br><em>no post ops adjustments</em><br><small>Daily IFR traffic and en-route [ATFM delay][ATFMdelay] by entity and delay cause (FIR based)</small>                | {{% getdata "dwnld" "ert_dly_fir_beg" %}} - {{% getdata "dwnld" "ert_dly_fir_end" %}}            | [{{% dwnld_i %}}][ERT-DLY-FIRxlsx]      |                                             | [{{% info_i %}}][ERT-DLY-FIR-meta] |
| En-route IFR flights and ATFM delays [(FIR)][DefFIR]<br><em>[with post ops adjustments][PostOps]</em><br><small>Daily IFR traffic and en-route [ATFM delay][ATFMdelay] by entity and delay cause (FIR based)</small>       | {{% getdata "dwnld" "ert_dly_fir_post_beg" %}} - {{% getdata "dwnld" "ert_dly_fir_post_end" %}}  | [{{% dwnld_i %}}][ERT-DLY-FIR-postxlsx] |                                             | [{{% info_i %}}][ERT-DLY-FIR-meta] |
| Horizontal en-route flight efficiency <br><small>Daily [en-route flight efficiency][DefFE] data by entity ([KEP][DefKEP] and [KEA][DefKEA])</small>                                                               | {{% getdata "dwnld" "hfe_beg" %}} - {{% getdata "dwnld" "hfe_end" %}}                            | [{{% dwnld_i %}}][HFExlsx]              | [{{% fltr_i %}} {{% ndwk_i %}}][HFEcsv] | [{{% info_i %}}][HFEmeta]          |

[ATFMdelay]: /reference/definition/atfm-delay/ "ATFM Delay definition"

[ERT-DLY-AUAxlsx]: /download/xls/En-Route_ATFM_Delay_AUA.xlsm "ERT-DLY (Excel)"
[ERT-DLY-AUA-postxlsx]: /download/xls/En-Route_ATFM_Delay_AUA_post_ops.xlsm "ERT-DLY-PO (Excel)"

[ERT-DLY-FIRxlsx]: /download/xls/En-Route_ATFM_Delay_FIR.xlsm "ERT-DLY (Excel)"
[ERT-DLY-FIR-postxlsx]: /download/xls/En-Route_ATFM_Delay_FIR_post_ops.xlsm "ERT-DLY-PO (Excel)"


[ERT-DLYcsv]: /404/ "ERT-DLY (CSV)"
[ERT-DLY-AUA-meta]: /reference/dataset/en-route-atfm-delay-aua/ "ERT-DLY (Meta)"
[ERT-DLY-FIR-meta]: /reference/dataset/en-route-atfm-delay-fir/ "ERT-DLY (Meta)"

[HFExlsx]: /download/xls/Horizontal_Flight_Efficiency.xlsm "HFE (Excel)"
[HFEcsv]: /data/set/hfe/horizontal_flight_efficiency.html "HFE (CSV)"
[HFEmeta]: /reference/dataset/horizontal-flight-efficiency/ "HFE (Meta)"

[DefAUA]: /reference/acronym/aua/ "AUA definition"
[DefFIR]: /reference/acronym/fir/ "FIR definition"
[DefFE]: /reference/methodology/horizontal-flight-efficiency-pi/ "Flight Efficiency performance indicator"
[DefKEP]: /reference/acronym/kep/ "Key performance Environment indicator based on last filed flight Plan"
[DefKEA]: /reference/acronym/kea/ "Key performance Environment indicator based on Actual trajectory"

[PostOps]: http://www.eurocontrol.int/publications/post-operations-performance-adjustment-process "Post ops adjustment process"


## <img src="/images/prcq-operations-airport.png" width="40" height="40" alt="Operations at Airports"> Operations at Airports

| Data description                                                                                                                                                                       | Period                                                                                  | <i class="fas fa-file-excel"></i>                                   | CSV                                             |  Info                          |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------|-----------------------------------------|-------------------------------------------------|------------------------------------|
| Airport arrival ATFM delays<br><em>no post ops adjustments</em><br><small>Daily IFR arrivals and airport arrival [ATFM delay][ATFMdelay] by airport and delay category</small>              | {{% getdata "dwnld" "apt_dly_beg" %}} - {{% getdata "dwnld" "apt_dly_end" %}}           | [{{% dwnld_i %}}][APT-DLYxlsx]      | [{{% fltr_i %}} {{% ndwk_i %}}][APT-DLYcsv] | [{{% info_i %}}][APT-DLYmeta] |
| Airport arrival ATFM delays<br><em>[with post ops adjustments][PostOps]</em><br><small>Daily IFR arrivals and airport arrival [ATFM delay][ATFMdelay] by airport and delay category</small>     | {{% getdata "dwnld" "apt_dly_post_beg" %}} - {{% getdata "dwnld" "apt_dly_post_end" %}} | [{{% dwnld_i %}}][APT-DLY-postxlsx] |                                                 | [{{% info_i %}}][APT-DLYmeta] |
| Airport traffic<br><small>Daily IFR arrivals and departures by airport</small>                                                                                                         | {{% getdata "dwnld" "apt_flt_beg" %}} - {{% getdata "dwnld" "apt_flt_end" %}}           | [{{% dwnld_i %}}][APT-FLTxlsx]      |                                                 | [{{% info_i %}}][APT-FLTmeta] |
| Arrival Sequencing and Metering (ASMA) additional time<br><small>Monthly ASMA [additional][ASMAadditional] and [unimpeded][ASMAunimpeded] time</small>                                 | {{% getdata "dwnld" "asma_beg" %}} - {{% getdata "dwnld" "asma_end" %}}                 | [{{% dwnld_i %}}][ASMAxlsx]         |                                                 | [{{% info_i %}}][ASMAmeta]    |
| Vertical flight efficiency - Continuous climb and descent operations<br><small>Monthly continuous climb and descent data</small>                                                       | {{% getdata "dwnld" "cdo_beg" %}} - {{% getdata "dwnld" "cdo_end" %}}                   | [{{% dwnld_i %}}][CDOxlsx]          |                                                 | [{{% info_i %}}][CDOmeta]     |
| Taxi-out additional time<br><small>Monthly taxi out [additional][TX-OUTadditional] and [unimpeded][TX-OUTunimpeded] time</small>                                                       | {{% getdata "dwnld" "tx_out_beg" %}} - {{% getdata "dwnld" "tx_out_end" %}}             | [{{% dwnld_i %}}][TX-OUTxlsx]       |                                                 | [{{% info_i %}}][TX-OUTmeta]  |
| ATC pre-departure delays<br><small>Daily [ATC pre-departure delay][ATCpredepdelay] by airport</small>                                                                                  | {{% getdata "dwnld" "atc_pre_beg" %}} - {{% getdata "dwnld" "atc_pre_end" %}}           | [{{% dwnld_i %}}][ATC-PRExlsx]      |                                                 | [{{% info_i %}}][ATC-PREmeta] |
| ATFM slot adherence<br><small>Daily ATFM slot adherence by airport</small>                                                                                                             | {{% getdata "dwnld" "slt_adh_beg" %}} - {{% getdata "dwnld" "slt_adh_end" %}}           | [{{% dwnld_i %}}][SLT-ADHxlsx]      |                                                 | [{{% info_i %}}][SLT-ADHmeta] |


[ASMAadditional]: /reference/definition/additional-asma-time/ "ASMA Additional Time definition"
[ASMAunimpeded]: /reference/definition/unimpeded-asma-time/ "ASMA Unimpeded Time definition"
[TX-OUTadditional]: /reference/definition/additional-taxi-out-time/ "Taxi-out Additional Time definition"
[TX-OUTunimpeded]: /reference/definition/unimpeded-taxi-out-time/ "Taxi-out Unimpeded Time definition"
[ATCpredepdelay]: /reference/definition/atc-pre-departure-delay/ "ATC Pre-departure Delay definition"

[APT-FLTxlsx]: /download/xls/Airport_Traffic.xlsm "APT-FLT (Excel)"
[APT-DLY-postxlsx]: /download/xls/Airport_Arrival_ATFM_Delay_post_ops.xlsm "APT-DLY-PO (Excel)"
[APT-FLTcsv]: /404/ "APT-FLT (CSV)"
[APT-FLTmeta]: /reference/dataset/airport-traffic/  "APT-FLT (Meta)"

[APT-DLYxlsx]: /download/xls/Airport_Arrival_ATFM_Delay.xlsm "APT-DLY (Excel)"
[APT-DLYcsv]: /data/set/apt-dly/airport-arrival-atfm-delay/ "APT-DLY (CSV)"
[APT-DLYmeta]: /reference/dataset/airport-arrival-atfm-delay/ "APT-DLY (Meta)"

[ASMAxlsx]: /download/xls/ASMA_Additional_Time.xlsm "ASMA (Excel)"
[ASMAcsv]: /404/ "ASMA (CSV)"
[ASMAmeta]: /reference/dataset/asma-additional-time/ "ASMA (Meta)"

[CDOxlsx]: /download/xls/Vertical_Flight_Efficiency_cdo_cco.xlsm "CDO/CCO (Excel)"
[CDOcsv]: /404/ "CDO/CCO (CSV)"
[CDOmeta]: /reference/dataset/continuous-climb-descent/ "CDO/CCO (Meta)"

[TX-OUTxlsx]: /download/xls/Taxi-Out_Additional_Time.xlsm "TX-OUT (Excel)"
[TX-OUTcsv]: /404/ "TX-OUT (CSV)"
[TX-OUTmeta]: /reference/dataset/taxi-out-additional-time/ "TX-OUT (Meta)"

[ATC-PRExlsx]: /download/xls/ATC_Pre-Departure_Delay.xlsm "ATC-PRE (Excel)"
[ATC-PREmeta]: /reference/dataset/atc-pre-departure-delay/  "ATC-PRE (Meta)"

[SLT-ADHxlsx]: /download/xls/ATFM_Slot_Adherence.xlsm "SLT-ADH (Excel)"
[SLT-ADHmeta]: /reference/dataset/atfm-slot-adherence/ "SLT-ADH (Meta)"




## <img src="/images/prcq-traffic.png" width="40" height="40" alt="Traffic"> Traffic

| Data description                                                                            | Period                                                                                 | <i class="fas fa-file-excel"></i>                            | CSV | Info                        |
|---------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------|----------------------------------|-----|---------------------------------|
| Complexity (based on [BADA][CPLXbada] version 3.6) <br><small>Complexity by ANSP</small>    | {{% getdata "dwnld" "cplx_beg_bada_3_6" %}} -  {{% getdata "dwnld" "cplx_end_bada_3_6" %}}       | [{{% dwnld_i %}}][CPLXxlsx]  |     | [{{% info_i %}}][CPLXmeta] |
| Complexity (based on [BADA][CPLXbada] version 3.13.1) <br><small>Complexity by ANSP</small> | {{% getdata "dwnld" "cplx_beg_bada_3_13_1" %}} - {{% getdata "dwnld" "cplx_end_bada_3_13_1" %}} | [{{% dwnld_i %}}][CPLX1xlsx] |     | [{{% info_i %}}][CPLXmeta] |

[CPLXxlsx]: /download/xls/Traffic_Complexity_Scores_1.xlsm "CPLX (Excel)"
[CPLX1xlsx]: /download/xls/Traffic_Complexity_Scores_2.xlsm "CPLX (Excel)"
[CPLXcsv]: /404/ "CPLX (CSV)"
[CPLXmeta]: /reference/dataset/traffic-complexity-score/ "CPLX (Meta)"
[CPLXbada]: /reference/acronym/bada/ "Base of Aircraft Data"




## <img src="/images/prcq-economics.png" width="40" height="40" alt="ATM Cost-Effectiveness (ACE) operational data"> ATM Cost-Effectiveness (ACE) operational data

| Data description                                                     | Period                                                                         | <i class="fas fa-file-excel"></i>                           | CSV |  Info                      |
|----------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------|-----|--------------------------------|
| ACE operational data<br><small>Monthly ACE operational data</small>  | {{% getdata "dwnld" "ace_opt_beg" %}} - {{% getdata "dwnld" "ace_opt_end" %}}  | [{{% dwnld_i %}}][ACExlsx]  |     | [specs {{% info_i %}}][ACEurl] |

[ACExlsx]: /download/xls/ACE_Monthly_Operational_Data.xls "ACE (Excel)"
[ACEcsv]: /404/ "ACE (CSV)"
[ACEmeta]: /reference/dataset/ace-monthly-operational-data/ "ACE (Meta)"
[ACEurl]: http://www.eurocontrol.int/documents/economic-information-disclosure-specification "ACE specs"

<br>

{{% dwnld_i %}} = dataset download.<br>
{{% info_i %}} = info on dataset.<br>
{{% fltr_i %}} = filter for dataset and download.<br>
{{% ndwk_i %}} = experimental, [feedback](mailto:{{ site.owner.email }}) is more than welcome.<br>
{{% attn_i %}} = not (yet?) available.<br>



<div class="container text-center">
{{% subscribe-button %}}
</div>




<style>
i.fa.pru {color: #337ab7;}
table {
  width: 100% !important;
}

td {
/*  white-space: nowrap !important; */
  padding-left: 0.5em;
  padding-right: 0.5em;
}

th:nth-child(1) {
width: auto;
}

th:nth-child(2) {
width: 11em !important;
}

th:nth-child(3) {
width: 3em !important;
}

th:nth-child(4) {
width: 4em !important;
}

th:nth-child(5) {
width: 4em !important;
}


/* ==========================================================================
   Tables
   ========================================================================== */

/*  A clean textbook-like style with horizontal lines above and below and under
    the header. Rows highlight on hover to help scanning the table on screen.
*/

table, th, td {
  border-bottom: 1px solid #CCCCCC; /* dim gray for reduced non-data ink */
}

table
    {
    width: 100% !important;
    border-collapse: collapse;
    border-spacing: 0; /* IE 6 */

    border-bottom: 2pt solid #CCC;
    border-top: 2pt solid #CCC; /* The caption on top will not have a bottom-border */

    /* Center */
    margin-left: 2em;
    margin-right: auto;
    margin-bottom: 2em;
    }

thead /* Entire table header */
    {
    border-bottom: 1pt solid #000;
    background-color: #eee; /* Does this BG print well? */
    }

tr.header /* Each header row */
    {
    }

tbody /* Entire table  body */
    {
    }

/* Table body rows */

tr  {
    }
tr.odd:hover, tr.even:hover /* Use .odd and .even classes to avoid styling rows in other tables */
    {
    background-color: #eee;
    }

/* Odd and even rows */
tr.odd {}
tr.even {}

td, th /* Table cells and table header cells */ {
    vertical-align: top; /* Word */
    vertical-align: baseline; /* Others */
    padding-left:   0.5em;
    padding-right:  0.5em;
    padding-top:    0.2em;
    padding-bottom: 0.2em;
    border-bottom: 1px solid #CCCCCC; /* dim gray for reduced non-data ink */
}

/* Removes padding on left and right of table for a tight look. Good if thead has no background color*/
/*
tr td:last-child, tr th:last-child
    {
    padding-right: 0;
    }
tr td:first-child, tr th:first-child
    {
    padding-left: 0;
    }
*/

th /* Table header cells */
    {
    font-weight: bold;
    }

tfoot /* Table footer (what appears here if caption is on top?) */
    {
    }

caption /* This is for a table caption tag, not the p.caption Pandoc uses in a div.figure */
    {
    caption-side: top;
    border: none;
    font-size: 0.9em;
    font-style: italic;
    text-align: center;
    margin-bottom: 0.3em; /* Good for when on top */
    padding-bottom: 0.2em;
}

.h2 {
  margin-top: inherit;
}
</style>