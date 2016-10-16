(function () {
  var width = 700;
  var height = 0.618 * width;

  var svg = d3.select('svg')
        .attr("width", width)
        .attr("height", height);
  var margin = {top: 20, right: 100, bottom: 30, left: 40};
  var plot_width = width - margin.left - margin.right;
  var plot_height = height - margin.top - margin.bottom;
  var g = svg.append('g').attr('transform', 'translate(' + margin.left + ',' + margin.top + ')');

  var tooltip = d3.select("body").append("div").attr("class", "tooltip");

  var x = d3.scaleBand()
        .rangeRound([0, plot_width])
        .padding(0.1)
        .align(0.1);

  var y = d3.scaleLinear()
        .rangeRound([plot_height, 0]);

  // TODO: use colorbrewer!
  var colors = ['#C0504D',
                '#D99694',
                '#E6B9B8',
                '#558ED5',
                '#B9CDE5',
                '#DCE6F2',
                '#C3D69B'];
  var z = d3.scaleOrdinal()
        .range(colors);

  // gridlines in y axis function
  function make_y_gridlines() {
    return d3.axisLeft(y)
      .ticks(5);
  }

  var stack = d3.stack();

  d3.csv("ert_dly_ectrl_yy.csv", type, function(error, data) {
    if (error) throw error;

    var labels = [];

    x.domain(data.map(function(d) { return d.year; }));
    y.domain([0, d3.max(data, function(d) { return d.total; })]).nice();
    z.domain(data.columns.slice(2));

    var s = d3.formatSpecifier("f");
    s.precision = d3.precisionFixed(0.01);
    var formatter = d3.format(s);

    var cols = data.columns.slice(2);
    var dataset = stack.keys(cols)(data);

    g.selectAll(".serie")
      .data(dataset)
      .enter().append("g")
      .attr("class", "serie")
      .attr("fill", function(d) { return z(d.key); })
      .selectAll("rect")
      .data(function(d) { return d; })
      .enter().append("rect")
      .attr("x", function(d) { return x(d.data.year); })
      .attr("y", function(d) { return y(d[1]); })
      .attr("height", function(d) { return y(d[0]) - y(d[1]); })
      .attr("width", x.bandwidth())
      .on("mousemove", function(d){
        tooltip
          .style("left", d3.event.pageX - 25 + "px")
          .style("top", d3.event.pageY - 45 + "px")
          .style("display", "inline-block")
      	  .html(formatter(d[1] - d[0]));
      })
      .on("mouseout", function(d) { tooltip.style("display", "none"); })
    ;

    // add the Y gridlines
    g.append("g")
      .attr("class", "grid")
      .call(make_y_gridlines()
            .tickSize(-plot_width)
            .tickFormat("")
           );

    g.append("g")
      .attr("class", "axis axis--x")
      .attr("transform", "translate(0," + plot_height + ")")
      .call(d3.axisBottom(x));

    g.append("g")
      .attr("class", "axis axis--y")
      .call(d3.axisLeft(y).ticks(10, "s"))
      .append("text")
      .attr("x", 2)
      .attr("y", y(y.ticks(10).pop()))
      .attr("dy", "0.35em")
      .attr("text-anchor", "start")
      .attr("fill", "#000")
      .text("En-route ATFM Delays (min/flight)");



    var ordinal = d3.scaleOrdinal()
          .domain(cols.reverse())
          .range(colors.reverse());


    svg.append("g")
      .attr("class", "legendOrdinal")
      .attr("transform", "translate(" + (width - margin.right -65) + ",20)");

    var legendOrdinal = d3.legendColor()
    //d3 symbol creates a path-string, for example
    //"M0,-8.059274488676564L9.306048591020996,
    //8.059274488676564 -9.306048591020996,8.059274488676564Z"
    //          .shape("path", d3.symbol().type(d3.symbolTriangle).size(150)())
          .labels(["capacity - ATC",
                   "staffing - ATC",
                   "disruption - ATC",
                   "capacity - non ATC",
                   "disruption - non ATC",
                   "event - non ATC",
                   "weather"].reverse())
          .shapeWidth(15)
          .shapePadding(5)
          .scale(ordinal);

    svg.select(".legendOrdinal")
      .call(legendOrdinal);




    // var legend = g.selectAll(".legend")
    //       .data(data.columns.slice(2).reverse())
    //       .enter().append("g")
    //       .attr("class", "legend")
    //       .attr("transform", function(d, i) { return "translate(0," + i * 20 + ")"; })
    //       .style("font", "10px sans-serif");

    // legend.append("rect")
    //   .attr("x", plot_width - 18)
    //   .attr("width", 18)
    //   .attr("height", 18)
    //   .attr("fill", z);

    // legend.append("text")
    //   .attr("x", plot_width - 24)
    //   .attr("y", 9)
    //   .attr("dy", ".35em")
    //   .attr("text-anchor", "end")
    //   .text(function(d) { return d; });
  });

  // sum all the delays up
  function type(d, i, columns) {
    // start from 'c' (3rd col, hence i=2)
    for (i = 2, t = 0; i < columns.length; ++i) t += d[columns[i]] = +d[columns[i]];
    d.total = t;
    return d;
  }

})();
