---
layout: default
title: ATFM slot adherence
excerpt: Performance Review Unit MetaData Definitions.
keywords: metadata, dataset, performance, data, statistics, economics, air transport, flights, europe, cost efficiency
---
# {{ page.title }}

## Data description
<p>ATFM departure slots are allocated centrally by the European Network Manager upon the request of the local Flow Management Position (FMP), when an imbalance between demand and capacity is foreseen at airports and/or en-route. The purpose of such regulation is to hold aircraft on the ground. </p>
<p>An ATFM slot tolerance window is available to ATC to sequence departures. The standard slot tolerance window is [-5 minutes, +10 minutes]. ATC at the departure airport has a joint responsibility with aircraft operators to ensure that flights departure within the allocated ATFM slot tolerance window in order to optimise traffic flow. ATFM departure slot adherence, simply named ATFM slot adherence hereafter, measures the share of take-offs inside the slot tolerance window of [-5 minutes, +10 minutes].</p>
<p>ATFM slot adherence monitoring is a pre-requisite to fine tune traffic predictions at the departure, en-route airspace and at the destination airports. The higher the number of regulated departing aircraft inside the assigned ATFM standard window, the more accurate the predicted traffic and associated down-stream ATFM measures.</p>

## Column naming and types

| Column name         | Data source     | Label                                          | Column description                                                              | Example                  |
|---------------------|-----------------|------------------------------------------------|---------------------------------------------------------------------------------|--------------------------|
| YEAR                | Network Manager | YEAR                                           | Reference year                                                                  | 2015                     |
| MONTH_NUM           | Network Manager | MONTH                                          | Month (numeric)                                                                 | 5                        |
| MONTH_MON           | Network Manager |                                                | Month (3-letter code)                                                           | MAY                      |
| DATE_FLT            | Network Manager | DATE_FLT                                       | Date of flight                                                                  | 31/05/2015               |
| APT_ICAO            | Network Manager | APT_ICAO                                       | ICAO 4-letter airport designator                                                | LFPG                     |
| APT_NAME            | PRU             | APT_NAME                                       | Airport name                                                                    | Paris/ Charles de Gaulle |
| STATE_NAME          | PRU             | STATE_NAME                                     | Name of the State in which the airport is located                               | France                   |
| FLT_DEP_1           | Network Manager | IFR departures                                 | Number of IFR departures                                                        | 670                      |
| FLT_DEP_REG_1       | Network Manager | Regulated departures                           | Activated Regulated Traffic                                                     | 155                      |
| FLT_DEP_OUT_EARLY_1 | Network Manager | Regulated departures (early)                   | Regulated departures before the slot tolerance window (Early Take-Off Traffic)  | 7                        |
| FLT_DEP_IN_1        | Network Manager | Regulated departures (within departure window) | Regulated departures within the slot tolerance window [-5 minutes, +10 minutes] | 140                      |
| FLT_DEP_OUT_LATE_1  | Network Manager | Regulated departures (late)                    | Regulated departures after the slot tolerance window (Late Take-Off Traffic)    | 8                        |                               | 0          |
