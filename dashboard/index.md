---
layout: dashboard
title: Dashboard
permalink: /dashboard/
---


<style>
.bar {
  fill: steelblue;
}

.bar:hover {
  fill: brown;
}

.axis {
  font: 10px sans-serif;
}

.axis path,
.axis line {
  fill: none;
  stroke: #000;
  shape-rendering: crispEdges;
}

.x.axis path {
  /*display: none;*/
}

.hidden{
  display: none;
}

#loading {
  text-align: center;
  position: absolute;
  padding-left: 200px;
  padding-top: 100px;
  height: 20px;
  font: 16px sans-serif;
}

#tooltip {
  position: absolute;
  width: auto;
  height: auto;
  padding: 2px 2px;
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  border-radius: 3px;
  -webkit-box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.4);
  -moz-box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.4);
  box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.4);
  pointer-events: none;
  background-color: #bbb;
}

#tooltip p {
  margin: 0 0 0 0;
  padding: 2px 2px;
  font-family: sans-serif;
  font-size: 14px;
}

.zero.axis path {
  stroke: red;
  stroke: #777;
  stroke-dasharray: 4,2;
}

.line {
  fill: none;
  stroke: red;
  stroke-width: 1.5px;
}

</style>

<div id="tooltip" class="hidden">
</div>

## Traffic ##

### IFR Flights (Jan - Sep) ###
<div id="chart"></div>

## Safety ##

## Capacity ##

--------------------------------------
<script src="http://d3js.org/d3.v3.min.js"></script>
<script>
// define size and margings
var margin = {top: 20, right: 20, bottom: 30, left: 40},
    width = 700 - margin.left - margin.right,
    height = 400 - margin.top - margin.bottom;

// x, y and z axes: type (ordinal/linear/...), ranges, ticks formatting
var x = d3.scale.ordinal()
    .rangeRoundBands([0, width], 0.15);

var y = d3.scale.linear()
          .range([height, 0]);

var z = d3.scale.linear()
          .range([height, 0]);

var xAxis = d3.svg.axis()
              .scale(x)
              .orient("bottom")
              .tickFormat(d3.time.format("%Y"));

var yAxis = d3.svg.axis()
    .scale(y)
    .orient("left");

var zAxis = d3.svg.axis()
    .scale(z)
    .orient("right");


// chart creation and positioning
var svg = d3.select("#chart").append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
  .append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

// pointers to <div>s
var loading = d3.select("#loading");
var tooltip = d3.select("#tooltip").classed("hidden", true);
var tip = tooltip.append("p");

// register on mouseover event for tooltip management
svg.on("mousemove", function() {
  // update tooltip position
  tooltip.style("top", (event.pageY-10)+"px").style("left",(event.pageX+10)+"px");
  return true;
});


// the line
var line = d3.svg.line()
    .x(function(d) { return x(d.year) + x.rangeBand()/2; })
    .y(function(d) { return z(d.per_cent_change); });


// read the data and draw the chart
d3.csv("data.csv", function(error, data) {
  if (error) return console.error(error);
  loading.classed("hidden", true);

  // properly read the data
  var parseDate = d3.time.format("%Y").parse;
  data.forEach(function(d) {
    d.year = parseDate(d.year);
    d.avg_daily = + d.avg_daily;
    d.per_cent_change = +d.per_cent_change;
  });

  x.domain(data.map(function(d){return d.year;}));
  y.domain(d3.extent(data, function(d) { return d.avg_daily; })).nice();
  z.domain(d3.extent(data, function(d) { return d.per_cent_change; })).nice();

  svg.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + height + ")")
      .call(xAxis)
    .append("text")
      .attr("x", width)
      .attr("dy", "3em")
      .style("text-anchor", "end")
      .text("Year");

  svg.append("g")
      .attr("class", "y axis left")
      .call(yAxis)
    .append("text")
      .attr("transform", "rotate(-90)")
      .attr("y", 6)
      .attr("dy", ".65em")
      .style("text-anchor", "end")
      .text("Avg. daily EU IFR flights");

  // bar chart
  svg.selectAll(".bar")
      .data(data)
    .enter().append("rect")
      .attr("class", "bar")
      .attr("x", function(d) { return x(d.year); })
      .attr("width", x.rangeBand())
      .attr("y", function(d) { return y(d.avg_daily); })
      .attr("height", function(d) { return height - y(d.avg_daily); })
      .on("mouseover", function(d,i) {
        d3.select(this).style({'stroke-opacity':1,'stroke':'#F00'});
        tooltip.classed("hidden", false);
        tip.text("" + d.avg_daily + " IFR flights");
      })
      .on("mouseout", function(d) {
        this.style.stroke = "none";
        tooltip.classed("hidden", true);
      });


  // line chart
  var gz = svg.append("g")
      .attr("class", "y axis right")
      .attr("transform", "translate(" + width + ", 0)")
      .call(zAxis)
    .append("text")
      .attr("transform", "rotate(-90)")
      .attr("y", 6)
      .attr("dy", "-1.0em")
      .style("text-anchor", "end")
      .text("year on year (%)");

  svg.append("path")
      .datum(data)
      .attr("class", "line")
      .attr("d", line);

  // Add the points!
  svg.selectAll(".point")
      .data(data)
    .enter().append("circle")
      .attr("class", "point")
      .attr("r", 4.5)
      .attr("cx", function(d) { return x(d.year) + x.rangeBand()/2; })
      .attr("cy", function(d) { return z(d.per_cent_change); })
      .on("mouseover", function(d,i) {
        d3.select(this).style({'stroke-opacity':1,'stroke':'#F00'});
        tooltip.classed("hidden", false);
        tip.text("" + d.per_cent_change + "% year on year");
      })
      .on("mouseout", function(d) {
        this.style.stroke = "none";
        tooltip.classed("hidden", true);
      });

  // zero line
    svg.append("g")
      .attr("class", "zero axis")
      .attr("transform", "translate(0," + z(0) + ")")
      .call(xAxis.tickFormat("").innerTickSize(0))
    .append("text")
      .attr("x", width)
      .attr("dy", "3em");

  // primitive legend: TODO make it better
  var legend = svg.append("g")
    .attr("transform", "translate("+(width/2)+")");
  legend.append("text")
    .attr("dy", ".35em")
    .attr("x", 26)
    .text("Average daily IFR Flights (EU-wide)");
  legend.append("text")
    .attr("dy", ".35em")
    .attr("y", 15)
    .attr("x", 26)
    .text("(hover with the mouse to see values)");

});

</script>