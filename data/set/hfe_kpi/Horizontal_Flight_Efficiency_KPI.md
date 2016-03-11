---
layout: default
title: Horizontal Flight Efficiency Dataset (KEA/KEP)
permalink: /references/dataset/Horizontal_Flight_Efficiency_KPI.html
excerpt: Performance Review Unit MetaData Definitions.
keywords: metadata, dataset, performance, data, statistics, economics, air transport, flights, europe, cost efficiency
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


## Data description

**[KEP](/references/definition/kep.html)** and
**[KEA](/references/definition/kea.html)** are performance indicators measuring
horizontal en-route flight inefficiency in flight plans (KEP) and in actual
flown trajectories (KEA) over a period of 12 months.

**Please note that the values are NOT monthly averages but the average over the entire 12 months period preceding the given END-DATE**

The **KEP** indicator is the horizontal flight efficiency calculated using the *last filed flight plans* to describe the
trajectories, while **KEA** uses the *actual trajectories* generated via *radar data*.

The planned trajectory is derived from the flight plans submitted by airspace
users to the Network Manager.
The actual flown trajectory is based on processed radar track data (a.k.a. correlated
position reports or [CPR](/references/definition/cpr.html)) submitted by ANSPs
to the EUROCONTROL Enhanced Tactical Flow 
Management System ([ETFMS](/references/definition/etfms.html)).

In order to smooth out the influence of unusual events, the ten best days
and the ten worst days (for each measured area) are excluded from the computation.



## Methodology

[Horizontal en-route flight efficiency methodology](/references/methodology/horizontal_flight_efficiency.html)
is fully consistent with the Single European Sky (SES) Performance Scheme
[see {% cite pru-hfe --file aviation %}].



## Column naming and types

{:.metatable}
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
<br>
The map below shows all Eurocontrol Member States FIRs and the nine FABs
relevant for **SES RP2**.

Click to zoom in/out. Hoover with the mouse to get further information.

<script src="https://cdnjs.cloudflare.com/ajax/libs/topojson/1.6.20/topojson.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/queue-async/1.0.7/queue.min.js"></script>

{% stylesheet fabs %}
{% javascript fabs %}

<div id="tooltip" class="hidden">
    <p id="info"></p>
</div>
<div id="chart"></div>

<script type="text/javascript">
(function () {

  // general design from
  // http://www.jeromecukier.net/blog/2013/11/20/getting-beyond-hello-world-with-d3/
  var params = {
    refresh: false, // REMOVE, i.e. `false`, for production
  	width: 800,
  	height:580,
  	scale: 530,
    rotateLat:-53,
    rotateLon: 0,
    topo: "{% asset_path euctrl-firs.json %}",
  	world: "{% asset_path world-50m.json %}"
  };

  var query = window.location.search.substring(1);
  var vars = query.split("&");
  vars.forEach(function(v) {
      var p = v.split("=");
      params[p[0]] = p[1];
  })

  vis.init(params);
}());
</script>


## References

{% bibliography --file aviation --cited_in_order %}
