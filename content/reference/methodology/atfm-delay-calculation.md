---
title: Modification of the ATFM delay calculation (NM release 20.0)
categories:
  - metadata
  - methodology
type: methodology
slug: atfm-delay-calculation
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


## Background

Air Navigation Service Providers (ANSPs) noticed that the use of the Ready
Message (REA) - whilst attempting to improve punctuality for aircraft – could
result in artificial changes to the computed ATFM delay for individual
flights and for the ANSP that has requested the regulation.

The ANSPs brought this to the attention of the Network Management Board (NMB).
The ANSPs, together with the airspace users and the Network Manager reviewed the
existing situation and developed a more accurate process which avoids artificial
changes to the computed ATFM delay when a REA message is used.

The more accurate process was presented to the NMB and approved in March 2015
for implementation with NM software release 20.0 on April 04 2016.

## NM software version 20.0 related changes (04 April 2016)

The changes implemented with the release of NM software version 20.0 on 04 April
2016 reduce the overall level of computed ATFM delay. The changes are described
in more detail in the relevant [NM Release presentation][NM20-rn].


## Impact on this webpage

The ATFM delay related graphs shown on this web page and data in the 
[download area](/data/performancearea/) take the change in 
methodology as of April 2016 into account.

In the ATFM delay download files, the data computed in accordance with the old methodology 
(i.e. REA message related ATFM delays are included) are marked as **Version 1** and the data 
based on the revised methodology (as of 04 April 2016) are marked as **Version 2**.


[NM20-rn]: /library/NM_20_FB750_Delay_Calculation_improvements.pdf "NM 20 Release Notes: Delay calculation improvements"
