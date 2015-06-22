---
layout: default
title: Airport ATFM Delay Dataset
excerpt: Performance Review Unit MetaData Definitions.
keywords: metadata, dataset, performance, data, statistics, economics, air transport, flights, europe, cost efficiency
---
# {{ page.title }}


## Column naming and types

| Column name  | Data source     | Label                                 | Column description                                                            | Example     |
|--------------|-----------------|---------------------------------------|-------------------------------------------------------------------------------|-------------|
| YEAR         | Network Manager | YEAR                                  | Reference year                                                                | 2015        |
| MONTH_NUM    | Network Manager | MONTH                                 | Month (numeric)                                                               | 2           |
| MONTH_MON    | Network Manager |                                       | Month (3-letter code)                                                         | FEB         |
| FLT_DATE     | Network Manager | FLT_DATE                              | Date of the flight                                                            | 11/02/2015  |
| APT_ICAO     | Network Manager | APT_ICAO                              | ICAO 4-letter airport designator                                              | LSGG        |
| APT_NAME     | PRU             | APT_NAME                              | Airport name                                                                  | Geneva      |
| STATE_NAME   | PRU             | STATE_NAME                            |                                                                               | Switzerland |
| FLT_ARR_1    | Network Manager | IFR arrivals (source: NM)             | Number of IFR arrivals (source:NM)                                            | 221         |
| FLT_DEP_1    | Network Manager | IFR departures (source: NM)           | Number of IFR departures (source:NM)                                          | 208         |
| FLT_TOT_1    | Network Manager | IFR flights (arr + dep) - (source:NM) | Number total IFR movements (source:NM)                                        | 429         |
| DLY_APT_1    | Network Manager | Airport ATFM arrival delay            | Minutes of airport ATFM delay                                                 | 1312        |
| DLY_APT_A_1  | Network Manager | A - Accident/Incident                 | Minutes of airport ATFM delay with delay code A - Accident/Incident           | 0           |
| DLY_APT_C_1  | Network Manager | C - ATC Capacity                      | Minutes of airport ATFM delay with delay code C - ATC Capacity                | 0           |
| DLY_APT_D_1  | Network Manager | D - De-icing                          | Minutes of airport ATFM delay with delay code D - De-icing                    | 0           |
| DLY_APT_E_1  | Network Manager | E - Equipment (non-ATC)               | Minutes of airport ATFM delay with delay code E - Equipment (non-ATC)         | 0           |
| DLY_APT_G_1  | Network Manager | G - Aerodrome Capacity                | Minutes of airport ATFM delay with delay code G - Aerodrome Capacity          | 0           |
| DLY_APT_I_1  | Network Manager | I - Industrial Action (ATC)           | Minutes of airport ATFM delay with delay code I - Industrial Action (ATC)     | 0           |
| DLY_APT_M_1  | Network Manager | M - Airspace Management               | Minutes of airport ATFM delay with delay code M - Airspace Management         | 0           |
| DLY_APT_N_1  | Network Manager | N - Industrial Action (non-ATC)       | Minutes of airport ATFM delay with delay code N - Industrial Action (non-ATC) | 0           |
| DLY_APT_O_1  | Network Manager | O - Other                             | Minutes of airport ATFM delay with delay code O - Other                       | 0           |
| DLY_APT_P_1  | Network Manager | P - Special Event                     | Minutes of airport ATFM delay with delay code P - Special Event               | 0           |
| DLY_APT_R_1  | Network Manager | R - ATC Routeing                      | Minutes of airport ATFM delay with delay code R - ATC Routeing                | 0           |
| DLY_APT_S_1  | Network Manager | S - ATC Staffing                      | Minutes of airport ATFM delay with delay code S - ATC Staffing                | 1312        |
| DLY_APT_T_1  | Network Manager | T - Equipment (ATC)                   | Minutes of airport ATFM delay with delay code T - Equipment (ATC)             | 0           |
| DLY_APT_V_1  | Network Manager | V - Environmental Issues              | Minutes of airport ATFM delay with delay code V - Environmental Issues        | 0           |
| DLY_APT_W_1  | Network Manager | W - Weather                           | Minutes of airport ATFM delay with delay code W - Weather                     | 0           |
| DLY_APT_NA_1 | Network Manager | NA - Not specified                    | Minutes of airport ATFM delay with delay code NA - Not specified              | 0           |
