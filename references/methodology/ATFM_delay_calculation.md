---
layout: default
title: Modification of the ATFM delay calculation (NM release 20.0)
subtitle: Different versions of ATFM delay computation
excerpt: Performance Review Unit Metadata Definitions.
keywords: ATFM, metrics, metadata, performance, data, statistics, economics, air transport, flights, europe, 
needsMath: true
---
<style>
img + em {
text-align: center;
}

img + em:before {
content: ' ';
display: block;
}
</style>

# {{ page.title }}


# Background

Air Navigation Service Providers (ANSPs) noticed that the use of the Ready Message (REA) - whilst attempting to improve punctuality for aircraft – could result in negative changes to the computed ATFM delay for individual flights and for the ANSP that has requested the regulation. The ANSPs brought this to the attention of the Network Management Board (NMB). The ANSPs, together with the airspace users and the Network Manager reviewed the existing situation and developed a more accurate process which avoids negative changes to the computed ATFM delay when a REA message is used. 

The more accurate process was presented to the NMB and approved in March 2015 for implementation with NM software release 20.0 on April 04 2016. 

## NM software version 20.0 related changes (04 April 2016)

The changes implemented with the release of NM software version 20.0 on 04 April 2016 reduce the overall level of computed ATFM delay. The changes are described in more detail in the <a href="{{site.url}}/references/library/NM_20_FB750_Delay_Calculation_improvements.pdf">NM release presentation</a>. 

## Impact on this webpage

**Graphs:** The ATFM delay related graphs shown on this web page take the change in methodology as of April 2016 into account. 

**Download area:** In the interest of transparency, the PRU publishes both data sets in the <a href="{{site.url}}/data/performancearea/">download area</a>. 

* ATFM delays based on the old methodology (i.e. REA message related ATFM delays are included) are marked as **Version 1**. 

* ATFM delays based on the revised methodology (as of 04 April 2016) are marked as **Version 2**.  