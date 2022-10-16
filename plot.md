visualisasi
================
farhan
16/10/2022

``` r
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library(tidyverse)
```

    ## -- Attaching packages --------------------------------------- tidyverse 1.3.0 --

    ## v ggplot2 3.3.6     v purrr   0.3.4
    ## v tibble  3.1.0     v stringr 1.4.0
    ## v tidyr   1.1.3     v forcats 0.5.1
    ## v readr   1.4.0

    ## -- Conflicts ------------------------------------------ tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
library(knitr)
```

    ## Warning: package 'knitr' was built under R version 4.0.5

1.  Cek missing value dari data `grads`

``` r
grads <- read.csv("data/recent-grads.csv")
grads %>% 
  is.na() %>% 
  colSums()
```

    ##                 Rank           Major_code                Major 
    ##                    0                    0                    0 
    ##                Total                  Men                Women 
    ##                    1                    1                    1 
    ##       Major_category           ShareWomen          Sample_size 
    ##                    0                    1                    0 
    ##             Employed            Full_time            Part_time 
    ##                    0                    0                    0 
    ## Full_time_year_round           Unemployed    Unemployment_rate 
    ##                    0                    0                    0 
    ##               Median                P25th                P75th 
    ##                    0                    0                    0 
    ##         College_jobs     Non_college_jobs        Low_wage_jobs 
    ##                    0                    0                    0

2.  Isi missing value dengan nilai median dari tiap variabel. Kemudian,
    cek kembali missing valuenya.

``` r
gradsnew <- grads %>% 
  drop_na()
gradsnew
```

    ##     Rank Major_code
    ## 1      1       2419
    ## 2      2       2416
    ## 3      3       2415
    ## 4      4       2417
    ## 5      5       2405
    ## 6      6       2418
    ## 7      7       6202
    ## 8      8       5001
    ## 9      9       2414
    ## 10    10       2408
    ## 11    11       2407
    ## 12    12       2401
    ## 13    13       2404
    ## 14    14       5008
    ## 15    15       2409
    ## 16    16       2402
    ## 17    17       2412
    ## 18    18       2400
    ## 19    19       2403
    ## 20    20       3201
    ## 21    21       2102
    ## 22    23       2502
    ## 23    24       2413
    ## 24    25       6212
    ## 25    26       2406
    ## 26    27       5601
    ## 27    28       6204
    ## 28    29       2499
    ## 29    30       5402
    ## 30    31       2410
    ## 31    32       2500
    ## 32    33       6099
    ## 33    34       2411
    ## 34    35       6107
    ## 35    36       6207
    ## 36    37       5501
    ## 37    38       6205
    ## 38    39       2503
    ## 39    40       5102
    ## 40    41       6201
    ## 41    42       3700
    ## 42    43       2100
    ## 43    44       5007
    ## 44    45       6105
    ## 45    46       2105
    ## 46    47       3702
    ## 47    48       3701
    ## 48    49       3607
    ## 49    50       5006
    ## 50    51       2501
    ## 51    52       6104
    ## 52    53       4005
    ## 53    54       2101
    ## 54    55       4006
    ## 55    56       2303
    ## 56    57       5505
    ## 57    58       6200
    ## 58    59       1401
    ## 59    60       6210
    ## 60    61       6108
    ## 61    62       3603
    ## 62    63       6299
    ## 63    64       1101
    ## 64    65       1100
    ## 65    66       2599
    ## 66    67       2504
    ## 67    68       3605
    ## 68    69       5599
    ## 69    70       6403
    ## 70    71       5205
    ## 71    72       1102
    ## 72    73       5000
    ## 73    74       3801
    ## 74    75       5003
    ## 75    76       5701
    ## 76    77       6203
    ## 77    78       6206
    ## 78    79       5506
    ## 79    80       5504
    ## 80    81       3606
    ## 81    82       2106
    ## 82    83       3601
    ## 83    84       3602
    ## 84    85       2107
    ## 85    86       5004
    ## 86    87       6209
    ## 87    88       3202
    ## 88    89       6199
    ## 89    90       5401
    ## 90    91       5005
    ## 91    92       5206
    ## 92    93       1301
    ## 93    94       1901
    ## 94    95       5301
    ## 95    96       6004
    ## 96    97       1902
    ## 97    98       5098
    ## 98    99       1904
    ## 99   100       1501
    ## 100  101       2310
    ## 101  102       3608
    ## 102  103       5503
    ## 103  104       4002
    ## 104  105       6103
    ## 105  106       2001
    ## 106  107       5901
    ## 107  108       1303
    ## 108  109       3611
    ## 109  110       4000
    ## 110  111       5002
    ## 111  112       1302
    ## 112  113       1106
    ## 113  114       2300
    ## 114  115       6402
    ## 115  116       2602
    ## 116  117       4001
    ## 117  118       2311
    ## 118  119       6110
    ## 119  120       2305
    ## 120  121       2301
    ## 121  122       6106
    ## 122  123       3699
    ## 123  124       3600
    ## 124  125       5507
    ## 125  126       1903
    ## 126  127       6109
    ## 127  128       6211
    ## 128  129       2313
    ## 129  130       2601
    ## 130  131       2399
    ## 131  132       4007
    ## 132  133       3604
    ## 133  134       2309
    ## 134  135       6100
    ## 135  136       4801
    ## 136  137       2314
    ## 137  138       3301
    ## 138  139       2304
    ## 139  140       4101
    ## 140  141       3401
    ## 141  142       6005
    ## 142  143       5500
    ## 143  144       1105
    ## 144  145       2308
    ## 145  146       5200
    ## 146  147       6002
    ## 147  148       2306
    ## 148  149       6006
    ## 149  150       6000
    ## 150  151       2901
    ## 151  152       5404
    ## 152  153       1103
    ## 153  154       6003
    ## 154  155       2312
    ## 155  156       5299
    ## 156  157       5403
    ## 157  158       3402
    ## 158  159       4901
    ## 159  160       6007
    ## 160  161       2201
    ## 161  162       1199
    ## 162  163       5502
    ## 163  164       6102
    ## 164  165       2307
    ## 165  166       2603
    ## 166  167       6001
    ## 167  168       3302
    ## 168  169       3609
    ## 169  170       5201
    ## 170  171       5202
    ## 171  172       5203
    ## 172  173       3501
    ##                                                                 Major  Total
    ## 1                                               PETROLEUM ENGINEERING   2339
    ## 2                                      MINING AND MINERAL ENGINEERING    756
    ## 3                                           METALLURGICAL ENGINEERING    856
    ## 4                           NAVAL ARCHITECTURE AND MARINE ENGINEERING   1258
    ## 5                                                CHEMICAL ENGINEERING  32260
    ## 6                                                 NUCLEAR ENGINEERING   2573
    ## 7                                                   ACTUARIAL SCIENCE   3777
    ## 8                                          ASTRONOMY AND ASTROPHYSICS   1792
    ## 9                                              MECHANICAL ENGINEERING  91227
    ## 10                                             ELECTRICAL ENGINEERING  81527
    ## 11                                               COMPUTER ENGINEERING  41542
    ## 12                                              AEROSPACE ENGINEERING  15058
    ## 13                                             BIOMEDICAL ENGINEERING  14955
    ## 14                                                  MATERIALS SCIENCE   4279
    ## 15                          ENGINEERING MECHANICS PHYSICS AND SCIENCE   4321
    ## 16                                             BIOLOGICAL ENGINEERING   8925
    ## 17                           INDUSTRIAL AND MANUFACTURING ENGINEERING  18968
    ## 18                                                GENERAL ENGINEERING  61152
    ## 19                                          ARCHITECTURAL ENGINEERING   2825
    ## 20                                                    COURT REPORTING   1148
    ## 21                                                   COMPUTER SCIENCE 128319
    ## 22                                  ELECTRICAL ENGINEERING TECHNOLOGY  11565
    ## 23                        MATERIALS ENGINEERING AND MATERIALS SCIENCE   2993
    ## 24                      MANAGEMENT INFORMATION SYSTEMS AND STATISTICS  18713
    ## 25                                                  CIVIL ENGINEERING  53153
    ## 26                                              CONSTRUCTION SERVICES  18498
    ## 27                                OPERATIONS LOGISTICS AND E-COMMERCE  11732
    ## 28                                          MISCELLANEOUS ENGINEERING   9133
    ## 29                                                      PUBLIC POLICY   5978
    ## 30                                          ENVIRONMENTAL ENGINEERING   4047
    ## 31                                           ENGINEERING TECHNOLOGIES   3600
    ## 32                                            MISCELLANEOUS FINE ARTS   3340
    ## 33                             GEOLOGICAL AND GEOPHYSICAL ENGINEERING    720
    ## 34                                                            NURSING 209394
    ## 35                                                            FINANCE 174506
    ## 36                                                          ECONOMICS 139247
    ## 37                                                 BUSINESS ECONOMICS  13302
    ## 38                                 INDUSTRIAL PRODUCTION TECHNOLOGIES   4631
    ## 39         NUCLEAR, INDUSTRIAL RADIOLOGY, AND BIOLOGICAL TECHNOLOGIES   2116
    ## 40                                                         ACCOUNTING 198633
    ## 41                                                        MATHEMATICS  72397
    ## 42                                   COMPUTER AND INFORMATION SYSTEMS  36698
    ## 43                                                            PHYSICS  32142
    ## 44                                   MEDICAL TECHNOLOGIES TECHNICIANS  15914
    ## 45                                               INFORMATION SCIENCES  11913
    ## 46                                    STATISTICS AND DECISION SCIENCE   6251
    ## 47                                                APPLIED MATHEMATICS   4939
    ## 48                                                       PHARMACOLOGY   1762
    ## 49                                                       OCEANOGRAPHY   2418
    ## 50                              ENGINEERING AND INDUSTRIAL MANAGEMENT   2906
    ## 51                                         MEDICAL ASSISTING SERVICES  11123
    ## 52                                   MATHEMATICS AND COMPUTER SCIENCE    609
    ## 53                           COMPUTER PROGRAMMING AND DATA PROCESSING   4168
    ## 54                                COGNITIVE SCIENCE AND BIOPSYCHOLOGY   3831
    ## 55                                          SCHOOL STUDENT COUNSELING    818
    ## 56                                            INTERNATIONAL RELATIONS  28187
    ## 57                                                   GENERAL BUSINESS 234590
    ## 58                                                       ARCHITECTURE  46420
    ## 59                                             INTERNATIONAL BUSINESS  25894
    ## 60                PHARMACY PHARMACEUTICAL SCIENCES AND ADMINISTRATION  23551
    ## 61                                                  MOLECULAR BIOLOGY  18300
    ## 62                    MISCELLANEOUS BUSINESS & MEDICAL ADMINISTRATION  17947
    ## 63                              AGRICULTURE PRODUCTION AND MANAGEMENT  14240
    ## 64                                                GENERAL AGRICULTURE  10399
    ## 65                             MISCELLANEOUS ENGINEERING TECHNOLOGIES   8804
    ## 66                        MECHANICAL ENGINEERING RELATED TECHNOLOGIES   4790
    ## 67                                                           GENETICS   3635
    ## 68                                      MISCELLANEOUS SOCIAL SCIENCES   3283
    ## 69                                              UNITED STATES HISTORY   3079
    ## 70                           INDUSTRIAL AND ORGANIZATIONAL PSYCHOLOGY   3014
    ## 71                                             AGRICULTURAL ECONOMICS   2439
    ## 72                                                  PHYSICAL SCIENCES   1436
    ## 73                                              MILITARY TECHNOLOGIES    124
    ## 74                                                          CHEMISTRY  66530
    ## 75  ELECTRICAL, MECHANICAL, AND PRECISION TECHNOLOGIES AND PRODUCTION   2435
    ## 76                             BUSINESS MANAGEMENT AND ADMINISTRATION 329927
    ## 77                                   MARKETING AND MARKETING RESEARCH 205211
    ## 78                                   POLITICAL SCIENCE AND GOVERNMENT 182621
    ## 79                                                          GEOGRAPHY  18480
    ## 80                                                       MICROBIOLOGY  15232
    ## 81                    COMPUTER ADMINISTRATION MANAGEMENT AND SECURITY   8066
    ## 82                                               BIOCHEMICAL SCIENCES  39107
    ## 83                                                             BOTANY   1329
    ## 84                         COMPUTER NETWORKING AND TELECOMMUNICATIONS   7613
    ## 85                                          GEOLOGY AND EARTH SCIENCE  10972
    ## 86                           HUMAN RESOURCES AND PERSONNEL MANAGEMENT  24497
    ## 87                                          PRE-LAW AND LEGAL STUDIES  13528
    ## 88                           MISCELLANEOUS HEALTH MEDICAL PROFESSIONS  13386
    ## 89                                              PUBLIC ADMINISTRATION   5629
    ## 90                                                        GEOSCIENCES   1978
    ## 91                                                  SOCIAL PSYCHOLOGY   1386
    ## 92                                              ENVIRONMENTAL SCIENCE  25965
    ## 93                                                     COMMUNICATIONS 213996
    ## 94                               CRIMINAL JUSTICE AND FIRE PROTECTION 152824
    ## 95                                  COMMERCIAL ART AND GRAPHIC DESIGN 103480
    ## 96                                                         JOURNALISM  72619
    ## 97                              MULTI-DISCIPLINARY OR GENERAL SCIENCE  62052
    ## 98                                   ADVERTISING AND PUBLIC RELATIONS  53162
    ## 99                               AREA ETHNIC AND CIVILIZATION STUDIES  31195
    ## 100                                           SPECIAL NEEDS EDUCATION  28739
    ## 101                                                        PHYSIOLOGY  22060
    ## 102                                                       CRIMINOLOGY  19879
    ## 103                                                NUTRITION SCIENCES  18909
    ## 104                        HEALTH AND MEDICAL ADMINISTRATIVE SERVICES  18109
    ## 105                                        COMMUNICATION TECHNOLOGIES  18035
    ## 106                          TRANSPORTATION SCIENCES AND TECHNOLOGIES  15150
    ## 107                                      NATURAL RESOURCES MANAGEMENT  13773
    ## 108                                                      NEUROSCIENCE  13663
    ## 109                                   MULTI/INTERDISCIPLINARY STUDIES  12296
    ## 110                              ATMOSPHERIC SCIENCES AND METEOROLOGY   4043
    ## 111                                                          FORESTRY   3607
    ## 112                                                      SOIL SCIENCE    685
    ## 113                                                 GENERAL EDUCATION 143718
    ## 114                                                           HISTORY 141951
    ## 115     FRENCH GERMAN LATIN AND OTHER COMMON FOREIGN LANGUAGE STUDIES  48246
    ## 116                           INTERCULTURAL AND INTERNATIONAL STUDIES  24650
    ## 117                       SOCIAL SCIENCE OR HISTORY TEACHER EDUCATION  20198
    ## 118                                       COMMUNITY AND PUBLIC HEALTH  19735
    ## 119                                     MATHEMATICS TEACHER EDUCATION  14237
    ## 120                        EDUCATIONAL ADMINISTRATION AND SUPERVISION    804
    ## 121                           HEALTH AND MEDICAL PREPARATORY PROGRAMS  12740
    ## 122                                             MISCELLANEOUS BIOLOGY  10706
    ## 123                                                           BIOLOGY 280709
    ## 124                                                         SOCIOLOGY 115433
    ## 125                                                        MASS MEDIA  52824
    ## 126                                     TREATMENT THERAPY PROFESSIONS  48491
    ## 127                                            HOSPITALITY MANAGEMENT  43647
    ## 128                                      LANGUAGE AND DRAMA EDUCATION  30471
    ## 129               LINGUISTICS AND COMPARATIVE LANGUAGE AND LITERATURE  16601
    ## 130                                           MISCELLANEOUS EDUCATION  10150
    ## 131                                 INTERDISCIPLINARY SOCIAL SCIENCES   9916
    ## 132                                                           ECOLOGY   9154
    ## 133                                       SECONDARY TEACHER EDUCATION  17125
    ## 134                               GENERAL MEDICAL AND HEALTH SERVICES  33599
    ## 135                                  PHILOSOPHY AND RELIGIOUS STUDIES  54814
    ## 136                                           ART AND MUSIC EDUCATION  34181
    ## 137                                   ENGLISH LANGUAGE AND LITERATURE 194673
    ## 138                                              ELEMENTARY EDUCATION 170862
    ## 139                     PHYSICAL FITNESS PARKS RECREATION AND LEISURE 125074
    ## 140                                                      LIBERAL ARTS  71369
    ## 141                                  FILM VIDEO AND PHOTOGRAPHIC ARTS  38761
    ## 142                                           GENERAL SOCIAL SCIENCES  12920
    ## 143                                        PLANT SCIENCE AND AGRONOMY   7416
    ## 144                            SCIENCE AND COMPUTER TEACHER EDUCATION   6483
    ## 145                                                        PSYCHOLOGY 393735
    ## 146                                                             MUSIC  60633
    ## 147                            PHYSICAL AND HEALTH EDUCATION TEACHING  28213
    ## 148                                         ART HISTORY AND CRITICISM  21030
    ## 149                                                         FINE ARTS  74440
    ## 150                                      FAMILY AND CONSUMER SCIENCES  58001
    ## 151                                                       SOCIAL WORK  53552
    ## 152                                                   ANIMAL SCIENCES  21573
    ## 153                                        VISUAL AND PERFORMING ARTS  16250
    ## 154                                TEACHER EDUCATION: MULTIPLE LEVELS  14443
    ## 155                                          MISCELLANEOUS PSYCHOLOGY   9628
    ## 156                         HUMAN SERVICES AND COMMUNITY ORGANIZATION   9374
    ## 157                                                        HUMANITIES   6652
    ## 158                                  THEOLOGY AND RELIGIOUS VOCATIONS  30207
    ## 159                                                       STUDIO ARTS  16977
    ## 160                            COSMETOLOGY SERVICES AND CULINARY ARTS  10510
    ## 161                                         MISCELLANEOUS AGRICULTURE   1488
    ## 162                                       ANTHROPOLOGY AND ARCHEOLOGY  38844
    ## 163                     COMMUNICATION DISORDERS SCIENCES AND SERVICES  38279
    ## 164                                         EARLY CHILDHOOD EDUCATION  37589
    ## 165                                           OTHER FOREIGN LANGUAGES  11204
    ## 166                                            DRAMA AND THEATER ARTS  43249
    ## 167                                          COMPOSITION AND RHETORIC  18953
    ## 168                                                           ZOOLOGY   8409
    ## 169                                            EDUCATIONAL PSYCHOLOGY   2854
    ## 170                                               CLINICAL PSYCHOLOGY   2838
    ## 171                                             COUNSELING PSYCHOLOGY   4626
    ## 172                                                   LIBRARY SCIENCE   1098
    ##        Men  Women                      Major_category ShareWomen Sample_size
    ## 1     2057    282                         Engineering 0.12056434          36
    ## 2      679     77                         Engineering 0.10185185           7
    ## 3      725    131                         Engineering 0.15303738           3
    ## 4     1123    135                         Engineering 0.10731320          16
    ## 5    21239  11021                         Engineering 0.34163050         289
    ## 6     2200    373                         Engineering 0.14496697          17
    ## 7     2110   1667                            Business 0.44135557          51
    ## 8      832    960                   Physical Sciences 0.53571429          10
    ## 9    80320  10907                         Engineering 0.11955890        1029
    ## 10   65511  16016                         Engineering 0.19645026         631
    ## 11   33258   8284                         Engineering 0.19941264         399
    ## 12   12953   2105                         Engineering 0.13979280         147
    ## 13    8407   6548                         Engineering 0.43784687          79
    ## 14    2949   1330                         Engineering 0.31082028          22
    ## 15    3526    795                         Engineering 0.18398519          30
    ## 16    6062   2863                         Engineering 0.32078431          55
    ## 17   12453   6515                         Engineering 0.34347322         183
    ## 18   45683  15469                         Engineering 0.25295984         425
    ## 19    1835    990                         Engineering 0.35044248          26
    ## 20     877    271                 Law & Public Policy 0.23606272          14
    ## 21   99743  28576             Computers & Mathematics 0.22269500        1196
    ## 22    8181   3384                         Engineering 0.29260700          97
    ## 23    2020    973                         Engineering 0.32509188          22
    ## 24   13496   5217                            Business 0.27879015         278
    ## 25   41081  12072                         Engineering 0.22711794         565
    ## 26   16820   1678 Industrial Arts & Consumer Services 0.09071251         295
    ## 27    7921   3811                            Business 0.32483805         156
    ## 28    7398   1735                         Engineering 0.18997044         118
    ## 29    2639   3339                 Law & Public Policy 0.55854801          55
    ## 30    2662   1385                         Engineering 0.34222881          26
    ## 31    2695    905                         Engineering 0.25138889          39
    ## 32    1970   1370                                Arts 0.41017964          30
    ## 33     488    232                         Engineering 0.32222222           5
    ## 34   21773 187621                              Health 0.89601899        2554
    ## 35  115030  59476                            Business 0.34082496        2189
    ## 36   89749  49498                      Social Science 0.35546906        1322
    ## 37    7575   5727                            Business 0.43053676         199
    ## 38    3477   1154                         Engineering 0.24919024          73
    ## 39     528   1588                   Physical Sciences 0.75047259          31
    ## 40   94519 104114                            Business 0.52415258        2042
    ## 41   39956  32441             Computers & Mathematics 0.44809868         541
    ## 42   27392   9306             Computers & Mathematics 0.25358330         425
    ## 43   23080   9062                   Physical Sciences 0.28193641         142
    ## 44    3916  11998                              Health 0.75392736         190
    ## 45    9005   2908             Computers & Mathematics 0.24410308         158
    ## 46    2960   3291             Computers & Mathematics 0.52647576          37
    ## 47    2794   2145             Computers & Mathematics 0.43429844          45
    ## 48     515   1247              Biology & Life Science 0.70771850           3
    ## 49     752   1666                   Physical Sciences 0.68899917          36
    ## 50    2400    506                         Engineering 0.17412251          29
    ## 51     803  10320                              Health 0.92780725          67
    ## 52     500    109             Computers & Mathematics 0.17898194           7
    ## 53    3046   1122             Computers & Mathematics 0.26919386          43
    ## 54    1667   2164              Biology & Life Science 0.56486557          25
    ## 55     119    699                           Education 0.85452323           4
    ## 56   10345  17842                      Social Science 0.63298684         219
    ## 57  132238 102352                            Business 0.43630163        2380
    ## 58   25463  20957                         Engineering 0.45146489         362
    ## 59   10624  15270                            Business 0.58971190         260
    ## 60    8697  14854                              Health 0.63071632          38
    ## 61    7426  10874              Biology & Life Science 0.59420765          90
    ## 62   10285   7662                            Business 0.42692372         244
    ## 63    9658   4582     Agriculture & Natural Resources 0.32176966         273
    ## 64    6053   4346     Agriculture & Natural Resources 0.41792480         158
    ## 65    7043   1761                         Engineering 0.20002272         125
    ## 66    4419    371                         Engineering 0.07745303          71
    ## 67    1761   1874              Biology & Life Science 0.51554333          11
    ## 68    1499   1784                      Social Science 0.54340542          28
    ## 69    1756   1323           Humanities & Liberal Arts 0.42968496          22
    ## 70    1075   1939            Psychology & Social Work 0.64333112          24
    ## 71    1749    690     Agriculture & Natural Resources 0.28290283          44
    ## 72     894    542                   Physical Sciences 0.37743733          10
    ## 73     124      0 Industrial Arts & Consumer Services 0.00000000           4
    ## 74   32923  33607                   Physical Sciences 0.50514054         353
    ## 75    1869    566 Industrial Arts & Consumer Services 0.23244353          37
    ## 76  173809 156118                            Business 0.47318952        4212
    ## 77   78857 126354                            Business 0.61572723        2684
    ## 78   93880  88741                      Social Science 0.48592988        1387
    ## 79   11404   7076                      Social Science 0.38290043         179
    ## 80    6383   8849              Biology & Life Science 0.58094800          62
    ## 81    6607   1459             Computers & Mathematics 0.18088272         103
    ## 82   18951  20156              Biology & Life Science 0.51540645         174
    ## 83     626    703              Biology & Life Science 0.52896915           9
    ## 84    5291   2322             Computers & Mathematics 0.30500460          97
    ## 85    5813   5159                   Physical Sciences 0.47019687          78
    ## 86    6184  18313                            Business 0.74756093         264
    ## 87    4435   9093                 Law & Public Policy 0.67216144          92
    ## 88    1589  11797                              Health 0.88129389          81
    ## 89    2947   2682                 Law & Public Policy 0.47646118          46
    ## 90     809   1169                   Physical Sciences 0.59100101          18
    ## 91     413    973            Psychology & Social Work 0.70202020           8
    ## 92   10787  15178              Biology & Life Science 0.58455613         225
    ## 93   70619 143377         Communications & Journalism 0.66999851        2394
    ## 94   80231  72593                 Law & Public Policy 0.47501047        1728
    ## 95   32041  71439                                Arts 0.69036529        1186
    ## 96   23736  48883         Communications & Journalism 0.67314339         843
    ## 97   27015  35037                   Physical Sciences 0.56463933         427
    ## 98   12862  40300         Communications & Journalism 0.75806027         681
    ## 99    8739  22456           Humanities & Liberal Arts 0.71985895         249
    ## 100   2682  26057                           Education 0.90667734         246
    ## 101   8422  13638              Biology & Life Science 0.61822303          99
    ## 102  10031   9848                      Social Science 0.49539715         214
    ## 103   2563  16346                              Health 0.86445608         118
    ## 104   4266  13843                              Health 0.76442653         184
    ## 105  11431   6604             Computers & Mathematics 0.36617688         208
    ## 106  13257   1893 Industrial Arts & Consumer Services 0.12495049         180
    ## 107   8617   5156     Agriculture & Natural Resources 0.37435562         152
    ## 108   4944   8719              Biology & Life Science 0.63814682          53
    ## 109   2817   9479                   Interdisciplinary 0.77090111         128
    ## 110   2744   1299                   Physical Sciences 0.32129607          32
    ## 111   3156    451     Agriculture & Natural Resources 0.12503465          48
    ## 112    476    209     Agriculture & Natural Resources 0.30510949           4
    ## 113  26893 116825                           Education 0.81287661         919
    ## 114  78253  63698           Humanities & Liberal Arts 0.44873231        1058
    ## 115  12835  35411           Humanities & Liberal Arts 0.73396758         342
    ## 116   8575  16075           Humanities & Liberal Arts 0.65212982         184
    ## 117   9950  10248                           Education 0.50737697         157
    ## 118   4103  15632                              Health 0.79209526         130
    ## 119   3872  10365                           Education 0.72803259         123
    ## 120    280    524                           Education 0.65174129           5
    ## 121   5521   7219                              Health 0.56664050          31
    ## 122   4747   5959              Biology & Life Science 0.55660377          63
    ## 123 111762 168947              Biology & Life Science 0.60185815        1370
    ## 124  32510  82923                      Social Science 0.71836477        1024
    ## 125  24704  28120         Communications & Journalism 0.53233379         590
    ## 126  13487  35004                              Health 0.72186591         224
    ## 127  15204  28443                            Business 0.65165991         546
    ## 128   3741  26730                           Education 0.87722753         235
    ## 129   4416  12185           Humanities & Liberal Arts 0.73399193          88
    ## 130   3654   6496                           Education 0.64000000         126
    ## 131   2337   7579                      Social Science 0.76432029          95
    ## 132   3878   5276              Biology & Life Science 0.57636006          86
    ## 133   6820  10305                           Education 0.60175183         156
    ## 134   7574  26025                              Health 0.77457662         202
    ## 135  31967  22847           Humanities & Liberal Arts 0.41680957         375
    ## 136  10732  23449                           Education 0.68602440         338
    ## 137  58227 136446           Humanities & Liberal Arts 0.70089843        1436
    ## 138  13029 157833                           Education 0.92374548        1629
    ## 139  62181  62893 Industrial Arts & Consumer Services 0.50284631        1014
    ## 140  22339  49030           Humanities & Liberal Arts 0.68699295         569
    ## 141  22357  16404                                Arts 0.42320890         331
    ## 142   5079   7841                      Social Science 0.60688855         113
    ## 143   4897   2519     Agriculture & Natural Resources 0.33967098         110
    ## 144   2049   4434                           Education 0.68394262          59
    ## 145  86648 307087            Psychology & Social Work 0.77993320        2584
    ## 146  29909  30724                                Arts 0.50672076         419
    ## 147  15670  12543                           Education 0.44458229         259
    ## 148   3240  17790           Humanities & Liberal Arts 0.84593438         204
    ## 149  24786  49654                                Arts 0.66703385         623
    ## 150   5166  52835 Industrial Arts & Consumer Services 0.91093257         518
    ## 151   5137  48415            Psychology & Social Work 0.90407454         374
    ## 152   5347  16226     Agriculture & Natural Resources 0.75214388         255
    ## 153   4133  12117                                Arts 0.74566154         132
    ## 154   2734  11709                           Education 0.81070415         142
    ## 155   1936   7692            Psychology & Social Work 0.79891982          60
    ## 156    885   8489            Psychology & Social Work 0.90558993          89
    ## 157   2013   4639           Humanities & Liberal Arts 0.69738424          49
    ## 158  18616  11591           Humanities & Liberal Arts 0.38371901         310
    ## 159   4754  12223                                Arts 0.71997408         182
    ## 160   4364   6146 Industrial Arts & Consumer Services 0.58477640         117
    ## 161    404   1084     Agriculture & Natural Resources 0.72849462          24
    ## 162  11376  27468           Humanities & Liberal Arts 0.70713624         247
    ## 163   1225  37054                              Health 0.96799812          95
    ## 164   1167  36422                           Education 0.96895368         342
    ## 165   3472   7732           Humanities & Liberal Arts 0.69011068          56
    ## 166  14440  28809                                Arts 0.66611945         357
    ## 167   7022  11931           Humanities & Liberal Arts 0.62950456         151
    ## 168   3050   5359              Biology & Life Science 0.63729338          47
    ## 169    522   2332            Psychology & Social Work 0.81709881           7
    ## 170    568   2270            Psychology & Social Work 0.79985906          13
    ## 171    931   3695            Psychology & Social Work 0.79874622          21
    ## 172    134    964                           Education 0.87795993           2
    ##     Employed Full_time Part_time Full_time_year_round Unemployed
    ## 1       1976      1849       270                 1207         37
    ## 2        640       556       170                  388         85
    ## 3        648       558       133                  340         16
    ## 4        758      1069       150                  692         40
    ## 5      25694     23170      5180                16697       1672
    ## 6       1857      2038       264                 1449        400
    ## 7       2912      2924       296                 2482        308
    ## 8       1526      1085       553                  827         33
    ## 9      76442     71298     13101                54639       4650
    ## 10     61928     55450     12695                41413       3895
    ## 11     32506     30315      5146                23621       2275
    ## 12     11391     11106      2724                 8790        794
    ## 13     10047      9017      2694                 5986       1019
    ## 14      3307      2751       878                 1967         78
    ## 15      3608      2999       811                 2004         23
    ## 16      6170      5455      1983                 3413        589
    ## 17     15604     14879      2243                11326        699
    ## 18     44931     41235      7199                33540       2859
    ## 19      2575      2277       343                 1848        170
    ## 20       930       808       223                  808         11
    ## 21    102087     91485     18726                70932       6884
    ## 22      8587      7530      1873                 5681        824
    ## 23      2449      1658      1040                 1151         70
    ## 24     16413     15141      2420                13017       1015
    ## 25     43041     38302     10080                29196       3270
    ## 26     16318     15690      1751                12313       1042
    ## 27     10027      9639      1183                 7724        504
    ## 28      7428      6811      1662                 5476        597
    ## 29      4547      4163      1306                 2776        670
    ## 30      2983      2384       930                 1951        308
    ## 31      2799      2257       689                 1723        163
    ## 32      2914      2049      1067                 1200        286
    ## 33       604       524       126                  396         49
    ## 34    180903    151191     40818               122817       8497
    ## 35    145696    137921     21463               108595       9413
    ## 36    104117     96567     25325                70740      11452
    ## 37     10914     10048      1937                 8000       1165
    ## 38      4428      3988       597                 3242        129
    ## 39      1778      1392       579                 1115        137
    ## 40    165527    151967     27693               123169      12411
    ## 41     58118     46399     18079                33738       2884
    ## 42     28459     26348      4332                21130       2934
    ## 43     25302     19428      8721                14389       1282
    ## 44     13150     11510      2665                 9005        505
    ## 45      9881      9105      1468                 7378        639
    ## 46      4247      3190      1840                 2151        401
    ## 47      3854      3465      1176                 2593        385
    ## 48      1144       657       532                  565        107
    ## 49      1638      1931       379                 1595         99
    ## 50      2125      1992       462                 1358         74
    ## 51      9168      5643      4107                 4290        407
    ## 52       559       584         0                  391          0
    ## 53      3257      3204       482                 2453        419
    ## 54      2741      2470       711                 1584        223
    ## 55       730       595       135                  545         88
    ## 56     21190     18681      5563                13583       2271
    ## 57    190183    171385     36241               138299      14946
    ## 58     34158     29223     10206                20026       4366
    ## 59     19660     17563      4890                12823       2092
    ## 60     16620     12537      5346                 9131        977
    ## 61     11581      9441      4590                 6183       1067
    ## 62     14826     13364      3366                10637       1150
    ## 63     12323     11119      2196                 9093        649
    ## 64      8884      7589      2031                 5888        178
    ## 65      7502      7001      1240                 5825        416
    ## 66      4186      4175       247                 3607        250
    ## 67      2463      1787       847                 1487         87
    ## 68      2727      2183       907                 1530        215
    ## 69      2787      2103       839                 1274        138
    ## 70      2343      1644      1095                 1409        286
    ## 71      2174      1819       620                 1528        182
    ## 72      1146       768       437                  653         42
    ## 73         0       111         0                  111          0
    ## 74     48535     39509     15066                29910       2769
    ## 75      2107      2057       287                 1752         64
    ## 76    276234    251540     50357               199897      21502
    ## 77    178862    156668     35829               127230      11663
    ## 78    133454    117709     43711                83236      15022
    ## 79     14057     11367      5651                 8628       1799
    ## 80      9685      7453      3379                 5080        693
    ## 81      6509      6289      1030                 4936        721
    ## 82     25678     20643      9948                13785       2249
    ## 83      1010       946       169                  740          0
    ## 84      6144      5495      1447                 4369       1100
    ## 85      8296      6966      2913                 5008        677
    ## 86     20760     18550      3767                15446       1315
    ## 87      9762      7851      3595                 5370        757
    ## 88     10076      7514      4145                 5868        893
    ## 89      4158      4148       847                 2952        789
    ## 90      1441      1264       354                 1011         36
    ## 91      1080       828       433                  529         33
    ## 92     20859     16987      7071                10916       1779
    ## 93    179633    147335     49889               116251      14602
    ## 94    125393    109970     32242                88548      11268
    ## 95     83483     67448     24387                52243       8947
    ## 96     61022     51411     15902                39524       4535
    ## 97     46138     37850     13133                28966       2727
    ## 98     45326     38815     10948                30932       3305
    ## 99     24629     18755      9541                13109       1668
    ## 100    24639     21584      5153                16642       1067
    ## 101    14643     10732      6541                 7588       1088
    ## 102    16181     13616      4543                10548       1743
    ## 103    13217      9601      6648                 6625        975
    ## 104    15419     13534      3299                10982       1518
    ## 105    14779     11981      4690                 9085       2006
    ## 106    12266     11688      2633                 9170        962
    ## 107    11797     10722      2613                 6954        842
    ## 108     9087      8027      3078                 5482        463
    ## 109     9821      8032      3173                 6234        749
    ## 110     3431      2659      1309                 2161         78
    ## 111     3007      2473       891                 1763        322
    ## 112      613       488       185                  383          0
    ## 113   118241     98408     29558                73531       7195
    ## 114   105646     84681     40657                59218      11176
    ## 115    38315     29340     14569                20056       3132
    ## 116    18824     14354      7978                 8801       1718
    ## 117    17700     14002      5168                 8871       1012
    ## 118    14512     10099      6377                 7460       1833
    ## 119    13115     11259      2273                 8073        216
    ## 120      703       733         0                  504          0
    ## 121     7052      5029      3891                 3236        529
    ## 122     7767      6076      2568                 4542        483
    ## 123   182295    144512     72371               100336      13874
    ## 124    92721     73475     29639                56561       8608
    ## 125    44679     35769     13078                27521       4410
    ## 126    37861     30020     12346                21735       2409
    ## 127    36728     32160      7494                23106       2393
    ## 128    26033     21419      7239                15266       1379
    ## 129    11165      8462      4831                 5821       1302
    ## 130     8691      7264      2202                 5816        547
    ## 131     7444      5843      2834                 4714        757
    ## 132     7585      5603      2741                 3912        437
    ## 133    15116     12520      3782                 9193        833
    ## 134    24406     18166     11088                12809       2183
    ## 135    40157     31086     16659                21816       4267
    ## 136    30007     23018      9209                16537       1206
    ## 137   149180    114386     57825                81180      14345
    ## 138   149339    123177     37965                86540       7297
    ## 139   103078     77428     38515                57978       5593
    ## 140    54844     43401     19187                33438       4657
    ## 141    31433     22457     12818                15740       3718
    ## 142     9602      7700      3396                 5679       1108
    ## 143     6594      5798      1246                 4522        314
    ## 144     5362      4764      1227                 3247        266
    ## 145   307933    233205    115172               174438      28169
    ## 146    47662     29010     24943                21425       3918
    ## 147    23794     19420      7230                13651       1920
    ## 148    17579     13262      6140                 9965       1128
    ## 149    59679     42764     23656                31877       5486
    ## 150    46624     36747     15872                26906       3355
    ## 151    45038     34941     13481                27588       3329
    ## 152    17112     14479      5353                10824        917
    ## 153    12870      8447      6253                 6322       1465
    ## 154    13076     11734      2214                 8457        496
    ## 155     7653      5201      3221                 3838        419
    ## 156     8294      6455      2405                 5061        326
    ## 157     5052      3565      2225                 2661        372
    ## 158    24202     18079      8767                13944       1617
    ## 159    13908     10451      5673                 7413       1368
    ## 160     8650      7662      2064                 5949        510
    ## 161     1290      1098       335                  936         82
    ## 162    29633     20147     14515                13232       3395
    ## 163    29763     19975     13862                14460       1487
    ## 164    32551     27569      7001                20748       1360
    ## 165     7052      5197      3685                 3214        846
    ## 166    36165     25147     15994                16891       3040
    ## 167    15053     10121      6612                 7832       1340
    ## 168     6259      5043      2190                 3602        304
    ## 169     2125      1848       572                 1211        148
    ## 170     2101      1724       648                 1293        368
    ## 171     3777      3154       965                 2738        214
    ## 172      742       593       237                  410         87
    ##     Unemployment_rate Median P25th  P75th College_jobs Non_college_jobs
    ## 1         0.018380527 110000 95000 125000         1534              364
    ## 2         0.117241379  75000 55000  90000          350              257
    ## 3         0.024096386  73000 50000 105000          456              176
    ## 4         0.050125313  70000 43000  80000          529              102
    ## 5         0.061097712  65000 50000  75000        18314             4440
    ## 6         0.177226407  65000 50000 102000         1142              657
    ## 7         0.095652174  62000 53000  72000         1768              314
    ## 8         0.021167415  62000 31500 109000          972              500
    ## 9         0.057342278  60000 48000  70000        52844            16384
    ## 10        0.059173845  60000 45000  72000        45829            10874
    ## 11        0.065409275  60000 45000  75000        23694             5721
    ## 12        0.065162085  60000 42000  70000         8184             2425
    ## 13        0.092083860  60000 36000  70000         6439             2471
    ## 14        0.023042836  60000 39000  65000         2626              391
    ## 15        0.006334343  58000 25000  74000         2439              947
    ## 16        0.087143069  57100 40000  76000         3603             1595
    ## 17        0.042875544  57000 37900  67000         8306             3235
    ## 18        0.059824231  56000 36000  69000        26898            11734
    ## 19        0.061930783  54000 38000  65000         1665              649
    ## 20        0.011689692  54000 50000  54000          402              528
    ## 21        0.063172771  53000 39000  70000        68622            25667
    ## 22        0.087557114  52000 35000  60000         5126             2686
    ## 23        0.027788805  52000 35000  62000         1911              305
    ## 24        0.058239614  51000 38000  60000         6342             5741
    ## 25        0.070609574  50000 40000  60000        28526             9356
    ## 26        0.060023041  50000 36000  60000         3275             5351
    ## 27        0.047858703  50000 40000  60000         1466             3629
    ## 28        0.074392523  50000 39000  65000         3445             2426
    ## 29        0.128426299  50000 35000  70000         1550             1871
    ## 30        0.093588575  50000 42000  56000         2028              830
    ## 31        0.055030385  50000 43000  60000         1017             1269
    ## 32        0.089375000  50000 25000  66000          693             1714
    ## 33        0.075038285  50000 42800  57000          501               50
    ## 34        0.044862724  48000 39000  58000       151643            26146
    ## 35        0.060686356  47000 35000  64000        24243            48447
    ## 36        0.099092317  47000 35000  65000        25582            37057
    ## 37        0.096448381  46000 33000  58000         1578             4612
    ## 38        0.028308097  46000 35000  65000         1394             2454
    ## 39        0.071540470  46000 38000  53000          162             1475
    ## 40        0.069749014  45000 34000  56000        11417            39323
    ## 41        0.047277138  45000 33000  60000        34800            14829
    ## 42        0.093460326  45000 30000  60000        13344            11783
    ## 43        0.048224496  45000 30000  68000        18674             4576
    ## 44        0.036982790  45000 36000  50000         5546             7176
    ## 45        0.060741445  45000 32500  58000         4390             4102
    ## 46        0.086273666  45000 26700  60000         2298             1200
    ## 47        0.090823307  45000 34000  63000         2437              803
    ## 48        0.085531575  45000 40000  45000          603              478
    ## 49        0.056994819  44700 23000  50000          459              996
    ## 50        0.033651660  44000 30000  50000          482              844
    ## 51        0.042506527  42000 30000  65000         2091             6948
    ## 52        0.000000000  42000 30000  78000          452               67
    ## 53        0.113982590  41300 20000  46000         2024             1033
    ## 54        0.075236167  41000 20000  60000         1369              921
    ## 55        0.107579462  41000 41000  43000          509              221
    ## 56        0.096798943  40100 31200  53000         6774             9570
    ## 57        0.072861468  40000 30000  55000        29334           100831
    ## 58        0.113331949  40000 31000  50000        16178            13724
    ## 59        0.096175064  40000 30000  50000         3383             9482
    ## 60        0.055520827  40000 20000  90000        11573             4493
    ## 61        0.084361164  40000 29000  47000         7225             3145
    ## 62        0.071982974  40000 30000  51000         2236             8937
    ## 63        0.050030836  40000 25000  50000         1925             6221
    ## 64        0.019642463  40000 30000  50000         2418             4717
    ## 65        0.052538520  40000 30400  56000         2446             3896
    ## 66        0.056357078  40000 27000  52000         1861             2121
    ## 67        0.034117647  40000 34000  45000         1675              678
    ## 68        0.073079538  40000 30000  54000          744             1654
    ## 69        0.047179487  40000 30000  42000          801             1591
    ## 70        0.108786611  40000 32000  53000          559             1224
    ## 71        0.077249576  40000 27000  54000          535              893
    ## 72        0.035353535  40000 30000  55000          530              465
    ## 73        0.000000000  40000 40000  40000            0                0
    ## 74        0.053972400  39000 30000  49900        30382            14718
    ## 75        0.029479503  38400 22500  45000          221             1659
    ## 76        0.072218341  38000 29000  50000        36720           148395
    ## 77        0.061215064  38000 30000  50000        25320            93889
    ## 78        0.101174601  38000 28000  50000        36854            66947
    ## 79        0.113458628  38000 30000  50000         5350             6830
    ## 80        0.066775872  38000 29600  50000         5577             3174
    ## 81        0.099723375  37500 25000  50000         2354             3244
    ## 82        0.080531385  37400 29000  50000        15654             8394
    ## 83        0.000000000  37000 26000  40000          677              184
    ## 84        0.151849807  36400 27000  49000         2593             2941
    ## 85        0.075448568  36200 28000  47000         4858             2792
    ## 86        0.059569649  36000 28000  45000         2406             9629
    ## 87        0.071965016  36000 29200  46000         2002             6454
    ## 88        0.081411250  36000 23000  42000         5652             3835
    ## 89        0.159490600  36000 23000  60000          919             2313
    ## 90        0.024373731  36000 21000  41000          784              591
    ## 91        0.029649596  36000 34000  45000          434              593
    ## 92        0.078584681  35600 25000  40200         8149            10076
    ## 93        0.075176976  35000 27000  45000        40763            97964
    ## 94        0.082452199  35000 26000  45000        24348            88858
    ## 95        0.096797577  35000 25000  45000        37389            38119
    ## 96        0.069176442  35000 26000  42900        23279            26672
    ## 97        0.055806815  35000 24000  50000        17923            22039
    ## 98        0.067960766  35000 27000  47000         9659            23059
    ## 99        0.063429289  35000 24500  44000         8465            11818
    ## 100       0.041507819  35000 32000  42000        20185             3797
    ## 101       0.069162800  35000 20000  50000         6587             6894
    ## 102       0.097243919  35000 25000  45000         3373            10605
    ## 103       0.068700676  35000 26000  45000         6535             5473
    ## 104       0.089626262  35000 27000  42000         2589             8592
    ## 105       0.119511469  35000 25000  45000         4545             8794
    ## 106       0.072724524  35000 22000  52000         4575             6147
    ## 107       0.066619195  35000 25000  42000         4333             5808
    ## 108       0.048481675  35000 30000  44000         5605             2301
    ## 109       0.070860927  35000 25000  44000         5176             3903
    ## 110       0.022228555  35000 28000  50000         1808             1317
    ## 111       0.096725743  35000 28600  48000         1096             1692
    ## 112       0.000000000  35000 18500  44000          355              144
    ## 113       0.057359929  34000 26000  41000        82007            31112
    ## 114       0.095666912  34000 25000  47000        35336            54569
    ## 115       0.075566386  34000 25000  45000        15051            18193
    ## 116       0.083633531  34000 24000  45000         4956            10343
    ## 117       0.054082941  34000 23050  42000        10928             5561
    ## 118       0.112144387  34000 21000  45000         5225             7385
    ## 119       0.016202835  34000 30000  40000        10699             1977
    ## 120       0.000000000  34000 29000  35000          346              206
    ## 121       0.069779712  33500 23000  40000         3051             3539
    ## 122       0.058545455  33500 23000  48000         4253             2722
    ## 123       0.070724732  33400 24000  45000        88232            81109
    ## 124       0.084951001  33000 25000  44000        29051            48899
    ## 125       0.089836827  33000 25000  45000        12855            25297
    ## 126       0.059821207  33000 24000  41000        22215            14616
    ## 127       0.061169193  33000 25000  42000         2325            23341
    ## 128       0.050306435  33000 24000  40000        17985             6824
    ## 129       0.104435710  33000 25000  40000         4122             5695
    ## 130       0.059211951  33000 30000  45000         5284             2438
    ## 131       0.092305816  33000 24000  40000         2630             3906
    ## 132       0.054475193  33000 23000  42000         2856             4159
    ## 133       0.052228980  32500 25000  38000        10304             3967
    ## 134       0.082101621  32400 25000  45000         9364            12889
    ## 135       0.096051684  32200 23000  47100        14444            20313
    ## 136       0.038637747  32100 25000  40000        20821             8260
    ## 137       0.087723590  32000 23000  41000        57690            71827
    ## 138       0.046585715  32000 23400  38000       108085            36972
    ## 139       0.051467273  32000 24000  43000        27581            63946
    ## 140       0.078267592  32000 25000  42000        18565            28558
    ## 141       0.105772240  32000 22000  42000         7368            20721
    ## 142       0.103454715  32000 27000  50000         3602             4778
    ## 143       0.045454545  32000 22900  40000         2089             3545
    ## 144       0.047263682  32000 28000  39000         4214             1106
    ## 145       0.083810867  31500 24000  41000       125148           141860
    ## 146       0.075959674  31000 22300  42000        13752            28786
    ## 147       0.074667496  31000 24000  40000        12777             9328
    ## 148       0.060298284  31000 23000  40000         5139             9738
    ## 149       0.084186296  30500 21000  41000        20792            32725
    ## 150       0.067128194  30000 22900  40000        20985            20133
    ## 151       0.068827920  30000 25000  35000        27449            14416
    ## 152       0.050862499  30000 22000  40000         5443             9571
    ## 153       0.102197419  30000 22000  40000         3849             7635
    ## 154       0.036545830  30000 24000  37000        10766             1949
    ## 155       0.051907830  30000 20800  40000         2960             3948
    ## 156       0.037819026  30000 24000  35000         2878             4595
    ## 157       0.068584071  30000 20000  49000         1168             3354
    ## 158       0.062628297  29000 22000  38000         9927            12037
    ## 159       0.089552239  29000 19200  38300         3948             8707
    ## 160       0.055676856  29000 20000  36000          563             7384
    ## 161       0.059766764  29000 23000  42100          483              626
    ## 162       0.102791571  28000 20000  38000         9805            16693
    ## 163       0.047584000  28000 20000  40000        19957             9404
    ## 164       0.040104981  28000 21000  35000        23515             7705
    ## 165       0.107115726  27500 22900  38000         2326             3703
    ## 166       0.077541130  27000 19200  35000         6994            25313
    ## 167       0.081742207  27000 20000  35000         4855             8100
    ## 168       0.046320280  26000 20000  39000         2771             2947
    ## 169       0.065112187  25000 24000  34000         1488              615
    ## 170       0.149048198  25000 25000  40000          986              870
    ## 171       0.053620646  23400 19200  26000         2403             1245
    ## 172       0.104945718  22000 20000  22000          288              338
    ##     Low_wage_jobs
    ## 1             193
    ## 2              50
    ## 3               0
    ## 4               0
    ## 5             972
    ## 6             244
    ## 7             259
    ## 8             220
    ## 9            3253
    ## 10           3170
    ## 11            980
    ## 12            372
    ## 13            789
    ## 14             81
    ## 15            263
    ## 16            524
    ## 17            640
    ## 18           3192
    ## 19            137
    ## 20            144
    ## 21           5144
    ## 22            696
    ## 23             70
    ## 24            708
    ## 25           2899
    ## 26            703
    ## 27            285
    ## 28            365
    ## 29            340
    ## 30            260
    ## 31            142
    ## 32            755
    ## 33             49
    ## 34           6193
    ## 35           9910
    ## 36          10653
    ## 37           1284
    ## 38            480
    ## 39            124
    ## 40          10886
    ## 41           4569
    ## 42           1672
    ## 43           1823
    ## 44           1002
    ## 45            608
    ## 46            343
    ## 47            357
    ## 48             93
    ## 49            186
    ## 50            245
    ## 51           1270
    ## 52             25
    ## 53            263
    ## 54            135
    ## 55              0
    ## 56           2499
    ## 57          27320
    ## 58           4221
    ## 59           3046
    ## 60           1121
    ## 61           1168
    ## 62           1758
    ## 63           1362
    ## 64            839
    ## 65            386
    ## 66            406
    ## 67            201
    ## 68            573
    ## 69            302
    ## 70            272
    ## 71             94
    ## 72            269
    ## 73              0
    ## 74           4288
    ## 75             81
    ## 76          32395
    ## 77          27968
    ## 78          19803
    ## 79           1905
    ## 80           1246
    ## 81            308
    ## 82           3012
    ## 83             56
    ## 84            352
    ## 85            959
    ## 86           1906
    ## 87           1336
    ## 88           1422
    ## 89            496
    ## 90            221
    ## 91             37
    ## 92           3175
    ## 93          27440
    ## 94          18404
    ## 95          14839
    ## 96           8512
    ## 97           5751
    ## 98           7214
    ## 99           3677
    ## 100          1179
    ## 101          2237
    ## 102          1895
    ## 103          2449
    ## 104          1391
    ## 105          2495
    ## 106           557
    ## 107          1405
    ## 108           902
    ## 109          1061
    ## 110           237
    ## 111           327
    ## 112             0
    ## 113         11443
    ## 114         16839
    ## 115          5267
    ## 116          3168
    ## 117          1806
    ## 118          1854
    ## 119           786
    ## 120           111
    ## 121          1159
    ## 122           459
    ## 123         28339
    ## 124         13748
    ## 125          6429
    ## 126          4468
    ## 127          9063
    ## 128          2819
    ## 129          2085
    ## 130           657
    ## 131          1470
    ## 132           976
    ## 133          1385
    ## 134          3816
    ## 135          8051
    ## 136          2767
    ## 137         26503
    ## 138         11502
    ## 139         16838
    ## 140          9030
    ## 141          5862
    ## 142          1634
    ## 143          1231
    ## 144           591
    ## 145         48207
    ## 146          9286
    ## 147          2042
    ## 148          3426
    ## 149         11880
    ## 150          5248
    ## 151          4344
    ## 152          2125
    ## 153          2840
    ## 154           722
    ## 155          1650
    ## 156           724
    ## 157          1141
    ## 158          3304
    ## 159          3586
    ## 160          3163
    ## 161            31
    ## 162          6866
    ## 163          5125
    ## 164          2868
    ## 165          1115
    ## 166         11068
    ## 167          3466
    ## 168           743
    ## 169            82
    ## 170           622
    ## 171           308
    ## 172           192

3.  Kelompokkan data berdasarkan major category-nya, kemudian lihatlah
    rangkuman dari total jumlah Women dan Men.

``` r
data_agg <- gradsnew %>% 
  group_by(Major_category) %>% 
  summarise(total_men = sum(Men),
            total_women = sum(Women),
            total = sum(Total))
```

4.  Buatlah visualisasi yang interaktif dari data yang sudah di agregasi
    di atas.

``` r
library(ggthemes)
options(scipen = 888)
library(glue)
plot_sebaran <- data_agg %>% 
  ggplot(aes(x = total_men, 
             y = total_women,
             text = glue("Total Men = {total_men}
                         Total women = {total_women}
                         Total = {total}
                         Major Category = {Major_category}"))) +
  geom_point(aes(col = total, size = total)) +
  labs(title = "Men vs Women",
       x = "Total Men",
       y = "Total Women") +
  scale_color_gradient(low = "red", high = "yellow") +
  theme_economist() +
  theme(legend.position = "none")
```

``` r
library(plotly)
ggplotly(plot_sebaran, tooltip = "text")
```

<div id="htmlwidget-796c137b6af0f4916e21" style="width:672px;height:480px;" class="plotly html-widget"></div>
<script type="application/json" data-for="htmlwidget-796c137b6af0f4916e21">{"x":{"data":[{"x":[40357,134390,184919,667852,131921,208725,103526,408307,75517,272846,103781,2817,91129,95390,98115,256834],"y":[35263,222740,268943,634524,260680,90283,455603,129276,387713,440622,126011,9479,87978,90089,382892,273132],"text":["Total Men = 40357<br />Total women = 35263<br />Total = 75620<br />Major Category = Agriculture & Natural Resources","Total Men = 134390<br />Total women = 222740<br />Total = 357130<br />Major Category = Arts","Total Men = 184919<br />Total women = 268943<br />Total = 453862<br />Major Category = Biology & Life Science","Total Men = 667852<br />Total women = 634524<br />Total = 1302376<br />Major Category = Business","Total Men = 131921<br />Total women = 260680<br />Total = 392601<br />Major Category = Communications & Journalism","Total Men = 208725<br />Total women = 90283<br />Total = 299008<br />Major Category = Computers & Mathematics","Total Men = 103526<br />Total women = 455603<br />Total = 559129<br />Major Category = Education","Total Men = 408307<br />Total women = 129276<br />Total = 537583<br />Major Category = Engineering","Total Men = 75517<br />Total women = 387713<br />Total = 463230<br />Major Category = Health","Total Men = 272846<br />Total women = 440622<br />Total = 713468<br />Major Category = Humanities & Liberal Arts","Total Men = 103781<br />Total women = 126011<br />Total = 229792<br />Major Category = Industrial Arts & Consumer Services","Total Men = 2817<br />Total women = 9479<br />Total = 12296<br />Major Category = Interdisciplinary","Total Men = 91129<br />Total women = 87978<br />Total = 179107<br />Major Category = Law & Public Policy","Total Men = 95390<br />Total women = 90089<br />Total = 185479<br />Major Category = Physical Sciences","Total Men = 98115<br />Total women = 382892<br />Total = 481007<br />Major Category = Psychology & Social Work","Total Men = 256834<br />Total women = 273132<br />Total = 529966<br />Major Category = Social Science"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":["rgba(255,44,0,1)","rgba(255,112,0,1)","rgba(255,129,0,1)","rgba(255,255,0,1)","rgba(255,118,0,1)","rgba(255,101,0,1)","rgba(255,146,0,1)","rgba(255,143,0,1)","rgba(255,130,0,1)","rgba(255,170,0,1)","rgba(255,86,0,1)","rgba(255,0,0,1)","rgba(255,75,0,1)","rgba(255,76,0,1)","rgba(255,133,0,1)","rgba(255,141,0,1)"],"opacity":1,"size":[7.96633868555899,13.5497452298771,14.8355016549478,22.6771653543307,14.0399494163272,12.688387568373,16.0829676010957,15.8381452373292,14.9521646045601,17.7114639214088,11.538868530175,3.77952755905512,10.5748730548717,10.7034441706277,15.1702631929941,15.750397111118],"symbol":"circle","line":{"width":1.88976377952756,"color":["rgba(255,44,0,1)","rgba(255,112,0,1)","rgba(255,129,0,1)","rgba(255,255,0,1)","rgba(255,118,0,1)","rgba(255,101,0,1)","rgba(255,146,0,1)","rgba(255,143,0,1)","rgba(255,130,0,1)","rgba(255,170,0,1)","rgba(255,86,0,1)","rgba(255,0,0,1)","rgba(255,75,0,1)","rgba(255,76,0,1)","rgba(255,133,0,1)","rgba(255,141,0,1)"]}},"hoveron":"points","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null}],"layout":{"margin":{"t":53.8580323785803,"r":13.2835201328352,"b":38.5222083852221,"l":65.0892486508925},"plot_bgcolor":"transparent","paper_bgcolor":"rgba(213,228,235,1)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"title":{"text":"<b> Men vs Women <\/b>","font":{"color":"rgba(0,0,0,1)","family":"","size":21.9178082191781},"x":0,"xref":"paper"},"xaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[-30434.75,701103.75],"tickmode":"array","ticktext":["0","200000","400000","600000"],"tickvals":[0,200000,400000,600000],"categoryorder":"array","categoryarray":["0","200000","400000","600000"],"nticks":null,"ticks":"outside","tickcolor":"rgba(0,0,0,1)","ticklen":-6.6417600664176,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"tickangle":-0,"showline":true,"linecolor":"rgba(0,0,0,1)","linewidth":0.531340805313408,"showgrid":false,"gridcolor":null,"gridwidth":0,"zeroline":false,"anchor":"y","title":{"text":"Total Men","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187}},"hoverformat":".2f"},"yaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[-21773.25,665776.25],"tickmode":"array","ticktext":["0","200000","400000","600000"],"tickvals":[0,200000,400000,600000],"categoryorder":"array","categoryarray":["0","200000","400000","600000"],"nticks":null,"ticks":"","tickcolor":null,"ticklen":-6.6417600664176,"tickwidth":0,"showticklabels":true,"tickfont":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":1.16230801162308,"zeroline":false,"anchor":"x","title":{"text":"Total Women","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187}},"hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":1}],"showlegend":false,"legend":{"bgcolor":"transparent","bordercolor":"transparent","borderwidth":1.88976377952756,"font":{"color":"rgba(0,0,0,1)","family":"","size":18.2648401826484}},"hovermode":"closest","barmode":"relative"},"config":{"doubleClick":"reset","showSendToCloud":false},"source":"A","attrs":{"2178b723dd5":{"colour":{},"size":{},"x":{},"y":{},"text":{},"type":"scatter"}},"cur_data":"2178b723dd5","visdat":{"2178b723dd5":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.2,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

\#\#\#\#\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

Batlah sebuah visualisasi yang menunjukkan sebaran data jumlah men dan
women Cek missing value dari data grads Isi missing value dengan nilai
median dari tiap variabel. Kemudian, cek kembali missing valuenya.
Kelompokkan data berdasarkan major category-nya, kemudian lihatlah
rangkuman dari total jumlah Women dan Men. Buatlah visualisasi yang
interaktif dari data yang sudah di agregasi di atas.

``` r
grads%>%
is.na() %>%
colSums()
```

    ##                 Rank           Major_code                Major 
    ##                    0                    0                    0 
    ##                Total                  Men                Women 
    ##                    1                    1                    1 
    ##       Major_category           ShareWomen          Sample_size 
    ##                    0                    1                    0 
    ##             Employed            Full_time            Part_time 
    ##                    0                    0                    0 
    ## Full_time_year_round           Unemployed    Unemployment_rate 
    ##                    0                    0                    0 
    ##               Median                P25th                P75th 
    ##                    0                    0                    0 
    ##         College_jobs     Non_college_jobs        Low_wage_jobs 
    ##                    0                    0                    0

``` r
clean <- grads %>% 
mutate(Women = replace_na(data = Women, replace = mean(Women, na.rm = TRUE)),
           ShareWomen = replace_na(data = ShareWomen, replace = mean(ShareWomen, na.rm = TRUE)),Total = replace_na(data = Total, replace = mean(Total, na.rm = TRUE)), Men = replace_na(data = Men, replace = mean(Men, na.rm = TRUE)))

clean%>%
  is.na() %>%
  colSums()
```

    ##                 Rank           Major_code                Major 
    ##                    0                    0                    0 
    ##                Total                  Men                Women 
    ##                    0                    0                    0 
    ##       Major_category           ShareWomen          Sample_size 
    ##                    0                    0                    0 
    ##             Employed            Full_time            Part_time 
    ##                    0                    0                    0 
    ## Full_time_year_round           Unemployed    Unemployment_rate 
    ##                    0                    0                    0 
    ##               Median                P25th                P75th 
    ##                    0                    0                    0 
    ##         College_jobs     Non_college_jobs        Low_wage_jobs 
    ##                    0                    0                    0

``` r
grads_agg <- grads %>%
  group_by(Major_category)%>%
  summarise(Jumlah = sum(Total))
grads_agg
```

    ## # A tibble: 16 x 2
    ##    Major_category                       Jumlah
    ##    <chr>                                 <int>
    ##  1 Agriculture & Natural Resources          NA
    ##  2 Arts                                 357130
    ##  3 Biology & Life Science               453862
    ##  4 Business                            1302376
    ##  5 Communications & Journalism          392601
    ##  6 Computers & Mathematics              299008
    ##  7 Education                            559129
    ##  8 Engineering                          537583
    ##  9 Health                               463230
    ## 10 Humanities & Liberal Arts            713468
    ## 11 Industrial Arts & Consumer Services  229792
    ## 12 Interdisciplinary                     12296
    ## 13 Law & Public Policy                  179107
    ## 14 Physical Sciences                    185479
    ## 15 Psychology & Social Work             481007
    ## 16 Social Science                       529966

``` r
new_grads_agg <- grads_agg %>%
  drop_na()
new_grads_agg
```

    ## # A tibble: 15 x 2
    ##    Major_category                       Jumlah
    ##    <chr>                                 <int>
    ##  1 Arts                                 357130
    ##  2 Biology & Life Science               453862
    ##  3 Business                            1302376
    ##  4 Communications & Journalism          392601
    ##  5 Computers & Mathematics              299008
    ##  6 Education                            559129
    ##  7 Engineering                          537583
    ##  8 Health                               463230
    ##  9 Humanities & Liberal Arts            713468
    ## 10 Industrial Arts & Consumer Services  229792
    ## 11 Interdisciplinary                     12296
    ## 12 Law & Public Policy                  179107
    ## 13 Physical Sciences                    185479
    ## 14 Psychology & Social Work             481007
    ## 15 Social Science                       529966

``` r
plot_penyebaran <- new_grads_agg %>% 
  ggplot(mapping = aes(x = reorder(Major_category,Jumlah), 
                       y = Jumlah, 
                       text= glue("Jumlah: {Jumlah}"))) +
  geom_col(aes(fill = Major_category)) +
  coord_flip() +
  guides(fill = FALSE)+
  labs(title = "Jumlah penyebaran berdasarkan Major Category",
       x = NULL,
       y = "Jumlah") +
  theme_economist_white()+
  theme(legend.position = "none")
ggplotly(plot_penyebaran,tooltip = "text")
```

<div id="htmlwidget-e137a01f950c778d2267" style="width:672px;height:480px;" class="plotly html-widget"></div>
<script type="application/json" data-for="htmlwidget-e137a01f950c778d2267">{"x":{"data":[{"orientation":"h","width":0.9,"base":0,"x":[357130],"y":[6],"text":"Jumlah: 357130","type":"bar","marker":{"autocolorscale":false,"color":"rgba(248,118,109,1)","line":{"width":1.88976377952756,"color":"transparent"}},"name":"Arts","legendgroup":"Arts","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"orientation":"h","width":0.899999999999999,"base":0,"x":[453862],"y":[8],"text":"Jumlah: 453862","type":"bar","marker":{"autocolorscale":false,"color":"rgba(229,135,0,1)","line":{"width":1.88976377952756,"color":"transparent"}},"name":"Biology & Life Science","legendgroup":"Biology & Life Science","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"orientation":"h","width":0.899999999999999,"base":0,"x":[1302376],"y":[15],"text":"Jumlah: 1302376","type":"bar","marker":{"autocolorscale":false,"color":"rgba(201,152,0,1)","line":{"width":1.88976377952756,"color":"transparent"}},"name":"Business","legendgroup":"Business","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"orientation":"h","width":0.9,"base":0,"x":[392601],"y":[7],"text":"Jumlah: 392601","type":"bar","marker":{"autocolorscale":false,"color":"rgba(163,165,0,1)","line":{"width":1.88976377952756,"color":"transparent"}},"name":"Communications & Journalism","legendgroup":"Communications & Journalism","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"orientation":"h","width":0.9,"base":0,"x":[299008],"y":[5],"text":"Jumlah: 299008","type":"bar","marker":{"autocolorscale":false,"color":"rgba(107,177,0,1)","line":{"width":1.88976377952756,"color":"transparent"}},"name":"Computers & Mathematics","legendgroup":"Computers & Mathematics","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"orientation":"h","width":0.899999999999999,"base":0,"x":[559129],"y":[13],"text":"Jumlah: 559129","type":"bar","marker":{"autocolorscale":false,"color":"rgba(0,186,56,1)","line":{"width":1.88976377952756,"color":"transparent"}},"name":"Education","legendgroup":"Education","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"orientation":"h","width":0.899999999999999,"base":0,"x":[537583],"y":[12],"text":"Jumlah: 537583","type":"bar","marker":{"autocolorscale":false,"color":"rgba(0,191,125,1)","line":{"width":1.88976377952756,"color":"transparent"}},"name":"Engineering","legendgroup":"Engineering","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"orientation":"h","width":0.899999999999999,"base":0,"x":[463230],"y":[9],"text":"Jumlah: 463230","type":"bar","marker":{"autocolorscale":false,"color":"rgba(0,192,175,1)","line":{"width":1.88976377952756,"color":"transparent"}},"name":"Health","legendgroup":"Health","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"orientation":"h","width":0.899999999999999,"base":0,"x":[713468],"y":[14],"text":"Jumlah: 713468","type":"bar","marker":{"autocolorscale":false,"color":"rgba(0,188,216,1)","line":{"width":1.88976377952756,"color":"transparent"}},"name":"Humanities & Liberal Arts","legendgroup":"Humanities & Liberal Arts","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"orientation":"h","width":0.9,"base":0,"x":[229792],"y":[4],"text":"Jumlah: 229792","type":"bar","marker":{"autocolorscale":false,"color":"rgba(0,176,246,1)","line":{"width":1.88976377952756,"color":"transparent"}},"name":"Industrial Arts & Consumer Services","legendgroup":"Industrial Arts & Consumer Services","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"orientation":"h","width":0.9,"base":0,"x":[12296],"y":[1],"text":"Jumlah: 12296","type":"bar","marker":{"autocolorscale":false,"color":"rgba(97,156,255,1)","line":{"width":1.88976377952756,"color":"transparent"}},"name":"Interdisciplinary","legendgroup":"Interdisciplinary","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"orientation":"h","width":0.9,"base":0,"x":[179107],"y":[2],"text":"Jumlah: 179107","type":"bar","marker":{"autocolorscale":false,"color":"rgba(185,131,255,1)","line":{"width":1.88976377952756,"color":"transparent"}},"name":"Law & Public Policy","legendgroup":"Law & Public Policy","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"orientation":"h","width":0.9,"base":0,"x":[185479],"y":[3],"text":"Jumlah: 185479","type":"bar","marker":{"autocolorscale":false,"color":"rgba(231,107,243,1)","line":{"width":1.88976377952756,"color":"transparent"}},"name":"Physical Sciences","legendgroup":"Physical Sciences","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"orientation":"h","width":0.899999999999999,"base":0,"x":[481007],"y":[10],"text":"Jumlah: 481007","type":"bar","marker":{"autocolorscale":false,"color":"rgba(253,97,209,1)","line":{"width":1.88976377952756,"color":"transparent"}},"name":"Psychology & Social Work","legendgroup":"Psychology & Social Work","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"orientation":"h","width":0.899999999999999,"base":0,"x":[529966],"y":[11],"text":"Jumlah: 529966","type":"bar","marker":{"autocolorscale":false,"color":"rgba(255,103,164,1)","line":{"width":1.88976377952756,"color":"transparent"}},"name":"Social Science","legendgroup":"Social Science","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null}],"layout":{"margin":{"t":53.8580323785803,"r":13.2835201328352,"b":37.8580323785803,"l":261.685346616854},"plot_bgcolor":"rgba(255,255,255,1)","paper_bgcolor":"rgba(235,235,235,1)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"title":{"text":"<b> Jumlah penyebaran berdasarkan Major Category <\/b>","font":{"color":"rgba(0,0,0,1)","family":"","size":21.9178082191781},"x":0,"xref":"paper"},"xaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[-65118.8,1367494.8],"tickmode":"array","ticktext":["0","500000","1000000"],"tickvals":[0,500000,1000000],"categoryorder":"array","categoryarray":["0","500000","1000000"],"nticks":null,"ticks":"outside","tickcolor":"rgba(0,0,0,1)","ticklen":-7.30593607305936,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"tickangle":-0,"showline":true,"linecolor":"rgba(0,0,0,1)","linewidth":0.531340805313408,"showgrid":false,"gridcolor":null,"gridwidth":0,"zeroline":false,"anchor":"y","title":{"text":"Jumlah","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187}},"hoverformat":".2f"},"yaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[0.4,15.6],"tickmode":"array","ticktext":["Interdisciplinary","Law & Public Policy","Physical Sciences","Industrial Arts & Consumer Services","Computers & Mathematics","Arts","Communications & Journalism","Biology & Life Science","Health","Psychology & Social Work","Social Science","Engineering","Education","Humanities & Liberal Arts","Business"],"tickvals":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],"categoryorder":"array","categoryarray":["Interdisciplinary","Law & Public Policy","Physical Sciences","Industrial Arts & Consumer Services","Computers & Mathematics","Arts","Communications & Journalism","Biology & Life Science","Health","Psychology & Social Work","Social Science","Engineering","Education","Humanities & Liberal Arts","Business"],"nticks":null,"ticks":"","tickcolor":null,"ticklen":-7.30593607305936,"tickwidth":0,"showticklabels":true,"tickfont":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(201,201,201,1)","gridwidth":1.16230801162308,"zeroline":false,"anchor":"x","title":{"text":"","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187}},"hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":1}],"showlegend":false,"legend":{"bgcolor":"rgba(235,235,235,1)","bordercolor":"transparent","borderwidth":1.88976377952756,"font":{"color":"rgba(0,0,0,1)","family":"","size":18.2648401826484}},"hovermode":"closest","barmode":"relative"},"config":{"doubleClick":"reset","showSendToCloud":false},"source":"A","attrs":{"217862d8320":{"fill":{},"x":{},"y":{},"text":{},"type":"bar"}},"cur_data":"217862d8320","visdat":{"217862d8320":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.2,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>
