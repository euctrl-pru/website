/*jslint browser: true, devel: true */
var d3, queue, vis, params, topojson;
(function () {
    "use strict";
    vis = {};
    var width, height,
        chart, svg, g, active, background,
        path,
        defs, style,
        slider, step, maxStep, running, sv, timer,
        button;



    // general design from
    // http://www.jeromecukier.net/blog/2013/11/20/getting-beyond-hello-world-with-d3/
    vis.init = function (params) {
        vis.params = params || {};

        chart = d3.select(vis.params.chart || "#chart"); // placeholder div for svg
        width = vis.params.width ||600;
        height = vis.params.height || 600;
        active = d3.select(null);

        svg = chart.selectAll("svg")
            .data([{width: width, height: height}]).enter()
            .append("svg");
        svg.attr({
            width:  function (d) { return d.width; },
            height: function (d) { return d.height; }
        });

        background = svg.selectAll("rect.background")
            .data([{}]).enter()
            .append("rect")
            .classed("background", true);


        g = svg.selectAll("g.all")
            .data([{}]).enter()
            .append("g")
            .classed("all", true);

        // vis.init can be re-ran to pass different height/width values
        // to the svg. this doesn't create new svg elements.

        style = svg.selectAll("style")
            .data([{}]).enter()
            .append("style")
            .attr("type", "text/css");
        // this is where we can insert style that will affect the svg directly.

        defs = svg.selectAll("defs").data([{}]).enter()
            .append("defs");
        // this is used if it's necessary to define gradients, patterns etc.

        // the following will implement interaction around a slider and a
        // button. repeat/remove as needed.
        // note that this code won't cause errors if the corresponding elements
        // do not exist in the HTML.
        slider = d3.select(vis.params.slider || ".slider");

        if (slider[0][0]) {
            maxStep = slider.property("max");
            step = slider.property("value");
            slider.on("change", function () {
                vis.stop();
                step = this.value;
                vis.draw(vis.params);
            });
            running = vis.params.running || 0; // autorunning off or manually set on
        } else {
            running = -1; // never attempt auto-running
        }
        button = d3.select(vis.params.button || ".button");
        if (button[0][0] && running > -1) {
            button.on("click", function () {
                if (running) {
                    vis.stop();
                } else {
                    vis.start();
                }
            });
        }

        vis.loaddata(vis.params);
    };

    function ready(error, firs, world, wnames, trafficdelays) {
        if (error) {
            console.error(error);
        }

        vis.firs = firs;
        vis.world = world;
        vis.wnames = wnames;
        vis.trafficdelays = trafficdelays;
        if (running > 0) {
            vis.start();
        } else {
            vis.draw(vis.params);
        }
    }

    vis.loaddata = function (params) {
        if (!params) { params = {}; }

        // if `params.refresh` is set/true forces the browser to reload the file
        // and not use the cached version due to URL being different (but the filename is the same)
        var topo = (params.topo || "ectrl-firs.json") + (params.refresh ? ("#" + Math.random()) : "");
        var world = (params.world || "world-50m.json") + (params.refresh ? ("#" + Math.random()) : "");
        var names = (params.worldnames || "world-country-names.tsv") + (params.refresh ? ("#" + Math.random()) : "");
        var trafficdelays = (params.trafficdelays || "En-Route_Traffic_FAB_FIR.csv") + (params.refresh ? ("#" + Math.random()) : "");

        queue()
            .defer(d3.json, topo)
            .defer(d3.json, world)
            .defer(d3.tsv, names)
            .defer(d3.csv, trafficdelays)
            .await(ready);
    };

    vis.play = function () {
        if (i === maxStep && !running) {
            step = -1;
            vis.stop();
        }

        if (i < maxStep) {
            step = step + 1;
            running = 1;
            d3.select(".stop").html("Pause").on("click", vis.stop(params));
            slider.property("value", sv);
            vis.draw(params);
        } else {
            vis.stop();
        }
    };

    vis.start = function (params) {
        timer = setInterval(function () { vis.play(params); }, 50);
    };

    vis.stop = function (params) {
        clearInterval(timer);
        running = 0;
        d3.select(".stop").html("Play").on("click", vis.start(params));
    };

    var zoom = d3.behavior.zoom()
            .scaleExtent([1, 8000])
            .on("zoom", zoomed);

    function zoomed() {
        g.style("stroke-width", 1.5 / d3.event.scale + "px");
        g.attr("transform", "translate(" + d3.event.translate + ")scale(" + d3.event.scale + ")");
        // console.log("g.attr('transform') [zoomed]: " + g.attr("transform"));
        // console.log("center [zoomed]: " + path.projection().center());
        // console.log("translate [zoomed]: " + path.projection().translate());
        // console.log("rotate [zoomed]: " + path.projection().rotate());
        // console.log("scale [zoomed]: " + path.projection().scale());
    }

    // If the drag behavior prevents the default click,
    // also stop propagation so we don’t click-to-zoom.
    function stopped() {
        if (d3.event.defaultPrevented) d3.event.stopPropagation();
    }

    function reset() {
        active.classed("active", false);
        active = d3.select(null);
        svg.transition()
            .duration(750)
            .call(zoom.translate([0, 0]).scale(1).event);
        // console.log("center: " + path.projection().center());
    }

    function clicked(d) {
        if (active.node() === this) {
            return reset();
        }
        active.classed("active", false);
        active = d3.select(this).classed("active", true);

        var bounds = path.bounds(d),
            dx = bounds[1][0] - bounds[0][0],
            dy = bounds[1][1] - bounds[0][1],
            x = (bounds[0][0] + bounds[1][0]) / 2,
            y = (bounds[0][1] + bounds[1][1]) / 2,
            scale = .9 / Math.max(dx / width, dy / height),
            translate = [width / 2 - scale * x, height / 2 - scale * y];

        svg.transition()
            .duration(750)
            .call(zoom.translate(translate).scale(scale).event);
        // console.log("center [clicked]: " + path.projection().center());
    }

    vis.draw = function (params) {
        // make stuff here!
        var pars = params || {},
            scale = pars.scale || 600,
		      	cLon = pars.centerLon || 10,
    		  	cLat = pars.centerLat || 51.5,
            projection = d3.geo.albers()
                .center([cLon, cLat])
                .rotate([4.4, 0])
                .parallels([50, 60])
                .scale(scale)
                .translate([width / 2, height / 2]),
            firs = topojson.feature(vis.firs, vis.firs.objects.firs).features,

            tooltip = d3.select("#tooltip").classed("hidden", true),
            countryname = d3.select("#countryname").append("tspan"),
            graticule = d3.geo.graticule(),

            land = topojson.feature(vis.world, vis.world.objects.land),
            countries = topojson.feature(vis.world, vis.world.objects.countries).features,
            borders = topojson.mesh(vis.world, vis.world.objects.countries, function (a, b) { return a.id !== b.id; }),
            country, fir,
            fabs = [
                {"id": "BALTICFAB",   "name": "Baltic FAB"},
                {"id": "BLUMEDFAB",   "name": "BLUE MED FAB"},
                {"id": "DANUBEFAB",   "name": "DANUBE FAB"},
                {"id": "DKSEFAB",     "name": "DK-SE FAB"},
                {"id": "FABCE",       "name": "FAB CE (SES RP2)"},
                {"id": "FABEC",       "name": "FABEC"},
                {"id": "NEFAB",       "name": "NEFAB"},
                {"id":"SWFAB",        "name": "SW FAB"},
                {"id":"UKIRELANDFAB", "name": "UK-Ireland FAB"}
            ];

        function idxForName(target) {
            return function(idx, item, i) {
                return item.name === target ? i : idx;
            };
        }

        var rateById = {};
        vis.trafficdelays.forEach(function(d) {
            var obj_idx = fabs.reduce(idxForName(d.ENTITY_NAME), -1);
            if (obj_idx === -1) {
                console.log(d);
                console.log("FAB name NOT found!!!!");
            }
            else {
                //console.log(d);
                if (d.YEAR === "2015") {
                    fabs[obj_idx].rate = d.FLT_ERT_1 == 0 ? 0 : d.DLY_ERT_1 / d.FLT_ERT_1;
                    fabs[obj_idx].year = +d.YEAR;
                    rateById[fabs[obj_idx].id] = fabs[obj_idx].rate;
                }
            }
        });
        console.log(fabs);
        console.log(rateById);
        var twodecimals = d3.format(".2n");
        var rates = fabs.map(function(d) { return d.rate;});
        console.log([d3.min(rates), d3.max(rates)]);
        var qClasses = 5;
        var quantize = d3.scale.quantize()
                .domain([d3.min(rates), d3.max(rates)])
                .range(d3.range(qClasses).map(function(i) { return "q" + i + "-" + qClasses; }));
        // var color = d3.scale.threshold()
        //         .domain([.02, .03, .03, .05, .65])
        //         .range(["#f2f0f7", "#dadaeb", "#bcbddc", "#9e9ac8", "#756bb1", "#54278f"]);


        path = d3.geo.path()
            .projection(projection);

        countries.forEach(function (d) {
            vis.wnames.some(function (n) {
                if (+d.id === +n.id) {
                    d.name = n.name;
                    return d.name;
                }
            });
        });

        // /* Initialize tooltip */
        // var tip = d3.tip().attr('class', 'd3-tip').html(function(d) { return d; });
        // tip.html(function(d) {
        //     return d.name + "<br><span>" + d.name +
        //         ": avg delay per flight: " + twodecimals(d.rate) + "</span>";
        // });

        // // use tip.offset to follow an hidden circle that follows the mouse when over the FAB

        // /* Invoke the tip in the context of your visualization */
        // svg.call(tip);

        svg.on("click", stopped, true);
        background.on("click", reset);
        g.style("stroke-width", "0.5px");

        svg
            .call(zoom) // delete this line to disable free zooming
            .call(zoom.event);

        svg.on("mousemove", function () {
            // update tooltip position
            tooltip.style("top", (event.pageY + 16) + "px").style("left", (event.pageX + 10) + "px");
            return true;
        });


        svg.selectAll(".path.graticule")
            .data([graticule]).enter()
            .append("path")
            .classed("graticule", true)
            .attr("d", path);


        svg.append("g")
            .attr("class", "legendQuant")
            .attr("transform", "translate(20," + height/3 + ")");
      svg.append("g")
        .attr("transform", "translate(60," + (height/3 - 15) + ")")
        .append("text")
        .style("text-anchor", "middle")
        .text("2015 situation");

        var legend = d3.legend.color()
                .labelFormat(d3.format(".2f"))
                .useClass(true)
                .scale(quantize);

        svg.select(".legendQuant")
            .call(legend);

        country = g.selectAll(".country")
            .data(countries)
            .enter().insert("path", ".graticule")
            .attr("class", function (d) {return "country country" + d.id; })
            .attr("d", path)
            .text(function (d) { return d.id; })
            .on("mouseover", function (d, i) {
                d3.select(this).style({'stroke-opacity': 1, 'stroke': '#F00'});
                // http://stackoverflow.com/questions/17917072/#answer-17917341
                // d3.select(this.parentNode.appendChild(this)).style({'stroke-opacity':1,'stroke':'#F00'});
                if (d.id) {
                    tooltip.classed("hidden", false);
                    countryname.text(d.name);
                }
            })
            .on("mouseout", function () {
                this.style.stroke = "#000";
                tooltip.classed("hidden", true);
            })
            .on("mousedown.log", function (d) {
                console.log("id=" + d.id + "; name=" + d.name + "; centroid=[" + path.centroid(d) + "] px.");
            });


        // TODO: this seems not too much a D3 idiom...
        fabs.forEach(function (f) {
      	    // from http://stackoverflow.com/a/16093597/963575
      	    var mmm = topojson.merge(
    			      vis.firs,
    			      vis.firs.objects.firs.geometries.filter(function (d) {
      			        return d.properties.fab === f.id;
    		        }));
            mmm.id = f.id;
            mmm.name = f.name;
            mmm.rate = f.rate;
  			    g.append("path")
    			      .datum(mmm)
    			      .attr("d", path)
    			      // .attr("class", "fab " + f.id)
                // .style("fill", function(d) { return color(d.rate); })
                .attr("class", "fab " + f.id + " " + quantize(f.rate))
//                .on("click", clicked)
                .on("mouseover", function (d) {
                    d3.select(this).style("stroke", "red");
                    // tip.show(d);
                    tooltip.classed("hidden", false);
                    // countryname.text(d.name + ", avg delay per flight: " + twodecimals(d.rate));
                    countryname.html(d.name + "<br> avg delay per flight: " + twodecimals(d.rate));
                })
                .on("mouseleave", function (d) {
                    d3.select(this).style("stroke", "yellow");
                    tooltip.classed("hidden", true);
                    // tip.hide(d);
                })
            ;
        });

    };

}());
