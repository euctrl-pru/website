---
layout: default
needsMath: true
title: Horizontal Flight Efficiency Dataset
permalink: /references/dataset/Horizontal_Flight_Efficiency.html
excerpt: Performance Review Unit MetaData Definitions.
keywords: metadata, dataset, performance, data, statistics, economics, air transport, flights, europe, cost efficiency
ndwk_i: <i class="fa pru fa-flask"></i>
fltr_i: <i class="fa pru fa-filter"></i>
---
<style>
td {
  white-space: normal;
}
th:nth-child(1) {
width: 11em;
}

.metatable th:nth-child(2) {
width: 11em;
}
.metatable th:nth-child(5) {
width: 7em;
}

</style>

# {{ page.title }}

Please note that additional quality control measures detected a limited number of abnormal flight trajectories starting towards the end of 2015 which were removed by applying an additional filter as of 01 January 2015. Due to this quality improvement, the period January 2015 - May 2016 might differ slightly from older data releases.  

## Data description
Horizontal en-route flight efficiency compares the length of actual or planned flight trajectories
to the corresponding “achieved” distance.

The achieved distance apportions the
[Great Circle Distance](https://en.wikipedia.org/wiki/Great-circle_distance)
between two points within the European airspace (reference area).
If the origin/destination airport is located outside of European airspace, the
entry/exit point into the reference area is used for the calculation.

The planned trajectory is derived from the flight plans submitted by airspace
users to the Network Manager.
The actual flown trajectory is based on processed radar track data (a.k.a. correlated
position reports or [CPR]({{ "/references/acronym/cpr.html" | prepend: site.baseurl | prepend: site.url }})) submitted by ANSPs
to the EUROCONTROL Enhanced Tactical Flow Management System
([ETFMS]({{ "/references/acronym/etfms.html" | prepend: site.baseurl | prepend: site.url }})).

**[KEP]({{ "/references/acronym/kep.html" | prepend: site.baseurl | prepend: site.url }})** and
**[KEA]({{ "/references/acronym/kea.html" | prepend: site.baseurl | prepend: site.url }})** are performance indicators measuring
horizontal en-route flight inefficiency in flight plans (KEP) and in actual
flown trajectories (KEA) over a period of 12 months.
**Please note that the values are NOT monthly averages but the average over the
entire 12 months period preceding the given END-DATE.**

The **KEP** indicator is the horizontal flight efficiency calculated using the
*last filed flight plans* to describe the trajectories, while **KEA** uses the
*actual trajectories* generated via *radar data*.
In order to smooth out the influence of unusual events, the ten best days and
the ten worst days (for each measured area) are excluded from the computation.


## Methodology

[Horizontal en-route flight efficiency methodology]({{ "/references/methodology/horizontal_flight_efficiency_pi.html" | prepend: site.baseurl | prepend: site.url }})
is fully consistent with the Single European Sky (SES) Performance Scheme
[see {% cite pru-hfe-pi --file aviation %}].


## Column naming and types

### HFE data

{:.metatable}
| Column name      | Data source     | Label            | Column description                                                                                | Example   |
|------------------|-----------------|------------------|---------------------------------------------------------------------------------------------------|-----------|
| YEAR             | Network Manager | YEAR             | Reference year                                                                                    | 2014      |
| MONTH_NUM        | Network Manager | MONTH_NUM        | Month (numeric)                                                                                   | 9         |
| MONTH_MON        | Network Manager | MONTH_MON        | Month (3-letter code)                                                                             | SEP       |
| ENTRY_DATE       | Network Manager | ENTRY_DATE       | The entry date considered                                                                         | 06-Sep-14 (*) |
| ENTITY_NAME      | Network Manager | ENTITY_NAME      | Name of the entity to with the data refers                                                        | FABEC     |
| ENTITY_TYPE      | Network Manager | ENTITY_TYPE      | Type of the entity                                                                                | FAB (FIR) |
| MODEL_TYPE       | Network Manager | MODEL_TYPE       | The type of trajectory used for the calculation (CPF=actual, FTFM=flight plan)                    | FTFM      |
| DIST_FLOWN_KM    | Network Manager | DIST_FLOWN_KM    | Sum of flown distances in kilometre                                                               | 8699586   |
| DIST_DIRECT_KM   | Network Manager | DIST_DIRECT_KM   | Sum of direct flown distances in kilometre                                                        | 8405033   |
| DIST_ACHIEVED_KM | Network Manager | DIST_ACHIEVED_KM | Sum of achieved distances in kilometre                                                            | 8255220   |

(*) The experimental [CSV files]({{ "/data/csv/" | prepend: site.baseurl | prepend: site.url }}) and
[HFE filter and csv download {{ page.fltr_i }} {{ page.ndwk_i }}][HFEcsv] use [ISO 8601][iso8601] date time format,
i.e. `2017-01-02T00:00:00Z`

[HFEcsv]: <{{ "/data/set/hfe/horizontal_flight_efficiency.html" | prepend: site.baseurl | prepend: site.url }}> "HFE (CSV)"
[iso8601]: <https://en.wikipedia.org/wiki/ISO_8601> "Wikipedia: ISO 8601"


### KEP/KEA KPI data

| Column name    | Data source     | Label          | Column description                                                                                              | Example                                                                                                      |
|----------------|-----------------|----------------|-----------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------|
| ENTITY_NAME    | Network Manager | ENTITY_NAME    | Name of the entity to with the data refers                                                                      | BLUE MED FAB                                                                                                 |
| ENTITY_TYPE    | Network Manager | ENTITY_TYPE    | Type of the entity                                                                                              | FAB (FIR)                                                                                                    |
| END_DATE       | Network Manager | END_DATE       | End date of the running 12 month                                                                                | 29-Feb-2016                                                                                                  |
| INDICATOR_TYPE | Network Manager | INDICATOR_TYPE | The type of indicator                                                                                           | KEP                                                                                                          |
| HFE_ALL        | Network Manager | HFE_ALL        | En-route flight efficiency for all days of the 12 month preceding the END_DATE in percent                       | 5.19                                                                                                         |
| HFE_KPI        | Network Manager | HFE_KPI        | Key performance indicator (without 10 worst and 10 best days of the 12 month preceding the END_DATE) in percent | 5.19                                                                                                         |
| EXCLUDED_LOW   | Network Manager | EXCLUDED_LOW   | Dates of the 10 worst days of the 12 month preceding the END_DATE                                               | 08-MAR-15, 15-MAR-15, 26-APR-15, 31-OCT-15, 01-NOV-15, 07-NOV-15, 14-NOV-15, 15-NOV-15, 25-DEC-15, 26-DEC-15 |
| HFE_BEST_10    | Network Manager | HFE_BEST_10    | En-route flight efficiency for the 10 best days of the 12 month preceding the END_DATE in percent               | 4.50                                                                                                         |
| EXCLUDED_HIGH  | Network Manager | EXCLUDED_HIGH  | Dates of the 10 best days of the 12 month preceding the END_DATE                                                | 27-MAR-15, 30-MAR-15, 01-APR-15, 08-APR-15, 09-APR-15, 23-SEP-15, 23-NOV-15, 25-NOV-15, 27-NOV-15, 26-JAN-16 |
| HFE_WORST_10   | Network Manager | HFE_WORST_10   | En-route flight efficiency for the 10 worst days of the 12 month preceding the END_DATE in percent              | 6.07                                                                                                         |



### Calculated Field(s)
The indicator is calculated as the ratio of the two sums (length of trajectories
and achieved distances), over all flights considered:

$$
{HFE}_j = ( \frac{\sum_{f,p} L_{fjp}}{\sum_{f,p} H_{fjp}} - 1 ) %
$$

where $$L$$ is the length of the trajectory and $$H$$ is the achieved distance;
the index $$f$$ is the flight, $$j$$ is the airspace and $$p$$ is the portion
considered.

From the table above $$L$$ is $$DIST\_FLOWN\_KM$$, while $$H$$ is
$$DIST\_ACHIEVED\_KM$$.

## FAB definitions

The FAB level information is based on an aggregation of Flight Information
Regions (FIRs) (ENTITY_TYPE = FAB (FIR)).

| FAB Name         | FIRs included                                                                                                                                  |
|------------------|------------------------------------------------------------------------------------------------------------------------------------------------|
| Baltic FAB       | EPWWFIR, EYVLFIR, EYVLUIR                                                                                                                      |
| BLUE MED FAB     | LCCCFIR, LCCCUIR, LGGGFIR, LGGGUIR, LIBBFIR, LIBBUIR, LIMMFIR, LIMMUIR, LIRRFIR, LIRRUIR, LMMMFIR, LMMMUIR                                     |
| DANUBE FAB       | LBSRFIR, LRBBFIR                                                                                                                               |
| DK-SE FAB        | EKDKFIR, ESAAFIR                                                                                                                               |
| FABEC            | EBBUFIR, EBURUIR, EDGGFIR, EDMMFIR, EDUUUIR, EDVVUIR, EDWWFIR, EHAAFIR, LFBBFIR, LFEEFIR, LFFFFIR, LFFFUIR, LFMMFIR, LFRRFIR, LSASFIR, LSASUIR |
| FAB CE           | LDZOFIR, LHCCFIR, LJLAFIR, LKAAFIR, LOVVFIR, LQSBFIR, LQSBUIR, LZBBFIR                                                                         |
| FAB CE (SES RP1) | LHCCFIR, LJLAFIR, LKAAFIR, LOVVFIR, LZBBFIR                                                                                                    |
| FAB CE (SES RP2) | LDZOFIR, LHCCFIR, LJLAFIR, LKAAFIR, LOVVFIR, LZBBFIR                                                                                           |
| NEFAB            | EETTFIR, EFINFIR, EFINUIR, ENOBFIR, ENORFIR, EVRRFIR                                                                                           |
| SW FAB           | GCCCFIR, GCCCUIR, LECBFIR, LECBUIR, LECMFIR, LECMUIR, LPPCFIR                                                                                  |
| UK-Ireland FAB   | EGPXFIR, EGPXUIR, EGTTFIR, EGTTUIR, EISNFIR, EISNUIR                                                                                           |

<br>
The map below shows all Eurocontrol Member States FIRs and the nine FABs
relevant for **SES RP2**.

Click to zoom in/out. Hoover with the mouse to get further information.

{% javascript vendor/pym.min %}
<div id="fabs_firs_map"></div>
<script>
 var pymParent = new pym.Parent(
   'fabs_firs_map',
   '{{ "/graphics/fabs_firs_map/index.html" | prepend: site.baseurl | prepend: site.url }}',
   {});
</script>


## References

{% bibliography --file aviation --cited_in_order %}
