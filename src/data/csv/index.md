---
layout: default
title: Datasets in CSV format
---
# {{ page.title }}

PRU provides some relevant datasets in CSV format (compressed using [bzip2][bzip2]):

The filename convention we adopted is as follows:

> `<dataset group>_<YYYY>.csv.bz2`

where
> `<dataset group> = <dataset>_<group>`

The datasets made available are:

* Daily en-route delays: `ert_dly`
    * [ANSP][ansp] group (see [list of ANSP's considered by PRU][ansps]): `ansp`
    * Country FIR group: `fir`

For example `ert_dly_ansp_2012.csv.bz2` refers to en-rote delays dataset with ANSP breakdown for year 2012.

## Dataset files

{% directory path: data/csv exclude: .md$ %}
* [{{ file.name }}]({{ file.url }})
{% enddirectory %}

[bzip2]: <https://en.wikipedia.org/wiki/Bzip2> "Wikipedia: bzip2"
[ansp]: <{{ "/references/acronym/ansp.html"| prepend: site.baseurl | prepend: site.url }}> "ANSP"
[ansps]: <{{ "/references/ANSP/"| prepend: site.baseurl | prepend: site.url }}> "ANSP's"
