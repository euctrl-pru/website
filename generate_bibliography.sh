cat <<EOF
---
layout: page
title: Referenced material and Sources
permalink: /references/
link-citations: true
nocite: |
  $(cat references.bib |  grep -e '^@\(.*\),$' | sed -e 's/^@.*{/@/' -e 's/,$//'| sort | tr '\n' ','|sed -e 's/,$//')
---

## Eurocontrol
See [@aocost,@bada,@complexitymetrics,@delaycost,@ir691,@jetzki,@plan4delay,@prc:tor,@pru:aces,@pru:atmapmet,@upr].

## EU Law
Various EU directives drive the work PRU performs for PRB.
See [@ec:1794/2006,@ec:2096/2005,@ec:50/2008,@ec:549/2004,@ec:793/2004,@ec:betterairports,@eec:95/93,@eu:255/2010,@eu:691/2010]


## ICAO, IATA et al.
See [@iata:delaycodes,@iata:slot,@icao:4444,@icao:8168,@icao:9829,@icao:9854,@icao:asbu,@nats:3di]


## Statistics and Data Visualization
See [@bertin,@clevelandTEGD,tufteBE,@tufteEI,@tuftePP,@tufteVDQI,@tufteVISEX,@wickhamTidy]


## Other
See [@dataSP,@mathjax,@pandoc,]

# References

EOF