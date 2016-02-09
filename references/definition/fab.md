---
layout: default
title: "FAB - Functional Airspace Blocks"
resource: true
entity: definition
excerpt: Performance Review Unit MetaData Definitions.
keywords: metadata, performance, data, statistics, air transport, flights, europe, delay, safety
---
<style>
td {
  white-space: nowrap;
}
th:nth-child(1) {
width: 16em;
}
th:nth-child(2) {
width: 20em;
}
</style>



# {{ page.title }}

The <a href="http://www.eurocontrol.int/dossiers/fabs" target="_blank">FAB</a> concept was developed in the 1st legislative package of the Single European Sky (SES I) as one of the main means for reducing airspace fragmentation. The 2nd legislative package (SES II) tackled the creation of FABs in terms of service provision, in addition to the airspace organisation issues.

The twofold objective of the legislative packagers is to optimise air traffic flows and increase the efficiency of air traffic services in Europe.

SES II lays down a definite commitment date for the Member States to improve performance by implementing FABs, i.e. 4 December 2012. Nine FAB initiatives have been taken:

| Short name     | Name               | Countries                                                                                    |
|----------------|--------------------|----------------------------------------------------------------------------------------------|
| NEFAB          | North European FAB | Estonia, Finland, Latvia, Norway                                                             |
| Denmark-Sweden | Denmark-Sweden     | Denmark, Sweden                                                                              |
| BALTIC FAB     | BALTIC FAB         | Poland, Lithuania                                                                            |
| FABEC          | FAB Europe Central | France, Germany, Belgium, Netherlands, Luxembourg, and Switzerland                           |
| FABCE          | FAB Central Europe | Czech Republic, Slovak Republic, Austria, Hungary, Croatia, Slovenia, Bosnia and Herzegovina |
| DANUBE         | DANUBE             | Bulgaria, Romania                                                                            |
| BLUE MED       | BLUE MED           | Italy, Malta, Greece, Cyprus, (and Egypt, Tunisia, Albania, Jordan as observers)             |
| UK-IRELAND FAB | UK-IRELAND FAB     | United Kingdom, Ireland                                                                      |
| SW FAB         | South West FAB     | Portugal, Spain                                                                              |

<br>
<br>
The map below shows all Eurocontrol Member States FIRs and the nine FABs relevant for **SES RP2**.

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
