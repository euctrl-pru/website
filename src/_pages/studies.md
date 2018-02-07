---
layout: default
permalink: /studies/
title: "Studies"
---
# {{ page.title }}
<div class="container">
<div class="row">
{% assign studies = site.studies | sort: "date" | reverse %}

{% for s in studies  %}
    {% capture this_year %}{{ s.date | date: "%Y" }}{% endcapture %}
    {% capture next_year %}{{ s.previous.date | date: "%Y" }}{% endcapture %}

    {% if forloop.first %}
        <h3 id="{{ this_year }}-ref">{{this_year}}</h3>
        <ul>
    {% endif %}

    <h4>{{ s.date | date: "%d %b" }} &mdash; <a href="{{ s.url | prepend: site.baseurl | prepend: site.url }}" title="{{ s.title }}">{{ s.title }}</a></h4>
    <p>{{ s.excerpt | strip_html | truncate: 160 }}</p>

    {% if forloop.last %}
        </ul>
    {% else %}
        {% if this_year != next_year %}
            </ul>
            <h3 id="{{ next_year }}-ref">{{next_year}}</h3>
            <ul>
        {% endif %}
    {% endif %}
{% endfor %}

</div>
</div>
