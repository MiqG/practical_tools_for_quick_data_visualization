Biology-related data visualization
==================================

Gene Set Enrichment Analysis (GSEA) with `clusterProfiler`
==========================================================

    require(tidyverse)

    ## Loading required package: tidyverse

    ## ── Attaching packages ──────────────────────────────────────────────────────────────── tidyverse 1.3.1 ──

    ## ✔ ggplot2 3.3.5     ✔ purrr   0.3.4
    ## ✔ tibble  3.1.6     ✔ dplyr   1.0.8
    ## ✔ tidyr   1.2.0     ✔ stringr 1.4.0
    ## ✔ readr   2.1.2     ✔ forcats 0.5.1

    ## ── Conflicts ─────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()

Let's say we have found a set of interesting genes.

    geneset_file = file.path(here::here(), "data", "raw", "geneset.txt")
    genes_oi = readLines(geneset_file)

    genes_oi %>% length() %>% print()

    ## [1] 166

    genes_oi %>% head()

    ## [1] "ADAM10" "ADAM17" "APAF1"  "APBB1"  "APH1A"  "APOE"

Is is enriched in some biological processes?

    require(clusterProfiler)

    ## Loading required package: clusterProfiler

    ## 

    ## clusterProfiler v4.2.2  For help: https://yulab-smu.top/biomedical-knowledge-mining-book/
    ## 
    ## If you use clusterProfiler in published research, please cite:
    ## T Wu, E Hu, S Xu, M Chen, P Guo, Z Dai, T Feng, L Zhou, W Tang, L Zhan, X Fu, S Liu, X Bo, and G Yu. clusterProfiler 4.0: A universal enrichment tool for interpreting omics data. The Innovation. 2021, 2(3):100141

    ## 
    ## Attaching package: 'clusterProfiler'

    ## The following object is masked from 'package:purrr':
    ## 
    ##     simplify

    ## The following object is masked from 'package:stats':
    ## 
    ##     filter

    require(org.Hs.eg.db)

    ## Loading required package: org.Hs.eg.db

    ## Loading required package: AnnotationDbi

    ## Loading required package: stats4

    ## Loading required package: BiocGenerics

    ## 
    ## Attaching package: 'BiocGenerics'

    ## The following objects are masked from 'package:dplyr':
    ## 
    ##     combine, intersect, setdiff, union

    ## The following objects are masked from 'package:stats':
    ## 
    ##     IQR, mad, sd, var, xtabs

    ## The following objects are masked from 'package:base':
    ## 
    ##     anyDuplicated, append, as.data.frame, basename, cbind, colnames,
    ##     dirname, do.call, duplicated, eval, evalq, Filter, Find, get, grep,
    ##     grepl, intersect, is.unsorted, lapply, Map, mapply, match, mget,
    ##     order, paste, pmax, pmax.int, pmin, pmin.int, Position, rank,
    ##     rbind, Reduce, rownames, sapply, setdiff, sort, table, tapply,
    ##     union, unique, unsplit, which.max, which.min

    ## Loading required package: Biobase

    ## Welcome to Bioconductor
    ## 
    ##     Vignettes contain introductory material; view with
    ##     'browseVignettes()'. To cite Bioconductor, see
    ##     'citation("Biobase")', and for packages 'citation("pkgname")'.

    ## Loading required package: IRanges

    ## Loading required package: S4Vectors

    ## 
    ## Attaching package: 'S4Vectors'

    ## The following object is masked from 'package:clusterProfiler':
    ## 
    ##     rename

    ## The following objects are masked from 'package:dplyr':
    ## 
    ##     first, rename

    ## The following object is masked from 'package:tidyr':
    ## 
    ##     expand

    ## The following objects are masked from 'package:base':
    ## 
    ##     expand.grid, I, unname

    ## 
    ## Attaching package: 'IRanges'

    ## The following object is masked from 'package:clusterProfiler':
    ## 
    ##     slice

    ## The following objects are masked from 'package:dplyr':
    ## 
    ##     collapse, desc, slice

    ## The following object is masked from 'package:purrr':
    ## 
    ##     reduce

    ## 
    ## Attaching package: 'AnnotationDbi'

    ## The following object is masked from 'package:clusterProfiler':
    ## 
    ##     select

    ## The following object is masked from 'package:dplyr':
    ## 
    ##     select

    ## 

    result = enrichGO(genes_oi, ont="BP", keyType="SYMBOL", OrgDb=org.Hs.eg.db)
    result %>% as.data.frame()

    ##                    ID
    ## GO:0006119 GO:0006119
    ## GO:0009060 GO:0009060
    ## GO:0046034 GO:0046034
    ## GO:0045333 GO:0045333
    ## GO:0019646 GO:0019646
    ## GO:0042773 GO:0042773
    ## GO:0042775 GO:0042775
    ## GO:0022904 GO:0022904
    ## GO:0015980 GO:0015980
    ## GO:0022900 GO:0022900
    ## GO:0006091 GO:0006091
    ## GO:0006120 GO:0006120
    ## GO:0010257 GO:0010257
    ## GO:0032981 GO:0032981
    ## GO:0033108 GO:0033108
    ## GO:1902600 GO:1902600
    ## GO:0006123 GO:0006123
    ## GO:0015985 GO:0015985
    ## GO:0015986 GO:0015986
    ## GO:0006122 GO:0006122
    ## GO:0019932 GO:0019932
    ## GO:0019722 GO:0019722
    ## GO:0070588 GO:0070588
    ## GO:0010952 GO:0010952
    ## GO:0070997 GO:0070997
    ## GO:0050804 GO:0050804
    ## GO:0099177 GO:0099177
    ## GO:0010950 GO:0010950
    ## GO:0006509 GO:0006509
    ## GO:0045862 GO:0045862
    ## GO:0050435 GO:0050435
    ## GO:0006816 GO:0006816
    ## GO:0042776 GO:0042776
    ## GO:0060401 GO:0060401
    ## GO:0006754 GO:0006754
    ## GO:0033619 GO:0033619
    ## GO:2001056 GO:2001056
    ## GO:0009206 GO:0009206
    ## GO:0009145 GO:0009145
    ## GO:0048167 GO:0048167
    ## GO:0048016 GO:0048016
    ## GO:0097553 GO:0097553
    ## GO:0009201 GO:0009201
    ## GO:1901216 GO:1901216
    ## GO:0051402 GO:0051402
    ## GO:0006874 GO:0006874
    ## GO:0009205 GO:0009205
    ## GO:0010038 GO:0010038
    ## GO:0060402 GO:0060402
    ## GO:0055074 GO:0055074
    ## GO:0009142 GO:0009142
    ## GO:0016485 GO:0016485
    ## GO:0009144 GO:0009144
    ## GO:0042987 GO:0042987
    ## GO:0009199 GO:0009199
    ## GO:0072503 GO:0072503
    ## GO:0007215 GO:0007215
    ## GO:0042982 GO:0042982
    ## GO:0060291 GO:0060291
    ## GO:0034205 GO:0034205
    ## GO:0052547 GO:0052547
    ## GO:0006919 GO:0006919
    ## GO:0051604 GO:0051604
    ## GO:0052548 GO:0052548
    ## GO:0042391 GO:0042391
    ## GO:0050806 GO:0050806
    ## GO:2000116 GO:2000116
    ## GO:0009141 GO:0009141
    ## GO:1901214 GO:1901214
    ## GO:0006164 GO:0006164
    ## GO:0043280 GO:0043280
    ## GO:0072522 GO:0072522
    ## GO:0007204 GO:0007204
    ## GO:0009152 GO:0009152
    ## GO:0035235 GO:0035235
    ## GO:0051235 GO:0051235
    ## GO:0033173 GO:0033173
    ## GO:0051651 GO:0051651
    ## GO:0009165 GO:0009165
    ## GO:0050890 GO:0050890
    ## GO:0007611 GO:0007611
    ## GO:1901293 GO:1901293
    ## GO:0009260 GO:0009260
    ## GO:0097720 GO:0097720
    ## GO:0006163 GO:0006163
    ## GO:0051208 GO:0051208
    ## GO:0051480 GO:0051480
    ## GO:0046390 GO:0046390
    ## GO:0050848 GO:0050848
    ## GO:0060079 GO:0060079
    ## GO:0009150 GO:0009150
    ## GO:0072521 GO:0072521
    ## GO:1990542 GO:1990542
    ## GO:0099565 GO:0099565
    ## GO:0009259 GO:0009259
    ## GO:0009117 GO:0009117
    ## GO:0006839 GO:0006839
    ## GO:0006753 GO:0006753
    ## GO:0019693 GO:0019693
    ## GO:0051209 GO:0051209
    ## GO:0051283 GO:0051283
    ## GO:0048143 GO:0048143
    ## GO:0051282 GO:0051282
    ## GO:0048857 GO:0048857
    ## GO:0021762 GO:0021762
    ## GO:1903421 GO:1903421
    ## GO:0099003 GO:0099003
    ## GO:0043281 GO:0043281
    ## GO:0060078 GO:0060078
    ## GO:0042063 GO:0042063
    ## GO:0031279 GO:0031279
    ## GO:0099504 GO:0099504
    ## GO:0048708 GO:0048708
    ## GO:0010506 GO:0010506
    ## GO:0043270 GO:0043270
    ## GO:0021782 GO:0021782
    ## GO:0051353 GO:0051353
    ## GO:0034765 GO:0034765
    ## GO:0030901 GO:0030901
    ## GO:0097193 GO:0097193
    ## GO:0070509 GO:0070509
    ## GO:0006979 GO:0006979
    ## GO:0070296 GO:0070296
    ## GO:0106027 GO:0106027
    ## GO:0034767 GO:0034767
    ## GO:0043467 GO:0043467
    ## GO:0014002 GO:0014002
    ## GO:0051222 GO:0051222
    ## GO:0061337 GO:0061337
    ## GO:0043523 GO:0043523
    ## GO:0032469 GO:0032469
    ## GO:1904062 GO:1904062
    ## GO:0051588 GO:0051588
    ## GO:1904646 GO:1904646
    ## GO:0051099 GO:0051099
    ## GO:0051098 GO:0051098
    ## GO:0010882 GO:0010882
    ## GO:0016079 GO:0016079
    ## GO:1904951 GO:1904951
    ## GO:0010001 GO:0010001
    ## GO:0055117 GO:0055117
    ## GO:0022898 GO:0022898
    ## GO:0051592 GO:0051592
    ## GO:0010800 GO:0010800
    ## GO:0071260 GO:0071260
    ## GO:0043279 GO:0043279
    ## GO:0071675 GO:0071675
    ## GO:0008625 GO:0008625
    ## GO:2000300 GO:2000300
    ## GO:0018107 GO:0018107
    ## GO:0043393 GO:0043393
    ## GO:0010921 GO:0010921
    ## GO:0032092 GO:0032092
    ## GO:1904645 GO:1904645
    ## GO:0071902 GO:0071902
    ## GO:1903715 GO:1903715
    ## GO:1903169 GO:1903169
    ## GO:0046928 GO:0046928
    ## GO:0097202 GO:0097202
    ## GO:0023061 GO:0023061
    ## GO:0051928 GO:0051928
    ## GO:0043525 GO:0043525
    ## GO:0032770 GO:0032770
    ## GO:1990000 GO:1990000
    ## GO:0008016 GO:0008016
    ## GO:0032768 GO:0032768
    ## GO:0051924 GO:0051924
    ## GO:0018210 GO:0018210
    ## GO:0034349 GO:0034349
    ## GO:1901550 GO:1901550
    ## GO:1903140 GO:1903140
    ## GO:0032409 GO:0032409
    ## GO:0021543 GO:0021543
    ## GO:0048488 GO:0048488
    ## GO:0140238 GO:0140238
    ## GO:1900242 GO:1900242
    ## GO:0006942 GO:0006942
    ## GO:0097242 GO:0097242
    ## GO:0032412 GO:0032412
    ## GO:0034764 GO:0034764
    ## GO:0038034 GO:0038034
    ## GO:0097192 GO:0097192
    ## GO:1901021 GO:1901021
    ## GO:0060048 GO:0060048
    ## GO:0045936 GO:0045936
    ## GO:0010523 GO:0010523
    ## GO:0071241 GO:0071241
    ## GO:0010563 GO:0010563
    ## GO:1903829 GO:1903829
    ## GO:0010522 GO:0010522
    ## GO:0002027 GO:0002027
    ## GO:0019233 GO:0019233
    ## GO:0032722 GO:0032722
    ## GO:0007568 GO:0007568
    ## GO:0007269 GO:0007269
    ## GO:0099643 GO:0099643
    ## GO:0046822 GO:0046822
    ## GO:0010881 GO:0010881
    ## GO:0031281 GO:0031281
    ## GO:0032496 GO:0032496
    ## GO:0050999 GO:0050999
    ## GO:0051341 GO:0051341
    ## GO:1904427 GO:1904427
    ## GO:0050905 GO:0050905
    ## GO:0060047 GO:0060047
    ## GO:0032414 GO:0032414
    ## GO:0002082 GO:0002082
    ## GO:0036465 GO:0036465
    ## GO:0006984 GO:0006984
    ## GO:1900271 GO:1900271
    ## GO:1904064 GO:1904064
    ## GO:0071248 GO:0071248
    ## GO:0051000 GO:0051000
    ## GO:0010799 GO:0010799
    ## GO:0021987 GO:0021987
    ## GO:0071900 GO:0071900
    ## GO:0003015 GO:0003015
    ## GO:0032388 GO:0032388
    ## GO:0051279 GO:0051279
    ## GO:0086064 GO:0086064
    ## GO:0043457 GO:0043457
    ## GO:0002237 GO:0002237
    ## GO:1903522 GO:1903522
    ## GO:0007613 GO:0007613
    ## GO:0035637 GO:0035637
    ## GO:0090316 GO:0090316
    ## GO:0060314 GO:0060314
    ## GO:0006836 GO:0006836
    ## GO:0032025 GO:0032025
    ## GO:0051342 GO:0051342
    ## GO:0097250 GO:0097250
    ## GO:0032411 GO:0032411
    ## GO:0048675 GO:0048675
    ## GO:0018105 GO:0018105
    ## GO:0098901 GO:0098901
    ## GO:0030100 GO:0030100
    ## GO:0001505 GO:0001505
    ## GO:0010524 GO:0010524
    ## GO:1903578 GO:1903578
    ## GO:0060315 GO:0060315
    ## GO:1901844 GO:1901844
    ## GO:2000343 GO:2000343
    ## GO:2000406 GO:2000406
    ## GO:0097191 GO:0097191
    ## GO:0042326 GO:0042326
    ## GO:0007219 GO:0007219
    ## GO:0035303 GO:0035303
    ## GO:0071214 GO:0071214
    ## GO:0104004 GO:0104004
    ## GO:0006099 GO:0006099
    ## GO:0010880 GO:0010880
    ## GO:0003012 GO:0003012
    ## GO:0071287 GO:0071287
    ## GO:1990034 GO:1990034
    ## GO:0043666 GO:0043666
    ## GO:0086065 GO:0086065
    ## GO:0046777 GO:0046777
    ## GO:1901019 GO:1901019
    ## GO:0018209 GO:0018209
    ## GO:0006941 GO:0006941
    ## GO:0045055 GO:0045055
    ## GO:0002687 GO:0002687
    ## GO:0010644 GO:0010644
    ## GO:0001933 GO:0001933
    ## GO:0030516 GO:0030516
    ## GO:0033674 GO:0033674
    ## GO:0005513 GO:0005513
    ## GO:0006983 GO:0006983
    ## GO:0051280 GO:0051280
    ## GO:0010959 GO:0010959
    ## GO:0001975 GO:0001975
    ## GO:0051051 GO:0051051
    ## GO:0070482 GO:0070482
    ## GO:0046824 GO:0046824
    ## GO:0016236 GO:0016236
    ## GO:0032642 GO:0032642
    ## GO:0010922 GO:0010922
    ## GO:0014808 GO:0014808
    ## GO:0070884 GO:0070884
    ## GO:0070059 GO:0070059
    ## GO:0032602 GO:0032602
    ## GO:0016241 GO:0016241
    ## GO:0048148 GO:0048148
    ## GO:0106056 GO:0106056
    ## GO:1903514 GO:1903514
    ## GO:2000403 GO:2000403
    ## GO:0035418 GO:0035418
    ## GO:0071677 GO:0071677
    ## GO:0071216 GO:0071216
    ## GO:0021537 GO:0021537
    ## GO:0051284 GO:0051284
    ## GO:0099170 GO:0099170
    ## GO:1901660 GO:1901660
    ## GO:0071674 GO:0071674
    ## GO:0043029 GO:0043029
    ## GO:0031331 GO:0031331
    ## GO:0032103 GO:0032103
    ## GO:0009896 GO:0009896
    ## GO:0071887 GO:0071887
    ## GO:0090257 GO:0090257
    ## GO:0071868 GO:0071868
    ## GO:0071870 GO:0071870
    ## GO:0034612 GO:0034612
    ## GO:0010649 GO:0010649
    ## GO:0051044 GO:0051044
    ## GO:1905906 GO:1905906
    ## GO:0034976 GO:0034976
    ## GO:0061387 GO:0061387
    ## GO:0071867 GO:0071867
    ## GO:0071869 GO:0071869
    ## GO:0051281 GO:0051281
    ## GO:0070266 GO:0070266
    ## GO:0009416 GO:0009416
    ## GO:0016042 GO:0016042
    ## GO:0071496 GO:0071496
    ## GO:0002685 GO:0002685
    ## GO:0050807 GO:0050807
    ## GO:0045860 GO:0045860
    ## GO:0046688 GO:0046688
    ## GO:0071312 GO:0071312
    ## GO:2000404 GO:2000404
    ## GO:0009749 GO:0009749
    ## GO:0051348 GO:0051348
    ## GO:0030730 GO:0030730
    ## GO:0007006 GO:0007006
    ## GO:0086001 GO:0086001
    ## GO:0031952 GO:0031952
    ## GO:1901983 GO:1901983
    ## GO:0009612 GO:0009612
    ## GO:0008542 GO:0008542
    ## GO:0043112 GO:0043112
    ## GO:0050803 GO:0050803
    ## GO:0007213 GO:0007213
    ## GO:1900221 GO:1900221
    ## GO:0009746 GO:0009746
    ## GO:0048538 GO:0048538
    ## GO:0032386 GO:0032386
    ## GO:0062197 GO:0062197
    ## GO:0006937 GO:0006937
    ## GO:0021766 GO:0021766
    ## GO:0001819 GO:0001819
    ## GO:0000302 GO:0000302
    ## GO:0034198 GO:0034198
    ## GO:0035094 GO:0035094
    ## GO:0061028 GO:0061028
    ## GO:0010042 GO:0010042
    ## GO:0010801 GO:0010801
    ## GO:0072567 GO:0072567
    ## GO:2000341 GO:2000341
    ## GO:0006470 GO:0006470
    ## GO:1990138 GO:1990138
    ## GO:0034284 GO:0034284
    ## GO:0046889 GO:0046889
    ## GO:0001774 GO:0001774
    ## GO:0045601 GO:0045601
    ## GO:0097300 GO:0097300
    ## GO:0006936 GO:0006936
    ## GO:0032516 GO:0032516
    ## GO:0050849 GO:0050849
    ## GO:0033157 GO:0033157
    ## GO:0097061 GO:0097061
    ## GO:0014075 GO:0014075
    ## GO:1990928 GO:1990928
    ## GO:0009266 GO:0009266
    ## GO:0034504 GO:0034504
    ## GO:0016311 GO:0016311
    ## GO:0030534 GO:0030534
    ## GO:0048588 GO:0048588
    ## GO:0060560 GO:0060560
    ## GO:0010721 GO:0010721
    ## GO:0007632 GO:0007632
    ## GO:0001776 GO:0001776
    ## GO:0051262 GO:0051262
    ## GO:1904950 GO:1904950
    ## GO:2001233 GO:2001233
    ## GO:0033673 GO:0033673
    ## GO:0051349 GO:0051349
    ## GO:2001257 GO:2001257
    ## GO:0001508 GO:0001508
    ## GO:0035304 GO:0035304
    ## GO:0099175 GO:0099175
    ## GO:0031345 GO:0031345
    ## GO:0006913 GO:0006913
    ## GO:0051169 GO:0051169
    ## GO:1900180 GO:1900180
    ## GO:1903305 GO:1903305
    ## GO:0016358 GO:0016358
    ## GO:0010288 GO:0010288
    ## GO:0051043 GO:0051043
    ## GO:0000086 GO:0000086
    ## GO:0045471 GO:0045471
    ## GO:0035065 GO:0035065
    ## GO:0001666 GO:0001666
    ## GO:0098900 GO:0098900
    ## GO:1902414 GO:1902414
    ## GO:0050768 GO:0050768
    ## GO:0001964 GO:0001964
    ## GO:0010560 GO:0010560
    ## GO:0032872 GO:0032872
    ## GO:0050729 GO:0050729
    ## GO:0070302 GO:0070302
    ## GO:0062013 GO:0062013
    ## GO:0009743 GO:0009743
    ## GO:0097305 GO:0097305
    ## GO:0006611 GO:0006611
    ## GO:0030900 GO:0030900
    ## GO:0051961 GO:0051961
    ## GO:0010559 GO:0010559
    ## GO:0031954 GO:0031954
    ## GO:0008630 GO:0008630
    ## GO:0021549 GO:0021549
    ## GO:0033209 GO:0033209
    ## GO:0060996 GO:0060996
    ## GO:1903531 GO:1903531
    ## GO:0035306 GO:0035306
    ## GO:0006473 GO:0006473
    ## GO:0045807 GO:0045807
    ## GO:0044839 GO:0044839
    ## GO:0051384 GO:0051384
    ## GO:0017157 GO:0017157
    ## GO:0036293 GO:0036293
    ## GO:0009314 GO:0009314
    ## GO:0031638 GO:0031638
    ## GO:0031663 GO:0031663
    ## GO:0042306 GO:0042306
    ## GO:0032801 GO:0032801
    ## GO:0071280 GO:0071280
    ## GO:1903020 GO:1903020
    ## GO:1903779 GO:1903779
    ## GO:0042176 GO:0042176
    ## GO:2000401 GO:2000401
    ## GO:0017038 GO:0017038
    ## GO:0035066 GO:0035066
    ## GO:0095500 GO:0095500
    ## GO:0002260 GO:0002260
    ## GO:0032731 GO:0032731
    ## GO:0070265 GO:0070265
    ## GO:0048638 GO:0048638
    ## GO:0050770 GO:0050770
    ## GO:0050708 GO:0050708
    ## GO:0061564 GO:0061564
    ## GO:1904589 GO:1904589
    ## GO:2000756 GO:2000756
    ## GO:0006606 GO:0006606
    ## GO:1905477 GO:1905477
    ## GO:0007176 GO:0007176
    ## GO:0046825 GO:0046825
    ## GO:0070498 GO:0070498
    ## GO:0090314 GO:0090314
    ## GO:0062012 GO:0062012
    ## GO:0001885 GO:0001885
    ## GO:1903018 GO:1903018
    ## GO:0008637 GO:0008637
    ## GO:0021761 GO:0021761
    ## GO:0006469 GO:0006469
    ## GO:0022037 GO:0022037
    ## GO:1905144 GO:1905144
    ## GO:1905145 GO:1905145
    ## GO:0051170 GO:0051170
    ## GO:0072678 GO:0072678
    ## GO:0006475 GO:0006475
    ## GO:0043271 GO:0043271
    ## GO:0031349 GO:0031349
    ## GO:1901889 GO:1901889
    ## GO:0010517 GO:0010517
    ## GO:0032890 GO:0032890
    ## GO:0051100 GO:0051100
    ## GO:0016049 GO:0016049
    ## GO:0051926 GO:0051926
    ## GO:0050796 GO:0050796
    ## GO:0007409 GO:0007409
    ## GO:0031960 GO:0031960
    ## GO:0086004 GO:0086004
    ## GO:2000758 GO:2000758
    ## GO:0006887 GO:0006887
    ## GO:0043200 GO:0043200
    ## GO:0072594 GO:0072594
    ## GO:0033555 GO:0033555
    ## GO:0021548 GO:0021548
    ## GO:0060439 GO:0060439
    ## GO:0071073 GO:0071073
    ## GO:0090647 GO:0090647
    ## GO:0098917 GO:0098917
    ## GO:1990535 GO:1990535
    ## GO:0044772 GO:0044772
    ## GO:0050808 GO:0050808
    ## GO:0071356 GO:0071356
    ## GO:0051048 GO:0051048
    ## GO:1901653 GO:1901653
    ## GO:0032732 GO:0032732
    ## GO:0086003 GO:0086003
    ## GO:0045732 GO:0045732
    ## GO:0010923 GO:0010923
    ## GO:0035774 GO:0035774
    ## GO:0071402 GO:0071402
    ## GO:0090313 GO:0090313
    ## GO:1903539 GO:1903539
    ## GO:0051881 GO:0051881
    ## GO:1905475 GO:1905475
    ## GO:0050767 GO:0050767
    ## GO:2001259 GO:2001259
    ## GO:0062237 GO:0062237
    ## GO:0001660 GO:0001660
    ## GO:0010918 GO:0010918
    ## GO:0031652 GO:0031652
    ## GO:0051610 GO:0051610
    ## GO:0071313 GO:0071313
    ## GO:0010508 GO:0010508
    ## GO:0098926 GO:0098926
    ## GO:0051403 GO:0051403
    ## GO:0072593 GO:0072593
    ## GO:0051960 GO:0051960
    ## GO:2001235 GO:2001235
    ## GO:0008306 GO:0008306
    ## GO:0008361 GO:0008361
    ## GO:1905952 GO:1905952
    ## GO:0016572 GO:0016572
    ## GO:1903115 GO:1903115
    ## GO:0010975 GO:0010975
    ## GO:0035270 GO:0035270
    ## GO:0051224 GO:0051224
    ## GO:0010642 GO:0010642
    ## GO:0032306 GO:0032306
    ## GO:0033127 GO:0033127
    ## GO:0034370 GO:0034370
    ## GO:0034372 GO:0034372
    ## GO:0061307 GO:0061307
    ## GO:0061308 GO:0061308
    ## GO:0061517 GO:0061517
    ## GO:0072584 GO:0072584
    ## GO:1902950 GO:1902950
    ## GO:0043543 GO:0043543
    ## GO:1901020 GO:1901020
    ## GO:0030641 GO:0030641
    ## GO:0031098 GO:0031098
    ## GO:0042307 GO:0042307
    ## GO:1901385 GO:1901385
    ## GO:0021819 GO:0021819
    ## GO:0036462 GO:0036462
    ## GO:0051481 GO:0051481
    ## GO:1900103 GO:1900103
    ## GO:1900121 GO:1900121
    ## GO:1900272 GO:1900272
    ## GO:0021795 GO:0021795
    ## GO:1900542 GO:1900542
    ## GO:0009410 GO:0009410
    ## GO:0001101 GO:0001101
    ## GO:0045981 GO:0045981
    ## GO:1900544 GO:1900544
    ## GO:1904591 GO:1904591
    ## GO:0097194 GO:0097194
    ## GO:0006140 GO:0006140
    ## GO:0022406 GO:0022406
    ## GO:0010977 GO:0010977
    ## GO:0001921 GO:0001921
    ## GO:0031650 GO:0031650
    ## GO:0051589 GO:0051589
    ## GO:0071415 GO:0071415
    ## GO:0030073 GO:0030073
    ## GO:0019915 GO:0019915
    ## GO:0044070 GO:0044070
    ## GO:1900182 GO:1900182
    ## GO:0090276 GO:0090276
    ## GO:0035305 GO:0035305
    ## GO:0035307 GO:0035307
    ## GO:1901985 GO:1901985
    ## GO:0019221 GO:0019221
    ## GO:0046330 GO:0046330
    ## GO:0032355 GO:0032355
    ## GO:0031018 GO:0031018
    ## GO:0002791 GO:0002791
    ## GO:0010820 GO:0010820
    ## GO:0014733 GO:0014733
    ## GO:0032310 GO:0032310
    ## GO:0048308 GO:0048308
    ## GO:0048313 GO:0048313
    ## GO:0051290 GO:0051290
    ## GO:0070885 GO:0070885
    ## GO:0070886 GO:0070886
    ## GO:0106057 GO:0106057
    ## GO:0106058 GO:0106058
    ## GO:1901841 GO:1901841
    ## GO:1903727 GO:1903727
    ## GO:1903799 GO:1903799
    ## GO:0046031 GO:0046031
    ## GO:0034763 GO:0034763
    ## GO:0070555 GO:0070555
    ## GO:0090087 GO:0090087
    ## GO:0046677 GO:0046677
    ## GO:0061001 GO:0061001
    ## GO:1903170 GO:1903170
    ## GO:0006885 GO:0006885
    ## GO:0060191 GO:0060191
    ## GO:0007612 GO:0007612
    ## GO:1903351 GO:1903351
    ## GO:1902003 GO:1902003
    ## GO:2001238 GO:2001238
    ## GO:0048813 GO:0048813
    ## GO:0032755 GO:0032755
    ## GO:1903350 GO:1903350
    ## GO:0010819 GO:0010819
    ## GO:0017014 GO:0017014
    ## GO:0018119 GO:0018119
    ## GO:0034116 GO:0034116
    ## GO:0045651 GO:0045651
    ## GO:0045838 GO:0045838
    ## GO:0042110 GO:0042110
    ## GO:0008038 GO:0008038
    ## GO:0009409 GO:0009409
    ## GO:0030225 GO:0030225
    ## GO:0048168 GO:0048168
    ## GO:0002690 GO:0002690
    ## GO:0032091 GO:0032091
    ## GO:0001558 GO:0001558
    ## GO:1901215 GO:1901215
    ## GO:0014074 GO:0014074
    ## GO:0045834 GO:0045834
    ## GO:0060425 GO:0060425
    ## GO:0046827 GO:0046827
    ## GO:0051580 GO:0051580
    ## GO:0061577 GO:0061577
    ## GO:1900034 GO:1900034
    ## GO:1903358 GO:1903358
    ## GO:1904355 GO:1904355
    ## GO:0030902 GO:0030902
    ## GO:0043535 GO:0043535
    ## GO:0071333 GO:0071333
    ## GO:2001236 GO:2001236
    ## GO:0051339 GO:0051339
    ## GO:0070252 GO:0070252
    ## GO:0016573 GO:0016573
    ## GO:0071331 GO:0071331
    ## GO:0045861 GO:0045861
    ## GO:0030856 GO:0030856
    ## GO:0071326 GO:0071326
    ## GO:1903532 GO:1903532
    ## GO:0001956 GO:0001956
    ## GO:0015732 GO:0015732
    ## GO:0031000 GO:0031000
    ## GO:0031649 GO:0031649
    ## GO:0060438 GO:0060438
    ## GO:0060546 GO:0060546
    ## GO:0071071 GO:0071071
    ## GO:0150078 GO:0150078
    ## GO:2000641 GO:2000641
    ## GO:0008347 GO:0008347
    ## GO:0070839 GO:0070839
    ## GO:0002064 GO:0002064
    ## GO:0018393 GO:0018393
    ## GO:0009306 GO:0009306
    ## GO:0035592 GO:0035592
    ## GO:0010759 GO:0010759
    ## GO:0010829 GO:0010829
    ## GO:0030220 GO:0030220
    ## GO:0032026 GO:0032026
    ## GO:0036344 GO:0036344
    ## GO:0045821 GO:0045821
    ## GO:0062099 GO:0062099
    ## GO:0140131 GO:0140131
    ## GO:0009135 GO:0009135
    ## GO:0009179 GO:0009179
    ## GO:0030004 GO:0030004
    ## GO:0032760 GO:0032760
    ## GO:0031113 GO:0031113
    ## GO:0042220 GO:0042220
    ## GO:1902991 GO:1902991
    ## GO:0002274 GO:0002274
    ## GO:0050673 GO:0050673
    ## GO:2001234 GO:2001234
    ## GO:0022029 GO:0022029
    ## GO:0043388 GO:0043388
    ## GO:0071322 GO:0071322
    ## GO:0006837 GO:0006837
    ## GO:0046931 GO:0046931
    ## GO:0060252 GO:0060252
    ## GO:1901386 GO:1901386
    ## GO:1902004 GO:1902004
    ## GO:0009185 GO:0009185
    ## GO:0042116 GO:0042116
    ## GO:0050879 GO:0050879
    ## GO:0050881 GO:0050881
    ##                                                                                                 Description
    ## GO:0006119                                                                        oxidative phosphorylation
    ## GO:0009060                                                                              aerobic respiration
    ## GO:0046034                                                                            ATP metabolic process
    ## GO:0045333                                                                             cellular respiration
    ## GO:0019646                                                                 aerobic electron transport chain
    ## GO:0042773                                                         ATP synthesis coupled electron transport
    ## GO:0042775                                           mitochondrial ATP synthesis coupled electron transport
    ## GO:0022904                                                             respiratory electron transport chain
    ## GO:0015980                                              energy derivation by oxidation of organic compounds
    ## GO:0022900                                                                         electron transport chain
    ## GO:0006091                                                   generation of precursor metabolites and energy
    ## GO:0006120                                             mitochondrial electron transport, NADH to ubiquinone
    ## GO:0010257                                                              NADH dehydrogenase complex assembly
    ## GO:0032981                                               mitochondrial respiratory chain complex I assembly
    ## GO:0033108                                                 mitochondrial respiratory chain complex assembly
    ## GO:1902600                                                                   proton transmembrane transport
    ## GO:0006123                                         mitochondrial electron transport, cytochrome c to oxygen
    ## GO:0015985                                   energy coupled proton transport, down electrochemical gradient
    ## GO:0015986                                                           ATP synthesis coupled proton transport
    ## GO:0006122                                      mitochondrial electron transport, ubiquinol to cytochrome c
    ## GO:0019932                                                              second-messenger-mediated signaling
    ## GO:0019722                                                                       calcium-mediated signaling
    ## GO:0070588                                                              calcium ion transmembrane transport
    ## GO:0010952                                                        positive regulation of peptidase activity
    ## GO:0070997                                                                                     neuron death
    ## GO:0050804                                                     modulation of chemical synaptic transmission
    ## GO:0099177                                                           regulation of trans-synaptic signaling
    ## GO:0010950                                                    positive regulation of endopeptidase activity
    ## GO:0006509                                                          membrane protein ectodomain proteolysis
    ## GO:0045862                                                               positive regulation of proteolysis
    ## GO:0050435                                                                   amyloid-beta metabolic process
    ## GO:0006816                                                                            calcium ion transport
    ## GO:0042776                                             mitochondrial ATP synthesis coupled proton transport
    ## GO:0060401                                                                  cytosolic calcium ion transport
    ## GO:0006754                                                                         ATP biosynthetic process
    ## GO:0033619                                                                     membrane protein proteolysis
    ## GO:2001056                                      positive regulation of cysteine-type endopeptidase activity
    ## GO:0009206                                          purine ribonucleoside triphosphate biosynthetic process
    ## GO:0009145                                              purine nucleoside triphosphate biosynthetic process
    ## GO:0048167                                                                regulation of synaptic plasticity
    ## GO:0048016                                                            inositol phosphate-mediated signaling
    ## GO:0097553                                                    calcium ion transmembrane import into cytosol
    ## GO:0009201                                                 ribonucleoside triphosphate biosynthetic process
    ## GO:1901216                                                              positive regulation of neuron death
    ## GO:0051402                                                                         neuron apoptotic process
    ## GO:0006874                                                                 cellular calcium ion homeostasis
    ## GO:0009205                                             purine ribonucleoside triphosphate metabolic process
    ## GO:0010038                                                                            response to metal ion
    ## GO:0060402                                                               calcium ion transport into cytosol
    ## GO:0055074                                                                          calcium ion homeostasis
    ## GO:0009142                                                     nucleoside triphosphate biosynthetic process
    ## GO:0016485                                                                               protein processing
    ## GO:0009144                                                 purine nucleoside triphosphate metabolic process
    ## GO:0042987                                                      amyloid precursor protein catabolic process
    ## GO:0009199                                                    ribonucleoside triphosphate metabolic process
    ## GO:0072503                                                   cellular divalent inorganic cation homeostasis
    ## GO:0007215                                                             glutamate receptor signaling pathway
    ## GO:0042982                                                      amyloid precursor protein metabolic process
    ## GO:0060291                                                                  long-term synaptic potentiation
    ## GO:0034205                                                                           amyloid-beta formation
    ## GO:0052547                                                                 regulation of peptidase activity
    ## GO:0006919                 activation of cysteine-type endopeptidase activity involved in apoptotic process
    ## GO:0051604                                                                               protein maturation
    ## GO:0052548                                                             regulation of endopeptidase activity
    ## GO:0042391                                                                 regulation of membrane potential
    ## GO:0050806                                                     positive regulation of synaptic transmission
    ## GO:2000116                                               regulation of cysteine-type endopeptidase activity
    ## GO:0009141                                                        nucleoside triphosphate metabolic process
    ## GO:1901214                                                                       regulation of neuron death
    ## GO:0006164                                                           purine nucleotide biosynthetic process
    ## GO:0043280        positive regulation of cysteine-type endopeptidase activity involved in apoptotic process
    ## GO:0072522                                                  purine-containing compound biosynthetic process
    ## GO:0007204                                       positive regulation of cytosolic calcium ion concentration
    ## GO:0009152                                                       purine ribonucleotide biosynthetic process
    ## GO:0035235                                                  ionotropic glutamate receptor signaling pathway
    ## GO:0051235                                                                          maintenance of location
    ## GO:0033173                                                               calcineurin-NFAT signaling cascade
    ## GO:0051651                                                                  maintenance of location in cell
    ## GO:0009165                                                                  nucleotide biosynthetic process
    ## GO:0050890                                                                                        cognition
    ## GO:0007611                                                                               learning or memory
    ## GO:1901293                                                        nucleoside phosphate biosynthetic process
    ## GO:0009260                                                              ribonucleotide biosynthetic process
    ## GO:0097720                                                                   calcineurin-mediated signaling
    ## GO:0006163                                                              purine nucleotide metabolic process
    ## GO:0051208                                                                      sequestering of calcium ion
    ## GO:0051480                                                regulation of cytosolic calcium ion concentration
    ## GO:0046390                                                            ribose phosphate biosynthetic process
    ## GO:0050848                                                         regulation of calcium-mediated signaling
    ## GO:0060079                                                                excitatory postsynaptic potential
    ## GO:0009150                                                          purine ribonucleotide metabolic process
    ## GO:0072521                                                     purine-containing compound metabolic process
    ## GO:1990542                                                            mitochondrial transmembrane transport
    ## GO:0099565                                                     chemical synaptic transmission, postsynaptic
    ## GO:0009259                                                                 ribonucleotide metabolic process
    ## GO:0009117                                                                     nucleotide metabolic process
    ## GO:0006839                                                                          mitochondrial transport
    ## GO:0006753                                                           nucleoside phosphate metabolic process
    ## GO:0019693                                                               ribose phosphate metabolic process
    ## GO:0051209                                                  release of sequestered calcium ion into cytosol
    ## GO:0051283                                               negative regulation of sequestering of calcium ion
    ## GO:0048143                                                                             astrocyte activation
    ## GO:0051282                                                        regulation of sequestering of calcium ion
    ## GO:0048857                                                                       neural nucleus development
    ## GO:0021762                                                                     substantia nigra development
    ## GO:1903421                                                         regulation of synaptic vesicle recycling
    ## GO:0099003                                                            vesicle-mediated transport in synapse
    ## GO:0043281                 regulation of cysteine-type endopeptidase activity involved in apoptotic process
    ## GO:0060078                                                    regulation of postsynaptic membrane potential
    ## GO:0042063                                                                                      gliogenesis
    ## GO:0031279                                                                   regulation of cyclase activity
    ## GO:0099504                                                                           synaptic vesicle cycle
    ## GO:0048708                                                                        astrocyte differentiation
    ## GO:0010506                                                                          regulation of autophagy
    ## GO:0043270                                                             positive regulation of ion transport
    ## GO:0021782                                                                           glial cell development
    ## GO:0051353                                                   positive regulation of oxidoreductase activity
    ## GO:0034765                                                        regulation of ion transmembrane transport
    ## GO:0030901                                                                             midbrain development
    ## GO:0097193                                                            intrinsic apoptotic signaling pathway
    ## GO:0070509                                                                               calcium ion import
    ## GO:0006979                                                                     response to oxidative stress
    ## GO:0070296                                                     sarcoplasmic reticulum calcium ion transport
    ## GO:0106027                                                                   neuron projection organization
    ## GO:0034767                                               positive regulation of ion transmembrane transport
    ## GO:0043467                                     regulation of generation of precursor metabolites and energy
    ## GO:0014002                                                                            astrocyte development
    ## GO:0051222                                                         positive regulation of protein transport
    ## GO:0061337                                                                               cardiac conduction
    ## GO:0043523                                                           regulation of neuron apoptotic process
    ## GO:0032469                                                    endoplasmic reticulum calcium ion homeostasis
    ## GO:1904062                                                     regulation of cation transmembrane transport
    ## GO:0051588                                                         regulation of neurotransmitter transport
    ## GO:1904646                                                                cellular response to amyloid-beta
    ## GO:0051099                                                                   positive regulation of binding
    ## GO:0051098                                                                            regulation of binding
    ## GO:0010882                                regulation of cardiac muscle contraction by calcium ion signaling
    ## GO:0016079                                                                      synaptic vesicle exocytosis
    ## GO:1904951                                     positive regulation of establishment of protein localization
    ## GO:0010001                                                                       glial cell differentiation
    ## GO:0055117                                                         regulation of cardiac muscle contraction
    ## GO:0022898                                                 regulation of transmembrane transporter activity
    ## GO:0051592                                                                          response to calcium ion
    ## GO:0010800                                        positive regulation of peptidyl-threonine phosphorylation
    ## GO:0071260                                                         cellular response to mechanical stimulus
    ## GO:0043279                                                                             response to alkaloid
    ## GO:0071675                                                         regulation of mononuclear cell migration
    ## GO:0008625                                 extrinsic apoptotic signaling pathway via death domain receptors
    ## GO:2000300                                                        regulation of synaptic vesicle exocytosis
    ## GO:0018107                                                               peptidyl-threonine phosphorylation
    ## GO:0043393                                                                    regulation of protein binding
    ## GO:0010921                                                               regulation of phosphatase activity
    ## GO:0032092                                                           positive regulation of protein binding
    ## GO:1904645                                                                         response to amyloid-beta
    ## GO:0071902                                  positive regulation of protein serine/threonine kinase activity
    ## GO:1903715                                                                regulation of aerobic respiration
    ## GO:1903169                                                regulation of calcium ion transmembrane transport
    ## GO:0046928                                                         regulation of neurotransmitter secretion
    ## GO:0097202                                               activation of cysteine-type endopeptidase activity
    ## GO:0023061                                                                                   signal release
    ## GO:0051928                                                     positive regulation of calcium ion transport
    ## GO:0043525                                                  positive regulation of neuron apoptotic process
    ## GO:0032770                                                    positive regulation of monooxygenase activity
    ## GO:1990000                                                                         amyloid fibril formation
    ## GO:0008016                                                                  regulation of heart contraction
    ## GO:0032768                                                             regulation of monooxygenase activity
    ## GO:0051924                                                              regulation of calcium ion transport
    ## GO:0018210                                                                  peptidyl-threonine modification
    ## GO:0034349                                                                     glial cell apoptotic process
    ## GO:1901550                                                       regulation of endothelial cell development
    ## GO:1903140                                               regulation of establishment of endothelial barrier
    ## GO:0032409                                                               regulation of transporter activity
    ## GO:0021543                                                                              pallium development
    ## GO:0048488                                                                     synaptic vesicle endocytosis
    ## GO:0140238                                                                          presynaptic endocytosis
    ## GO:1900242                                                       regulation of synaptic vesicle endocytosis
    ## GO:0006942                                                        regulation of striated muscle contraction
    ## GO:0097242                                                                           amyloid-beta clearance
    ## GO:0032412                                             regulation of ion transmembrane transporter activity
    ## GO:0034764                                                   positive regulation of transmembrane transport
    ## GO:0038034                                                         signal transduction in absence of ligand
    ## GO:0097192                                       extrinsic apoptotic signaling pathway in absence of ligand
    ## GO:1901021                            positive regulation of calcium ion transmembrane transporter activity
    ## GO:0060048                                                                       cardiac muscle contraction
    ## GO:0045936                                               negative regulation of phosphate metabolic process
    ## GO:0010523                                        negative regulation of calcium ion transport into cytosol
    ## GO:0071241                                                         cellular response to inorganic substance
    ## GO:0010563                                              negative regulation of phosphorus metabolic process
    ## GO:1903829                                             positive regulation of cellular protein localization
    ## GO:0010522                                                 regulation of calcium ion transport into cytosol
    ## GO:0002027                                                                         regulation of heart rate
    ## GO:0019233                                                                       sensory perception of pain
    ## GO:0032722                                                      positive regulation of chemokine production
    ## GO:0007568                                                                                            aging
    ## GO:0007269                                                                       neurotransmitter secretion
    ## GO:0099643                                                                      signal release from synapse
    ## GO:0046822                                                        regulation of nucleocytoplasmic transport
    ## GO:0010881 regulation of cardiac muscle contraction by regulation of the release of sequestered calcium ion
    ## GO:0031281                                                          positive regulation of cyclase activity
    ## GO:0032496                                                                   response to lipopolysaccharide
    ## GO:0050999                                                     regulation of nitric-oxide synthase activity
    ## GO:0051341                                                            regulation of oxidoreductase activity
    ## GO:1904427                                       positive regulation of calcium ion transmembrane transport
    ## GO:0050905                                                                            neuromuscular process
    ## GO:0060047                                                                                heart contraction
    ## GO:0032414                                    positive regulation of ion transmembrane transporter activity
    ## GO:0002082                                                          regulation of oxidative phosphorylation
    ## GO:0036465                                                                       synaptic vesicle recycling
    ## GO:0006984                                                                     ER-nucleus signaling pathway
    ## GO:1900271                                                    regulation of long-term synaptic potentiation
    ## GO:1904064                                            positive regulation of cation transmembrane transport
    ## GO:0071248                                                                   cellular response to metal ion
    ## GO:0051000                                            positive regulation of nitric-oxide synthase activity
    ## GO:0010799                                                 regulation of peptidyl-threonine phosphorylation
    ## GO:0021987                                                                      cerebral cortex development
    ## GO:0071900                                           regulation of protein serine/threonine kinase activity
    ## GO:0003015                                                                                    heart process
    ## GO:0032388                                                   positive regulation of intracellular transport
    ## GO:0051279                                    regulation of release of sequestered calcium ion into cytosol
    ## GO:0086064                         cell communication by electrical coupling involved in cardiac conduction
    ## GO:0043457                                                               regulation of cellular respiration
    ## GO:0002237                                                         response to molecule of bacterial origin
    ## GO:1903522                                                                  regulation of blood circulation
    ## GO:0007613                                                                                           memory
    ## GO:0035637                                                               multicellular organismal signaling
    ## GO:0090316                                           positive regulation of intracellular protein transport
    ## GO:0060314                               regulation of ryanodine-sensitive calcium-release channel activity
    ## GO:0006836                                                                       neurotransmitter transport
    ## GO:0032025                                                                           response to cobalt ion
    ## GO:0051342                                       regulation of cyclic-nucleotide phosphodiesterase activity
    ## GO:0097250                                                               mitochondrial respirasome assembly
    ## GO:0032411                                                      positive regulation of transporter activity
    ## GO:0048675                                                                                   axon extension
    ## GO:0018105                                                                  peptidyl-serine phosphorylation
    ## GO:0098901                                               regulation of cardiac muscle cell action potential
    ## GO:0030100                                                                        regulation of endocytosis
    ## GO:0001505                                                            regulation of neurotransmitter levels
    ## GO:0010524                                        positive regulation of calcium ion transport into cytosol
    ## GO:1903578                                                              regulation of ATP metabolic process
    ## GO:0060315                      negative regulation of ryanodine-sensitive calcium-release channel activity
    ## GO:1901844           regulation of cell communication by electrical coupling involved in cardiac conduction
    ## GO:2000343                               positive regulation of chemokine (C-X-C motif) ligand 2 production
    ## GO:2000406                                                          positive regulation of T cell migration
    ## GO:0097191                                                            extrinsic apoptotic signaling pathway
    ## GO:0042326                                                           negative regulation of phosphorylation
    ## GO:0007219                                                                          Notch signaling pathway
    ## GO:0035303                                                                  regulation of dephosphorylation
    ## GO:0071214                                                            cellular response to abiotic stimulus
    ## GO:0104004                                                      cellular response to environmental stimulus
    ## GO:0006099                                                                         tricarboxylic acid cycle
    ## GO:0010880          regulation of release of sequestered calcium ion into cytosol by sarcoplasmic reticulum
    ## GO:0003012                                                                            muscle system process
    ## GO:0071287                                                               cellular response to manganese ion
    ## GO:1990034                                                        calcium ion export across plasma membrane
    ## GO:0043666                                                regulation of phosphoprotein phosphatase activity
    ## GO:0086065                                                cell communication involved in cardiac conduction
    ## GO:0046777                                                                      protein autophosphorylation
    ## GO:1901019                                     regulation of calcium ion transmembrane transporter activity
    ## GO:0018209                                                                     peptidyl-serine modification
    ## GO:0006941                                                                      striated muscle contraction
    ## GO:0045055                                                                             regulated exocytosis
    ## GO:0002687                                                       positive regulation of leukocyte migration
    ## GO:0010644                                                        cell communication by electrical coupling
    ## GO:0001933                                                   negative regulation of protein phosphorylation
    ## GO:0030516                                                                     regulation of axon extension
    ## GO:0033674                                                           positive regulation of kinase activity
    ## GO:0005513                                                                         detection of calcium ion
    ## GO:0006983                                                                             ER overload response
    ## GO:0051280                           negative regulation of release of sequestered calcium ion into cytosol
    ## GO:0010959                                                                regulation of metal ion transport
    ## GO:0001975                                                                          response to amphetamine
    ## GO:0051051                                                                 negative regulation of transport
    ## GO:0070482                                                                        response to oxygen levels
    ## GO:0046824                                               positive regulation of nucleocytoplasmic transport
    ## GO:0016236                                                                                   macroautophagy
    ## GO:0032642                                                               regulation of chemokine production
    ## GO:0010922                                                      positive regulation of phosphatase activity
    ## GO:0014808                        release of sequestered calcium ion into cytosol by sarcoplasmic reticulum
    ## GO:0070884                                                 regulation of calcineurin-NFAT signaling cascade
    ## GO:0070059                intrinsic apoptotic signaling pathway in response to endoplasmic reticulum stress
    ## GO:0032602                                                                             chemokine production
    ## GO:0016241                                                                     regulation of macroautophagy
    ## GO:0048148                                                                   behavioral response to cocaine
    ## GO:0106056                                                     regulation of calcineurin-mediated signaling
    ## GO:1903514                         release of sequestered calcium ion into cytosol by endoplasmic reticulum
    ## GO:2000403                                                      positive regulation of lymphocyte migration
    ## GO:0035418                                                                  protein localization to synapse
    ## GO:0071677                                                positive regulation of mononuclear cell migration
    ## GO:0071216                                                             cellular response to biotic stimulus
    ## GO:0021537                                                                        telencephalon development
    ## GO:0051284                                               positive regulation of sequestering of calcium ion
    ## GO:0099170                                        postsynaptic modulation of chemical synaptic transmission
    ## GO:1901660                                                                               calcium ion export
    ## GO:0071674                                                                       mononuclear cell migration
    ## GO:0043029                                                                               T cell homeostasis
    ## GO:0031331                                                positive regulation of cellular catabolic process
    ## GO:0032103                                             positive regulation of response to external stimulus
    ## GO:0009896                                                         positive regulation of catabolic process
    ## GO:0071887                                                                      leukocyte apoptotic process
    ## GO:0090257                                                              regulation of muscle system process
    ## GO:0071868                                                          cellular response to monoamine stimulus
    ## GO:0071870                                                      cellular response to catecholamine stimulus
    ## GO:0034612                                                                response to tumor necrosis factor
    ## GO:0010649                                          regulation of cell communication by electrical coupling
    ## GO:0051044                                   positive regulation of membrane protein ectodomain proteolysis
    ## GO:1905906                                                           regulation of amyloid fibril formation
    ## GO:0034976                                                         response to endoplasmic reticulum stress
    ## GO:0061387                                                              regulation of extent of cell growth
    ## GO:0071867                                                                            response to monoamine
    ## GO:0071869                                                                        response to catecholamine
    ## GO:0051281                           positive regulation of release of sequestered calcium ion into cytosol
    ## GO:0070266                                                                              necroptotic process
    ## GO:0009416                                                                       response to light stimulus
    ## GO:0016042                                                                          lipid catabolic process
    ## GO:0071496                                                           cellular response to external stimulus
    ## GO:0002685                                                                regulation of leukocyte migration
    ## GO:0050807                                                               regulation of synapse organization
    ## GO:0045860                                                   positive regulation of protein kinase activity
    ## GO:0046688                                                                           response to copper ion
    ## GO:0071312                                                                    cellular response to alkaloid
    ## GO:2000404                                                                   regulation of T cell migration
    ## GO:0009749                                                                              response to glucose
    ## GO:0051348                                                      negative regulation of transferase activity
    ## GO:0030730                                                                     sequestering of triglyceride
    ## GO:0007006                                                              mitochondrial membrane organization
    ## GO:0086001                                                             cardiac muscle cell action potential
    ## GO:0031952                                                        regulation of protein autophosphorylation
    ## GO:1901983                                                                regulation of protein acetylation
    ## GO:0009612                                                                  response to mechanical stimulus
    ## GO:0008542                                                                                  visual learning
    ## GO:0043112                                                                       receptor metabolic process
    ## GO:0050803                                                      regulation of synapse structure or activity
    ## GO:0007213                                       G protein-coupled acetylcholine receptor signaling pathway
    ## GO:1900221                                                             regulation of amyloid-beta clearance
    ## GO:0009746                                                                               response to hexose
    ## GO:0048538                                                                               thymus development
    ## GO:0032386                                                            regulation of intracellular transport
    ## GO:0062197                                                             cellular response to chemical stress
    ## GO:0006937                                                                 regulation of muscle contraction
    ## GO:0021766                                                                          hippocampus development
    ## GO:0001819                                                       positive regulation of cytokine production
    ## GO:0000302                                                              response to reactive oxygen species
    ## GO:0034198                                                       cellular response to amino acid starvation
    ## GO:0035094                                                                             response to nicotine
    ## GO:0061028                                                             establishment of endothelial barrier
    ## GO:0010042                                                                        response to manganese ion
    ## GO:0010801                                        negative regulation of peptidyl-threonine phosphorylation
    ## GO:0072567                                                      chemokine (C-X-C motif) ligand 2 production
    ## GO:2000341                                        regulation of chemokine (C-X-C motif) ligand 2 production
    ## GO:0006470                                                                        protein dephosphorylation
    ## GO:1990138                                                                      neuron projection extension
    ## GO:0034284                                                                       response to monosaccharide
    ## GO:0046889                                                positive regulation of lipid biosynthetic process
    ## GO:0001774                                                                       microglial cell activation
    ## GO:0045601                                                   regulation of endothelial cell differentiation
    ## GO:0097300                                                                   programmed necrotic cell death
    ## GO:0006936                                                                               muscle contraction
    ## GO:0032516                                       positive regulation of phosphoprotein phosphatase activity
    ## GO:0050849                                                negative regulation of calcium-mediated signaling
    ## GO:0033157                                                    regulation of intracellular protein transport
    ## GO:0097061                                                                     dendritic spine organization
    ## GO:0014075                                                                                response to amine
    ## GO:1990928                                                                response to amino acid starvation
    ## GO:0009266                                                                 response to temperature stimulus
    ## GO:0034504                                                                  protein localization to nucleus
    ## GO:0016311                                                                                dephosphorylation
    ## GO:0030534                                                                                   adult behavior
    ## GO:0048588                                                                        developmental cell growth
    ## GO:0060560                                                   developmental growth involved in morphogenesis
    ## GO:0010721                                                          negative regulation of cell development
    ## GO:0007632                                                                                  visual behavior
    ## GO:0001776                                                                            leukocyte homeostasis
    ## GO:0051262                                                                          protein tetramerization
    ## GO:1904950                                     negative regulation of establishment of protein localization
    ## GO:2001233                                                        regulation of apoptotic signaling pathway
    ## GO:0033673                                                           negative regulation of kinase activity
    ## GO:0051349                                                            positive regulation of lyase activity
    ## GO:2001257                                                            regulation of cation channel activity
    ## GO:0001508                                                                                 action potential
    ## GO:0035304                                                          regulation of protein dephosphorylation
    ## GO:0099175                                                           regulation of postsynapse organization
    ## GO:0031345                                              negative regulation of cell projection organization
    ## GO:0006913                                                                      nucleocytoplasmic transport
    ## GO:0051169                                                                                nuclear transport
    ## GO:1900180                                                    regulation of protein localization to nucleus
    ## GO:1903305                                                        regulation of regulated secretory pathway
    ## GO:0016358                                                                             dendrite development
    ## GO:0010288                                                                             response to lead ion
    ## GO:0051043                                            regulation of membrane protein ectodomain proteolysis
    ## GO:0000086                                                            G2/M transition of mitotic cell cycle
    ## GO:0045471                                                                              response to ethanol
    ## GO:0035065                                                                regulation of histone acetylation
    ## GO:0001666                                                                              response to hypoxia
    ## GO:0098900                                                                   regulation of action potential
    ## GO:1902414                                                            protein localization to cell junction
    ## GO:0050768                                                              negative regulation of neurogenesis
    ## GO:0001964                                                                                 startle response
    ## GO:0010560                                         positive regulation of glycoprotein biosynthetic process
    ## GO:0032872                                                      regulation of stress-activated MAPK cascade
    ## GO:0050729                                                     positive regulation of inflammatory response
    ## GO:0070302                                  regulation of stress-activated protein kinase signaling cascade
    ## GO:0062013                                          positive regulation of small molecule metabolic process
    ## GO:0009743                                                                         response to carbohydrate
    ## GO:0097305                                                                              response to alcohol
    ## GO:0006611                                                                      protein export from nucleus
    ## GO:0030900                                                                            forebrain development
    ## GO:0051961                                                negative regulation of nervous system development
    ## GO:0010559                                                  regulation of glycoprotein biosynthetic process
    ## GO:0031954                                               positive regulation of protein autophosphorylation
    ## GO:0008630                                  intrinsic apoptotic signaling pathway in response to DNA damage
    ## GO:0021549                                                                           cerebellum development
    ## GO:0033209                                                 tumor necrosis factor-mediated signaling pathway
    ## GO:0060996                                                                      dendritic spine development
    ## GO:1903531                                                         negative regulation of secretion by cell
    ## GO:0035306                                                         positive regulation of dephosphorylation
    ## GO:0006473                                                                              protein acetylation
    ## GO:0045807                                                               positive regulation of endocytosis
    ## GO:0044839                                                                 cell cycle G2/M phase transition
    ## GO:0051384                                                                       response to glucocorticoid
    ## GO:0017157                                                                         regulation of exocytosis
    ## GO:0036293                                                              response to decreased oxygen levels
    ## GO:0009314                                                                            response to radiation
    ## GO:0031638                                                                               zymogen activation
    ## GO:0031663                                                    lipopolysaccharide-mediated signaling pathway
    ## GO:0042306                                                        regulation of protein import into nucleus
    ## GO:0032801                                                                       receptor catabolic process
    ## GO:0071280                                                                  cellular response to copper ion
    ## GO:1903020                                            positive regulation of glycoprotein metabolic process
    ## GO:1903779                                                                 regulation of cardiac conduction
    ## GO:0042176                                                          regulation of protein catabolic process
    ## GO:2000401                                                               regulation of lymphocyte migration
    ## GO:0017038                                                                                   protein import
    ## GO:0035066                                                       positive regulation of histone acetylation
    ## GO:0095500                                                         acetylcholine receptor signaling pathway
    ## GO:0002260                                                                           lymphocyte homeostasis
    ## GO:0032731                                             positive regulation of interleukin-1 beta production
    ## GO:0070265                                                                              necrotic cell death
    ## GO:0048638                                                               regulation of developmental growth
    ## GO:0050770                                                                       regulation of axonogenesis
    ## GO:0050708                                                                  regulation of protein secretion
    ## GO:0061564                                                                                 axon development
    ## GO:1904589                                                                     regulation of protein import
    ## GO:2000756                                                        regulation of peptidyl-lysine acetylation
    ## GO:0006606                                                                      protein import into nucleus
    ## GO:1905477                                          positive regulation of protein localization to membrane
    ## GO:0007176                                regulation of epidermal growth factor-activated receptor activity
    ## GO:0046825                                                        regulation of protein export from nucleus
    ## GO:0070498                                                         interleukin-1-mediated signaling pathway
    ## GO:0090314                                             positive regulation of protein targeting to membrane
    ## GO:0062012                                                   regulation of small molecule metabolic process
    ## GO:0001885                                                                     endothelial cell development
    ## GO:1903018                                                     regulation of glycoprotein metabolic process
    ## GO:0008637                                                                  apoptotic mitochondrial changes
    ## GO:0021761                                                                        limbic system development
    ## GO:0006469                                                   negative regulation of protein kinase activity
    ## GO:0022037                                                                        metencephalon development
    ## GO:1905144                                                                        response to acetylcholine
    ## GO:1905145                                                               cellular response to acetylcholine
    ## GO:0051170                                                                              import into nucleus
    ## GO:0072678                                                                                 T cell migration
    ## GO:0006475                                                          internal protein amino acid acetylation
    ## GO:0043271                                                             negative regulation of ion transport
    ## GO:0031349                                                          positive regulation of defense response
    ## GO:1901889                                                    negative regulation of cell junction assembly
    ## GO:0010517                                                             regulation of phospholipase activity
    ## GO:0032890                                                             regulation of organic acid transport
    ## GO:0051100                                                                   negative regulation of binding
    ## GO:0016049                                                                                      cell growth
    ## GO:0051926                                                     negative regulation of calcium ion transport
    ## GO:0050796                                                                  regulation of insulin secretion
    ## GO:0007409                                                                                     axonogenesis
    ## GO:0031960                                                                       response to corticosteroid
    ## GO:0086004                                                    regulation of cardiac muscle cell contraction
    ## GO:2000758                                               positive regulation of peptidyl-lysine acetylation
    ## GO:0006887                                                                                       exocytosis
    ## GO:0043200                                                                           response to amino acid
    ## GO:0072594                                               establishment of protein localization to organelle
    ## GO:0033555                                                      multicellular organismal response to stress
    ## GO:0021548                                                                                 pons development
    ## GO:0060439                                                                            trachea morphogenesis
    ## GO:0071073                                         positive regulation of phospholipid biosynthetic process
    ## GO:0090647                                                     modulation of age-related behavioral decline
    ## GO:0098917                                                              retrograde trans-synaptic signaling
    ## GO:1990535                                                                    neuron projection maintenance
    ## GO:0044772                                                              mitotic cell cycle phase transition
    ## GO:0050808                                                                             synapse organization
    ## GO:0071356                                                       cellular response to tumor necrosis factor
    ## GO:0051048                                                                 negative regulation of secretion
    ## GO:1901653                                                                     cellular response to peptide
    ## GO:0032732                                                  positive regulation of interleukin-1 production
    ## GO:0086003                                                                  cardiac muscle cell contraction
    ## GO:0045732                                                 positive regulation of protein catabolic process
    ## GO:0010923                                                      negative regulation of phosphatase activity
    ## GO:0035774       positive regulation of insulin secretion involved in cellular response to glucose stimulus
    ## GO:0071402                                               cellular response to lipoprotein particle stimulus
    ## GO:0090313                                                      regulation of protein targeting to membrane
    ## GO:1903539                                                    protein localization to postsynaptic membrane
    ## GO:0051881                                                   regulation of mitochondrial membrane potential
    ## GO:1905475                                                   regulation of protein localization to membrane
    ## GO:0050767                                                                       regulation of neurogenesis
    ## GO:2001259                                                   positive regulation of cation channel activity
    ## GO:0062237                                                              protein localization to postsynapse
    ## GO:0001660                                                                                 fever generation
    ## GO:0010918                                          positive regulation of mitochondrial membrane potential
    ## GO:0031652                                                           positive regulation of heat generation
    ## GO:0051610                                                                                 serotonin uptake
    ## GO:0071313                                                                    cellular response to caffeine
    ## GO:0010508                                                                 positive regulation of autophagy
    ## GO:0098926                                                                 postsynaptic signal transduction
    ## GO:0051403                                                                    stress-activated MAPK cascade
    ## GO:0072593                                                        reactive oxygen species metabolic process
    ## GO:0051960                                                         regulation of nervous system development
    ## GO:2001235                                               positive regulation of apoptotic signaling pathway
    ## GO:0008306                                                                             associative learning
    ## GO:0008361                                                                          regulation of cell size
    ## GO:1905952                                                                 regulation of lipid localization
    ## GO:0016572                                                                          histone phosphorylation
    ## GO:1903115                                                      regulation of actin filament-based movement
    ## GO:0010975                                                      regulation of neuron projection development
    ## GO:0035270                                                                     endocrine system development
    ## GO:0051224                                                         negative regulation of protein transport
    ## GO:0010642                 negative regulation of platelet-derived growth factor receptor signaling pathway
    ## GO:0032306                                                            regulation of prostaglandin secretion
    ## GO:0033127                                                            regulation of histone phosphorylation
    ## GO:0034370                                                triglyceride-rich lipoprotein particle remodeling
    ## GO:0034372                                                 very-low-density lipoprotein particle remodeling
    ## GO:0061307                          cardiac neural crest cell differentiation involved in heart development
    ## GO:0061308                              cardiac neural crest cell development involved in heart development
    ## GO:0061517                                                                         macrophage proliferation
    ## GO:0072584                                                                    caveolin-mediated endocytosis
    ## GO:1902950                                                        regulation of dendritic spine maintenance
    ## GO:0043543                                                                                protein acylation
    ## GO:1901020                            negative regulation of calcium ion transmembrane transporter activity
    ## GO:0030641                                                                        regulation of cellular pH
    ## GO:0031098                                                stress-activated protein kinase signaling cascade
    ## GO:0042307                                               positive regulation of protein import into nucleus
    ## GO:1901385                                             regulation of voltage-gated calcium channel activity
    ## GO:0021819                                                               layer formation in cerebral cortex
    ## GO:0036462                                                      TRAIL-activated apoptotic signaling pathway
    ## GO:0051481                                       negative regulation of cytosolic calcium ion concentration
    ## GO:1900103                           positive regulation of endoplasmic reticulum unfolded protein response
    ## GO:1900121                                                          negative regulation of receptor binding
    ## GO:1900272                                           negative regulation of long-term synaptic potentiation
    ## GO:0021795                                                                   cerebral cortex cell migration
    ## GO:1900542                                                regulation of purine nucleotide metabolic process
    ## GO:0009410                                                                  response to xenobiotic stimulus
    ## GO:0001101                                                                        response to acid chemical
    ## GO:0045981                                              positive regulation of nucleotide metabolic process
    ## GO:1900544                                       positive regulation of purine nucleotide metabolic process
    ## GO:1904591                                                            positive regulation of protein import
    ## GO:0097194                                                                     execution phase of apoptosis
    ## GO:0006140                                                       regulation of nucleotide metabolic process
    ## GO:0022406                                                                                 membrane docking
    ## GO:0010977                                             negative regulation of neuron projection development
    ## GO:0001921                                                        positive regulation of receptor recycling
    ## GO:0031650                                                                    regulation of heat generation
    ## GO:0051589                                                negative regulation of neurotransmitter transport
    ## GO:0071415                                                  cellular response to purine-containing compound
    ## GO:0030073                                                                                insulin secretion
    ## GO:0019915                                                                                    lipid storage
    ## GO:0044070                                                                    regulation of anion transport
    ## GO:1900182                                           positive regulation of protein localization to nucleus
    ## GO:0090276                                                          regulation of peptide hormone secretion
    ## GO:0035305                                                         negative regulation of dephosphorylation
    ## GO:0035307                                                 positive regulation of protein dephosphorylation
    ## GO:1901985                                                       positive regulation of protein acetylation
    ## GO:0019221                                                              cytokine-mediated signaling pathway
    ## GO:0046330                                                               positive regulation of JNK cascade
    ## GO:0032355                                                                            response to estradiol
    ## GO:0031018                                                                   endocrine pancreas development
    ## GO:0002791                                                                  regulation of peptide secretion
    ## GO:0010820                                                         positive regulation of T cell chemotaxis
    ## GO:0014733                                                         regulation of skeletal muscle adaptation
    ## GO:0032310                                                                          prostaglandin secretion
    ## GO:0048308                                                                            organelle inheritance
    ## GO:0048313                                                                                Golgi inheritance
    ## GO:0051290                                                                    protein heterotetramerization
    ## GO:0070885                                        negative regulation of calcineurin-NFAT signaling cascade
    ## GO:0070886                                        positive regulation of calcineurin-NFAT signaling cascade
    ## GO:0106057                                            negative regulation of calcineurin-mediated signaling
    ## GO:0106058                                            positive regulation of calcineurin-mediated signaling
    ## GO:1901841                                        regulation of high voltage-gated calcium channel activity
    ## GO:1903727                                            positive regulation of phospholipid metabolic process
    ## GO:1903799                  negative regulation of production of miRNAs involved in gene silencing by miRNA
    ## GO:0046031                                                                            ADP metabolic process
    ## GO:0034763                                                   negative regulation of transmembrane transport
    ## GO:0070555                                                                        response to interleukin-1
    ## GO:0090087                                                                  regulation of peptide transport
    ## GO:0046677                                                                           response to antibiotic
    ## GO:0061001                                                      regulation of dendritic spine morphogenesis
    ## GO:1903170                                       negative regulation of calcium ion transmembrane transport
    ## GO:0006885                                                                                 regulation of pH
    ## GO:0060191                                                                    regulation of lipase activity
    ## GO:0007612                                                                                         learning
    ## GO:1903351                                                                    cellular response to dopamine
    ## GO:1902003                                                             regulation of amyloid-beta formation
    ## GO:2001238                                     positive regulation of extrinsic apoptotic signaling pathway
    ## GO:0048813                                                                           dendrite morphogenesis
    ## GO:0032755                                                  positive regulation of interleukin-6 production
    ## GO:1903350                                                                             response to dopamine
    ## GO:0010819                                                                  regulation of T cell chemotaxis
    ## GO:0017014                                                                            protein nitrosylation
    ## GO:0018119                                                                peptidyl-cysteine S-nitrosylation
    ## GO:0034116                                            positive regulation of heterotypic cell-cell adhesion
    ## GO:0045651                                                positive regulation of macrophage differentiation
    ## GO:0045838                                                        positive regulation of membrane potential
    ## GO:0042110                                                                                T cell activation
    ## GO:0008038                                                                               neuron recognition
    ## GO:0009409                                                                                 response to cold
    ## GO:0030225                                                                       macrophage differentiation
    ## GO:0048168                                                       regulation of neuronal synaptic plasticity
    ## GO:0002690                                                      positive regulation of leukocyte chemotaxis
    ## GO:0032091                                                           negative regulation of protein binding
    ## GO:0001558                                                                        regulation of cell growth
    ## GO:1901215                                                              negative regulation of neuron death
    ## GO:0014074                                                           response to purine-containing compound
    ## GO:0045834                                                   positive regulation of lipid metabolic process
    ## GO:0060425                                                                               lung morphogenesis
    ## GO:0046827                                               positive regulation of protein export from nucleus
    ## GO:0051580                                                            regulation of neurotransmitter uptake
    ## GO:0061577                       calcium ion transmembrane transport via high voltage-gated calcium channel
    ## GO:1900034                                                          regulation of cellular response to heat
    ## GO:1903358                                                                 regulation of Golgi organization
    ## GO:1904355                                                          positive regulation of telomere capping
    ## GO:0030902                                                                            hindbrain development
    ## GO:0043535                                            regulation of blood vessel endothelial cell migration
    ## GO:0071333                                                            cellular response to glucose stimulus
    ## GO:2001236                                              regulation of extrinsic apoptotic signaling pathway
    ## GO:0051339                                                                     regulation of lyase activity
    ## GO:0070252                                                                  actin-mediated cell contraction
    ## GO:0016573                                                                              histone acetylation
    ## GO:0071331                                                             cellular response to hexose stimulus
    ## GO:0045861                                                               negative regulation of proteolysis
    ## GO:0030856                                                    regulation of epithelial cell differentiation
    ## GO:0071326                                                     cellular response to monosaccharide stimulus
    ## GO:1903532                                                         positive regulation of secretion by cell
    ## GO:0001956                                                positive regulation of neurotransmitter secretion
    ## GO:0015732                                                                          prostaglandin transport
    ## GO:0031000                                                                             response to caffeine
    ## GO:0031649                                                                                  heat generation
    ## GO:0060438                                                                              trachea development
    ## GO:0060546                                                       negative regulation of necroptotic process
    ## GO:0071071                                                  regulation of phospholipid biosynthetic process
    ## GO:0150078                                                positive regulation of neuroinflammatory response
    ## GO:2000641                                          regulation of early endosome to late endosome transport
    ## GO:0008347                                                                             glial cell migration
    ## GO:0070839                                                                                 metal ion export
    ## GO:0002064                                                                      epithelial cell development
    ## GO:0018393                                                             internal peptidyl-lysine acetylation
    ## GO:0009306                                                                                protein secretion
    ## GO:0035592                                    establishment of protein localization to extracellular region
    ## GO:0010759                                                     positive regulation of macrophage chemotaxis
    ## GO:0010829                                           negative regulation of glucose transmembrane transport
    ## GO:0030220                                                                               platelet formation
    ## GO:0032026                                                                        response to magnesium ion
    ## GO:0036344                                                                           platelet morphogenesis
    ## GO:0045821                                                        positive regulation of glycolytic process
    ## GO:0062099                                            negative regulation of programmed necrotic cell death
    ## GO:0140131                                                     positive regulation of lymphocyte chemotaxis
    ## GO:0009135                                                  purine nucleoside diphosphate metabolic process
    ## GO:0009179                                              purine ribonucleoside diphosphate metabolic process
    ## GO:0030004                                                 cellular monovalent inorganic cation homeostasis
    ## GO:0032760                                          positive regulation of tumor necrosis factor production
    ## GO:0031113                                                         regulation of microtubule polymerization
    ## GO:0042220                                                                              response to cocaine
    ## GO:1902991                                        regulation of amyloid precursor protein catabolic process
    ## GO:0002274                                                                     myeloid leukocyte activation
    ## GO:0050673                                                                    epithelial cell proliferation
    ## GO:2001234                                               negative regulation of apoptotic signaling pathway
    ## GO:0022029                                                                     telencephalon cell migration
    ## GO:0043388                                                               positive regulation of DNA binding
    ## GO:0071322                                                       cellular response to carbohydrate stimulus
    ## GO:0006837                                                                              serotonin transport
    ## GO:0046931                                                                            pore complex assembly
    ## GO:0060252                                                  positive regulation of glial cell proliferation
    ## GO:1901386                                    negative regulation of voltage-gated calcium channel activity
    ## GO:1902004                                                    positive regulation of amyloid-beta formation
    ## GO:0009185                                                     ribonucleoside diphosphate metabolic process
    ## GO:0042116                                                                            macrophage activation
    ## GO:0050879                                                                multicellular organismal movement
    ## GO:0050881                                                                         musculoskeletal movement
    ##            GeneRatio   BgRatio        pvalue      p.adjust        qvalue
    ## GO:0006119    75/156 141/18722 5.925247e-125 1.667957e-121 1.118312e-121
    ## GO:0009060    77/156 189/18722 1.158448e-116 1.630516e-113 1.093209e-113
    ## GO:0046034    82/156 277/18722 3.636826e-111 3.412555e-108 2.288010e-108
    ## GO:0045333    78/156 230/18722 1.228519e-110 8.645704e-108 5.796671e-108
    ## GO:0019646    60/156  87/18722 7.658099e-109 4.311510e-106 2.890731e-106
    ## GO:0042773    61/156  95/18722 1.128535e-107 4.538322e-105 3.042801e-105
    ## GO:0042775    61/156  95/18722 1.128535e-107 4.538322e-105 3.042801e-105
    ## GO:0022904    63/156 114/18722 3.204638e-105 1.127632e-102 7.560417e-103
    ## GO:0015980    79/156 318/18722 9.465224e-100  2.960512e-97  1.984929e-97
    ## GO:0022900    66/156 175/18722  5.074881e-96  1.428579e-93  9.578170e-94
    ## GO:0006091    82/156 490/18722  1.554254e-88  3.977478e-86  2.666773e-86
    ## GO:0006120    35/156  51/18722  1.813764e-62  4.254787e-60  2.852700e-60
    ## GO:0010257    28/156  57/18722  5.802376e-44  1.166692e-41  7.822300e-42
    ## GO:0032981    28/156  57/18722  5.802376e-44  1.166692e-41  7.822300e-42
    ## GO:0033108    29/156  93/18722  2.165359e-38  4.063657e-36  2.724554e-36
    ## GO:1902600    32/156 157/18722  1.034439e-35  1.819966e-33  1.220230e-33
    ## GO:0006123    14/156  21/18722  4.740623e-25  7.849915e-23  5.263119e-23
    ## GO:0015985    12/156  26/18722  6.366385e-19  9.432302e-17  6.324060e-17
    ## GO:0015986    12/156  26/18722  6.366385e-19  9.432302e-17  6.324060e-17
    ## GO:0006122     9/156  11/18722  8.315595e-18  1.170420e-15  7.847296e-16
    ## GO:0019932    25/156 312/18722  1.072226e-17  1.437294e-15  9.636599e-16
    ## GO:0019722    21/156 202/18722  2.631188e-17  3.366725e-15  2.257283e-15
    ## GO:0070588    24/156 312/18722  1.294558e-16  1.584426e-14  1.062308e-14
    ## GO:0010952    20/156 197/18722  2.519450e-16  2.955105e-14  1.981305e-14
    ## GO:0070997    25/156 361/18722  3.373027e-16  3.798028e-14  2.546458e-14
    ## GO:0050804    27/156 439/18722  3.813121e-16  4.128436e-14  2.767986e-14
    ## GO:0099177    27/156 440/18722  4.034898e-16  4.206755e-14  2.820496e-14
    ## GO:0010950    19/156 179/18722  6.385784e-16  6.419993e-14  4.304402e-14
    ## GO:0006509    12/156  43/18722  8.956960e-16  8.694428e-14  5.829339e-14
    ## GO:0045862    24/156 372/18722  6.776059e-15  6.358202e-13  4.262973e-13
    ## GO:0050435    13/156  67/18722  9.680833e-15  8.790821e-13  5.893967e-13
    ## GO:0006816    25/156 422/18722  1.246957e-14  1.096933e-12  7.354585e-13
    ## GO:0042776     9/156  19/18722  1.319628e-14  1.120316e-12  7.511367e-13
    ## GO:0060401    18/156 182/18722  1.353135e-14  1.120316e-12  7.511367e-13
    ## GO:0006754    12/156  57/18722  3.737728e-14  2.922695e-12  1.959575e-12
    ## GO:0033619    12/156  57/18722  3.737728e-14  2.922695e-12  1.959575e-12
    ## GO:2001056    16/156 148/18722  1.051903e-13  8.002989e-12  5.365751e-12
    ## GO:0009206    12/156  68/18722  3.557906e-13  2.635660e-11  1.767126e-11
    ## GO:0009145    12/156  69/18722  4.276331e-13  3.086634e-11  2.069490e-11
    ## GO:0048167    17/156 198/18722  7.831248e-13  5.511241e-11  3.695113e-11
    ## GO:0048016    11/156  55/18722  8.218676e-13  5.642823e-11  3.783334e-11
    ## GO:0097553    15/156 142/18722  9.030725e-13  6.052736e-11  4.058168e-11
    ## GO:0009201    12/156  74/18722  1.027247e-12  6.724883e-11  4.508821e-11
    ## GO:1901216    13/156  97/18722  1.436029e-12  9.187319e-11  6.159807e-11
    ## GO:0051402    18/156 246/18722  2.462773e-12  1.540602e-10  1.032925e-10
    ## GO:0006874    23/156 448/18722  3.071693e-12  1.879743e-10  1.260308e-10
    ## GO:0009205    12/156  82/18722  3.663211e-12  2.194030e-10  1.471027e-10
    ## GO:0010038    21/156 373/18722  5.172964e-12  2.966925e-10  1.989229e-10
    ## GO:0060402    15/156 160/18722  5.202796e-12  2.966925e-10  1.989229e-10
    ## GO:0055074    23/156 460/18722  5.269849e-12  2.966925e-10  1.989229e-10
    ## GO:0009142    12/156  85/18722  5.694187e-12  3.142968e-10  2.107261e-10
    ## GO:0016485    17/156 225/18722  6.199926e-12  3.356306e-10  2.250297e-10
    ## GO:0009144    12/156  88/18722  8.700268e-12  4.620991e-10  3.098228e-10
    ## GO:0042987    11/156  68/18722  9.598203e-12  5.003508e-10  3.354693e-10
    ## GO:0009199    12/156  89/18722  9.984682e-12  5.110342e-10  3.426323e-10
    ## GO:0072503    23/156 486/18722  1.605618e-11  8.071098e-10  5.411416e-10
    ## GO:0007215    10/156  54/18722  2.107807e-11  1.040961e-09  6.979313e-10
    ## GO:0042982    12/156  95/18722  2.202752e-11  1.069094e-09  7.167938e-10
    ## GO:0060291    12/156  99/18722  3.620453e-11  1.727386e-09  1.158157e-09
    ## GO:0034205    10/156  57/18722  3.723221e-11  1.746811e-09  1.171182e-09
    ## GO:0052547    22/156 461/18722  3.936028e-11  1.816380e-09  1.217825e-09
    ## GO:0006919    11/156  78/18722  4.535039e-11  2.059054e-09  1.380531e-09
    ## GO:0051604    18/156 294/18722  4.826786e-11  2.156731e-09  1.446020e-09
    ## GO:0052548    21/156 432/18722  8.091618e-11  3.559048e-09  2.386229e-09
    ## GO:0042391    21/156 434/18722  8.811970e-11  3.816261e-09  2.558682e-09
    ## GO:0050806    14/156 164/18722  9.721829e-11  4.146508e-09  2.780102e-09
    ## GO:2000116    16/156 235/18722  1.273385e-10  5.350118e-09  3.587085e-09
    ## GO:0009141    12/156 112/18722  1.576751e-10  6.527286e-09  4.376339e-09
    ## GO:1901214    18/156 319/18722  1.833408e-10  7.479773e-09  5.014951e-09
    ## GO:0006164    14/156 191/18722  7.357494e-10  2.958764e-08  1.983757e-08
    ## GO:0043280    12/156 129/18722  8.271983e-10  3.279667e-08  2.198913e-08
    ## GO:0072522    14/156 200/18722  1.344559e-09  5.256852e-08  3.524553e-08
    ## GO:0007204    17/156 319/18722  1.448760e-09  5.586656e-08  3.745676e-08
    ## GO:0009152    13/156 169/18722  1.691773e-09  6.435595e-08  4.314863e-08
    ## GO:0035235     7/156  27/18722  1.880816e-09  7.059330e-08  4.733057e-08
    ## GO:0051235    17/156 326/18722  2.012746e-09  7.455107e-08  4.998413e-08
    ## GO:0033173     8/156  43/18722  2.197029e-09  8.031994e-08  5.385198e-08
    ## GO:0051651    14/156 213/18722  3.046710e-09  1.099550e-07  7.372134e-08
    ## GO:0009165    15/156 254/18722  3.526335e-09  1.256536e-07  8.424676e-08
    ## GO:0050890    16/156 296/18722  3.696392e-09  1.292862e-07  8.668227e-08
    ## GO:0007611    15/156 255/18722  3.720134e-09  1.292862e-07  8.668227e-08
    ## GO:1901293    15/156 256/18722  3.923626e-09  1.346952e-07  9.030887e-08
    ## GO:0009260    13/156 182/18722  4.183115e-09  1.418731e-07  9.512144e-08
    ## GO:0097720     8/156  48/18722  5.519386e-09  1.849651e-07  1.240133e-07
    ## GO:0006163    18/156 396/18722  5.735650e-09  1.899512e-07  1.273563e-07
    ## GO:0051208    11/156 122/18722  5.979017e-09  1.957085e-07  1.312164e-07
    ## GO:0051480    17/156 353/18722  6.642159e-09  2.149158e-07  1.440943e-07
    ## GO:0046390    13/156 190/18722  7.043462e-09  2.253107e-07  1.510637e-07
    ## GO:0050848     9/156  73/18722  9.457657e-09  2.991383e-07  2.005627e-07
    ## GO:0060079    10/156 100/18722  1.099246e-08  3.438198e-07  2.305203e-07
    ## GO:0009150    17/156 368/18722  1.231126e-08  3.768362e-07  2.526567e-07
    ## GO:0072521    18/156 416/18722  1.231578e-08  3.768362e-07  2.526567e-07
    ## GO:1990542    10/156 102/18722  1.333559e-08  4.036524e-07  2.706362e-07
    ## GO:0099565    10/156 106/18722  1.938306e-08  5.804609e-07  3.891806e-07
    ## GO:0009259    17/156 385/18722  2.390828e-08  7.084401e-07  4.749867e-07
    ## GO:0009117    19/156 489/18722  2.658365e-08  7.795102e-07  5.226369e-07
    ## GO:0006839    14/156 254/18722  2.873112e-08  8.337948e-07  5.590330e-07
    ## GO:0006753    19/156 497/18722  3.438867e-08  9.877970e-07  6.622866e-07
    ## GO:0019693    17/156 396/18722  3.605415e-08  1.025176e-06  6.873480e-07
    ## GO:0051209    10/156 115/18722  4.254740e-08  1.197709e-06  8.030263e-07
    ## GO:0051283    10/156 116/18722  4.623154e-08  1.288533e-06  8.639204e-07
    ## GO:0048143     6/156  25/18722  4.721848e-08  1.303137e-06  8.737124e-07
    ## GO:0051282    10/156 118/18722  5.445344e-08  1.488218e-06  9.978029e-07
    ## GO:0048857     8/156  64/18722  5.784366e-08  1.565672e-06  1.049734e-06
    ## GO:0021762     7/156  44/18722  7.208320e-08  1.932516e-06  1.295691e-06
    ## GO:1903421     6/156  27/18722  7.784380e-08  2.067267e-06  1.386037e-06
    ## GO:0099003    12/156 200/18722  1.163859e-07  3.061928e-06  2.052926e-06
    ## GO:0043281    12/156 209/18722  1.878575e-07  4.896471e-06  3.282929e-06
    ## GO:0060078    10/156 137/18722  2.238517e-07  5.781123e-06  3.876060e-06
    ## GO:0042063    14/156 301/18722  2.344651e-07  6.000174e-06  4.022927e-06
    ## GO:0031279     7/156  53/18722  2.723186e-07  6.906099e-06  4.630321e-06
    ## GO:0099504    11/156 181/18722  3.512822e-07  8.829101e-06  5.919633e-06
    ## GO:0048708     8/156  81/18722  3.729628e-07  9.291065e-06  6.229365e-06
    ## GO:0010506    14/156 317/18722  4.387391e-07  1.083378e-05  7.263705e-06
    ## GO:0043270    13/156 275/18722  5.359312e-07  1.311866e-05  8.795648e-06
    ## GO:0021782     9/156 116/18722  5.477935e-07  1.329344e-05  8.912829e-06
    ## GO:0051353     7/156  59/18722  5.780187e-07  1.390703e-05  9.324224e-06
    ## GO:0034765    17/156 491/18722  7.594256e-07  1.811680e-05  1.214674e-05
    ## GO:0030901     8/156  90/18722  8.437287e-07  1.995879e-05  1.338174e-05
    ## GO:0097193    13/156 288/18722  9.022333e-07  2.116489e-05  1.419039e-05
    ## GO:0070509     8/156  92/18722  9.990108e-07  2.324145e-05  1.558266e-05
    ## GO:0006979    16/156 446/18722  1.031343e-06  2.379697e-05  1.595511e-05
    ## GO:0070296     6/156  41/18722  1.073953e-06  2.457869e-05  1.647923e-05
    ## GO:0106027     8/156  93/18722  1.085381e-06  2.463990e-05  1.652027e-05
    ## GO:0034767    10/156 167/18722  1.393611e-06  3.138413e-05  2.104207e-05
    ## GO:0043467     9/156 130/18722  1.432881e-06  3.183521e-05  2.134450e-05
    ## GO:0014002     6/156  43/18722  1.436260e-06  3.183521e-05  2.134450e-05
    ## GO:0051222    13/156 303/18722  1.590247e-06  3.497300e-05  2.344829e-05
    ## GO:0061337     8/156  98/18722  1.619243e-06  3.533465e-05  2.369076e-05
    ## GO:0043523    11/156 212/18722  1.678951e-06  3.635575e-05  2.437538e-05
    ## GO:0032469     5/156  25/18722  1.749098e-06  3.758558e-05  2.519994e-05
    ## GO:1904062    14/156 357/18722  1.799156e-06  3.836837e-05  2.572478e-05
    ## GO:0051588     8/156 100/18722  1.888061e-06  3.976116e-05  2.665860e-05
    ## GO:1904646     6/156  45/18722  1.892716e-06  3.976116e-05  2.665860e-05
    ## GO:0051099    10/156 173/18722  1.919353e-06  4.002207e-05  2.683353e-05
    ## GO:0051098    14/156 363/18722  2.186141e-06  4.524990e-05  3.033863e-05
    ## GO:0010882     5/156  27/18722  2.622215e-06  5.387982e-05  3.612471e-05
    ## GO:0016079     8/156 105/18722  2.731291e-06  5.571438e-05  3.735473e-05
    ## GO:1904951    13/156 319/18722  2.806420e-06  5.683505e-05  3.810610e-05
    ## GO:0010001    11/156 225/18722  2.991489e-06  6.015029e-05  4.032887e-05
    ## GO:0055117     7/156  77/18722  3.594656e-06  7.176565e-05  4.811660e-05
    ## GO:0022898    12/156 278/18722  3.820056e-06  7.572858e-05  5.077362e-05
    ## GO:0051592     9/156 149/18722  4.436791e-06  8.733963e-05  5.855846e-05
    ## GO:0010800     5/156  30/18722  4.536369e-06  8.867971e-05  5.945694e-05
    ## GO:0071260     7/156  81/18722  5.055047e-06  9.813764e-05  6.579818e-05
    ## GO:0043279     8/156 115/18722  5.401300e-06  1.034330e-04  6.934859e-05
    ## GO:0071675     8/156 115/18722  5.401300e-06  1.034330e-04  6.934859e-05
    ## GO:0008625     7/156  82/18722  5.488549e-06  1.043937e-04  6.999266e-05
    ## GO:2000300     6/156  54/18722  5.642129e-06  1.065946e-04  7.146829e-05
    ## GO:0018107     8/156 116/18722  5.760818e-06  1.081114e-04  7.248525e-05
    ## GO:0043393    10/156 196/18722  5.862668e-06  1.092941e-04  7.327824e-05
    ## GO:0010921     7/156  84/18722  6.448679e-06  1.194278e-04  8.007258e-05
    ## GO:0032092     7/156  85/18722  6.978715e-06  1.272673e-04  8.532873e-05
    ## GO:1904645     6/156  56/18722  6.996327e-06  1.272673e-04  8.532873e-05
    ## GO:0071902    10/156 200/18722  7.007616e-06  1.272673e-04  8.532873e-05
    ## GO:1903715     5/156  33/18722  7.404313e-06  1.336099e-04  8.958119e-05
    ## GO:1903169     9/156 159/18722  7.536016e-06  1.344153e-04  9.012123e-05
    ## GO:0046928     7/156  86/18722  7.544448e-06  1.344153e-04  9.012123e-05
    ## GO:0097202     4/156  16/18722  7.808117e-06  1.379999e-04  9.252460e-05
    ## GO:0023061    15/156 463/18722  7.843692e-06  1.379999e-04  9.252460e-05
    ## GO:0051928     8/156 122/18722  8.371353e-06  1.463687e-04  9.813558e-05
    ## GO:0043525     6/156  58/18722  8.602867e-06  1.480073e-04  9.923421e-05
    ## GO:0032770     5/156  34/18722  8.622805e-06  1.480073e-04  9.923421e-05
    ## GO:1990000     5/156  34/18722  8.622805e-06  1.480073e-04  9.923421e-05
    ## GO:0008016    10/156 206/18722  9.086489e-06  1.550210e-04  1.039367e-04
    ## GO:0032768     6/156  59/18722  9.511340e-06  1.612917e-04  1.081410e-04
    ## GO:0051924    11/156 255/18722  9.862168e-06  1.662395e-04  1.114583e-04
    ## GO:0018210     8/156 125/18722  1.001267e-05  1.669981e-04  1.119669e-04
    ## GO:0034349     4/156  17/18722  1.014447e-05  1.669981e-04  1.119669e-04
    ## GO:1901550     4/156  17/18722  1.014447e-05  1.669981e-04  1.119669e-04
    ## GO:1903140     4/156  17/18722  1.014447e-05  1.669981e-04  1.119669e-04
    ## GO:0032409    12/156 310/18722  1.152711e-05  1.886558e-04  1.264878e-04
    ## GO:0021543     9/156 169/18722  1.232849e-05  2.006052e-04  1.344994e-04
    ## GO:0048488     6/156  62/18722  1.271274e-05  2.044935e-04  1.371064e-04
    ## GO:0140238     6/156  62/18722  1.271274e-05  2.044935e-04  1.371064e-04
    ## GO:1900242     4/156  18/18722  1.295841e-05  2.072609e-04  1.389619e-04
    ## GO:0006942     7/156  95/18722  1.457460e-05  2.317937e-04  1.554104e-04
    ## GO:0097242     5/156  38/18722  1.514237e-05  2.385240e-04  1.599228e-04
    ## GO:0032412    11/156 267/18722  1.516725e-05  2.385240e-04  1.599228e-04
    ## GO:0034764    10/156 219/18722  1.548569e-05  2.421791e-04  1.623734e-04
    ## GO:0038034     6/156  65/18722  1.673363e-05  2.588196e-04  1.735304e-04
    ## GO:0097192     6/156  65/18722  1.673363e-05  2.588196e-04  1.735304e-04
    ## GO:1901021     5/156  39/18722  1.725300e-05  2.653945e-04  1.779386e-04
    ## GO:0060048     8/156 137/18722  1.955906e-05  2.992323e-04  2.006258e-04
    ## GO:0045936    14/156 441/18722  1.999481e-05  3.042453e-04  2.039868e-04
    ## GO:0010523     4/156  20/18722  2.025265e-05  3.058455e-04  2.050598e-04
    ## GO:0071241    10/156 226/18722  2.031727e-05  3.058455e-04  2.050598e-04
    ## GO:0010563    14/156 442/18722  2.050189e-05  3.069831e-04  2.058225e-04
    ## GO:1903829    11/156 276/18722  2.062895e-05  3.072513e-04  2.060023e-04
    ## GO:0010522     7/156 102/18722  2.320131e-05  3.437457e-04  2.304706e-04
    ## GO:0002027     7/156 103/18722  2.472084e-05  3.624435e-04  2.430069e-04
    ## GO:0019233     7/156 103/18722  2.472084e-05  3.624435e-04  2.430069e-04
    ## GO:0032722     6/156  71/18722  2.784644e-05  4.053099e-04  2.717475e-04
    ## GO:0007568    12/156 339/18722  2.793255e-05  4.053099e-04  2.717475e-04
    ## GO:0007269     8/156 145/18722  2.946145e-05  4.231326e-04  2.836970e-04
    ## GO:0099643     8/156 145/18722  2.946145e-05  4.231326e-04  2.836970e-04
    ## GO:0046822     7/156 106/18722  2.977928e-05  4.255263e-04  2.853019e-04
    ## GO:0010881     4/156  22/18722  3.018304e-05  4.269611e-04  2.862639e-04
    ## GO:0031281     4/156  22/18722  3.018304e-05  4.269611e-04  2.862639e-04
    ## GO:0032496    12/156 343/18722  3.132368e-05  4.407312e-04  2.954963e-04
    ## GO:0050999     5/156  44/18722  3.146962e-05  4.407312e-04  2.954963e-04
    ## GO:0051341     7/156 107/18722  3.164344e-05  4.409717e-04  2.956576e-04
    ## GO:1904427     6/156  73/18722  3.264826e-05  4.527333e-04  3.035433e-04
    ## GO:0050905     8/156 148/18722  3.412207e-05  4.708511e-04  3.156907e-04
    ## GO:0060047    10/156 241/18722  3.518131e-05  4.830995e-04  3.239029e-04
    ## GO:0032414     7/156 109/18722  3.566026e-05  4.872992e-04  3.267187e-04
    ## GO:0002082     4/156  23/18722  3.630099e-05  4.936584e-04  3.309823e-04
    ## GO:0036465     6/156  75/18722  3.809343e-05  5.155433e-04  3.456555e-04
    ## GO:0006984     5/156  46/18722  3.919173e-05  5.253558e-04  3.522344e-04
    ## GO:1900271     5/156  46/18722  3.919173e-05  5.253558e-04  3.522344e-04
    ## GO:1904064     8/156 151/18722  3.938394e-05  5.254302e-04  3.522843e-04
    ## GO:0071248     9/156 197/18722  4.148589e-05  5.508622e-04  3.693357e-04
    ## GO:0051000     4/156  24/18722  4.327944e-05  5.719795e-04  3.834941e-04
    ## GO:0010799     5/156  47/18722  4.356442e-05  5.730553e-04  3.842155e-04
    ## GO:0021987     7/156 114/18722  4.756491e-05  6.227685e-04  4.175466e-04
    ## GO:0071900    12/156 359/18722  4.872728e-05  6.350337e-04  4.257700e-04
    ## GO:0003015    10/156 251/18722  4.959356e-05  6.433450e-04  4.313425e-04
    ## GO:0032388     9/156 202/18722  5.041715e-05  6.510288e-04  4.364942e-04
    ## GO:0051279     6/156  79/18722  5.116566e-05  6.549991e-04  4.391562e-04
    ## GO:0086064     4/156  25/18722  5.118998e-05  6.549991e-04  4.391562e-04
    ## GO:0043457     5/156  49/18722  5.343520e-05  6.806339e-04  4.563435e-04
    ## GO:0002237    12/156 363/18722  5.420516e-05  6.873312e-04  4.608338e-04
    ## GO:1903522    10/156 256/18722  5.851484e-05  7.386515e-04  4.952425e-04
    ## GO:0007613     7/156 118/18722  5.927843e-05  7.398484e-04  4.960450e-04
    ## GO:0035637     8/156 160/18722  5.939813e-05  7.398484e-04  4.960450e-04
    ## GO:0090316     8/156 160/18722  5.939813e-05  7.398484e-04  4.960450e-04
    ## GO:0060314     4/156  26/18722  6.010616e-05  7.453693e-04  4.997465e-04
    ## GO:0006836     9/156 208/18722  6.322870e-05  7.806526e-04  5.234029e-04
    ## GO:0032025     3/156  10/18722  6.523769e-05  7.949961e-04  5.330197e-04
    ## GO:0051342     3/156  10/18722  6.523769e-05  7.949961e-04  5.330197e-04
    ## GO:0097250     3/156  10/18722  6.523769e-05  7.949961e-04  5.330197e-04
    ## GO:0032411     7/156 120/18722  6.596386e-05  7.969453e-04  5.343266e-04
    ## GO:0048675     7/156 120/18722  6.596386e-05  7.969453e-04  5.343266e-04
    ## GO:0018105    11/156 315/18722  6.862124e-05  8.255077e-04  5.534768e-04
    ## GO:0098901     4/156  27/18722  7.010336e-05  8.397488e-04  5.630250e-04
    ## GO:0030100     9/156 211/18722  7.059967e-05  8.421104e-04  5.646084e-04
    ## GO:0001505     9/156 213/18722  7.590513e-05  9.015735e-04  6.044765e-04
    ## GO:0010524     5/156  54/18722  8.570213e-05  1.013662e-03  6.796281e-04
    ## GO:1903578     6/156  87/18722  8.800600e-05  1.036556e-03  6.949780e-04
    ## GO:0060315     3/156  11/18722  8.915337e-05  1.037053e-03  6.953110e-04
    ## GO:1901844     3/156  11/18722  8.915337e-05  1.037053e-03  6.953110e-04
    ## GO:2000343     3/156  11/18722  8.915337e-05  1.037053e-03  6.953110e-04
    ## GO:2000406     4/156  29/18722  9.365126e-05  1.083045e-03  7.261476e-04
    ## GO:0097191     9/156 219/18722  9.387675e-05  1.083045e-03  7.261476e-04
    ## GO:0042326    12/156 385/18722  9.489373e-05  1.090310e-03  7.310181e-04
    ## GO:0007219     8/156 172/18722  9.863619e-05  1.128703e-03  7.567595e-04
    ## GO:0035303     7/156 128/18722  9.916327e-05  1.130140e-03  7.577231e-04
    ## GO:0071214    11/156 331/18722  1.065434e-04  1.204071e-03  8.072917e-04
    ## GO:0104004    11/156 331/18722  1.065434e-04  1.204071e-03  8.072917e-04
    ## GO:0006099     4/156  30/18722  1.073612e-04  1.204071e-03  8.072917e-04
    ## GO:0010880     4/156  30/18722  1.073612e-04  1.204071e-03  8.072917e-04
    ## GO:0003012    13/156 452/18722  1.084976e-04  1.211987e-03  8.125988e-04
    ## GO:0071287     3/156  12/18722  1.181446e-04  1.309359e-03  8.778836e-04
    ## GO:1990034     3/156  12/18722  1.181446e-04  1.309359e-03  8.778836e-04
    ## GO:0043666     5/156  58/18722  1.208926e-04  1.329346e-03  8.912845e-04
    ## GO:0086065     5/156  58/18722  1.208926e-04  1.329346e-03  8.912845e-04
    ## GO:0046777     9/156 227/18722  1.232834e-04  1.350361e-03  9.053745e-04
    ## GO:1901019     6/156  93/18722  1.275058e-04  1.391197e-03  9.327537e-04
    ## GO:0018209    11/156 338/18722  1.280663e-04  1.391917e-03  9.332365e-04
    ## GO:0006941     8/156 179/18722  1.300818e-04  1.408385e-03  9.442777e-04
    ## GO:0045055     9/156 230/18722  1.361349e-04  1.468275e-03  9.844320e-04
    ## GO:0002687     7/156 135/18722  1.383511e-04  1.486482e-03  9.966391e-04
    ## GO:0010644     4/156  32/18722  1.390629e-04  1.488449e-03  9.979582e-04
    ## GO:0001933    11/156 342/18722  1.419529e-04  1.513627e-03  1.014839e-03
    ## GO:0030516     6/156  95/18722  1.434094e-04  1.523387e-03  1.021383e-03
    ## GO:0033674    13/156 467/18722  1.498723e-04  1.586054e-03  1.063399e-03
    ## GO:0005513     3/156  13/18722  1.526496e-04  1.597430e-03  1.071026e-03
    ## GO:0006983     3/156  13/18722  1.526496e-04  1.597430e-03  1.071026e-03
    ## GO:0051280     3/156  13/18722  1.526496e-04  1.597430e-03  1.071026e-03
    ## GO:0010959    12/156 406/18722  1.559564e-04  1.625990e-03  1.090175e-03
    ## GO:0001975     4/156  33/18722  1.572228e-04  1.633144e-03  1.094971e-03
    ## GO:0051051    13/156 470/18722  1.596071e-04  1.651816e-03  1.107490e-03
    ## GO:0070482    11/156 347/18722  1.610973e-04  1.661131e-03  1.113736e-03
    ## GO:0046824     5/156  62/18722  1.662213e-04  1.707711e-03  1.144966e-03
    ## GO:0016236    10/156 291/18722  1.681114e-04  1.720849e-03  1.153775e-03
    ## GO:0032642     6/156  98/18722  1.701692e-04  1.735602e-03  1.163667e-03
    ## GO:0010922     4/156  34/18722  1.770361e-04  1.786224e-03  1.197607e-03
    ## GO:0014808     4/156  34/18722  1.770361e-04  1.786224e-03  1.197607e-03
    ## GO:0070884     4/156  34/18722  1.770361e-04  1.786224e-03  1.197607e-03
    ## GO:0070059     5/156  63/18722  1.793477e-04  1.802359e-03  1.208425e-03
    ## GO:0032602     6/156  99/18722  1.799158e-04  1.802359e-03  1.208425e-03
    ## GO:0016241     7/156 141/18722  1.811801e-04  1.808589e-03  1.212602e-03
    ## GO:0048148     3/156  14/18722  1.930948e-04  1.920713e-03  1.287778e-03
    ## GO:0106056     4/156  35/18722  1.985901e-04  1.954654e-03  1.310534e-03
    ## GO:1903514     4/156  35/18722  1.985901e-04  1.954654e-03  1.310534e-03
    ## GO:2000403     4/156  35/18722  1.985901e-04  1.954654e-03  1.310534e-03
    ## GO:0035418     5/156  65/18722  2.079604e-04  2.032668e-03  1.362840e-03
    ## GO:0071677     5/156  65/18722  2.079604e-04  2.032668e-03  1.362840e-03
    ## GO:0071216     9/156 246/18722  2.251426e-04  2.192998e-03  1.470336e-03
    ## GO:0021537     9/156 248/18722  2.390676e-04  2.304793e-03  1.545291e-03
    ## GO:0051284     3/156  15/18722  2.398949e-04  2.304793e-03  1.545291e-03
    ## GO:0099170     3/156  15/18722  2.398949e-04  2.304793e-03  1.545291e-03
    ## GO:1901660     3/156  15/18722  2.398949e-04  2.304793e-03  1.545291e-03
    ## GO:0071674     8/156 196/18722  2.420456e-04  2.317545e-03  1.553841e-03
    ## GO:0043029     4/156  37/18722  2.472742e-04  2.350508e-03  1.575941e-03
    ## GO:0031331    12/156 427/18722  2.479932e-04  2.350508e-03  1.575941e-03
    ## GO:0032103    12/156 427/18722  2.479932e-04  2.350508e-03  1.575941e-03
    ## GO:0009896    13/156 492/18722  2.491515e-04  2.353562e-03  1.577989e-03
    ## GO:0071887     6/156 106/18722  2.611338e-04  2.458500e-03  1.648347e-03
    ## GO:0090257     9/156 252/18722  2.690698e-04  2.524772e-03  1.692780e-03
    ## GO:0071868     6/156 107/18722  2.747669e-04  2.561155e-03  1.717173e-03
    ## GO:0071870     6/156 107/18722  2.747669e-04  2.561155e-03  1.717173e-03
    ## GO:0034612     9/156 253/18722  2.770392e-04  2.573813e-03  1.725660e-03
    ## GO:0010649     3/156  16/18722  2.934534e-04  2.699580e-03  1.809983e-03
    ## GO:0051044     3/156  16/18722  2.934534e-04  2.699580e-03  1.809983e-03
    ## GO:1905906     3/156  16/18722  2.934534e-04  2.699580e-03  1.809983e-03
    ## GO:0034976     9/156 256/18722  3.021303e-04  2.770348e-03  1.857431e-03
    ## GO:0061387     6/156 110/18722  3.190476e-04  2.915971e-03  1.955066e-03
    ## GO:0071867     6/156 111/18722  3.349882e-04  3.027874e-03  2.030094e-03
    ## GO:0071869     6/156 111/18722  3.349882e-04  3.027874e-03  2.030094e-03
    ## GO:0051281     4/156  40/18722  3.355938e-04  3.027874e-03  2.030094e-03
    ## GO:0070266     4/156  40/18722  3.355938e-04  3.027874e-03  2.030094e-03
    ## GO:0009416    10/156 320/18722  3.591932e-04  3.209933e-03  2.152158e-03
    ## GO:0016042    10/156 320/18722  3.591932e-04  3.209933e-03  2.152158e-03
    ## GO:0071496    10/156 320/18722  3.591932e-04  3.209933e-03  2.152158e-03
    ## GO:0002685     8/156 210/18722  3.849420e-04  3.429151e-03  2.299137e-03
    ## GO:0050807     8/156 211/18722  3.973299e-04  3.528340e-03  2.365640e-03
    ## GO:0045860    11/156 386/18722  4.006848e-04  3.546942e-03  2.378112e-03
    ## GO:0046688     4/156  42/18722  4.057416e-04  3.558139e-03  2.385620e-03
    ## GO:0071312     4/156  42/18722  4.057416e-04  3.558139e-03  2.385620e-03
    ## GO:2000404     4/156  42/18722  4.057416e-04  3.558139e-03  2.385620e-03
    ## GO:0009749     8/156 212/18722  4.100404e-04  3.584670e-03  2.403408e-03
    ## GO:0051348     9/156 268/18722  4.220917e-04  3.669955e-03  2.460589e-03
    ## GO:0030730     3/156  18/18722  4.224033e-04  3.669955e-03  2.460589e-03
    ## GO:0007006     6/156 116/18722  4.242886e-04  3.674992e-03  2.463966e-03
    ## GO:0086001     5/156  76/18722  4.322081e-04  3.732104e-03  2.502257e-03
    ## GO:0031952     4/156  43/18722  4.444760e-04  3.826300e-03  2.565413e-03
    ## GO:1901983     5/156  77/18722  4.591500e-04  3.940571e-03  2.642028e-03
    ## GO:0009612     8/156 216/18722  4.642356e-04  3.972107e-03  2.663172e-03
    ## GO:0008542     4/156  44/18722  4.857767e-04  4.143822e-03  2.778302e-03
    ## GO:0043112     7/156 166/18722  4.889988e-04  4.158706e-03  2.788281e-03
    ## GO:0050803     8/156 218/18722  4.934360e-04  4.183802e-03  2.805107e-03
    ## GO:0007213     3/156  19/18722  4.985463e-04  4.201820e-03  2.817187e-03
    ## GO:1900221     3/156  19/18722  4.985463e-04  4.201820e-03  2.817187e-03
    ## GO:0009746     8/156 219/18722  5.085852e-04  4.273634e-03  2.865336e-03
    ## GO:0048538     4/156  45/18722  5.297386e-04  4.438137e-03  2.975631e-03
    ## GO:0032386    10/156 337/18722  5.384060e-04  4.484062e-03  3.006421e-03
    ## GO:0062197    10/156 337/18722  5.384060e-04  4.484062e-03  3.006421e-03
    ## GO:0006937     7/156 169/18722  5.442077e-04  4.519010e-03  3.029853e-03
    ## GO:0021766     5/156  80/18722  5.476007e-04  4.533812e-03  3.039777e-03
    ## GO:0001819    12/156 467/18722  5.538151e-04  4.571817e-03  3.065259e-03
    ## GO:0000302     8/156 222/18722  5.563105e-04  4.578989e-03  3.070067e-03
    ## GO:0034198     4/156  46/18722  5.764573e-04  4.702026e-03  3.152560e-03
    ## GO:0035094     4/156  46/18722  5.764573e-04  4.702026e-03  3.152560e-03
    ## GO:0061028     4/156  46/18722  5.764573e-04  4.702026e-03  3.152560e-03
    ## GO:0010042     3/156  20/18722  5.829510e-04  4.702026e-03  3.152560e-03
    ## GO:0010801     3/156  20/18722  5.829510e-04  4.702026e-03  3.152560e-03
    ## GO:0072567     3/156  20/18722  5.829510e-04  4.702026e-03  3.152560e-03
    ## GO:2000341     3/156  20/18722  5.829510e-04  4.702026e-03  3.152560e-03
    ## GO:0006470     9/156 281/18722  5.938043e-04  4.775883e-03  3.202079e-03
    ## GO:1990138     7/156 172/18722  6.042693e-04  4.846205e-03  3.249227e-03
    ## GO:0034284     8/156 225/18722  6.075997e-04  4.859072e-03  3.257854e-03
    ## GO:0046889     5/156  82/18722  6.132959e-04  4.890731e-03  3.279080e-03
    ## GO:0001774     4/156  47/18722  6.260288e-04  4.950200e-03  3.318952e-03
    ## GO:0045601     4/156  47/18722  6.260288e-04  4.950200e-03  3.318952e-03
    ## GO:0097300     4/156  47/18722  6.260288e-04  4.950200e-03  3.318952e-03
    ## GO:0006936    10/156 347/18722  6.747506e-04  5.300409e-03  3.553756e-03
    ## GO:0032516     3/156  21/18722  6.759668e-04  5.300409e-03  3.553756e-03
    ## GO:0050849     3/156  21/18722  6.759668e-04  5.300409e-03  3.553756e-03
    ## GO:0033157     8/156 229/18722  6.818655e-04  5.331810e-03  3.574810e-03
    ## GO:0097061     5/156  84/18722  6.847299e-04  5.339376e-03  3.579883e-03
    ## GO:0014075     4/156  49/18722  7.341148e-04  5.692929e-03  3.816929e-03
    ## GO:1990928     4/156  49/18722  7.341148e-04  5.692929e-03  3.816929e-03
    ## GO:0009266     7/156 178/18722  7.401632e-04  5.724064e-03  3.837804e-03
    ## GO:0034504     9/156 290/18722  7.433399e-04  5.732882e-03  3.843716e-03
    ## GO:0016311    11/156 417/18722  7.604343e-04  5.848695e-03  3.921365e-03
    ## GO:0030534     6/156 130/18722  7.752439e-04  5.946353e-03  3.986842e-03
    ## GO:0048588     8/156 234/18722  7.848228e-04  5.987198e-03  4.014227e-03
    ## GO:0060560     8/156 234/18722  7.848228e-04  5.987198e-03  4.014227e-03
    ## GO:0010721     7/156 180/18722  7.904757e-04  6.014025e-03  4.032213e-03
    ## GO:0007632     4/156  50/18722  7.928225e-04  6.015621e-03  4.033283e-03
    ## GO:0001776     5/156  87/18722  8.033249e-04  6.062626e-03  4.064799e-03
    ## GO:0051262     5/156  87/18722  8.033249e-04  6.062626e-03  4.064799e-03
    ## GO:1904950     6/156 131/18722  8.069516e-04  6.073713e-03  4.072232e-03
    ## GO:2001233    10/156 356/18722  8.207497e-04  6.161094e-03  4.130819e-03
    ## GO:0033673     8/156 237/18722  8.523703e-04  6.381443e-03  4.278555e-03
    ## GO:0051349     3/156  23/18722  8.891775e-04  6.639349e-03  4.451473e-03
    ## GO:2001257     7/156 184/18722  8.992029e-04  6.696445e-03  4.489755e-03
    ## GO:0001508     6/156 134/18722  9.081118e-04  6.744947e-03  4.522273e-03
    ## GO:0035304     5/156  90/18722  9.366101e-04  6.920098e-03  4.639707e-03
    ## GO:0099175     5/156  90/18722  9.366101e-04  6.920098e-03  4.639707e-03
    ## GO:0031345     7/156 186/18722  9.578177e-04  7.058264e-03  4.732343e-03
    ## GO:0006913     9/156 301/18722  9.664739e-04  7.084959e-03  4.750241e-03
    ## GO:0051169     9/156 301/18722  9.664739e-04  7.084959e-03  4.750241e-03
    ## GO:1900180     6/156 136/18722  9.807944e-04  7.152685e-03  4.795649e-03
    ## GO:1903305     6/156 136/18722  9.807944e-04  7.152685e-03  4.795649e-03
    ## GO:0016358     8/156 243/18722  1.001477e-03  7.284647e-03  4.884125e-03
    ## GO:0010288     3/156  24/18722  1.010020e-03  7.309014e-03  4.900463e-03
    ## GO:0051043     3/156  24/18722  1.010020e-03  7.309014e-03  4.900463e-03
    ## GO:0000086     6/156 137/18722  1.018773e-03  7.334644e-03  4.917646e-03
    ## GO:0045471     6/156 137/18722  1.018773e-03  7.334644e-03  4.917646e-03
    ## GO:0035065     4/156  54/18722  1.061012e-03  7.619257e-03  5.108471e-03
    ## GO:0001666     9/156 307/18722  1.109418e-03  7.946596e-03  5.327941e-03
    ## GO:0098900     4/156  55/18722  1.136884e-03  8.068509e-03  5.409680e-03
    ## GO:1902414     5/156  94/18722  1.139079e-03  8.068509e-03  5.409680e-03
    ## GO:0050768     6/156 140/18722  1.139519e-03  8.068509e-03  5.409680e-03
    ## GO:0001964     3/156  25/18722  1.140770e-03  8.068509e-03  5.409680e-03
    ## GO:0010560     3/156  25/18722  1.140770e-03  8.068509e-03  5.409680e-03
    ## GO:0032872     7/156 192/18722  1.151905e-03  8.126851e-03  5.448797e-03
    ## GO:0050729     6/156 142/18722  1.225914e-03  8.627370e-03  5.784379e-03
    ## GO:0070302     7/156 195/18722  1.259870e-03  8.844227e-03  5.929774e-03
    ## GO:0062013     6/156 143/18722  1.270948e-03  8.899801e-03  5.967035e-03
    ## GO:0009743     8/156 253/18722  1.295839e-03  9.029175e-03  6.053776e-03
    ## GO:0097305     8/156 253/18722  1.295839e-03  9.029175e-03  6.053776e-03
    ## GO:0006611     4/156  57/18722  1.299896e-03  9.035082e-03  6.057737e-03
    ## GO:0030900    10/156 379/18722  1.315344e-03  9.119934e-03  6.114627e-03
    ## GO:0051961     6/156 145/18722  1.364805e-03  9.439621e-03  6.328967e-03
    ## GO:0010559     4/156  58/18722  1.387230e-03  9.571207e-03  6.417191e-03
    ## GO:0031954     3/156  27/18722  1.433178e-03  9.785796e-03  6.561066e-03
    ## GO:0008630     5/156  99/18722  1.435714e-03  9.785796e-03  6.561066e-03
    ## GO:0021549     5/156  99/18722  1.435714e-03  9.785796e-03  6.561066e-03
    ## GO:0033209     5/156  99/18722  1.435714e-03  9.785796e-03  6.561066e-03
    ## GO:0060996     5/156  99/18722  1.435714e-03  9.785796e-03  6.561066e-03
    ## GO:1903531     6/156 147/18722  1.463866e-03  9.953579e-03  6.673560e-03
    ## GO:0035306     4/156  59/18722  1.478577e-03  1.002938e-02  6.724385e-03
    ## GO:0006473     7/156 201/18722  1.499502e-03  1.013449e-02  6.794853e-03
    ## GO:0045807     5/156 100/18722  1.501272e-03  1.013449e-02  6.794853e-03
    ## GO:0044839     6/156 148/18722  1.515406e-03  1.018107e-02  6.826084e-03
    ## GO:0051384     6/156 148/18722  1.515406e-03  1.018107e-02  6.826084e-03
    ## GO:0017157     7/156 202/18722  1.542679e-03  1.031579e-02  6.916410e-03
    ## GO:0036293     9/156 322/18722  1.542788e-03  1.031579e-02  6.916410e-03
    ## GO:0009314    11/156 456/18722  1.560257e-03  1.040788e-02  6.978152e-03
    ## GO:0031638     4/156  60/18722  1.574034e-03  1.042566e-02  6.990076e-03
    ## GO:0031663     4/156  60/18722  1.574034e-03  1.042566e-02  6.990076e-03
    ## GO:0042306     4/156  60/18722  1.574034e-03  1.042566e-02  6.990076e-03
    ## GO:0032801     3/156  28/18722  1.595409e-03  1.046871e-02  7.018938e-03
    ## GO:0071280     3/156  28/18722  1.595409e-03  1.046871e-02  7.018938e-03
    ## GO:1903020     3/156  28/18722  1.595409e-03  1.046871e-02  7.018938e-03
    ## GO:1903779     3/156  28/18722  1.595409e-03  1.046871e-02  7.018938e-03
    ## GO:0042176    10/156 391/18722  1.656892e-03  1.084687e-02  7.272480e-03
    ## GO:2000401     4/156  61/18722  1.673697e-03  1.093145e-02  7.329194e-03
    ## GO:0017038     7/156 206/18722  1.725170e-03  1.124156e-02  7.537109e-03
    ## GO:0035066     3/156  29/18722  1.768689e-03  1.145106e-02  7.677576e-03
    ## GO:0095500     3/156  29/18722  1.768689e-03  1.145106e-02  7.677576e-03
    ## GO:0002260     4/156  62/18722  1.777661e-03  1.145106e-02  7.677576e-03
    ## GO:0032731     4/156  62/18722  1.777661e-03  1.145106e-02  7.677576e-03
    ## GO:0070265     4/156  62/18722  1.777661e-03  1.145106e-02  7.677576e-03
    ## GO:0048638     9/156 330/18722  1.824274e-03  1.172450e-02  7.860905e-03
    ## GO:0050770     6/156 154/18722  1.854280e-03  1.189020e-02  7.972004e-03
    ## GO:0050708     8/156 268/18722  1.862591e-03  1.191635e-02  7.989534e-03
    ## GO:0061564    11/156 467/18722  1.881548e-03  1.198453e-02  8.035251e-03
    ## GO:1904589     4/156  63/18722  1.886021e-03  1.198453e-02  8.035251e-03
    ## GO:2000756     4/156  63/18722  1.886021e-03  1.198453e-02  8.035251e-03
    ## GO:0006606     6/156 155/18722  1.915922e-03  1.214712e-02  8.144260e-03
    ## GO:1905477     5/156 106/18722  1.941886e-03  1.224607e-02  8.210601e-03
    ## GO:0007176     3/156  30/18722  1.953280e-03  1.224607e-02  8.210601e-03
    ## GO:0046825     3/156  30/18722  1.953280e-03  1.224607e-02  8.210601e-03
    ## GO:0070498     3/156  30/18722  1.953280e-03  1.224607e-02  8.210601e-03
    ## GO:0090314     3/156  30/18722  1.953280e-03  1.224607e-02  8.210601e-03
    ## GO:0062012     9/156 334/18722  1.979685e-03  1.238403e-02  8.303100e-03
    ## GO:0001885     4/156  64/18722  1.998872e-03  1.244873e-02  8.346478e-03
    ## GO:1903018     4/156  64/18722  1.998872e-03  1.244873e-02  8.346478e-03
    ## GO:0008637     5/156 107/18722  2.023608e-03  1.254726e-02  8.412540e-03
    ## GO:0021761     5/156 107/18722  2.023608e-03  1.254726e-02  8.412540e-03
    ## GO:0006469     7/156 212/18722  2.029905e-03  1.255864e-02  8.420171e-03
    ## GO:0022037     5/156 108/18722  2.107814e-03  1.301205e-02  8.724171e-03
    ## GO:1905144     3/156  31/18722  2.149439e-03  1.321107e-02  8.857604e-03
    ## GO:1905145     3/156  31/18722  2.149439e-03  1.321107e-02  8.857604e-03
    ## GO:0051170     6/156 159/18722  2.178140e-03  1.335831e-02  8.956324e-03
    ## GO:0072678     4/156  66/18722  2.238425e-03  1.369559e-02  9.182458e-03
    ## GO:0006475     6/156 160/18722  2.247730e-03  1.369559e-02  9.182458e-03
    ## GO:0043271     6/156 160/18722  2.247730e-03  1.369559e-02  9.182458e-03
    ## GO:0031349     8/156 278/18722  2.338277e-03  1.421652e-02  9.531730e-03
    ## GO:1901889     3/156  32/18722  2.357409e-03  1.428832e-02  9.579870e-03
    ## GO:0010517     4/156  67/18722  2.365314e-03  1.428832e-02  9.579870e-03
    ## GO:0032890     4/156  67/18722  2.365314e-03  1.428832e-02  9.579870e-03
    ## GO:0051100     6/156 162/18722  2.391929e-03  1.441816e-02  9.666921e-03
    ## GO:0016049    11/156 482/18722  2.404836e-03  1.446499e-02  9.698315e-03
    ## GO:0051926     4/156  68/18722  2.497069e-03  1.498774e-02  1.004880e-02
    ## GO:0050796     6/156 165/18722  2.621152e-03  1.569903e-02  1.052570e-02
    ## GO:0007409    10/156 418/18722  2.691562e-03  1.608651e-02  1.078550e-02
    ## GO:0031960     6/156 167/18722  2.782880e-03  1.659705e-02  1.112780e-02
    ## GO:0086004     3/156  34/18722  2.809723e-03  1.668325e-02  1.118559e-02
    ## GO:2000758     3/156  34/18722  2.809723e-03  1.668325e-02  1.118559e-02
    ## GO:0006887     9/156 352/18722  2.815114e-03  1.668325e-02  1.118559e-02
    ## GO:0043200     5/156 116/18722  2.876262e-03  1.700410e-02  1.140071e-02
    ## GO:0072594    10/156 422/18722  2.881334e-03  1.700410e-02  1.140071e-02
    ## GO:0033555     4/156  71/18722  2.922445e-03  1.721064e-02  1.153919e-02
    ## GO:0021548     2/156  10/18722  2.971148e-03  1.728054e-02  1.158605e-02
    ## GO:0060439     2/156  10/18722  2.971148e-03  1.728054e-02  1.158605e-02
    ## GO:0071073     2/156  10/18722  2.971148e-03  1.728054e-02  1.158605e-02
    ## GO:0090647     2/156  10/18722  2.971148e-03  1.728054e-02  1.158605e-02
    ## GO:0098917     2/156  10/18722  2.971148e-03  1.728054e-02  1.158605e-02
    ## GO:1990535     2/156  10/18722  2.971148e-03  1.728054e-02  1.158605e-02
    ## GO:0044772    10/156 424/18722  2.980156e-03  1.729719e-02  1.159722e-02
    ## GO:0050808    10/156 426/18722  3.081672e-03  1.784960e-02  1.196759e-02
    ## GO:0071356     7/156 229/18722  3.122689e-03  1.804745e-02  1.210024e-02
    ## GO:0051048     6/156 171/18722  3.128652e-03  1.804745e-02  1.210024e-02
    ## GO:1901653     9/156 359/18722  3.206912e-03  1.846106e-02  1.237755e-02
    ## GO:0032732     4/156  73/18722  3.232033e-03  1.852988e-02  1.242370e-02
    ## GO:0086003     4/156  73/18722  3.232033e-03  1.852988e-02  1.242370e-02
    ## GO:0045732     7/156 231/18722  3.276097e-03  1.874434e-02  1.256748e-02
    ## GO:0010923     3/156  36/18722  3.312021e-03  1.875923e-02  1.257747e-02
    ## GO:0035774     3/156  36/18722  3.312021e-03  1.875923e-02  1.257747e-02
    ## GO:0071402     3/156  36/18722  3.312021e-03  1.875923e-02  1.257747e-02
    ## GO:0090313     3/156  36/18722  3.312021e-03  1.875923e-02  1.257747e-02
    ## GO:1903539     3/156  36/18722  3.312021e-03  1.875923e-02  1.257747e-02
    ## GO:0051881     4/156  74/18722  3.394897e-03  1.919003e-02  1.286631e-02
    ## GO:1905475     6/156 175/18722  3.505559e-03  1.977376e-02  1.325768e-02
    ## GO:0050767     9/156 364/18722  3.512213e-03  1.977376e-02  1.325768e-02
    ## GO:2001259     4/156  75/18722  3.563258e-03  2.002110e-02  1.342352e-02
    ## GO:0062237     3/156  37/18722  3.582440e-03  2.005252e-02  1.344458e-02
    ## GO:0001660     2/156  11/18722  3.611591e-03  2.005252e-02  1.344458e-02
    ## GO:0010918     2/156  11/18722  3.611591e-03  2.005252e-02  1.344458e-02
    ## GO:0031652     2/156  11/18722  3.611591e-03  2.005252e-02  1.344458e-02
    ## GO:0051610     2/156  11/18722  3.611591e-03  2.005252e-02  1.344458e-02
    ## GO:0071313     2/156  11/18722  3.611591e-03  2.005252e-02  1.344458e-02
    ## GO:0010508     5/156 124/18722  3.829430e-03  2.122017e-02  1.422745e-02
    ## GO:0098926     3/156  38/18722  3.865970e-03  2.138056e-02  1.433499e-02
    ## GO:0051403     7/156 239/18722  3.948043e-03  2.174900e-02  1.458202e-02
    ## GO:0072593     7/156 239/18722  3.948043e-03  2.174900e-02  1.458202e-02
    ## GO:0051960    10/156 443/18722  4.060759e-03  2.232624e-02  1.496904e-02
    ## GO:2001235     5/156 126/18722  4.099264e-03  2.246634e-02  1.506297e-02
    ## GO:0008306     4/156  78/18722  4.102203e-03  2.246634e-02  1.506297e-02
    ## GO:0008361     6/156 181/18722  4.132958e-03  2.254705e-02  1.511708e-02
    ## GO:1905952     6/156 181/18722  4.132958e-03  2.254705e-02  1.511708e-02
    ## GO:0016572     3/156  39/18722  4.162802e-03  2.262217e-02  1.516745e-02
    ## GO:1903115     3/156  39/18722  4.162802e-03  2.262217e-02  1.516745e-02
    ## GO:0010975    10/156 445/18722  4.190516e-03  2.272891e-02  1.523901e-02
    ## GO:0035270     5/156 127/18722  4.239158e-03  2.285017e-02  1.532031e-02
    ## GO:0051224     5/156 127/18722  4.239158e-03  2.285017e-02  1.532031e-02
    ## GO:0010642     2/156  12/18722  4.310280e-03  2.285017e-02  1.532031e-02
    ## GO:0032306     2/156  12/18722  4.310280e-03  2.285017e-02  1.532031e-02
    ## GO:0033127     2/156  12/18722  4.310280e-03  2.285017e-02  1.532031e-02
    ## GO:0034370     2/156  12/18722  4.310280e-03  2.285017e-02  1.532031e-02
    ## GO:0034372     2/156  12/18722  4.310280e-03  2.285017e-02  1.532031e-02
    ## GO:0061307     2/156  12/18722  4.310280e-03  2.285017e-02  1.532031e-02
    ## GO:0061308     2/156  12/18722  4.310280e-03  2.285017e-02  1.532031e-02
    ## GO:0061517     2/156  12/18722  4.310280e-03  2.285017e-02  1.532031e-02
    ## GO:0072584     2/156  12/18722  4.310280e-03  2.285017e-02  1.532031e-02
    ## GO:1902950     2/156  12/18722  4.310280e-03  2.285017e-02  1.532031e-02
    ## GO:0043543     7/156 243/18722  4.320923e-03  2.286353e-02  1.532927e-02
    ## GO:1901020     3/156  40/18722  4.473116e-03  2.362443e-02  1.583943e-02
    ## GO:0030641     4/156  81/18722  4.693732e-03  2.474317e-02  1.658952e-02
    ## GO:0031098     7/156 247/18722  4.719888e-03  2.483455e-02  1.665078e-02
    ## GO:0042307     3/156  41/18722  4.797087e-03  2.514674e-02  1.686009e-02
    ## GO:1901385     3/156  41/18722  4.797087e-03  2.514674e-02  1.686009e-02
    ## GO:0021819     2/156  13/18722  5.066213e-03  2.626407e-02  1.760923e-02
    ## GO:0036462     2/156  13/18722  5.066213e-03  2.626407e-02  1.760923e-02
    ## GO:0051481     2/156  13/18722  5.066213e-03  2.626407e-02  1.760923e-02
    ## GO:1900103     2/156  13/18722  5.066213e-03  2.626407e-02  1.760923e-02
    ## GO:1900121     2/156  13/18722  5.066213e-03  2.626407e-02  1.760923e-02
    ## GO:1900272     2/156  13/18722  5.066213e-03  2.626407e-02  1.760923e-02
    ## GO:0021795     3/156  42/18722  5.134883e-03  2.657113e-02  1.781510e-02
    ## GO:1900542     4/156  84/18722  5.340097e-03  2.758234e-02  1.849308e-02
    ## GO:0009410    10/156 462/18722  5.430902e-03  2.799998e-02  1.877310e-02
    ## GO:0001101     5/156 135/18722  5.483550e-03  2.808174e-02  1.882792e-02
    ## GO:0045981     3/156  43/18722  5.486663e-03  2.808174e-02  1.882792e-02
    ## GO:1900544     3/156  43/18722  5.486663e-03  2.808174e-02  1.882792e-02
    ## GO:1904591     3/156  43/18722  5.486663e-03  2.808174e-02  1.882792e-02
    ## GO:0097194     4/156  85/18722  5.568117e-03  2.844691e-02  1.907276e-02
    ## GO:0006140     4/156  86/18722  5.802552e-03  2.953740e-02  1.980389e-02
    ## GO:0022406     4/156  86/18722  5.802552e-03  2.953740e-02  1.980389e-02
    ## GO:0010977     5/156 137/18722  5.831042e-03  2.962885e-02  1.986521e-02
    ## GO:0001921     2/156  14/18722  5.878399e-03  2.965536e-02  1.988298e-02
    ## GO:0031650     2/156  14/18722  5.878399e-03  2.965536e-02  1.988298e-02
    ## GO:0051589     2/156  14/18722  5.878399e-03  2.965536e-02  1.988298e-02
    ## GO:0071415     2/156  14/18722  5.878399e-03  2.965536e-02  1.988298e-02
    ## GO:0030073     6/156 195/18722  5.915979e-03  2.979156e-02  1.997430e-02
    ## GO:0019915     4/156  87/18722  6.043478e-03  3.027116e-02  2.029585e-02
    ## GO:0044070     4/156  87/18722  6.043478e-03  3.027116e-02  2.029585e-02
    ## GO:1900182     4/156  87/18722  6.043478e-03  3.027116e-02  2.029585e-02
    ## GO:0090276     6/156 196/18722  6.061823e-03  3.030912e-02  2.032130e-02
    ## GO:0035305     3/156  45/18722  6.232785e-03  3.099874e-02  2.078368e-02
    ## GO:0035307     3/156  45/18722  6.232785e-03  3.099874e-02  2.078368e-02
    ## GO:1901985     3/156  45/18722  6.232785e-03  3.099874e-02  2.078368e-02
    ## GO:0019221    10/156 472/18722  6.284942e-03  3.120302e-02  2.092064e-02
    ## GO:0046330     4/156  89/18722  6.545115e-03  3.243750e-02  2.174831e-02
    ## GO:0032355     5/156 141/18722  6.572111e-03  3.251405e-02  2.179964e-02
    ## GO:0031018     3/156  46/18722  6.627412e-03  3.251644e-02  2.180124e-02
    ## GO:0002791     6/156 200/18722  6.671527e-03  3.251644e-02  2.180124e-02
    ## GO:0010820     2/156  15/18722  6.745861e-03  3.251644e-02  2.180124e-02
    ## GO:0014733     2/156  15/18722  6.745861e-03  3.251644e-02  2.180124e-02
    ## GO:0032310     2/156  15/18722  6.745861e-03  3.251644e-02  2.180124e-02
    ## GO:0048308     2/156  15/18722  6.745861e-03  3.251644e-02  2.180124e-02
    ## GO:0048313     2/156  15/18722  6.745861e-03  3.251644e-02  2.180124e-02
    ## GO:0051290     2/156  15/18722  6.745861e-03  3.251644e-02  2.180124e-02
    ## GO:0070885     2/156  15/18722  6.745861e-03  3.251644e-02  2.180124e-02
    ## GO:0070886     2/156  15/18722  6.745861e-03  3.251644e-02  2.180124e-02
    ## GO:0106057     2/156  15/18722  6.745861e-03  3.251644e-02  2.180124e-02
    ## GO:0106058     2/156  15/18722  6.745861e-03  3.251644e-02  2.180124e-02
    ## GO:1901841     2/156  15/18722  6.745861e-03  3.251644e-02  2.180124e-02
    ## GO:1903727     2/156  15/18722  6.745861e-03  3.251644e-02  2.180124e-02
    ## GO:1903799     2/156  15/18722  6.745861e-03  3.251644e-02  2.180124e-02
    ## GO:0046031     4/156  90/18722  6.805975e-03  3.275012e-02  2.195792e-02
    ## GO:0034763     5/156 143/18722  6.966368e-03  3.340771e-02  2.239881e-02
    ## GO:0070555     5/156 143/18722  6.966368e-03  3.340771e-02  2.239881e-02
    ## GO:0090087     6/156 202/18722  6.992543e-03  3.347621e-02  2.244474e-02
    ## GO:0046677     3/156  47/18722  7.036598e-03  3.351611e-02  2.247149e-02
    ## GO:0061001     3/156  47/18722  7.036598e-03  3.351611e-02  2.247149e-02
    ## GO:1903170     3/156  47/18722  7.036598e-03  3.351611e-02  2.247149e-02
    ## GO:0006885     4/156  91/18722  7.073630e-03  3.357887e-02  2.251357e-02
    ## GO:0060191     4/156  91/18722  7.073630e-03  3.357887e-02  2.251357e-02
    ## GO:0007612     5/156 144/18722  7.169575e-03  3.397702e-02  2.278052e-02
    ## GO:1903351     4/156  92/18722  7.348151e-03  3.476478e-02  2.330868e-02
    ## GO:1902003     3/156  48/18722  7.460468e-03  3.517792e-02  2.358568e-02
    ## GO:2001238     3/156  48/18722  7.460468e-03  3.517792e-02  2.358568e-02
    ## GO:0048813     5/156 146/18722  7.588349e-03  3.561780e-02  2.388061e-02
    ## GO:0032755     4/156  93/18722  7.629610e-03  3.561780e-02  2.388061e-02
    ## GO:1903350     4/156  93/18722  7.629610e-03  3.561780e-02  2.388061e-02
    ## GO:0010819     2/156  16/18722  7.667634e-03  3.561780e-02  2.388061e-02
    ## GO:0017014     2/156  16/18722  7.667634e-03  3.561780e-02  2.388061e-02
    ## GO:0018119     2/156  16/18722  7.667634e-03  3.561780e-02  2.388061e-02
    ## GO:0034116     2/156  16/18722  7.667634e-03  3.561780e-02  2.388061e-02
    ## GO:0045651     2/156  16/18722  7.667634e-03  3.561780e-02  2.388061e-02
    ## GO:0045838     2/156  16/18722  7.667634e-03  3.561780e-02  2.388061e-02
    ## GO:0042110    10/156 487/18722  7.758487e-03  3.598046e-02  2.412376e-02
    ## GO:0008038     3/156  49/18722  7.899143e-03  3.636116e-02  2.437900e-02
    ## GO:0009409     3/156  49/18722  7.899143e-03  3.636116e-02  2.437900e-02
    ## GO:0030225     3/156  49/18722  7.899143e-03  3.636116e-02  2.437900e-02
    ## GO:0048168     3/156  49/18722  7.899143e-03  3.636116e-02  2.437900e-02
    ## GO:0002690     4/156  94/18722  7.918078e-03  3.636116e-02  2.437900e-02
    ## GO:0032091     4/156  94/18722  7.918078e-03  3.636116e-02  2.437900e-02
    ## GO:0001558     9/156 414/18722  7.988405e-03  3.662436e-02  2.455548e-02
    ## GO:1901215     6/156 208/18722  8.022769e-03  3.666757e-02  2.458445e-02
    ## GO:0014074     5/156 148/18722  8.023881e-03  3.666757e-02  2.458445e-02
    ## GO:0045834     5/156 149/18722  8.248033e-03  3.763081e-02  2.523027e-02
    ## GO:0060425     3/156  50/18722  8.352738e-03  3.804686e-02  2.550921e-02
    ## GO:0046827     2/156  17/18722  8.642763e-03  3.898939e-02  2.614115e-02
    ## GO:0051580     2/156  17/18722  8.642763e-03  3.898939e-02  2.614115e-02
    ## GO:0061577     2/156  17/18722  8.642763e-03  3.898939e-02  2.614115e-02
    ## GO:1900034     2/156  17/18722  8.642763e-03  3.898939e-02  2.614115e-02
    ## GO:1903358     2/156  17/18722  8.642763e-03  3.898939e-02  2.614115e-02
    ## GO:1904355     2/156  17/18722  8.642763e-03  3.898939e-02  2.614115e-02
    ## GO:0030902     5/156 151/18722  8.709308e-03  3.903933e-02  2.617464e-02
    ## GO:0043535     5/156 151/18722  8.709308e-03  3.903933e-02  2.617464e-02
    ## GO:0071333     5/156 151/18722  8.709308e-03  3.903933e-02  2.617464e-02
    ## GO:2001236     5/156 151/18722  8.709308e-03  3.903933e-02  2.617464e-02
    ## GO:0051339     3/156  51/18722  8.821361e-03  3.943782e-02  2.644181e-02
    ## GO:0070252     4/156  97/18722  8.826226e-03  3.943782e-02  2.644181e-02
    ## GO:0016573     5/156 152/18722  8.946512e-03  3.991193e-02  2.675969e-02
    ## GO:0071331     5/156 153/18722  9.188146e-03  4.092505e-02  2.743895e-02
    ## GO:0045861     8/156 351/18722  9.307176e-03  4.138973e-02  2.775051e-02
    ## GO:0030856     5/156 154/18722  9.434248e-03  4.182269e-02  2.804079e-02
    ## GO:0071326     5/156 154/18722  9.434248e-03  4.182269e-02  2.804079e-02
    ## GO:1903532     7/156 282/18722  9.496802e-03  4.203380e-02  2.818233e-02
    ## GO:0001956     2/156  18/18722  9.670308e-03  4.220452e-02  2.829680e-02
    ## GO:0015732     2/156  18/18722  9.670308e-03  4.220452e-02  2.829680e-02
    ## GO:0031000     2/156  18/18722  9.670308e-03  4.220452e-02  2.829680e-02
    ## GO:0031649     2/156  18/18722  9.670308e-03  4.220452e-02  2.829680e-02
    ## GO:0060438     2/156  18/18722  9.670308e-03  4.220452e-02  2.829680e-02
    ## GO:0060546     2/156  18/18722  9.670308e-03  4.220452e-02  2.829680e-02
    ## GO:0071071     2/156  18/18722  9.670308e-03  4.220452e-02  2.829680e-02
    ## GO:0150078     2/156  18/18722  9.670308e-03  4.220452e-02  2.829680e-02
    ## GO:2000641     2/156  18/18722  9.670308e-03  4.220452e-02  2.829680e-02
    ## GO:0008347     3/156  53/18722  9.804095e-03  4.272218e-02  2.864387e-02
    ## GO:0070839     3/156  54/18722  1.031839e-02  4.489379e-02  3.009986e-02
    ## GO:0002064     6/156 220/18722  1.040415e-02  4.519705e-02  3.030319e-02
    ## GO:0018393     5/156 158/18722  1.046412e-02  4.538753e-02  3.043090e-02
    ## GO:0009306     8/156 359/18722  1.056675e-02  4.576218e-02  3.068209e-02
    ## GO:0035592     8/156 360/18722  1.073268e-02  4.585194e-02  3.074227e-02
    ## GO:0010759     2/156  19/18722  1.074934e-02  4.585194e-02  3.074227e-02
    ## GO:0010829     2/156  19/18722  1.074934e-02  4.585194e-02  3.074227e-02
    ## GO:0030220     2/156  19/18722  1.074934e-02  4.585194e-02  3.074227e-02
    ## GO:0032026     2/156  19/18722  1.074934e-02  4.585194e-02  3.074227e-02
    ## GO:0036344     2/156  19/18722  1.074934e-02  4.585194e-02  3.074227e-02
    ## GO:0045821     2/156  19/18722  1.074934e-02  4.585194e-02  3.074227e-02
    ## GO:0062099     2/156  19/18722  1.074934e-02  4.585194e-02  3.074227e-02
    ## GO:0140131     2/156  19/18722  1.074934e-02  4.585194e-02  3.074227e-02
    ## GO:0009135     4/156 103/18722  1.084081e-02  4.585194e-02  3.074227e-02
    ## GO:0009179     4/156 103/18722  1.084081e-02  4.585194e-02  3.074227e-02
    ## GO:0030004     4/156 103/18722  1.084081e-02  4.585194e-02  3.074227e-02
    ## GO:0032760     4/156 103/18722  1.084081e-02  4.585194e-02  3.074227e-02
    ## GO:0031113     3/156  55/18722  1.084810e-02  4.585194e-02  3.074227e-02
    ## GO:0042220     3/156  55/18722  1.084810e-02  4.585194e-02  3.074227e-02
    ## GO:1902991     3/156  55/18722  1.084810e-02  4.585194e-02  3.074227e-02
    ## GO:0002274     6/156 223/18722  1.107037e-02  4.672127e-02  3.132513e-02
    ## GO:0050673     9/156 437/18722  1.112529e-02  4.688276e-02  3.143340e-02
    ## GO:2001234     6/156 224/18722  1.129901e-02  4.754365e-02  3.187651e-02
    ## GO:0022029     3/156  56/18722  1.139328e-02  4.779745e-02  3.204668e-02
    ## GO:0043388     3/156  56/18722  1.139328e-02  4.779745e-02  3.204668e-02
    ## GO:0071322     5/156 163/18722  1.185660e-02  4.939322e-02  3.311659e-02
    ## GO:0006837     2/156  20/18722  1.187894e-02  4.939322e-02  3.311659e-02
    ## GO:0046931     2/156  20/18722  1.187894e-02  4.939322e-02  3.311659e-02
    ## GO:0060252     2/156  20/18722  1.187894e-02  4.939322e-02  3.311659e-02
    ## GO:1901386     2/156  20/18722  1.187894e-02  4.939322e-02  3.311659e-02
    ## GO:1902004     2/156  20/18722  1.187894e-02  4.939322e-02  3.311659e-02
    ## GO:0009185     4/156 106/18722  1.195062e-02  4.941349e-02  3.313018e-02
    ## GO:0042116     4/156 106/18722  1.195062e-02  4.941349e-02  3.313018e-02
    ## GO:0050879     3/156  57/18722  1.195403e-02  4.941349e-02  3.313018e-02
    ## GO:0050881     3/156  57/18722  1.195403e-02  4.941349e-02  3.313018e-02
    ##                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              geneID
    ## GO:0006119                                             ATP5F1A/ATP5F1B/ATP5F1C/ATP5F1D/ATP5F1E/ATP5PB/ATP5PD/ATP5PF/ATP5PO/BID/COX4I1/COX4I2/COX5A/COX5B/COX6A1/COX6A2/COX6B1/COX6B2/COX6C/COX7A1/COX7A2/COX7A2L/COX7B/COX7B2/COX7C/COX8A/COX8C/CYC1/CYCS/NDUFA1/NDUFA10/NDUFA2/NDUFA3/NDUFA4/NDUFA5/NDUFA6/NDUFA7/NDUFA8/NDUFA9/NDUFAB1/NDUFB1/NDUFB10/NDUFB2/NDUFB3/NDUFB4/NDUFB5/NDUFB6/NDUFB7/NDUFB8/NDUFB9/NDUFC1/NDUFC2/NDUFS1/NDUFS2/NDUFS3/NDUFS4/NDUFS5/NDUFS6/NDUFS7/NDUFS8/NDUFV1/NDUFV2/NDUFV3/SDHA/SDHC/SDHD/SNCA/UQCR10/UQCR11/UQCRB/UQCRC1/UQCRC2/UQCRH/UQCRHL/UQCRQ
    ## GO:0009060                                    ATP5F1A/ATP5F1B/ATP5F1C/ATP5F1D/ATP5F1E/ATP5PB/ATP5PD/ATP5PF/ATP5PO/BID/COX4I1/COX4I2/COX5A/COX5B/COX6A1/COX6A2/COX6B1/COX6B2/COX6C/COX7A1/COX7A2/COX7A2L/COX7B/COX7B2/COX7C/COX8A/COX8C/CYC1/CYCS/IDE/NDUFA1/NDUFA10/NDUFA2/NDUFA3/NDUFA4/NDUFA5/NDUFA6/NDUFA7/NDUFA8/NDUFA9/NDUFAB1/NDUFB1/NDUFB10/NDUFB2/NDUFB3/NDUFB4/NDUFB5/NDUFB6/NDUFB7/NDUFB8/NDUFB9/NDUFC1/NDUFC2/NDUFS1/NDUFS2/NDUFS3/NDUFS4/NDUFS5/NDUFS6/NDUFS7/NDUFS8/NDUFV1/NDUFV2/NDUFV3/SDHA/SDHB/SDHC/SDHD/SNCA/UQCR10/UQCR11/UQCRB/UQCRC1/UQCRC2/UQCRH/UQCRHL/UQCRQ
    ## GO:0046034 APP/ATP5F1A/ATP5F1B/ATP5F1C/ATP5F1D/ATP5F1E/ATP5MC1/ATP5MC2/ATP5MC3/ATP5PB/ATP5PD/ATP5PF/ATP5PO/BAD/BID/COX4I1/COX4I2/COX5A/COX5B/COX6A1/COX6A2/COX6B1/COX6B2/COX6C/COX7A1/COX7A2/COX7A2L/COX7B/COX7B2/COX7C/COX8A/COX8C/CYC1/CYCS/GAPDH/NDUFA1/NDUFA10/NDUFA2/NDUFA3/NDUFA4/NDUFA5/NDUFA6/NDUFA7/NDUFA8/NDUFA9/NDUFAB1/NDUFB1/NDUFB10/NDUFB2/NDUFB3/NDUFB4/NDUFB5/NDUFB6/NDUFB7/NDUFB8/NDUFB9/NDUFC1/NDUFC2/NDUFS1/NDUFS2/NDUFS3/NDUFS4/NDUFS5/NDUFS6/NDUFS7/NDUFS8/NDUFV1/NDUFV2/NDUFV3/PSEN1/SDHA/SDHC/SDHD/SNCA/UQCR10/UQCR11/UQCRB/UQCRC1/UQCRC2/UQCRH/UQCRHL/UQCRQ
    ## GO:0045333                            ATP5F1A/ATP5F1B/ATP5F1C/ATP5F1D/ATP5F1E/ATP5PB/ATP5PD/ATP5PF/ATP5PO/BID/COX4I1/COX4I2/COX5A/COX5B/COX6A1/COX6A2/COX6B1/COX6B2/COX6C/COX7A1/COX7A2/COX7A2L/COX7B/COX7B2/COX7C/COX8A/COX8C/CYC1/CYCS/IDE/NDUFA1/NDUFA10/NDUFA2/NDUFA3/NDUFA4/NDUFA5/NDUFA6/NDUFA7/NDUFA8/NDUFA9/NDUFAB1/NDUFB1/NDUFB10/NDUFB2/NDUFB3/NDUFB4/NDUFB5/NDUFB6/NDUFB7/NDUFB8/NDUFB9/NDUFC1/NDUFC2/NDUFS1/NDUFS2/NDUFS3/NDUFS4/NDUFS5/NDUFS6/NDUFS7/NDUFS8/NDUFV1/NDUFV2/NDUFV3/SDHA/SDHB/SDHC/SDHD/SNCA/UQCR10/UQCR11/UQCRB/UQCRC1/UQCRC2/UQCRFS1/UQCRH/UQCRHL/UQCRQ
    ## GO:0019646                                                                                                                                                       COX4I1/COX4I2/COX5A/COX5B/COX6A1/COX6A2/COX6C/COX7A1/COX7A2/COX7A2L/COX7C/COX8A/COX8C/CYC1/CYCS/NDUFA1/NDUFA10/NDUFA2/NDUFA3/NDUFA4/NDUFA5/NDUFA6/NDUFA7/NDUFA8/NDUFA9/NDUFAB1/NDUFB1/NDUFB10/NDUFB2/NDUFB3/NDUFB4/NDUFB5/NDUFB6/NDUFB7/NDUFB8/NDUFB9/NDUFC1/NDUFC2/NDUFS1/NDUFS2/NDUFS3/NDUFS4/NDUFS5/NDUFS6/NDUFS7/NDUFS8/NDUFV1/NDUFV2/NDUFV3/SDHA/SDHC/SDHD/SNCA/UQCR10/UQCR11/UQCRB/UQCRC1/UQCRH/UQCRHL/UQCRQ
    ## GO:0042773                                                                                                                                                   BID/COX4I1/COX4I2/COX5A/COX5B/COX6A1/COX6A2/COX6C/COX7A1/COX7A2/COX7A2L/COX7C/COX8A/COX8C/CYC1/CYCS/NDUFA1/NDUFA10/NDUFA2/NDUFA3/NDUFA4/NDUFA5/NDUFA6/NDUFA7/NDUFA8/NDUFA9/NDUFAB1/NDUFB1/NDUFB10/NDUFB2/NDUFB3/NDUFB4/NDUFB5/NDUFB6/NDUFB7/NDUFB8/NDUFB9/NDUFC1/NDUFC2/NDUFS1/NDUFS2/NDUFS3/NDUFS4/NDUFS5/NDUFS6/NDUFS7/NDUFS8/NDUFV1/NDUFV2/NDUFV3/SDHA/SDHC/SDHD/SNCA/UQCR10/UQCR11/UQCRB/UQCRC1/UQCRH/UQCRHL/UQCRQ
    ## GO:0042775                                                                                                                                                   BID/COX4I1/COX4I2/COX5A/COX5B/COX6A1/COX6A2/COX6C/COX7A1/COX7A2/COX7A2L/COX7C/COX8A/COX8C/CYC1/CYCS/NDUFA1/NDUFA10/NDUFA2/NDUFA3/NDUFA4/NDUFA5/NDUFA6/NDUFA7/NDUFA8/NDUFA9/NDUFAB1/NDUFB1/NDUFB10/NDUFB2/NDUFB3/NDUFB4/NDUFB5/NDUFB6/NDUFB7/NDUFB8/NDUFB9/NDUFC1/NDUFC2/NDUFS1/NDUFS2/NDUFS3/NDUFS4/NDUFS5/NDUFS6/NDUFS7/NDUFS8/NDUFV1/NDUFV2/NDUFV3/SDHA/SDHC/SDHD/SNCA/UQCR10/UQCR11/UQCRB/UQCRC1/UQCRH/UQCRHL/UQCRQ
    ## GO:0022904                                                                                                                                      BID/COX4I1/COX4I2/COX5A/COX5B/COX6A1/COX6A2/COX6C/COX7A1/COX7A2/COX7A2L/COX7C/COX8A/COX8C/CYC1/CYCS/NDUFA1/NDUFA10/NDUFA2/NDUFA3/NDUFA4/NDUFA5/NDUFA6/NDUFA7/NDUFA8/NDUFA9/NDUFAB1/NDUFB1/NDUFB10/NDUFB2/NDUFB3/NDUFB4/NDUFB5/NDUFB6/NDUFB7/NDUFB8/NDUFB9/NDUFC1/NDUFC2/NDUFS1/NDUFS2/NDUFS3/NDUFS4/NDUFS5/NDUFS6/NDUFS7/NDUFS8/NDUFV1/NDUFV2/NDUFV3/SDHA/SDHB/SDHC/SDHD/SNCA/UQCR10/UQCR11/UQCRB/UQCRC1/UQCRFS1/UQCRH/UQCRHL/UQCRQ
    ## GO:0015980                      ATP5F1A/ATP5F1B/ATP5F1C/ATP5F1D/ATP5F1E/ATP5PB/ATP5PD/ATP5PF/ATP5PO/BID/COX4I1/COX4I2/COX5A/COX5B/COX6A1/COX6A2/COX6B1/COX6B2/COX6C/COX7A1/COX7A2/COX7A2L/COX7B/COX7B2/COX7C/COX8A/COX8C/CYC1/CYCS/GSK3B/IDE/NDUFA1/NDUFA10/NDUFA2/NDUFA3/NDUFA4/NDUFA5/NDUFA6/NDUFA7/NDUFA8/NDUFA9/NDUFAB1/NDUFB1/NDUFB10/NDUFB2/NDUFB3/NDUFB4/NDUFB5/NDUFB6/NDUFB7/NDUFB8/NDUFB9/NDUFC1/NDUFC2/NDUFS1/NDUFS2/NDUFS3/NDUFS4/NDUFS5/NDUFS6/NDUFS7/NDUFS8/NDUFV1/NDUFV2/NDUFV3/SDHA/SDHB/SDHC/SDHD/SNCA/UQCR10/UQCR11/UQCRB/UQCRC1/UQCRC2/UQCRFS1/UQCRH/UQCRHL/UQCRQ
    ## GO:0022900                                                                                                                  BID/COX4I1/COX4I2/COX5A/COX5B/COX6A1/COX6A2/COX6B1/COX6C/COX7A1/COX7A2/COX7A2L/COX7B/COX7B2/COX7C/COX8A/COX8C/CYC1/CYCS/NDUFA1/NDUFA10/NDUFA2/NDUFA3/NDUFA4/NDUFA5/NDUFA6/NDUFA7/NDUFA8/NDUFA9/NDUFAB1/NDUFB1/NDUFB10/NDUFB2/NDUFB3/NDUFB4/NDUFB5/NDUFB6/NDUFB7/NDUFB8/NDUFB9/NDUFC1/NDUFC2/NDUFS1/NDUFS2/NDUFS3/NDUFS4/NDUFS5/NDUFS6/NDUFS7/NDUFS8/NDUFV1/NDUFV2/NDUFV3/SDHA/SDHB/SDHC/SDHD/SNCA/UQCR10/UQCR11/UQCRB/UQCRC1/UQCRFS1/UQCRH/UQCRHL/UQCRQ
    ## GO:0006091      APP/ATP5F1A/ATP5F1B/ATP5F1C/ATP5F1D/ATP5F1E/ATP5PB/ATP5PD/ATP5PF/ATP5PO/BID/COX4I1/COX4I2/COX5A/COX5B/COX6A1/COX6A2/COX6B1/COX6B2/COX6C/COX7A1/COX7A2/COX7A2L/COX7B/COX7B2/COX7C/COX8A/COX8C/CYC1/CYCS/GAPDH/GSK3B/IDE/NDUFA1/NDUFA10/NDUFA2/NDUFA3/NDUFA4/NDUFA5/NDUFA6/NDUFA7/NDUFA8/NDUFA9/NDUFAB1/NDUFB1/NDUFB10/NDUFB2/NDUFB3/NDUFB4/NDUFB5/NDUFB6/NDUFB7/NDUFB8/NDUFB9/NDUFC1/NDUFC2/NDUFS1/NDUFS2/NDUFS3/NDUFS4/NDUFS5/NDUFS6/NDUFS7/NDUFS8/NDUFV1/NDUFV2/NDUFV3/PSEN1/SDHA/SDHB/SDHC/SDHD/SNCA/UQCR10/UQCR11/UQCRB/UQCRC1/UQCRC2/UQCRFS1/UQCRH/UQCRHL/UQCRQ
    ## GO:0006120                                                                                                                                                                                                                                                                                                                    NDUFA1/NDUFA10/NDUFA2/NDUFA3/NDUFA4/NDUFA5/NDUFA6/NDUFA7/NDUFA8/NDUFA9/NDUFAB1/NDUFB1/NDUFB10/NDUFB2/NDUFB3/NDUFB4/NDUFB5/NDUFB6/NDUFB7/NDUFB8/NDUFB9/NDUFC1/NDUFC2/NDUFS1/NDUFS2/NDUFS3/NDUFS4/NDUFS5/NDUFS6/NDUFS7/NDUFS8/NDUFV1/NDUFV2/NDUFV3/SNCA
    ## GO:0010257                                                                                                                                                                                                                                                                                                                                                                   NDUFA1/NDUFA10/NDUFA2/NDUFA3/NDUFA5/NDUFA6/NDUFA8/NDUFA9/NDUFAB1/NDUFB1/NDUFB10/NDUFB2/NDUFB3/NDUFB4/NDUFB5/NDUFB6/NDUFB7/NDUFB8/NDUFB9/NDUFC1/NDUFC2/NDUFS1/NDUFS2/NDUFS3/NDUFS4/NDUFS5/NDUFS7/NDUFS8
    ## GO:0032981                                                                                                                                                                                                                                                                                                                                                                   NDUFA1/NDUFA10/NDUFA2/NDUFA3/NDUFA5/NDUFA6/NDUFA8/NDUFA9/NDUFAB1/NDUFB1/NDUFB10/NDUFB2/NDUFB3/NDUFB4/NDUFB5/NDUFB6/NDUFB7/NDUFB8/NDUFB9/NDUFC1/NDUFC2/NDUFS1/NDUFS2/NDUFS3/NDUFS4/NDUFS5/NDUFS7/NDUFS8
    ## GO:0033108                                                                                                                                                                                                                                                                                                                                                           NDUFA1/NDUFA10/NDUFA2/NDUFA3/NDUFA5/NDUFA6/NDUFA8/NDUFA9/NDUFAB1/NDUFB1/NDUFB10/NDUFB2/NDUFB3/NDUFB4/NDUFB5/NDUFB6/NDUFB7/NDUFB8/NDUFB9/NDUFC1/NDUFC2/NDUFS1/NDUFS2/NDUFS3/NDUFS4/NDUFS5/NDUFS7/NDUFS8/UQCRFS1
    ## GO:1902600                                                                                                                                                                                                                                                                                                                                         ATP5F1A/ATP5F1B/ATP5F1C/ATP5F1D/ATP5F1E/ATP5MC1/ATP5MC2/ATP5MC3/ATP5PB/ATP5PD/ATP5PF/ATP5PO/CHP1/COX4I1/COX4I2/COX5A/COX5B/COX6A1/COX6A2/COX6B1/COX7A1/COX7A2L/COX7B/COX7B2/COX8A/CYC1/NDUFA4/NDUFS7/UQCR10/UQCRC1/UQCRFS1/UQCRH
    ## GO:0006123                                                                                                                                                                                                                                                                                                                                                                                                                                                                               COX4I1/COX4I2/COX5A/COX5B/COX6A1/COX6A2/COX6C/COX7A1/COX7A2/COX7A2L/COX7C/COX8A/COX8C/CYCS
    ## GO:0015985                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ATP5F1A/ATP5F1B/ATP5F1C/ATP5F1D/ATP5F1E/ATP5MC1/ATP5MC2/ATP5MC3/ATP5PB/ATP5PD/ATP5PF/ATP5PO
    ## GO:0015986                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ATP5F1A/ATP5F1B/ATP5F1C/ATP5F1D/ATP5F1E/ATP5MC1/ATP5MC2/ATP5MC3/ATP5PB/ATP5PD/ATP5PF/ATP5PO
    ## GO:0006122                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  CYC1/CYCS/UQCR10/UQCR11/UQCRB/UQCRC1/UQCRH/UQCRHL/UQCRQ
    ## GO:0019932                                                                                                                                                                                                                                                                                                                                                                                                              APOE/ATP2A2/CACNA1C/CALM1/CALM2/CALM3/CHP1/CHP2/EIF2AK3/GRIN1/GRIN2A/GRIN2B/GRIN2C/GRIN2D/GSK3B/ITPR1/ITPR2/ITPR3/MAPT/NOS1/PPP3CA/PPP3CB/PPP3CC/PPP3R1/TNF
    ## GO:0019722                                                                                                                                                                                                                                                                                                                                                                                                                                    ATP2A2/CACNA1C/CALM1/CALM2/CALM3/CHP1/CHP2/EIF2AK3/GRIN1/GRIN2A/GRIN2B/GRIN2C/GRIN2D/GSK3B/ITPR1/MAPT/PPP3CA/PPP3CB/PPP3CC/PPP3R1/TNF
    ## GO:0070588                                                                                                                                                                                                                                                                                                                                                                                                               ATP2A1/ATP2A2/ATP2A3/CACNA1C/CACNA1D/CACNA1F/CACNA1S/CALM1/CALM2/CALM3/CDK5/GRIN1/GRIN2A/GRIN2B/GRIN2C/GRIN2D/ITPR1/ITPR2/ITPR3/NOS1/PSEN1/PSEN2/RYR3/SNCA
    ## GO:0010952                                                                                                                                                                                                                                                                                                                                                                                                                                                          APAF1/APH1A/APP/ATP2A3/BAD/BID/CASP8/CASP9/CYCS/EIF2AK3/FADD/FAS/GRIN1/GRIN2A/GRIN2B/MAPT/NCSTN/PSENEN/SNCA/TNF
    ## GO:0070997                                                                                                                                                                                                                                                                                                                                                                                                                                    APOE/APP/BACE1/BAD/BID/CAPN2/CASP3/CASP7/CASP8/CASP9/CDK5/CDK5R1/CHP1/FADD/FAS/GAPDH/GRIN2B/GSK3B/LRP1/MAPT/NAE1/NCSTN/PSEN1/SNCA/TNF
    ## GO:0050804                                                                                                                                                                                                                                                                                                                                                                                                           APOE/APP/ATP2A2/BACE1/CALM1/CALM3/CDK5/GRIN1/GRIN2A/GRIN2B/GRIN2C/GRIN2D/GSK3B/IL1B/ITPR3/MAPK1/MAPT/MME/NCSTN/PLCB1/PLCB4/PPP3CA/PPP3CB/PPP3R1/PSEN1/SNCA/TNF
    ## GO:0099177                                                                                                                                                                                                                                                                                                                                                                                                           APOE/APP/ATP2A2/BACE1/CALM1/CALM3/CDK5/GRIN1/GRIN2A/GRIN2B/GRIN2C/GRIN2D/GSK3B/IL1B/ITPR3/MAPK1/MAPT/MME/NCSTN/PLCB1/PLCB4/PPP3CA/PPP3CB/PPP3R1/PSEN1/SNCA/TNF
    ## GO:0010950                                                                                                                                                                                                                                                                                                                                                                                                                                                              APAF1/APH1A/ATP2A3/BAD/BID/CASP8/CASP9/CYCS/EIF2AK3/FADD/FAS/GRIN1/GRIN2A/GRIN2B/MAPT/NCSTN/PSENEN/SNCA/TNF
    ## GO:0006509                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ADAM10/ADAM17/APH1A/APOE/BACE1/BACE2/IL1B/NCSTN/PSEN1/PSEN2/PSENEN/TNF
    ## GO:0045862                                                                                                                                                                                                                                                                                                                                                                                                                                    APAF1/APH1A/APOE/APP/ATP2A3/BAD/BID/CASP8/CASP9/CYCS/EIF2AK3/FADD/FAS/GRIN1/GRIN2A/GRIN2B/GSK3B/IL1B/MAPT/NCSTN/PSEN1/PSENEN/SNCA/TNF
    ## GO:0050435                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ADAM10/APH1A/APOE/BACE1/BACE2/CASP3/IDE/MME/NCSTN/PSEN1/PSEN2/PSENEN/TNF
    ## GO:0006816                                                                                                                                                                                                                                                                                                                                                                                                        ATP2A1/ATP2A2/ATP2A3/CACNA1C/CACNA1D/CACNA1F/CACNA1S/CALM1/CALM2/CALM3/CDK5/GRIN1/GRIN2A/GRIN2B/GRIN2C/GRIN2D/ITPR1/ITPR2/ITPR3/NOS1/PPP3CA/PSEN1/PSEN2/RYR3/SNCA
    ## GO:0042776                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ATP5F1A/ATP5F1B/ATP5F1C/ATP5F1D/ATP5F1E/ATP5PB/ATP5PD/ATP5PF/ATP5PO
    ## GO:0060401                                                                                                                                                                                                                                                                                                                                                                                                                                                         ATP2A2/ATP2A3/CACNA1C/CALM1/CALM2/CALM3/GRIN1/GRIN2A/GRIN2B/GRIN2C/GRIN2D/ITPR1/ITPR2/ITPR3/NOS1/PSEN2/RYR3/SNCA
    ## GO:0006754                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ATP5F1A/ATP5F1B/ATP5F1C/ATP5F1D/ATP5F1E/ATP5MC1/ATP5MC2/ATP5MC3/ATP5PB/ATP5PD/ATP5PF/ATP5PO
    ## GO:0033619                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ADAM10/ADAM17/APH1A/APOE/BACE1/BACE2/IL1B/NCSTN/PSEN1/PSEN2/PSENEN/TNF
    ## GO:2001056                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 APAF1/ATP2A3/BAD/BID/CASP8/CASP9/CYCS/EIF2AK3/FADD/FAS/GRIN1/GRIN2A/GRIN2B/MAPT/SNCA/TNF
    ## GO:0009206                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ATP5F1A/ATP5F1B/ATP5F1C/ATP5F1D/ATP5F1E/ATP5MC1/ATP5MC2/ATP5MC3/ATP5PB/ATP5PD/ATP5PF/ATP5PO
    ## GO:0009145                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ATP5F1A/ATP5F1B/ATP5F1C/ATP5F1D/ATP5F1E/ATP5MC1/ATP5MC2/ATP5MC3/ATP5PB/ATP5PD/ATP5PF/ATP5PO
    ## GO:0048167                                                                                                                                                                                                                                                                                                                                                                                                                                                                       APOE/APP/CDK5/GRIN1/GRIN2A/GRIN2B/GRIN2C/GRIN2D/GSK3B/ITPR3/MAPK1/MAPT/MME/NCSTN/PPP3CB/PSEN1/SNCA
    ## GO:0048016                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        CHP1/CHP2/GSK3B/ITPR1/ITPR2/ITPR3/PPP3CA/PPP3CB/PPP3CC/PPP3R1/TNF
    ## GO:0097553                                                                                                                                                                                                                                                                                                                                                                                                                                                                             CACNA1C/CALM1/CALM2/CALM3/GRIN1/GRIN2A/GRIN2B/GRIN2C/GRIN2D/ITPR1/ITPR2/ITPR3/NOS1/RYR3/SNCA
    ## GO:0009201                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ATP5F1A/ATP5F1B/ATP5F1C/ATP5F1D/ATP5F1E/ATP5MC1/ATP5MC2/ATP5MC3/ATP5PB/ATP5PD/ATP5PF/ATP5PO
    ## GO:1901216                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 BACE1/BAD/CAPN2/CASP3/CASP8/CASP9/CDK5/CDK5R1/GRIN2B/GSK3B/MAPT/SNCA/TNF
    ## GO:0051402                                                                                                                                                                                                                                                                                                                                                                                                                                                                           APOE/APP/BACE1/BID/CASP3/CASP7/CASP9/CDK5/CDK5R1/FADD/FAS/GAPDH/LRP1/NAE1/NCSTN/PSEN1/SNCA/TNF
    ## GO:0006874                                                                                                                                                                                                                                                                                                                                                                                                                               APOE/APP/ATP2A1/ATP2A2/ATP2A3/CACNA1C/CALM1/CALM2/CALM3/CDK5/GRIN1/GRIN2A/GRIN2B/GRIN2C/GRIN2D/ITPR1/ITPR2/ITPR3/LRP1/NOS1/PSEN1/RYR3/SNCA
    ## GO:0009205                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ATP5F1A/ATP5F1B/ATP5F1C/ATP5F1D/ATP5F1E/ATP5MC1/ATP5MC2/ATP5MC3/ATP5PB/ATP5PD/ATP5PF/ATP5PO
    ## GO:0010038                                                                                                                                                                                                                                                                                                                                                                                                                                               APBB1/APP/ATP5F1D/BACE1/BAD/CALM1/CALM2/CALM3/CASP3/CASP8/CASP9/CHP2/EIF2AK3/ITPR3/MAPK1/MAPK3/MAPT/NCSTN/PPP3CA/RYR3/SNCA
    ## GO:0060402                                                                                                                                                                                                                                                                                                                                                                                                                                                                             CACNA1C/CALM1/CALM2/CALM3/GRIN1/GRIN2A/GRIN2B/GRIN2C/GRIN2D/ITPR1/ITPR2/ITPR3/NOS1/RYR3/SNCA
    ## GO:0055074                                                                                                                                                                                                                                                                                                                                                                                                                               APOE/APP/ATP2A1/ATP2A2/ATP2A3/CACNA1C/CALM1/CALM2/CALM3/CDK5/GRIN1/GRIN2A/GRIN2B/GRIN2C/GRIN2D/ITPR1/ITPR2/ITPR3/LRP1/NOS1/PSEN1/RYR3/SNCA
    ## GO:0009142                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ATP5F1A/ATP5F1B/ATP5F1C/ATP5F1D/ATP5F1E/ATP5MC1/ATP5MC2/ATP5MC3/ATP5PB/ATP5PD/ATP5PF/ATP5PO
    ## GO:0016485                                                                                                                                                                                                                                                                                                                                                                                                                                                                     ADAM10/ADAM17/APH1A/BACE1/BACE2/BAD/CAPN2/CASP3/CASP7/CASP8/FADD/GRIN2A/MME/NCSTN/PSEN1/PSEN2/PSENEN
    ## GO:0009144                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ATP5F1A/ATP5F1B/ATP5F1C/ATP5F1D/ATP5F1E/ATP5MC1/ATP5MC2/ATP5MC3/ATP5PB/ATP5PD/ATP5PF/ATP5PO
    ## GO:0042987                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ADAM10/ADAM17/APH1A/APOE/BACE1/CASP3/NCSTN/PSEN1/PSEN2/PSENEN/TNF
    ## GO:0009199                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ATP5F1A/ATP5F1B/ATP5F1C/ATP5F1D/ATP5F1E/ATP5MC1/ATP5MC2/ATP5MC3/ATP5PB/ATP5PD/ATP5PF/ATP5PO
    ## GO:0072503                                                                                                                                                                                                                                                                                                                                                                                                                               APOE/APP/ATP2A1/ATP2A2/ATP2A3/CACNA1C/CALM1/CALM2/CALM3/CDK5/GRIN1/GRIN2A/GRIN2B/GRIN2C/GRIN2D/ITPR1/ITPR2/ITPR3/LRP1/NOS1/PSEN1/RYR3/SNCA
    ## GO:0007215                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            APP/CDK5R1/GNAQ/GRIN1/GRIN2A/GRIN2B/GRIN2C/GRIN2D/NCSTN/PLCB1
    ## GO:0042982                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ADAM10/ADAM17/APH1A/APOE/BACE1/BACE2/CASP3/NCSTN/PSEN1/PSEN2/PSENEN/TNF
    ## GO:0060291                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    APOE/APP/GRIN2A/GRIN2B/GRIN2C/GRIN2D/GSK3B/ITPR3/MAPK1/MME/NCSTN/SNCA
    ## GO:0034205                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ADAM10/APH1A/APOE/BACE1/CASP3/NCSTN/PSEN1/PSEN2/PSENEN/TNF
    ## GO:0052547                                                                                                                                                                                                                                                                                                                                                                                                                                               APAF1/APH1A/APP/ATP2A3/BAD/BID/CASP8/CASP9/CYCS/EIF2AK3/FADD/FAS/GAPDH/GRIN1/GRIN2A/GRIN2B/LRP1/MAPT/NCSTN/PSENEN/SNCA/TNF
    ## GO:0006919                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              APAF1/ATP2A3/BAD/BID/CASP8/CASP9/CYCS/EIF2AK3/MAPT/SNCA/TNF
    ## GO:0051604                                                                                                                                                                                                                                                                                                                                                                                                                                                             ADAM10/ADAM17/APH1A/BACE1/BACE2/BAD/CAPN2/CASP3/CASP7/CASP8/FADD/GRIN2A/MME/NCSTN/NDUFAB1/PSEN1/PSEN2/PSENEN
    ## GO:0052548                                                                                                                                                                                                                                                                                                                                                                                                                                                    APAF1/APH1A/APP/ATP2A3/BAD/BID/CASP8/CASP9/CYCS/EIF2AK3/FADD/FAS/GAPDH/GRIN1/GRIN2A/GRIN2B/MAPT/NCSTN/PSENEN/SNCA/TNF
    ## GO:0042391                                                                                                                                                                                                                                                                                                                                                                                                                                           APP/ATP2A2/BAD/BID/CACNA1C/CACNA1D/CALM1/CALM3/CDK5/GNAQ/GRIN1/GRIN2A/GRIN2B/GRIN2C/GRIN2D/GSK3B/MAPT/NDUFS1/PPP3CA/PSEN1/SNCA
    ## GO:0050806                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           APOE/APP/CDK5/GRIN2A/GRIN2B/GRIN2C/GRIN2D/GSK3B/ITPR3/MAPK1/MME/NCSTN/SNCA/TNF
    ## GO:2000116                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 APAF1/ATP2A3/BAD/BID/CASP8/CASP9/CYCS/EIF2AK3/FADD/FAS/GRIN1/GRIN2A/GRIN2B/MAPT/SNCA/TNF
    ## GO:0009141                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ATP5F1A/ATP5F1B/ATP5F1C/ATP5F1D/ATP5F1E/ATP5MC1/ATP5MC2/ATP5MC3/ATP5PB/ATP5PD/ATP5PF/ATP5PO
    ## GO:1901214                                                                                                                                                                                                                                                                                                                                                                                                                                                                       APOE/BACE1/BAD/CAPN2/CASP3/CASP8/CASP9/CDK5/CDK5R1/CHP1/GRIN2B/GSK3B/LRP1/MAPT/NAE1/PSEN1/SNCA/TNF
    ## GO:0006164                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ATP5F1A/ATP5F1B/ATP5F1C/ATP5F1D/ATP5F1E/ATP5MC1/ATP5MC2/ATP5MC3/ATP5PB/ATP5PD/ATP5PF/ATP5PO/NOS1/SNCA
    ## GO:0043280                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          APAF1/ATP2A3/BAD/BID/CASP8/CASP9/CYCS/EIF2AK3/FAS/MAPT/SNCA/TNF
    ## GO:0072522                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ATP5F1A/ATP5F1B/ATP5F1C/ATP5F1D/ATP5F1E/ATP5MC1/ATP5MC2/ATP5MC3/ATP5PB/ATP5PD/ATP5PF/ATP5PO/NOS1/SNCA
    ## GO:0007204                                                                                                                                                                                                                                                                                                                                                                                                                                                                   CACNA1C/CALM1/CALM2/CALM3/CDK5/GRIN1/GRIN2A/GRIN2B/GRIN2C/GRIN2D/ITPR1/ITPR2/ITPR3/LRP1/NOS1/RYR3/SNCA
    ## GO:0009152                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ATP5F1A/ATP5F1B/ATP5F1C/ATP5F1D/ATP5F1E/ATP5MC1/ATP5MC2/ATP5MC3/ATP5PB/ATP5PD/ATP5PF/ATP5PO/SNCA
    ## GO:0035235                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             APP/CDK5R1/GRIN1/GRIN2A/GRIN2B/GRIN2C/GRIN2D
    ## GO:0051235                                                                                                                                                                                                                                                                                                                                                                                                                                                                           APOE/ATP2A1/CACNA1C/CALM1/CALM2/CALM3/CDK5/IL1B/ITPR1/ITPR2/ITPR3/LPL/NOS1/PSEN1/RYR3/SNCA/TNF
    ## GO:0033173                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          CHP1/CHP2/GSK3B/PPP3CA/PPP3CB/PPP3CC/PPP3R1/TNF
    ## GO:0051651                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        APOE/ATP2A1/CACNA1C/CALM1/CALM2/CALM3/CDK5/ITPR1/ITPR2/ITPR3/NOS1/PSEN1/RYR3/SNCA
    ## GO:0009165                                                                                                                                                                                                                                                                                                                                                                                                                                                              ATP5F1A/ATP5F1B/ATP5F1C/ATP5F1D/ATP5F1E/ATP5MC1/ATP5MC2/ATP5MC3/ATP5PB/ATP5PD/ATP5PF/ATP5PO/MAPK1/NOS1/SNCA
    ## GO:0050890                                                                                                                                                                                                                                                                                                                                                                                                                                                                                APOE/APP/CASP3/CDK5/GRIN1/GRIN2A/GRIN2B/ITPR3/MAPK1/MAPT/MME/NCSTN/PLCB1/PPP3CB/PSEN1/TNF
    ## GO:0007611                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    APOE/APP/CASP3/CDK5/GRIN1/GRIN2A/GRIN2B/ITPR3/MAPK1/MAPT/MME/NCSTN/PLCB1/PPP3CB/PSEN1
    ## GO:1901293                                                                                                                                                                                                                                                                                                                                                                                                                                                              ATP5F1A/ATP5F1B/ATP5F1C/ATP5F1D/ATP5F1E/ATP5MC1/ATP5MC2/ATP5MC3/ATP5PB/ATP5PD/ATP5PF/ATP5PO/MAPK1/NOS1/SNCA
    ## GO:0009260                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ATP5F1A/ATP5F1B/ATP5F1C/ATP5F1D/ATP5F1E/ATP5MC1/ATP5MC2/ATP5MC3/ATP5PB/ATP5PD/ATP5PF/ATP5PO/SNCA
    ## GO:0097720                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          CHP1/CHP2/GSK3B/PPP3CA/PPP3CB/PPP3CC/PPP3R1/TNF
    ## GO:0006163                                                                                                                                                                                                                                                                                                                                                                                                                                                APP/ATP5F1A/ATP5F1B/ATP5F1C/ATP5F1D/ATP5F1E/ATP5MC1/ATP5MC2/ATP5MC3/ATP5PB/ATP5PD/ATP5PF/ATP5PO/BAD/GAPDH/NOS1/PSEN1/SNCA
    ## GO:0051208                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         CACNA1C/CALM1/CALM2/CALM3/ITPR1/ITPR2/ITPR3/NOS1/PSEN1/RYR3/SNCA
    ## GO:0051480                                                                                                                                                                                                                                                                                                                                                                                                                                                                   CACNA1C/CALM1/CALM2/CALM3/CDK5/GRIN1/GRIN2A/GRIN2B/GRIN2C/GRIN2D/ITPR1/ITPR2/ITPR3/LRP1/NOS1/RYR3/SNCA
    ## GO:0046390                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ATP5F1A/ATP5F1B/ATP5F1C/ATP5F1D/ATP5F1E/ATP5MC1/ATP5MC2/ATP5MC3/ATP5PB/ATP5PD/ATP5PF/ATP5PO/SNCA
    ## GO:0050848                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         CALM1/CALM2/CALM3/CHP1/CHP2/GSK3B/ITPR1/MAPT/TNF
    ## GO:0060079                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             APP/CDK5/GRIN1/GRIN2A/GRIN2B/GRIN2C/GRIN2D/GSK3B/PPP3CA/SNCA
    ## GO:0009150                                                                                                                                                                                                                                                                                                                                                                                                                                                     APP/ATP5F1A/ATP5F1B/ATP5F1C/ATP5F1D/ATP5F1E/ATP5MC1/ATP5MC2/ATP5MC3/ATP5PB/ATP5PD/ATP5PF/ATP5PO/BAD/GAPDH/PSEN1/SNCA
    ## GO:0072521                                                                                                                                                                                                                                                                                                                                                                                                                                                APP/ATP5F1A/ATP5F1B/ATP5F1C/ATP5F1D/ATP5F1E/ATP5MC1/ATP5MC2/ATP5MC3/ATP5PB/ATP5PD/ATP5PF/ATP5PO/BAD/GAPDH/NOS1/PSEN1/SNCA
    ## GO:1990542                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ATP5F1A/ATP5F1B/ATP5F1C/ATP5F1D/ATP5F1E/ATP5PB/ATP5PD/ATP5PF/ATP5PO/PSEN2
    ## GO:0099565                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             APP/CDK5/GRIN1/GRIN2A/GRIN2B/GRIN2C/GRIN2D/GSK3B/PPP3CA/SNCA
    ## GO:0009259                                                                                                                                                                                                                                                                                                                                                                                                                                                     APP/ATP5F1A/ATP5F1B/ATP5F1C/ATP5F1D/ATP5F1E/ATP5MC1/ATP5MC2/ATP5MC3/ATP5PB/ATP5PD/ATP5PF/ATP5PO/BAD/GAPDH/PSEN1/SNCA
    ## GO:0009117                                                                                                                                                                                                                                                                                                                                                                                                                                          APP/ATP5F1A/ATP5F1B/ATP5F1C/ATP5F1D/ATP5F1E/ATP5MC1/ATP5MC2/ATP5MC3/ATP5PB/ATP5PD/ATP5PF/ATP5PO/BAD/GAPDH/MAPK1/NOS1/PSEN1/SNCA
    ## GO:0006839                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ATP5F1A/ATP5F1B/ATP5F1C/ATP5F1D/ATP5F1E/ATP5PB/ATP5PD/ATP5PF/ATP5PO/BAD/BID/GSK3B/PSEN1/PSEN2
    ## GO:0006753                                                                                                                                                                                                                                                                                                                                                                                                                                          APP/ATP5F1A/ATP5F1B/ATP5F1C/ATP5F1D/ATP5F1E/ATP5MC1/ATP5MC2/ATP5MC3/ATP5PB/ATP5PD/ATP5PF/ATP5PO/BAD/GAPDH/MAPK1/NOS1/PSEN1/SNCA
    ## GO:0019693                                                                                                                                                                                                                                                                                                                                                                                                                                                     APP/ATP5F1A/ATP5F1B/ATP5F1C/ATP5F1D/ATP5F1E/ATP5MC1/ATP5MC2/ATP5MC3/ATP5PB/ATP5PD/ATP5PF/ATP5PO/BAD/GAPDH/PSEN1/SNCA
    ## GO:0051209                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               CACNA1C/CALM1/CALM2/CALM3/ITPR1/ITPR2/ITPR3/NOS1/RYR3/SNCA
    ## GO:0051283                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               CACNA1C/CALM1/CALM2/CALM3/ITPR1/ITPR2/ITPR3/NOS1/RYR3/SNCA
    ## GO:0048143                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            APP/BACE2/LRP1/MAPT/PSEN1/TNF
    ## GO:0051282                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               CACNA1C/CALM1/CALM2/CALM3/ITPR1/ITPR2/ITPR3/NOS1/RYR3/SNCA
    ## GO:0048857                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     ATP5PB/ATP5PF/CALM1/CALM2/CALM3/CDK5R1/COX6B1/NDUFS3
    ## GO:0021762                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ATP5PB/ATP5PF/CALM1/CALM2/CALM3/COX6B1/NDUFS3
    ## GO:1903421                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      CALM1/CALM3/CDK5/PPP3CB/PPP3CC/SNCA
    ## GO:0099003                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ATP2A2/BACE1/CALM1/CALM3/CDK5/CDK5R1/GSK3B/PPP3CB/PPP3CC/PPP3R1/PSEN1/SNCA
    ## GO:0043281                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          APAF1/ATP2A3/BAD/BID/CASP8/CASP9/CYCS/EIF2AK3/FAS/MAPT/SNCA/TNF
    ## GO:0060078                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             APP/CDK5/GRIN1/GRIN2A/GRIN2B/GRIN2C/GRIN2D/GSK3B/PPP3CA/SNCA
    ## GO:0042063                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           APP/BACE2/CDK5/CDK5R1/IL1B/LRP1/MAPK1/MAPK3/MAPT/NCSTN/NDUFS2/PPP3R1/PSEN1/TNF
    ## GO:0031279                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             CACNA1C/CACNA1D/CALM1/CALM2/CALM3/MAPK3/NOS1
    ## GO:0099504                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ATP2A2/BACE1/CALM1/CALM3/CDK5/CDK5R1/GSK3B/PPP3CB/PPP3CC/PSEN1/SNCA
    ## GO:0048708                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                APP/BACE2/LRP1/MAPK1/MAPK3/MAPT/PSEN1/TNF
    ## GO:0010506                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ATF6/BAD/BID/CAPN1/CASP3/CDK5/CDK5R1/ERN1/GAPDH/GSK3B/ITPR1/MAPK3/MAPT/SNCA
    ## GO:0043270                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ATP2A1/CACNA1D/CALM1/CALM2/CALM3/CDK5/CHP1/GRIN1/IL1B/NDUFA4/NOS1/PSEN1/SNCA
    ## GO:0021782                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          APP/BACE2/CDK5/LRP1/MAPT/NCSTN/PPP3R1/PSEN1/TNF
    ## GO:0051353                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    APOE/CALM1/CALM3/IL1B/NDUFA4/SNCA/TNF
    ## GO:0034765                                                                                                                                                                                                                                                                                                                                                                                                                                                                APP/ATP2A1/CACNA1C/CACNA1D/CACNA1F/CACNA1S/CALM1/CALM2/CALM3/CAPN1/CDK5/CHP1/NDUFA4/NOS1/PSEN1/PSEN2/SNCA
    ## GO:0030901                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ATP5PB/ATP5PF/CALM1/CALM2/CALM3/COX6B1/NDUFS3/UQCRQ
    ## GO:0097193                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           APAF1/ATP2A1/ATP2A3/BAD/BID/CASP3/CASP9/EIF2AK3/ERN1/ITPR1/NDUFS3/TNF/TNFRSF1A
    ## GO:0070509                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ATP2A1/ATP2A2/CACNA1C/CACNA1D/CACNA1F/CACNA1S/CDK5/PSEN2
    ## GO:0006979                                                                                                                                                                                                                                                                                                                                                                                                                                                                             APOE/APP/ATP2A2/BAD/CAPN2/CASP3/ERN1/MAPK1/MAPK3/MAPT/NDUFA6/NDUFB4/NDUFS2/NDUFS8/PSEN1/SNCA
    ## GO:0070296                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ATP2A1/ATP2A2/CACNA1C/CALM1/CALM2/CALM3
    ## GO:0106027                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ADAM10/APOE/APP/CDK5/CDK5R1/GRIN2B/GSK3B/PSEN1
    ## GO:0034767                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ATP2A1/CALM1/CALM2/CALM3/CDK5/CHP1/NDUFA4/NOS1/PSEN1/SNCA
    ## GO:0043467                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    APP/COX7A1/COX7A2/COX7A2L/GSK3B/IDE/NDUFA4/PSEN1/SNCA
    ## GO:0014002                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            APP/BACE2/LRP1/MAPT/PSEN1/TNF
    ## GO:0051222                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   APBB1/BAD/CDK5/CDK5R1/CHP1/CHP2/GSK3B/IL1B/LRP1/MAPK1/PPP3CB/PSEN1/TNF
    ## GO:0061337                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ATP2A1/ATP2A2/ATP2A3/CACNA1C/CACNA1D/CALM1/CALM2/CALM3
    ## GO:0043523                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              APOE/BACE1/CASP3/CASP9/CDK5/CDK5R1/LRP1/NAE1/PSEN1/SNCA/TNF
    ## GO:0032469                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            APP/ATP2A1/ATP2A2/ITPR1/PSEN1
    ## GO:1904062                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      APP/ATP2A1/CACNA1C/CACNA1D/CALM1/CALM2/CALM3/CAPN1/CDK5/CHP1/NDUFA4/NOS1/PSEN2/SNCA
    ## GO:0051588                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ATP2A2/BACE1/CALM1/CALM3/CDK5/GSK3B/NOS1/SNCA
    ## GO:1904646                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          APP/BACE1/CDK5/GSK3B/LRP1/PSEN1
    ## GO:0051099                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     APOE/APP/CALM1/CALM2/CALM3/CDK5/GSK3B/IDE/LRP1/PSEN1
    ## GO:0051098                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          APOE/APP/ATP2A2/ATP2A3/CALM1/CALM2/CALM3/CDK5/GSK3B/IDE/LRP1/MAPK3/PPP3CA/PSEN1
    ## GO:0010882                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ATP2A2/CACNA1C/CALM1/CALM2/CALM3
    ## GO:0016079                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ATP2A2/BACE1/CALM1/CALM3/CDK5/GSK3B/PSEN1/SNCA
    ## GO:1904951                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   APBB1/BAD/CDK5/CDK5R1/CHP1/CHP2/GSK3B/IL1B/LRP1/MAPK1/PPP3CB/PSEN1/TNF
    ## GO:0010001                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              APP/BACE2/CDK5/LRP1/MAPK1/MAPK3/MAPT/NCSTN/PPP3R1/PSEN1/TNF
    ## GO:0055117                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ATP2A1/ATP2A2/CACNA1C/CALM1/CALM2/CALM3/NOS1
    ## GO:0022898                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    APP/ATP2A1/CACNA1D/CALM1/CALM2/CALM3/CAPN1/CDK5/CHP1/NDUFA4/NOS1/SNCA
    ## GO:0051592                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       BAD/CALM1/CALM2/CALM3/CHP2/ITPR3/NCSTN/PPP3CA/RYR3
    ## GO:0010800                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              APP/CALM1/CALM2/CALM3/MAPK1
    ## GO:0071260                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   BAD/CASP8/FADD/FAS/IL1B/MAPK3/TNFRSF1A
    ## GO:0043279                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           CACNA1S/CASP3/CASP7/CDK5/FADD/RYR3/SNCA/UQCRC1
    ## GO:0071675                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ADAM10/ADAM17/APP/FADD/MAPK1/MAPK3/PLCB1/TNF
    ## GO:0008625                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    BAD/BID/CASP8/FADD/GSK3B/TNF/TNFRSF1A
    ## GO:2000300                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ATP2A2/BACE1/CALM1/CALM3/CDK5/GSK3B
    ## GO:0018107                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            APP/CALM1/CALM2/CALM3/CDK5/CDK5R1/GSK3B/MAPK1
    ## GO:0043393                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   APOE/APP/ATP2A2/ATP2A3/CDK5/GSK3B/IDE/LRP1/MAPK3/PSEN1
    ## GO:0010921                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    CALM1/CALM2/CALM3/CHP1/CHP2/GSK3B/TNF
    ## GO:0032092                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       APOE/APP/CDK5/GSK3B/IDE/LRP1/PSEN1
    ## GO:1904645                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          APP/BACE1/CDK5/GSK3B/LRP1/PSEN1
    ## GO:0071902                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ADAM17/CALM1/CALM2/CALM3/CDK5R1/ERN1/IL1B/PSEN1/SNCA/TNF
    ## GO:1903715                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           COX7A1/COX7A2/COX7A2L/IDE/SNCA
    ## GO:1903169                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ATP2A1/CACNA1C/CALM1/CALM2/CALM3/CDK5/NOS1/PSEN2/SNCA
    ## GO:0046928                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ATP2A2/BACE1/CALM1/CALM3/CDK5/GSK3B/SNCA
    ## GO:0097202                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    BAD/CASP8/FADD/GRIN2A
    ## GO:0023061                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ATP2A2/ATP5PF/BACE1/BAD/CALM1/CALM3/CDK5/GSK3B/IL1B/LRP1/PPP3CA/PPP3CB/PSEN1/SNCA/TNF
    ## GO:0051928                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ATP2A1/CACNA1D/CALM1/CALM2/CALM3/CDK5/GRIN1/SNCA
    ## GO:0043525                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        BACE1/CASP3/CASP9/CDK5/CDK5R1/TNF
    ## GO:0032770                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                APOE/CALM1/CALM3/IL1B/TNF
    ## GO:1990000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                APOE/APP/BACE1/MAPT/PSEN1
    ## GO:0008016                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ATP2A1/ATP2A2/ATP2A3/ATP5PF/CACNA1C/CACNA1D/CALM1/CALM2/CALM3/NOS1
    ## GO:0032768                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           APOE/CALM1/CALM3/IL1B/SNCA/TNF
    ## GO:0051924                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ATP2A1/CACNA1C/CACNA1D/CALM1/CALM2/CALM3/CDK5/GRIN1/NOS1/PSEN2/SNCA
    ## GO:0018210                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            APP/CALM1/CALM2/CALM3/CDK5/CDK5R1/GSK3B/MAPK1
    ## GO:0034349                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     BID/CASP3/CASP9/CDK5
    ## GO:1901550                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  IL1B/PLCB1/TNF/TNFRSF1A
    ## GO:1903140                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  IL1B/PLCB1/TNF/TNFRSF1A
    ## GO:0032409                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    APP/ATP2A1/CACNA1D/CALM1/CALM2/CALM3/CAPN1/CDK5/CHP1/NDUFA4/NOS1/SNCA
    ## GO:0021543                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       BAD/CASP3/CDK5/CDK5R1/GSK3B/LRP1/PLCB1/PSEN1/UQCRQ
    ## GO:0048488                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      CALM1/CALM3/CDK5/PPP3CB/PPP3CC/SNCA
    ## GO:0140238                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      CALM1/CALM3/CDK5/PPP3CB/PPP3CC/SNCA
    ## GO:1900242                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                CALM1/CALM3/PPP3CB/PPP3CC
    ## GO:0006942                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ATP2A1/ATP2A2/CACNA1C/CALM1/CALM2/CALM3/NOS1
    ## GO:0097242                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    APOE/IDE/LRP1/MME/TNF
    ## GO:0032412                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         APP/ATP2A1/CACNA1D/CALM1/CALM2/CALM3/CAPN1/CDK5/CHP1/NDUFA4/NOS1
    ## GO:0034764                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ATP2A1/CALM1/CALM2/CALM3/CDK5/CHP1/NDUFA4/NOS1/PSEN1/SNCA
    ## GO:0038034                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              BAD/FADD/FAS/GSK3B/IL1B/TNF
    ## GO:0097192                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              BAD/FADD/FAS/GSK3B/IL1B/TNF
    ## GO:1901021                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ATP2A1/CALM1/CALM2/CALM3/CDK5
    ## GO:0060048                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     ATP2A1/ATP2A2/CACNA1C/CACNA1D/CALM1/CALM2/CALM3/NOS1
    ## GO:0045936                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               APOE/CALM1/CALM2/CALM3/CASP3/CHP1/GNAQ/GSK3B/IL1B/LRP1/MAPT/PSEN1/SNCA/TNF
    ## GO:0010523                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   CALM1/CALM2/CALM3/NOS1
    ## GO:0071241                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   APP/BACE1/BAD/CHP2/EIF2AK3/MAPK1/MAPK3/NCSTN/RYR3/SNCA
    ## GO:0010563                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               APOE/CALM1/CALM2/CALM3/CASP3/CHP1/GNAQ/GSK3B/IL1B/LRP1/MAPT/PSEN1/SNCA/TNF
    ## GO:1903829                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            CDK5/CDK5R1/CHP1/CHP2/EIF2AK3/GSK3B/LRP1/MAPK1/MAPT/PSEN1/TNF
    ## GO:0010522                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                CACNA1C/CALM1/CALM2/CALM3/GRIN1/NOS1/SNCA
    ## GO:0002027                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ATP2A2/ATP5PF/CACNA1C/CACNA1D/CALM1/CALM2/CALM3
    ## GO:0019233                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 BACE1/CDK5/GRIN2A/GRIN2D/MAPK1/MAPK3/MME
    ## GO:0032722                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ADAM17/APP/IL1B/LPL/LRP1/TNF
    ## GO:0007568                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         APAF1/APP/CASP7/CASP9/IDE/LRP1/MAPK1/MAPK3/MME/PPP3CA/PSEN1/SNCA
    ## GO:0007269                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ATP2A2/BACE1/CALM1/CALM3/CDK5/GSK3B/PSEN1/SNCA
    ## GO:0099643                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ATP2A2/BACE1/CALM1/CALM3/CDK5/GSK3B/PSEN1/SNCA
    ## GO:0046822                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    CDK5/CHP1/CHP2/GSK3B/IL1B/MAPK1/PSEN1
    ## GO:0010881                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                CACNA1C/CALM1/CALM2/CALM3
    ## GO:0031281                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               CACNA1C/CACNA1D/MAPK3/NOS1
    ## GO:0032496                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     ADAM17/ATP2A2/CAPN2/CASP3/CASP8/CASP9/IL1B/MAPK1/MAPK3/NOS1/SNCA/TNF
    ## GO:0050999                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                APOE/CALM1/CALM3/IL1B/TNF
    ## GO:0051341                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    APOE/CALM1/CALM3/IL1B/NDUFA4/SNCA/TNF
    ## GO:1904427                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ATP2A1/CALM1/CALM2/CALM3/CDK5/SNCA
    ## GO:0050905                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       APP/ATP2A1/ATP2A2/BACE1/GRIN2A/GRIN2C/GRIN2D/ITPR1
    ## GO:0060047                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ATP2A1/ATP2A2/ATP2A3/ATP5PF/CACNA1C/CACNA1D/CALM1/CALM2/CALM3/NOS1
    ## GO:0032414                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ATP2A1/CALM1/CALM2/CALM3/CDK5/CHP1/NDUFA4
    ## GO:0002082                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               COX7A1/COX7A2/COX7A2L/SNCA
    ## GO:0036465                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      CALM1/CALM3/CDK5/PPP3CB/PPP3CC/SNCA
    ## GO:0006984                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ATF6/ATP2A2/BID/EIF2AK3/GSK3B
    ## GO:1900271                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 APOE/APP/GSK3B/MME/NCSTN
    ## GO:1904064                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ATP2A1/CALM1/CALM2/CALM3/CDK5/CHP1/NOS1/SNCA
    ## GO:0071248                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       APP/BACE1/CHP2/EIF2AK3/MAPK1/MAPK3/NCSTN/RYR3/SNCA
    ## GO:0051000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     APOE/CALM1/CALM3/TNF
    ## GO:0010799                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              APP/CALM1/CALM2/CALM3/MAPK1
    ## GO:0021987                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   BAD/CDK5/CDK5R1/GSK3B/LRP1/PLCB1/PSEN1
    ## GO:0071900                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ADAM17/APOE/CALM1/CALM2/CALM3/CASP3/CDK5R1/ERN1/IL1B/PSEN1/SNCA/TNF
    ## GO:0003015                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ATP2A1/ATP2A2/ATP2A3/ATP5PF/CACNA1C/CACNA1D/CALM1/CALM2/CALM3/NOS1
    ## GO:0032388                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ATP2A1/CDK5/CDK5R1/CHP1/CHP2/GSK3B/IL1B/MAPK1/PSEN1
    ## GO:0051279                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      CACNA1C/CALM1/CALM2/CALM3/NOS1/SNCA
    ## GO:0086064                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                CACNA1C/CALM1/CALM2/CALM3
    ## GO:0043457                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           COX7A1/COX7A2/COX7A2L/IDE/SNCA
    ## GO:0002237                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     ADAM17/ATP2A2/CAPN2/CASP3/CASP8/CASP9/IL1B/MAPK1/MAPK3/NOS1/SNCA/TNF
    ## GO:1903522                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ATP2A1/ATP2A2/ATP2A3/ATP5PF/CACNA1C/CACNA1D/CALM1/CALM2/CALM3/NOS1
    ## GO:0007613                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                APOE/GRIN2A/ITPR3/MAPT/PLCB1/PPP3CB/PSEN1
    ## GO:0035637                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ATP2A1/ATP2A2/ATP2A3/CACNA1C/CACNA1D/CALM1/CALM2/CALM3
    ## GO:0090316                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             CDK5/CDK5R1/CHP1/CHP2/GSK3B/IL1B/MAPK1/PSEN1
    ## GO:0060314                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   CALM1/CALM2/CALM3/NOS1
    ## GO:0006836                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ATP2A2/BACE1/CALM1/CALM3/CDK5/GSK3B/NOS1/PSEN1/SNCA
    ## GO:0032025                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        CASP3/CASP8/CASP9
    ## GO:0051342                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        CALM1/CALM2/CALM3
    ## GO:0097250                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    COX7A1/COX7A2/COX7A2L
    ## GO:0032411                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ATP2A1/CALM1/CALM2/CALM3/CDK5/CHP1/NDUFA4
    ## GO:0048675                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  APOE/CDK5/CDK5R1/GSK3B/LRP1/MAPT/PPP3CB
    ## GO:0018105                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             APP/CDK5/CDK5R1/EIF2AK3/ERN1/GSK3B/MAPK1/MAPK3/NOS1/SNCA/TNF
    ## GO:0098901                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ATP2A2/CACNA1C/CALM1/CALM3
    ## GO:0030100                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   APOE/CALM1/CALM3/LRP1/PPP3CA/PPP3CB/PPP3CC/PPP3R1/SNCA
    ## GO:0001505                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ATP2A2/BACE1/CALM1/CALM3/CDK5/GSK3B/NOS1/PSEN1/SNCA
    ## GO:0010524                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             CALM1/CALM2/CALM3/GRIN1/SNCA
    ## GO:1903578                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     APP/COX7A1/COX7A2/COX7A2L/PSEN1/SNCA
    ## GO:0060315                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        CALM1/CALM2/CALM3
    ## GO:1901844                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        CALM1/CALM2/CALM3
    ## GO:2000343                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             LPL/LRP1/TNF
    ## GO:2000406                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ADAM10/ADAM17/APP/FADD
    ## GO:0097191                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           BAD/BID/CASP8/FADD/FAS/GSK3B/IL1B/TNF/TNFRSF1A
    ## GO:0042326                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         APOE/CALM1/CALM2/CALM3/CASP3/CHP1/GNAQ/IL1B/LRP1/MAPT/PSEN1/SNCA
    ## GO:0007219                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ADAM10/ADAM17/APH1A/APP/NCSTN/PSEN1/PSEN2/PSENEN
    ## GO:0035303                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    CALM1/CALM2/CALM3/CHP1/CHP2/GSK3B/TNF
    ## GO:0071214                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              BAD/CASP3/CASP8/CASP9/CHP1/FADD/FAS/IL1B/MAPK3/MME/TNFRSF1A
    ## GO:0104004                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              BAD/CASP3/CASP8/CASP9/CHP1/FADD/FAS/IL1B/MAPK3/MME/TNFRSF1A
    ## GO:0006099                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      SDHA/SDHB/SDHC/SDHD
    ## GO:0010880                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                CACNA1C/CALM1/CALM2/CALM3
    ## GO:0003012                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  APBB1/ATP2A1/ATP2A2/CACNA1C/CACNA1D/CACNA1S/CALM1/CALM2/CALM3/IL1B/NOS1/PPP3CA/TNFRSF1A
    ## GO:0071287                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        APP/BACE1/EIF2AK3
    ## GO:1990034                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        CALM1/CALM2/CALM3
    ## GO:0043666                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              CALM1/CALM2/CALM3/GSK3B/TNF
    ## GO:0086065                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        CACNA1C/CACNA1D/CALM1/CALM2/CALM3
    ## GO:0046777                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     CALM1/CALM2/CALM3/CDK5/CHP1/EIF2AK3/ERN1/GSK3B/MAPK3
    ## GO:1901019                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ATP2A1/CALM1/CALM2/CALM3/CDK5/NOS1
    ## GO:0018209                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             APP/CDK5/CDK5R1/EIF2AK3/ERN1/GSK3B/MAPK1/MAPK3/NOS1/SNCA/TNF
    ## GO:0006941                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     ATP2A1/ATP2A2/CACNA1C/CACNA1D/CALM1/CALM2/CALM3/NOS1
    ## GO:0045055                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ATP2A2/BACE1/CALM1/CALM3/CDK5/GSK3B/PPP3CB/PSEN1/SNCA
    ## GO:0002687                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ADAM10/ADAM17/APP/FADD/MAPK1/MAPK3/TNF
    ## GO:0010644                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                CACNA1C/CALM1/CALM2/CALM3
    ## GO:0001933                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              APOE/CALM1/CALM2/CALM3/CASP3/CHP1/GNAQ/IL1B/LRP1/PSEN1/SNCA
    ## GO:0030516                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         APOE/CDK5/CDK5R1/GSK3B/LRP1/MAPT
    ## GO:0033674                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ADAM17/BAD/CALM1/CALM2/CALM3/CDK5/CDK5R1/ERN1/IL1B/MAPT/PSEN1/SNCA/TNF
    ## GO:0005513                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        CALM1/CALM2/CALM3
    ## GO:0006983                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        BID/EIF2AK3/GSK3B
    ## GO:0051280                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        CALM1/CALM2/CALM3
    ## GO:0010959                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ATP2A1/CACNA1C/CACNA1D/CALM1/CALM2/CALM3/CDK5/CHP1/GRIN1/NOS1/PSEN2/SNCA
    ## GO:0001975                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                CALM1/CALM3/GRIN2A/PPP3CA
    ## GO:0051051                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               APOE/ATP5PF/CALM1/CALM2/CALM3/CDK5/CHP1/IL1B/NOS1/PPP3CA/SNCA/TNF/TNFRSF1A
    ## GO:0070482                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ADAM17/APAF1/BAD/CAPN2/CASP3/COX4I2/FAS/ITPR1/ITPR2/NDUFS2/NOS1
    ## GO:0046824                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              CHP2/GSK3B/IL1B/MAPK1/PSEN1
    ## GO:0016236                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ATP2A2/CALM1/CAPN1/CASP3/CDK5/CDK5R1/ERN1/GAPDH/MAPK3/PSEN1
    ## GO:0032642                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ADAM17/APP/IL1B/LPL/LRP1/TNF
    ## GO:0010922                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   CALM1/CALM2/CALM3/CHP2
    ## GO:0014808                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                CACNA1C/CALM1/CALM2/CALM3
    ## GO:0070884                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      CHP1/CHP2/GSK3B/TNF
    ## GO:0070059                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ATP2A1/ATP2A3/EIF2AK3/ERN1/ITPR1
    ## GO:0032602                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ADAM17/APP/IL1B/LPL/LRP1/TNF
    ## GO:0016241                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 CAPN1/CASP3/CDK5/CDK5R1/ERN1/GAPDH/MAPK3
    ## GO:0048148                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           CDK5/FADD/SNCA
    ## GO:0106056                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      CHP1/CHP2/GSK3B/TNF
    ## GO:1903514                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                CACNA1C/CALM1/CALM2/CALM3
    ## GO:2000403                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ADAM10/ADAM17/APP/FADD
    ## GO:0035418                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ADAM10/CDK5/GRIN2A/GRIN2C/MAPT
    ## GO:0071677                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ADAM10/ADAM17/APP/FADD/TNF
    ## GO:0071216                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       APAF1/BID/CAPN2/EIF2AK3/GSK3B/IL1B/MAPK1/MAPK3/TNF
    ## GO:0021537                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       BAD/CASP3/CDK5/CDK5R1/GSK3B/LRP1/PLCB1/PSEN1/UQCRQ
    ## GO:0051284                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        CALM1/CALM2/CALM3
    ## GO:0099170                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      PLCB1/PPP3CA/PPP3R1
    ## GO:1901660                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        CALM1/CALM2/CALM3
    ## GO:0071674                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ADAM10/ADAM17/APP/FADD/MAPK1/MAPK3/PLCB1/TNF
    ## GO:0043029                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    CASP3/FADD/FAS/PPP3CB
    ## GO:0031331                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               APOE/APP/ATF6/BAD/BID/GSK3B/IL1B/LRP1/MAPK3/PSEN1/SNCA/TNF
    ## GO:0032103                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ADAM10/ADAM17/APP/FADD/IL1B/LPL/LRP1/MAPK1/MAPK3/SNCA/TNF/TNFRSF1A
    ## GO:0009896                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           APOE/APP/ATF6/BAD/BID/GSK3B/IDE/IL1B/LRP1/MAPK3/PSEN1/SNCA/TNF
    ## GO:0071887                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ADAM17/CASP3/CASP7/CASP9/FADD/FAS
    ## GO:0090257                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ATP2A1/ATP2A2/CACNA1C/CALM1/CALM2/CALM3/NOS1/PPP3CA/TNFRSF1A
    ## GO:0071868                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         APP/GSK3B/MAPK1/MAPK3/NCSTN/SNCA
    ## GO:0071870                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         APP/GSK3B/MAPK1/MAPK3/NCSTN/SNCA
    ## GO:0034612                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ADAM10/ADAM17/CASP3/CASP8/FAS/MAPK1/MAPK3/TNF/TNFRSF1A
    ## GO:0010649                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        CALM1/CALM2/CALM3
    ## GO:0051044                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            APOE/IL1B/TNF
    ## GO:1905906                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           APOE/APP/PSEN1
    ## GO:0034976                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ATF6/ATP2A1/ATP2A2/ATP2A3/BID/EIF2AK3/ERN1/GSK3B/ITPR1
    ## GO:0061387                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         APOE/CDK5/CDK5R1/GSK3B/LRP1/MAPT
    ## GO:0071867                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         APP/GSK3B/MAPK1/MAPK3/NCSTN/SNCA
    ## GO:0071869                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         APP/GSK3B/MAPK1/MAPK3/NCSTN/SNCA
    ## GO:0051281                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   CALM1/CALM2/CALM3/SNCA
    ## GO:0070266                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       CASP8/FADD/FAS/TNF
    ## GO:0009416                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 APP/CACNA1F/CASP3/CASP7/CASP9/CDK5/GNAQ/GRIN1/GRIN2A/MME
    ## GO:0016042                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  APOE/HSD17B10/IL1B/LPL/LRP1/PLCB1/PLCB2/PLCB3/PLCB4/TNF
    ## GO:0071496                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 BAD/CASP8/EIF2AK3/FADD/FAS/IL1B/LPL/MAPK1/MAPK3/TNFRSF1A
    ## GO:0002685                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ADAM10/ADAM17/APP/FADD/MAPK1/MAPK3/PLCB1/TNF
    ## GO:0050807                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ADAM10/APOE/APP/CDK5/CDK5R1/GRIN2B/SNCA/TNF
    ## GO:0045860                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ADAM17/CALM1/CALM2/CALM3/CDK5/CDK5R1/ERN1/IL1B/PSEN1/SNCA/TNF
    ## GO:0046688                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   APP/ATP5F1D/BACE1/SNCA
    ## GO:0071312                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 CACNA1S/CASP3/CASP7/RYR3
    ## GO:2000404                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ADAM10/ADAM17/APP/FADD
    ## GO:0009749                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             BAD/CASP3/ERN1/LPL/LRP1/NDUFA9/PPP3CA/PPP3CB
    ## GO:0051348                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          APOE/CASP3/CHP1/GNAQ/GSK3B/IL1B/MAPT/PSEN1/SNCA
    ## GO:0030730                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             IL1B/LPL/TNF
    ## GO:0007006                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           BAD/BID/CALM1/CALM3/GSK3B/SNCA
    ## GO:0086001                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ATP2A2/CACNA1C/CACNA1D/CALM1/CALM3
    ## GO:0031952                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   CALM1/CALM2/CALM3/CHP1
    ## GO:1901983                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               GSK3B/IL1B/MAPK3/NOS1/SNCA
    ## GO:0009612                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             BACE1/BAD/CASP8/FADD/FAS/IL1B/MAPK3/TNFRSF1A
    ## GO:0008542                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    APP/CDK5/GRIN1/GRIN2A
    ## GO:0043112                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   APOE/CAPN1/CDK5/LRP1/PPP3R1/PSEN1/SNCA
    ## GO:0050803                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ADAM10/APOE/APP/CDK5/CDK5R1/GRIN2B/SNCA/TNF
    ## GO:0007213                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        CDK5R1/GNAQ/PLCB1
    ## GO:1900221                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            APOE/LRP1/TNF
    ## GO:0009746                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             BAD/CASP3/ERN1/LPL/LRP1/NDUFA9/PPP3CA/PPP3CB
    ## GO:0048538                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   FADD/MAPK1/MAPK3/PSEN1
    ## GO:0032386                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ATP2A1/CDK5/CDK5R1/CHP1/CHP2/GSK3B/IL1B/MAPK1/MAPK3/PSEN1
    ## GO:0062197                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ATP2A2/BAD/CASP3/EIF2AK3/ERN1/FAS/MAPK1/MAPK3/MAPT/SNCA
    ## GO:0006937                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ATP2A1/ATP2A2/CACNA1C/CALM1/CALM2/CALM3/NOS1
    ## GO:0021766                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            CASP3/CDK5/CDK5R1/GSK3B/UQCRQ
    ## GO:0001819                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ADAM17/APP/CASP8/EIF2AK3/FADD/GAPDH/IL1B/LPL/LRP1/PLCB1/PSEN1/TNF
    ## GO:0000302                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               APOE/BAD/CAPN2/CASP3/ERN1/MAPK1/MAPK3/MAPT
    ## GO:0034198                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  EIF2AK3/FAS/MAPK1/MAPK3
    ## GO:0035094                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      BAD/CASP3/MAPK1/TNF
    ## GO:0061028                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  IL1B/PLCB1/TNF/TNFRSF1A
    ## GO:0010042                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        APP/BACE1/EIF2AK3
    ## GO:0010801                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        CALM1/CALM2/CALM3
    ## GO:0072567                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             LPL/LRP1/TNF
    ## GO:2000341                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             LPL/LRP1/TNF
    ## GO:0006470                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  CALM1/CALM2/CALM3/GSK3B/PPP3CA/PPP3CB/PPP3CC/PPP3R1/TNF
    ## GO:1990138                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  APOE/CDK5/CDK5R1/GSK3B/LRP1/MAPT/PPP3CB
    ## GO:0034284                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             BAD/CASP3/ERN1/LPL/LRP1/NDUFA9/PPP3CA/PPP3CB
    ## GO:0046889                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 APOE/CAPN2/CHP1/IL1B/TNF
    ## GO:0001774                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        APP/MAPT/SNCA/TNF
    ## GO:0045601                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  IL1B/PLCB1/TNF/TNFRSF1A
    ## GO:0097300                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       CASP8/FADD/FAS/TNF
    ## GO:0006936                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       APBB1/ATP2A1/ATP2A2/CACNA1C/CACNA1D/CACNA1S/CALM1/CALM2/CALM3/NOS1
    ## GO:0032516                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        CALM1/CALM2/CALM3
    ## GO:0050849                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         CHP1/GSK3B/ITPR1
    ## GO:0033157                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             CDK5/CDK5R1/CHP1/CHP2/GSK3B/IL1B/MAPK1/PSEN1
    ## GO:0097061                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ADAM10/APOE/CDK5/CDK5R1/GRIN2B
    ## GO:0014075                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                CALM1/CALM3/GRIN2A/PPP3CA
    ## GO:1990928                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  EIF2AK3/FAS/MAPK1/MAPK3
    ## GO:0009266                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ATP2A2/CASP8/EIF2AK3/GSK3B/LPL/MAPT/NOS1
    ## GO:0034504                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   CDK5/CHP1/CHP2/EIF2AK3/GSK3B/MAPK1/PPP3CA/PPP3R1/PSEN1
    ## GO:0016311                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        CALM1/CALM2/CALM3/CHP1/CHP2/GSK3B/PPP3CA/PPP3CB/PPP3CC/PPP3R1/TNF
    ## GO:0030534                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          APP/CDK5/FADD/GRIN2D/NCSTN/SNCA
    ## GO:0048588                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              APOE/APP/CDK5/CDK5R1/GSK3B/LRP1/MAPT/PPP3CB
    ## GO:0060560                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              APOE/APP/CDK5/CDK5R1/GSK3B/LRP1/MAPT/PPP3CB
    ## GO:0010721                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  CDK5/CDK5R1/GSK3B/IL1B/PPP3CA/PSEN1/TNF
    ## GO:0007632                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    APP/CDK5/GRIN1/GRIN2A
    ## GO:0001776                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ADAM17/CASP3/FADD/FAS/PPP3CB
    ## GO:0051262                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          GRIN1/GRIN2B/HSD17B10/RYR3/SNCA
    ## GO:1904950                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          APOE/CDK5/CHP1/IL1B/MAPT/PPP3CA
    ## GO:2001233                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     BAD/BID/EIF2AK3/FADD/FAS/GSK3B/IL1B/NDUFS3/PSEN1/TNF
    ## GO:0033673                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                APOE/CASP3/CHP1/GNAQ/IL1B/MAPT/PSEN1/SNCA
    ## GO:0051349                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     CACNA1C/CACNA1D/NOS1
    ## GO:2001257                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    APP/CALM1/CALM2/CALM3/CAPN1/CDK5/NOS1
    ## GO:0001508                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ATP2A2/CACNA1C/CACNA1D/CALM1/CALM3/GNAQ
    ## GO:0035304                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              CALM1/CALM2/CALM3/GSK3B/TNF
    ## GO:0099175                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ADAM10/APOE/CDK5/CDK5R1/GRIN2B
    ## GO:0031345                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                APOE/CDK5/CDK5R1/GRIN2B/LRP1/PPP3CA/PSEN1
    ## GO:0006913                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      CDK5/CHP1/CHP2/GSK3B/IL1B/MAPK1/PPP3CA/PPP3R1/PSEN1
    ## GO:0051169                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      CDK5/CHP1/CHP2/GSK3B/IL1B/MAPK1/PPP3CA/PPP3R1/PSEN1
    ## GO:1900180                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      CHP1/CHP2/EIF2AK3/GSK3B/MAPK1/PSEN1
    ## GO:1903305                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ATP2A2/BACE1/CALM1/CALM3/CDK5/GSK3B
    ## GO:0016358                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ADAM10/APOE/APP/CDK5/CDK5R1/GSK3B/PPP3CA/PSEN1
    ## GO:0010288                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           APP/BACE1/MAPT
    ## GO:0051043                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            APOE/IL1B/TNF
    ## GO:0000086                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         APP/CALM1/CALM2/CALM3/NAE1/PLCB1
    ## GO:0045471                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      BAD/CASP8/GRIN1/GRIN2A/GRIN2B/ITPR2
    ## GO:0035065                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     IL1B/MAPK3/NOS1/SNCA
    ## GO:0001666                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     ADAM17/APAF1/BAD/CAPN2/CASP3/COX4I2/ITPR1/ITPR2/NOS1
    ## GO:0098900                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ATP2A2/CACNA1C/CALM1/CALM3
    ## GO:1902414                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ADAM10/CDK5/GRIN2A/GRIN2C/MAPT
    ## GO:0050768                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        CDK5/CDK5R1/IL1B/PPP3CA/PSEN1/TNF
    ## GO:0001964                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      BACE1/GRIN2A/GRIN2D
    ## GO:0010560                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         CHP1/NCSTN/PLCB1
    ## GO:0032872                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       APP/FAS/IL1B/MAPK1/MAPK3/PLCB1/TNF
    ## GO:0050729                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           APP/IL1B/LPL/SNCA/TNF/TNFRSF1A
    ## GO:0070302                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       APP/FAS/IL1B/MAPK1/MAPK3/PLCB1/TNF
    ## GO:0062013                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             APP/IL1B/NOS1/PSEN1/SNCA/TNF
    ## GO:0009743                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             BAD/CASP3/ERN1/LPL/LRP1/NDUFA9/PPP3CA/PPP3CB
    ## GO:0097305                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          BAD/CALM1/CALM3/CASP8/GRIN1/GRIN2A/GRIN2B/ITPR2
    ## GO:0006611                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     CDK5/CHP1/GSK3B/IL1B
    ## GO:0030900                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   APP/BAD/CASP3/CDK5/CDK5R1/GSK3B/LRP1/PLCB1/PSEN1/UQCRQ
    ## GO:0051961                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        CDK5/CDK5R1/IL1B/PPP3CA/PSEN1/TNF
    ## GO:0010559                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   BACE2/CHP1/NCSTN/PLCB1
    ## GO:0031954                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        CALM1/CALM2/CALM3
    ## GO:0008630                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               BAD/BID/CASP9/TNF/TNFRSF1A
    ## GO:0021549                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            CDK5/CDK5R1/NCSTN/PSEN1/UQCRQ
    ## GO:0033209                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ADAM17/CASP8/FAS/TNF/TNFRSF1A
    ## GO:0060996                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ADAM10/APOE/CDK5/CDK5R1/PSEN1
    ## GO:1903531                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    APOE/ATP5PF/IL1B/PPP3CA/SNCA/TNFRSF1A
    ## GO:0035306                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   CALM1/CALM2/CALM3/CHP2
    ## GO:0006473                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    APBB1/GSK3B/IL1B/MAPK3/MAPT/NOS1/SNCA
    ## GO:0045807                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             APOE/LRP1/PPP3CA/PPP3CC/SNCA
    ## GO:0044839                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         APP/CALM1/CALM2/CALM3/NAE1/PLCB1
    ## GO:0051384                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          BAD/CALM1/CALM3/CASP3/CASP9/TNF
    ## GO:0017157                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ATP2A2/BACE1/CALM1/CALM3/CDK5/GSK3B/SNCA
    ## GO:0036293                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     ADAM17/APAF1/BAD/CAPN2/CASP3/COX4I2/ITPR1/ITPR2/NOS1
    ## GO:0009314                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           APP/BACE1/CACNA1F/CASP3/CASP7/CASP9/CDK5/GNAQ/GRIN1/GRIN2A/MME
    ## GO:0031638                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    BAD/CASP8/FADD/GRIN2A
    ## GO:0031663                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     IL1B/MAPK1/MAPK3/TNF
    ## GO:0042306                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    CHP1/CHP2/MAPK1/PSEN1
    ## GO:0032801                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          APOE/CAPN1/CDK5
    ## GO:0071280                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           APP/BACE1/SNCA
    ## GO:1903020                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         CHP1/NCSTN/PLCB1
    ## GO:1903779                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     ATP2A1/ATP2A2/ATP2A3
    ## GO:0042176                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    APOE/GRIN2A/GRIN2C/GSK3B/IDE/IL1B/LRP1/PSEN1/SNCA/TNF
    ## GO:2000401                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ADAM10/ADAM17/APP/FADD
    ## GO:0017038                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 APOE/CHP1/CHP2/MAPK1/PPP3CA/PPP3R1/PSEN1
    ## GO:0035066                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          IL1B/MAPK3/NOS1
    ## GO:0095500                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        CDK5R1/GNAQ/PLCB1
    ## GO:0002260                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    CASP3/FADD/FAS/PPP3CB
    ## GO:0032731                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        APP/CASP8/LPL/TNF
    ## GO:0070265                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       CASP8/FADD/FAS/TNF
    ## GO:0048638                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         APOE/APP/CDK5/CDK5R1/GSK3B/LRP1/MAPK1/MAPT/PLCB1
    ## GO:0050770                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        CDK5/CDK5R1/GSK3B/LRP1/MAPT/PSEN1
    ## GO:0050708                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               APBB1/APOE/BAD/IL1B/LRP1/PPP3CA/PPP3CB/TNF
    ## GO:0061564                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            APBB1/APOE/APP/CASP3/CDK5/CDK5R1/GSK3B/LRP1/MAPT/PPP3CB/PSEN1
    ## GO:1904589                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    CHP1/CHP2/MAPK1/PSEN1
    ## GO:2000756                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     IL1B/MAPK3/NOS1/SNCA
    ## GO:0006606                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      CHP1/CHP2/MAPK1/PPP3CA/PPP3R1/PSEN1
    ## GO:1905477                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                CDK5/CDK5R1/CHP1/LRP1/TNF
    ## GO:0007176                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ADAM17/APP/PSEN1
    ## GO:0046825                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          CDK5/GSK3B/IL1B
    ## GO:0070498                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         IL1B/MAPK3/PLCB1
    ## GO:0090314                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         CDK5/CDK5R1/CHP1
    ## GO:0062012                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              APOE/APP/BAD/GSK3B/IL1B/NOS1/PSEN1/SNCA/TNF
    ## GO:0001885                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  IL1B/PLCB1/TNF/TNFRSF1A
    ## GO:1903018                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   BACE2/CHP1/NCSTN/PLCB1
    ## GO:0008637                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ATP2A1/BAD/BID/GSK3B/NDUFS1
    ## GO:0021761                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            CASP3/CDK5/CDK5R1/GSK3B/UQCRQ
    ## GO:0006469                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     APOE/CASP3/CHP1/GNAQ/IL1B/PSEN1/SNCA
    ## GO:0022037                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            CDK5/CDK5R1/NCSTN/PSEN1/UQCRQ
    ## GO:1905144                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        CDK5R1/GNAQ/PLCB1
    ## GO:1905145                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        CDK5R1/GNAQ/PLCB1
    ## GO:0051170                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      CHP1/CHP2/MAPK1/PPP3CA/PPP3R1/PSEN1
    ## GO:0072678                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ADAM10/ADAM17/APP/FADD
    ## GO:0006475                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          APBB1/IL1B/MAPK3/MAPT/NOS1/SNCA
    ## GO:0043271                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ATP5PF/CALM1/CALM2/CALM3/NOS1/SNCA
    ## GO:0031349                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                APP/FADD/IL1B/LPL/MAPK3/SNCA/TNF/TNFRSF1A
    ## GO:1901889                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            IL1B/LRP1/TNF
    ## GO:0010517                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     GNAQ/LRP1/PLCB2/SNCA
    ## GO:0032890                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ATP5PF/IL1B/PSEN1/SNCA
    ## GO:0051100                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ATP2A2/ATP2A3/GSK3B/MAPK3/PPP3CA/PSEN1
    ## GO:0016049                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ADAM10/ADAM17/APOE/APP/CDK5/CDK5R1/GSK3B/LRP1/MAPT/NDUFS3/PPP3CB
    ## GO:0051926                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   CALM1/CALM2/CALM3/NOS1
    ## GO:0050796                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          BAD/IL1B/LRP1/PPP3CA/PPP3CB/TNF
    ## GO:0007409                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  APBB1/APOE/APP/CDK5/CDK5R1/GSK3B/LRP1/MAPT/PPP3CB/PSEN1
    ## GO:0031960                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          BAD/CALM1/CALM3/CASP3/CASP9/TNF
    ## GO:0086004                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ATP2A1/ATP2A2/CACNA1C
    ## GO:2000758                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          IL1B/MAPK3/NOS1
    ## GO:0006887                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ATP2A2/BACE1/CALM1/CALM3/CDK5/GSK3B/PPP3CB/PSEN1/SNCA
    ## GO:0043200                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                BAD/CAPN2/CASP3/GRIN1/TNF
    ## GO:0072594                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 BID/CALM1/CALM3/CHP1/CHP2/MAPK1/MAPT/PPP3CA/PPP3R1/PSEN1
    ## GO:0033555                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   APOE/CAPN2/NOS1/PPP3CA
    ## GO:0021548                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             CDK5R1/UQCRQ
    ## GO:0060439                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              MAPK1/MAPK3
    ## GO:0071073                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               CAPN2/CHP1
    ## GO:0090647                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                APP/PSEN1
    ## GO:0098917                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               NOS1/PLCB1
    ## GO:1990535                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                APP/PSEN1
    ## GO:0044772                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ADAM17/APP/BID/CALM1/CALM2/CALM3/CDK5/NAE1/PLCB1/PPP3CA
    ## GO:0050808                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ADAM10/APOE/APP/CDK5/CDK5R1/GRIN2B/MAPT/PSEN1/SNCA/TNF
    ## GO:0071356                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ADAM17/CASP8/FAS/MAPK1/MAPK3/TNF/TNFRSF1A
    ## GO:0051048                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    APOE/ATP5PF/IL1B/PPP3CA/SNCA/TNFRSF1A
    ## GO:1901653                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             APP/BACE1/CDK5/GSK3B/IDE/IL1B/LPL/LRP1/PSEN1
    ## GO:0032732                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        APP/CASP8/LPL/TNF
    ## GO:0086003                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ATP2A1/ATP2A2/CACNA1C/CACNA1D
    ## GO:0045732                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       APOE/GSK3B/IDE/IL1B/LRP1/PSEN1/TNF
    ## GO:0010923                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           CHP1/GSK3B/TNF
    ## GO:0035774                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          BAD/LRP1/PPP3CB
    ## GO:0071402                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ADAM17/APOE/LPL
    ## GO:0090313                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         CDK5/CDK5R1/CHP1
    ## GO:1903539                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     ADAM10/GRIN2A/GRIN2C
    ## GO:0051881                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      BAD/BID/MAPT/NDUFS1
    ## GO:1905475                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ADAM10/CDK5/CDK5R1/CHP1/LRP1/TNF
    ## GO:0050767                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          CDK5/CDK5R1/IL1B/LRP1/MAPT/MME/PPP3CA/PSEN1/TNF
    ## GO:2001259                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   CALM1/CALM2/CALM3/CDK5
    ## GO:0062237                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     ADAM10/GRIN2A/GRIN2C
    ## GO:0001660                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 IL1B/TNF
    ## GO:0010918                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  BAD/BID
    ## GO:0031652                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 IL1B/TNF
    ## GO:0051610                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                NOS1/SNCA
    ## GO:0071313                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             CACNA1S/RYR3
    ## GO:0010508                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ATF6/BAD/BID/GSK3B/MAPK3
    ## GO:0098926                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        CDK5R1/GNAQ/PLCB1
    ## GO:0051403                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       APP/FAS/IL1B/MAPK1/MAPK3/PLCB1/TNF
    ## GO:0072593                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 GRIN1/MAPT/NDUFS1/NDUFS3/NDUFS4/SNCA/TNF
    ## GO:0051960                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  CDK5/CDK5R1/EIF2AK3/IL1B/LRP1/MAPT/MME/PPP3CA/PSEN1/TNF
    ## GO:2001235                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     BAD/BID/FADD/FAS/TNF
    ## GO:0008306                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    APP/CDK5/GRIN1/GRIN2A
    ## GO:0008361                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         APOE/CDK5/CDK5R1/GSK3B/LRP1/MAPT
    ## GO:1905952                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            APOE/ATP5PF/IL1B/LPL/LRP1/TNF
    ## GO:0016572                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          CDK5/IL1B/MAPK3
    ## GO:1903115                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ATP2A1/ATP2A2/CACNA1C
    ## GO:0010975                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ADAM10/APBB1/APOE/CDK5/CDK5R1/GSK3B/LRP1/MAPT/PPP3CA/PSEN1
    ## GO:0035270                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            BAD/EIF2AK3/GSK3B/MAPK1/MAPK3
    ## GO:0051224                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               APOE/CDK5/CHP1/IL1B/PPP3CA
    ## GO:0010642                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                LRP1/SNCA
    ## GO:0032306                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ATP5PF/IL1B
    ## GO:0033127                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               IL1B/MAPK3
    ## GO:0034370                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 APOE/LPL
    ## GO:0034372                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 APOE/LPL
    ## GO:0061307                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              MAPK1/MAPK3
    ## GO:0061308                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              MAPK1/MAPK3
    ## GO:0061517                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              MAPK1/MAPK3
    ## GO:0072584                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              MAPK1/MAPK3
    ## GO:1902950                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              APOE/GRIN2B
    ## GO:0043543                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    APBB1/GSK3B/IL1B/MAPK3/MAPT/NOS1/SNCA
    ## GO:1901020                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        CALM1/CALM2/CALM3
    ## GO:0030641                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ATP5F1B/CHP1/MAPK1/MAPK3
    ## GO:0031098                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       APP/FAS/IL1B/MAPK1/MAPK3/PLCB1/TNF
    ## GO:0042307                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         CHP2/MAPK1/PSEN1
    ## GO:1901385                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         CALM1/CALM3/CDK5
    ## GO:0021819                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              CDK5/CDK5R1
    ## GO:0036462                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               CASP8/FADD
    ## GO:0051481                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                LRP1/RYR3
    ## GO:1900103                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ATF6/ERN1
    ## GO:1900121                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ATP2A2/ATP2A3
    ## GO:1900272                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 APOE/APP
    ## GO:0021795                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        CDK5/CDK5R1/PSEN1
    ## GO:1900542                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      APP/NOS1/PSEN1/SNCA
    ## GO:0009410                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ADAM17/BAD/CASP3/GRIN1/GRIN2A/IL1B/LPL/NOS1/SNCA/UQCRC2
    ## GO:0001101                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                BAD/CAPN2/CASP3/GRIN1/TNF
    ## GO:0045981                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           APP/NOS1/PSEN1
    ## GO:1900544                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           APP/NOS1/PSEN1
    ## GO:1904591                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         CHP2/MAPK1/PSEN1
    ## GO:0097194                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  CASP3/CASP7/CASP8/CASP9
    ## GO:0006140                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      APP/NOS1/PSEN1/SNCA
    ## GO:0022406                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ATP2A2/CALM1/CHP1/PSEN2
    ## GO:0010977                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              APOE/CDK5/CDK5R1/LRP1/PSEN1
    ## GO:0001921                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               PSEN1/SNCA
    ## GO:0031650                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 IL1B/TNF
    ## GO:0051589                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                NOS1/SNCA
    ## GO:0071415                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             CACNA1S/RYR3
    ## GO:0030073                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          BAD/IL1B/LRP1/PPP3CA/PPP3CB/TNF
    ## GO:0019915                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        APOE/IL1B/LPL/TNF
    ## GO:0044070                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ATP5PF/IL1B/PSEN1/SNCA
    ## GO:1900182                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 CHP2/EIF2AK3/MAPK1/PSEN1
    ## GO:0090276                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          BAD/IL1B/LRP1/PPP3CA/PPP3CB/TNF
    ## GO:0035305                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           CHP1/GSK3B/TNF
    ## GO:0035307                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        CALM1/CALM2/CALM3
    ## GO:1901985                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          IL1B/MAPK3/NOS1
    ## GO:0019221                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ADAM17/BAD/CASP8/FADD/FAS/IL1B/MAPK3/PLCB1/TNF/TNFRSF1A
    ## GO:0046330                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       APP/IL1B/PLCB1/TNF
    ## GO:0032355                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                BAD/BID/CASP3/CASP8/CASP9
    ## GO:0031018                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        BAD/EIF2AK3/GSK3B
    ## GO:0002791                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          BAD/IL1B/LRP1/PPP3CA/PPP3CB/TNF
    ## GO:0010820                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ADAM10/ADAM17
    ## GO:0014733                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ATP2A2/PPP3CA
    ## GO:0032310                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ATP5PF/IL1B
    ## GO:0048308                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              MAPK1/MAPK3
    ## GO:0048313                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              MAPK1/MAPK3
    ## GO:0051290                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             GRIN1/GRIN2B
    ## GO:0070885                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               CHP1/GSK3B
    ## GO:0070886                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 CHP2/TNF
    ## GO:0106057                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               CHP1/GSK3B
    ## GO:0106058                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 CHP2/TNF
    ## GO:1901841                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              CALM1/CALM3
    ## GO:1903727                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               CAPN2/CHP1
    ## GO:1903799                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               PPP3CA/TNF
    ## GO:0046031                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      APP/BAD/GAPDH/PSEN1
    ## GO:0034763                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               CALM1/CALM2/CALM3/IL1B/TNF
    ## GO:0070555                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                APP/IL1B/MAPK3/PLCB1/SNCA
    ## GO:0090087                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          BAD/IL1B/LRP1/PPP3CA/PPP3CB/TNF
    ## GO:0046677                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        CASP3/CASP8/CASP9
    ## GO:0061001                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ADAM10/CDK5/CDK5R1
    ## GO:1903170                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        CALM1/CALM2/CALM3
    ## GO:0006885                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ATP5F1B/CHP1/MAPK1/MAPK3
    ## GO:0060191                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     GNAQ/LRP1/PLCB2/SNCA
    ## GO:0007612                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             APP/CDK5/GRIN1/GRIN2A/PPP3CB
    ## GO:1903351                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  GSK3B/MAPK1/MAPK3/NCSTN
    ## GO:1902003                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           APOE/CASP3/TNF
    ## GO:2001238                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             BID/FADD/TNF
    ## GO:0048813                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ADAM10/CDK5/CDK5R1/GSK3B/PPP3CA
    ## GO:0032755                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         APP/IL1B/LPL/TNF
    ## GO:1903350                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  GSK3B/MAPK1/MAPK3/NCSTN
    ## GO:0010819                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ADAM10/ADAM17
    ## GO:0017014                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               GAPDH/NOS1
    ## GO:0018119                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               GAPDH/NOS1
    ## GO:0034116                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 IL1B/TNF
    ## GO:0045651                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               CASP8/FADD
    ## GO:0045838                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  BAD/BID
    ## GO:0042110                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ADAM17/BAD/CASP3/CASP8/FADD/IL1B/NCSTN/PPP3CA/PPP3CB/PSEN1
    ## GO:0008038                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         APP/CASP3/CDK5R1
    ## GO:0009409                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        CASP8/EIF2AK3/LPL
    ## GO:0030225                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           APP/CASP8/FADD
    ## GO:0048168                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            APOE/APP/SNCA
    ## GO:0002690                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ADAM10/ADAM17/MAPK1/MAPK3
    ## GO:0032091                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ATP2A2/ATP2A3/GSK3B/MAPK3
    ## GO:0001558                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ADAM10/ADAM17/APOE/CDK5/CDK5R1/GSK3B/LRP1/MAPT/NDUFS3
    ## GO:1901215                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          APOE/CDK5/GSK3B/LRP1/PSEN1/SNCA
    ## GO:0014074                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            APP/CACNA1S/ITPR2/NDUFS4/RYR3
    ## GO:0045834                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 APOE/CAPN2/CHP1/IL1B/TNF
    ## GO:0060425                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          MAPK1/MAPK3/TNF
    ## GO:0046827                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               GSK3B/IL1B
    ## GO:0051580                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                NOS1/SNCA
    ## GO:0061577                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             CACNA1C/NOS1
    ## GO:1900034                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               GSK3B/MAPT
    ## GO:1903358                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              MAPK1/MAPK3
    ## GO:1904355                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              MAPK1/MAPK3
    ## GO:0030902                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            CDK5/CDK5R1/NCSTN/PSEN1/UQCRQ
    ## GO:0043535                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ADAM17/APOE/ATP5F1A/ATP5F1B/TNF
    ## GO:0071333                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              BAD/ERN1/LRP1/PPP3CA/PPP3CB
    ## GO:2001236                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  BID/FADD/GSK3B/IL1B/TNF
    ## GO:0051339                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     CACNA1C/CACNA1D/NOS1
    ## GO:0070252                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ATP2A1/ATP2A2/CACNA1C/CACNA1D
    ## GO:0016573                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               APBB1/IL1B/MAPK3/NOS1/SNCA
    ## GO:0071331                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              BAD/ERN1/LRP1/PPP3CA/PPP3CB
    ## GO:0045861                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   APP/CDK5/GAPDH/IDE/LRP1/PSEN1/SNCA/TNF
    ## GO:0030856                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              BAD/IL1B/PLCB1/TNF/TNFRSF1A
    ## GO:0071326                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              BAD/ERN1/LRP1/PPP3CA/PPP3CB
    ## GO:1903532                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     APBB1/BAD/CDK5/IL1B/LRP1/PPP3CB/SNCA
    ## GO:0001956                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                CDK5/SNCA
    ## GO:0015732                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ATP5PF/IL1B
    ## GO:0031000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             CACNA1S/RYR3
    ## GO:0031649                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 IL1B/TNF
    ## GO:0060438                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              MAPK1/MAPK3
    ## GO:0060546                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               CASP8/FADD
    ## GO:0071071                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               CAPN2/CHP1
    ## GO:0150078                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 IL1B/TNF
    ## GO:2000641                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              MAPK1/MAPK3
    ## GO:0008347                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         CDK5/CDK5R1/LRP1
    ## GO:0070839                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        CALM1/CALM2/CALM3
    ## GO:0002064                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        BAD/GSK3B/IL1B/PLCB1/TNF/TNFRSF1A
    ## GO:0018393                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               APBB1/IL1B/MAPK3/NOS1/SNCA
    ## GO:0009306                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               APBB1/APOE/BAD/IL1B/LRP1/PPP3CA/PPP3CB/TNF
    ## GO:0035592                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               APBB1/APOE/BAD/IL1B/LRP1/PPP3CA/PPP3CB/TNF
    ## GO:0010759                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              MAPK1/MAPK3
    ## GO:0010829                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 IL1B/TNF
    ## GO:0030220                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              CASP3/CASP9
    ## GO:0032026                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                RYR3/SNCA
    ## GO:0036344                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              CASP3/CASP9
    ## GO:0045821                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                APP/PSEN1
    ## GO:0062099                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               CASP8/FADD
    ## GO:0140131                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ADAM10/ADAM17
    ## GO:0009135                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      APP/BAD/GAPDH/PSEN1
    ## GO:0009179                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      APP/BAD/GAPDH/PSEN1
    ## GO:0030004                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ATP5F1B/CHP1/MAPK1/MAPK3
    ## GO:0032760                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       APP/FADD/LPL/PSEN1
    ## GO:0031113                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         CDK5R1/MAPT/SNCA
    ## GO:0042220                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           CDK5/FADD/SNCA
    ## GO:1902991                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           APOE/CASP3/TNF
    ## GO:0002274                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ADAM10/APP/MAPT/PSEN1/SNCA/TNF
    ## GO:0050673                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ADAM17/APOE/ATP5F1A/BAD/ERN1/MAPK1/NCSTN/PSEN1/TNF
    ## GO:2001234                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          BID/GSK3B/IL1B/NDUFS3/PSEN1/TNF
    ## GO:0022029                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        CDK5/CDK5R1/PSEN1
    ## GO:0043388                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        CALM1/CALM2/CALM3
    ## GO:0071322                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              BAD/ERN1/LRP1/PPP3CA/PPP3CB
    ## GO:0006837                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                NOS1/SNCA
    ## GO:0046931                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ADAM10/BAD
    ## GO:0060252                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 IL1B/TNF
    ## GO:1901386                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              CALM1/CALM3
    ## GO:1902004                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                CASP3/TNF
    ## GO:0009185                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      APP/BAD/GAPDH/PSEN1
    ## GO:0042116                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        APP/MAPT/SNCA/TNF
    ## GO:0050879                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ATP2A1/ATP2A2/ITPR1
    ## GO:0050881                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ATP2A1/ATP2A2/ITPR1
    ##            Count
    ## GO:0006119    75
    ## GO:0009060    77
    ## GO:0046034    82
    ## GO:0045333    78
    ## GO:0019646    60
    ## GO:0042773    61
    ## GO:0042775    61
    ## GO:0022904    63
    ## GO:0015980    79
    ## GO:0022900    66
    ## GO:0006091    82
    ## GO:0006120    35
    ## GO:0010257    28
    ## GO:0032981    28
    ## GO:0033108    29
    ## GO:1902600    32
    ## GO:0006123    14
    ## GO:0015985    12
    ## GO:0015986    12
    ## GO:0006122     9
    ## GO:0019932    25
    ## GO:0019722    21
    ## GO:0070588    24
    ## GO:0010952    20
    ## GO:0070997    25
    ## GO:0050804    27
    ## GO:0099177    27
    ## GO:0010950    19
    ## GO:0006509    12
    ## GO:0045862    24
    ## GO:0050435    13
    ## GO:0006816    25
    ## GO:0042776     9
    ## GO:0060401    18
    ## GO:0006754    12
    ## GO:0033619    12
    ## GO:2001056    16
    ## GO:0009206    12
    ## GO:0009145    12
    ## GO:0048167    17
    ## GO:0048016    11
    ## GO:0097553    15
    ## GO:0009201    12
    ## GO:1901216    13
    ## GO:0051402    18
    ## GO:0006874    23
    ## GO:0009205    12
    ## GO:0010038    21
    ## GO:0060402    15
    ## GO:0055074    23
    ## GO:0009142    12
    ## GO:0016485    17
    ## GO:0009144    12
    ## GO:0042987    11
    ## GO:0009199    12
    ## GO:0072503    23
    ## GO:0007215    10
    ## GO:0042982    12
    ## GO:0060291    12
    ## GO:0034205    10
    ## GO:0052547    22
    ## GO:0006919    11
    ## GO:0051604    18
    ## GO:0052548    21
    ## GO:0042391    21
    ## GO:0050806    14
    ## GO:2000116    16
    ## GO:0009141    12
    ## GO:1901214    18
    ## GO:0006164    14
    ## GO:0043280    12
    ## GO:0072522    14
    ## GO:0007204    17
    ## GO:0009152    13
    ## GO:0035235     7
    ## GO:0051235    17
    ## GO:0033173     8
    ## GO:0051651    14
    ## GO:0009165    15
    ## GO:0050890    16
    ## GO:0007611    15
    ## GO:1901293    15
    ## GO:0009260    13
    ## GO:0097720     8
    ## GO:0006163    18
    ## GO:0051208    11
    ## GO:0051480    17
    ## GO:0046390    13
    ## GO:0050848     9
    ## GO:0060079    10
    ## GO:0009150    17
    ## GO:0072521    18
    ## GO:1990542    10
    ## GO:0099565    10
    ## GO:0009259    17
    ## GO:0009117    19
    ## GO:0006839    14
    ## GO:0006753    19
    ## GO:0019693    17
    ## GO:0051209    10
    ## GO:0051283    10
    ## GO:0048143     6
    ## GO:0051282    10
    ## GO:0048857     8
    ## GO:0021762     7
    ## GO:1903421     6
    ## GO:0099003    12
    ## GO:0043281    12
    ## GO:0060078    10
    ## GO:0042063    14
    ## GO:0031279     7
    ## GO:0099504    11
    ## GO:0048708     8
    ## GO:0010506    14
    ## GO:0043270    13
    ## GO:0021782     9
    ## GO:0051353     7
    ## GO:0034765    17
    ## GO:0030901     8
    ## GO:0097193    13
    ## GO:0070509     8
    ## GO:0006979    16
    ## GO:0070296     6
    ## GO:0106027     8
    ## GO:0034767    10
    ## GO:0043467     9
    ## GO:0014002     6
    ## GO:0051222    13
    ## GO:0061337     8
    ## GO:0043523    11
    ## GO:0032469     5
    ## GO:1904062    14
    ## GO:0051588     8
    ## GO:1904646     6
    ## GO:0051099    10
    ## GO:0051098    14
    ## GO:0010882     5
    ## GO:0016079     8
    ## GO:1904951    13
    ## GO:0010001    11
    ## GO:0055117     7
    ## GO:0022898    12
    ## GO:0051592     9
    ## GO:0010800     5
    ## GO:0071260     7
    ## GO:0043279     8
    ## GO:0071675     8
    ## GO:0008625     7
    ## GO:2000300     6
    ## GO:0018107     8
    ## GO:0043393    10
    ## GO:0010921     7
    ## GO:0032092     7
    ## GO:1904645     6
    ## GO:0071902    10
    ## GO:1903715     5
    ## GO:1903169     9
    ## GO:0046928     7
    ## GO:0097202     4
    ## GO:0023061    15
    ## GO:0051928     8
    ## GO:0043525     6
    ## GO:0032770     5
    ## GO:1990000     5
    ## GO:0008016    10
    ## GO:0032768     6
    ## GO:0051924    11
    ## GO:0018210     8
    ## GO:0034349     4
    ## GO:1901550     4
    ## GO:1903140     4
    ## GO:0032409    12
    ## GO:0021543     9
    ## GO:0048488     6
    ## GO:0140238     6
    ## GO:1900242     4
    ## GO:0006942     7
    ## GO:0097242     5
    ## GO:0032412    11
    ## GO:0034764    10
    ## GO:0038034     6
    ## GO:0097192     6
    ## GO:1901021     5
    ## GO:0060048     8
    ## GO:0045936    14
    ## GO:0010523     4
    ## GO:0071241    10
    ## GO:0010563    14
    ## GO:1903829    11
    ## GO:0010522     7
    ## GO:0002027     7
    ## GO:0019233     7
    ## GO:0032722     6
    ## GO:0007568    12
    ## GO:0007269     8
    ## GO:0099643     8
    ## GO:0046822     7
    ## GO:0010881     4
    ## GO:0031281     4
    ## GO:0032496    12
    ## GO:0050999     5
    ## GO:0051341     7
    ## GO:1904427     6
    ## GO:0050905     8
    ## GO:0060047    10
    ## GO:0032414     7
    ## GO:0002082     4
    ## GO:0036465     6
    ## GO:0006984     5
    ## GO:1900271     5
    ## GO:1904064     8
    ## GO:0071248     9
    ## GO:0051000     4
    ## GO:0010799     5
    ## GO:0021987     7
    ## GO:0071900    12
    ## GO:0003015    10
    ## GO:0032388     9
    ## GO:0051279     6
    ## GO:0086064     4
    ## GO:0043457     5
    ## GO:0002237    12
    ## GO:1903522    10
    ## GO:0007613     7
    ## GO:0035637     8
    ## GO:0090316     8
    ## GO:0060314     4
    ## GO:0006836     9
    ## GO:0032025     3
    ## GO:0051342     3
    ## GO:0097250     3
    ## GO:0032411     7
    ## GO:0048675     7
    ## GO:0018105    11
    ## GO:0098901     4
    ## GO:0030100     9
    ## GO:0001505     9
    ## GO:0010524     5
    ## GO:1903578     6
    ## GO:0060315     3
    ## GO:1901844     3
    ## GO:2000343     3
    ## GO:2000406     4
    ## GO:0097191     9
    ## GO:0042326    12
    ## GO:0007219     8
    ## GO:0035303     7
    ## GO:0071214    11
    ## GO:0104004    11
    ## GO:0006099     4
    ## GO:0010880     4
    ## GO:0003012    13
    ## GO:0071287     3
    ## GO:1990034     3
    ## GO:0043666     5
    ## GO:0086065     5
    ## GO:0046777     9
    ## GO:1901019     6
    ## GO:0018209    11
    ## GO:0006941     8
    ## GO:0045055     9
    ## GO:0002687     7
    ## GO:0010644     4
    ## GO:0001933    11
    ## GO:0030516     6
    ## GO:0033674    13
    ## GO:0005513     3
    ## GO:0006983     3
    ## GO:0051280     3
    ## GO:0010959    12
    ## GO:0001975     4
    ## GO:0051051    13
    ## GO:0070482    11
    ## GO:0046824     5
    ## GO:0016236    10
    ## GO:0032642     6
    ## GO:0010922     4
    ## GO:0014808     4
    ## GO:0070884     4
    ## GO:0070059     5
    ## GO:0032602     6
    ## GO:0016241     7
    ## GO:0048148     3
    ## GO:0106056     4
    ## GO:1903514     4
    ## GO:2000403     4
    ## GO:0035418     5
    ## GO:0071677     5
    ## GO:0071216     9
    ## GO:0021537     9
    ## GO:0051284     3
    ## GO:0099170     3
    ## GO:1901660     3
    ## GO:0071674     8
    ## GO:0043029     4
    ## GO:0031331    12
    ## GO:0032103    12
    ## GO:0009896    13
    ## GO:0071887     6
    ## GO:0090257     9
    ## GO:0071868     6
    ## GO:0071870     6
    ## GO:0034612     9
    ## GO:0010649     3
    ## GO:0051044     3
    ## GO:1905906     3
    ## GO:0034976     9
    ## GO:0061387     6
    ## GO:0071867     6
    ## GO:0071869     6
    ## GO:0051281     4
    ## GO:0070266     4
    ## GO:0009416    10
    ## GO:0016042    10
    ## GO:0071496    10
    ## GO:0002685     8
    ## GO:0050807     8
    ## GO:0045860    11
    ## GO:0046688     4
    ## GO:0071312     4
    ## GO:2000404     4
    ## GO:0009749     8
    ## GO:0051348     9
    ## GO:0030730     3
    ## GO:0007006     6
    ## GO:0086001     5
    ## GO:0031952     4
    ## GO:1901983     5
    ## GO:0009612     8
    ## GO:0008542     4
    ## GO:0043112     7
    ## GO:0050803     8
    ## GO:0007213     3
    ## GO:1900221     3
    ## GO:0009746     8
    ## GO:0048538     4
    ## GO:0032386    10
    ## GO:0062197    10
    ## GO:0006937     7
    ## GO:0021766     5
    ## GO:0001819    12
    ## GO:0000302     8
    ## GO:0034198     4
    ## GO:0035094     4
    ## GO:0061028     4
    ## GO:0010042     3
    ## GO:0010801     3
    ## GO:0072567     3
    ## GO:2000341     3
    ## GO:0006470     9
    ## GO:1990138     7
    ## GO:0034284     8
    ## GO:0046889     5
    ## GO:0001774     4
    ## GO:0045601     4
    ## GO:0097300     4
    ## GO:0006936    10
    ## GO:0032516     3
    ## GO:0050849     3
    ## GO:0033157     8
    ## GO:0097061     5
    ## GO:0014075     4
    ## GO:1990928     4
    ## GO:0009266     7
    ## GO:0034504     9
    ## GO:0016311    11
    ## GO:0030534     6
    ## GO:0048588     8
    ## GO:0060560     8
    ## GO:0010721     7
    ## GO:0007632     4
    ## GO:0001776     5
    ## GO:0051262     5
    ## GO:1904950     6
    ## GO:2001233    10
    ## GO:0033673     8
    ## GO:0051349     3
    ## GO:2001257     7
    ## GO:0001508     6
    ## GO:0035304     5
    ## GO:0099175     5
    ## GO:0031345     7
    ## GO:0006913     9
    ## GO:0051169     9
    ## GO:1900180     6
    ## GO:1903305     6
    ## GO:0016358     8
    ## GO:0010288     3
    ## GO:0051043     3
    ## GO:0000086     6
    ## GO:0045471     6
    ## GO:0035065     4
    ## GO:0001666     9
    ## GO:0098900     4
    ## GO:1902414     5
    ## GO:0050768     6
    ## GO:0001964     3
    ## GO:0010560     3
    ## GO:0032872     7
    ## GO:0050729     6
    ## GO:0070302     7
    ## GO:0062013     6
    ## GO:0009743     8
    ## GO:0097305     8
    ## GO:0006611     4
    ## GO:0030900    10
    ## GO:0051961     6
    ## GO:0010559     4
    ## GO:0031954     3
    ## GO:0008630     5
    ## GO:0021549     5
    ## GO:0033209     5
    ## GO:0060996     5
    ## GO:1903531     6
    ## GO:0035306     4
    ## GO:0006473     7
    ## GO:0045807     5
    ## GO:0044839     6
    ## GO:0051384     6
    ## GO:0017157     7
    ## GO:0036293     9
    ## GO:0009314    11
    ## GO:0031638     4
    ## GO:0031663     4
    ## GO:0042306     4
    ## GO:0032801     3
    ## GO:0071280     3
    ## GO:1903020     3
    ## GO:1903779     3
    ## GO:0042176    10
    ## GO:2000401     4
    ## GO:0017038     7
    ## GO:0035066     3
    ## GO:0095500     3
    ## GO:0002260     4
    ## GO:0032731     4
    ## GO:0070265     4
    ## GO:0048638     9
    ## GO:0050770     6
    ## GO:0050708     8
    ## GO:0061564    11
    ## GO:1904589     4
    ## GO:2000756     4
    ## GO:0006606     6
    ## GO:1905477     5
    ## GO:0007176     3
    ## GO:0046825     3
    ## GO:0070498     3
    ## GO:0090314     3
    ## GO:0062012     9
    ## GO:0001885     4
    ## GO:1903018     4
    ## GO:0008637     5
    ## GO:0021761     5
    ## GO:0006469     7
    ## GO:0022037     5
    ## GO:1905144     3
    ## GO:1905145     3
    ## GO:0051170     6
    ## GO:0072678     4
    ## GO:0006475     6
    ## GO:0043271     6
    ## GO:0031349     8
    ## GO:1901889     3
    ## GO:0010517     4
    ## GO:0032890     4
    ## GO:0051100     6
    ## GO:0016049    11
    ## GO:0051926     4
    ## GO:0050796     6
    ## GO:0007409    10
    ## GO:0031960     6
    ## GO:0086004     3
    ## GO:2000758     3
    ## GO:0006887     9
    ## GO:0043200     5
    ## GO:0072594    10
    ## GO:0033555     4
    ## GO:0021548     2
    ## GO:0060439     2
    ## GO:0071073     2
    ## GO:0090647     2
    ## GO:0098917     2
    ## GO:1990535     2
    ## GO:0044772    10
    ## GO:0050808    10
    ## GO:0071356     7
    ## GO:0051048     6
    ## GO:1901653     9
    ## GO:0032732     4
    ## GO:0086003     4
    ## GO:0045732     7
    ## GO:0010923     3
    ## GO:0035774     3
    ## GO:0071402     3
    ## GO:0090313     3
    ## GO:1903539     3
    ## GO:0051881     4
    ## GO:1905475     6
    ## GO:0050767     9
    ## GO:2001259     4
    ## GO:0062237     3
    ## GO:0001660     2
    ## GO:0010918     2
    ## GO:0031652     2
    ## GO:0051610     2
    ## GO:0071313     2
    ## GO:0010508     5
    ## GO:0098926     3
    ## GO:0051403     7
    ## GO:0072593     7
    ## GO:0051960    10
    ## GO:2001235     5
    ## GO:0008306     4
    ## GO:0008361     6
    ## GO:1905952     6
    ## GO:0016572     3
    ## GO:1903115     3
    ## GO:0010975    10
    ## GO:0035270     5
    ## GO:0051224     5
    ## GO:0010642     2
    ## GO:0032306     2
    ## GO:0033127     2
    ## GO:0034370     2
    ## GO:0034372     2
    ## GO:0061307     2
    ## GO:0061308     2
    ## GO:0061517     2
    ## GO:0072584     2
    ## GO:1902950     2
    ## GO:0043543     7
    ## GO:1901020     3
    ## GO:0030641     4
    ## GO:0031098     7
    ## GO:0042307     3
    ## GO:1901385     3
    ## GO:0021819     2
    ## GO:0036462     2
    ## GO:0051481     2
    ## GO:1900103     2
    ## GO:1900121     2
    ## GO:1900272     2
    ## GO:0021795     3
    ## GO:1900542     4
    ## GO:0009410    10
    ## GO:0001101     5
    ## GO:0045981     3
    ## GO:1900544     3
    ## GO:1904591     3
    ## GO:0097194     4
    ## GO:0006140     4
    ## GO:0022406     4
    ## GO:0010977     5
    ## GO:0001921     2
    ## GO:0031650     2
    ## GO:0051589     2
    ## GO:0071415     2
    ## GO:0030073     6
    ## GO:0019915     4
    ## GO:0044070     4
    ## GO:1900182     4
    ## GO:0090276     6
    ## GO:0035305     3
    ## GO:0035307     3
    ## GO:1901985     3
    ## GO:0019221    10
    ## GO:0046330     4
    ## GO:0032355     5
    ## GO:0031018     3
    ## GO:0002791     6
    ## GO:0010820     2
    ## GO:0014733     2
    ## GO:0032310     2
    ## GO:0048308     2
    ## GO:0048313     2
    ## GO:0051290     2
    ## GO:0070885     2
    ## GO:0070886     2
    ## GO:0106057     2
    ## GO:0106058     2
    ## GO:1901841     2
    ## GO:1903727     2
    ## GO:1903799     2
    ## GO:0046031     4
    ## GO:0034763     5
    ## GO:0070555     5
    ## GO:0090087     6
    ## GO:0046677     3
    ## GO:0061001     3
    ## GO:1903170     3
    ## GO:0006885     4
    ## GO:0060191     4
    ## GO:0007612     5
    ## GO:1903351     4
    ## GO:1902003     3
    ## GO:2001238     3
    ## GO:0048813     5
    ## GO:0032755     4
    ## GO:1903350     4
    ## GO:0010819     2
    ## GO:0017014     2
    ## GO:0018119     2
    ## GO:0034116     2
    ## GO:0045651     2
    ## GO:0045838     2
    ## GO:0042110    10
    ## GO:0008038     3
    ## GO:0009409     3
    ## GO:0030225     3
    ## GO:0048168     3
    ## GO:0002690     4
    ## GO:0032091     4
    ## GO:0001558     9
    ## GO:1901215     6
    ## GO:0014074     5
    ## GO:0045834     5
    ## GO:0060425     3
    ## GO:0046827     2
    ## GO:0051580     2
    ## GO:0061577     2
    ## GO:1900034     2
    ## GO:1903358     2
    ## GO:1904355     2
    ## GO:0030902     5
    ## GO:0043535     5
    ## GO:0071333     5
    ## GO:2001236     5
    ## GO:0051339     3
    ## GO:0070252     4
    ## GO:0016573     5
    ## GO:0071331     5
    ## GO:0045861     8
    ## GO:0030856     5
    ## GO:0071326     5
    ## GO:1903532     7
    ## GO:0001956     2
    ## GO:0015732     2
    ## GO:0031000     2
    ## GO:0031649     2
    ## GO:0060438     2
    ## GO:0060546     2
    ## GO:0071071     2
    ## GO:0150078     2
    ## GO:2000641     2
    ## GO:0008347     3
    ## GO:0070839     3
    ## GO:0002064     6
    ## GO:0018393     5
    ## GO:0009306     8
    ## GO:0035592     8
    ## GO:0010759     2
    ## GO:0010829     2
    ## GO:0030220     2
    ## GO:0032026     2
    ## GO:0036344     2
    ## GO:0045821     2
    ## GO:0062099     2
    ## GO:0140131     2
    ## GO:0009135     4
    ## GO:0009179     4
    ## GO:0030004     4
    ## GO:0032760     4
    ## GO:0031113     3
    ## GO:0042220     3
    ## GO:1902991     3
    ## GO:0002274     6
    ## GO:0050673     9
    ## GO:2001234     6
    ## GO:0022029     3
    ## GO:0043388     3
    ## GO:0071322     5
    ## GO:0006837     2
    ## GO:0046931     2
    ## GO:0060252     2
    ## GO:1901386     2
    ## GO:1902004     2
    ## GO:0009185     4
    ## GO:0042116     4
    ## GO:0050879     3
    ## GO:0050881     3

    result %>% dotplot()

![](03-bio_files/figure-markdown_strict/unnamed-chunk-4-1.png)

    result %>% cnetplot()

![](03-bio_files/figure-markdown_strict/unnamed-chunk-5-1.png)

Now, we would like to see the overlap between the genes in the top 5
enriched categories.

    require(ComplexHeatmap)

    ## Loading required package: ComplexHeatmap

    ## Loading required package: grid

    ## ========================================
    ## ComplexHeatmap version 2.10.0
    ## Bioconductor page: http://bioconductor.org/packages/ComplexHeatmap/
    ## Github page: https://github.com/jokergoo/ComplexHeatmap
    ## Documentation: http://jokergoo.github.io/ComplexHeatmap-reference
    ## 
    ## If you use it in published research, please cite:
    ## Gu, Z. Complex heatmaps reveal patterns and correlations in multidimensional 
    ##   genomic data. Bioinformatics 2016.
    ## 
    ## The new InteractiveComplexHeatmap package can directly export static 
    ## complex heatmaps into an interactive Shiny app with zero effort. Have a try!
    ## 
    ## This message can be suppressed by:
    ##   suppressPackageStartupMessages(library(ComplexHeatmap))
    ## ========================================

    # extract lists of genes in top enriched terms
    terms_oi = result %>% as.data.frame() %>% filter(p.adjust<0.05) %>% slice_max(Count, n=10)
    terms_oi = terms_oi %>% group_by(Description) %>% summarize(genes=strsplit(geneID, split="/")) %>% ungroup()
    terms_oi = sapply(terms_oi[["Description"]], 
                      function(genes){ terms_oi[["genes"]][[1]]}, simplify=FALSE)

    # prepare inputs
    terms_oi = terms_oi %>% 
        list_to_matrix() %>% 
        make_comb_mat()
      
    # plot
    plt = terms_oi %>% UpSet()
    plt

![](03-bio_files/figure-markdown_strict/unnamed-chunk-6-1.png)

Phylogenetic trees with `ggtree`
================================

Trees are another very common plot to visualize hierarchical patterns.
Here, we will use
[`ggtree`](https://guangchuangyu.github.io/ggtree-book/chapter-ggtree.html)
to visualize the phylogenetic relationships extracted from a multiple
sequence alignment of *TP53* across mammals.

Basic tree
----------

    require(ggtree)
    set.seed(100)
    tree <- rtree(50)
    ggtree(tree, layout="circular") + geom_tiplab()

![](03-bio_files/figure-markdown_strict/unnamed-chunk-7-1.png)

Tree and multiple sequence alignment of *TP53* amino acids
----------------------------------------------------------

We will follow [Russell J.
Gray](https://github.com/RussellGrayxd/Phylogenetics/blob/master/Sequence%20analysis.R)'s
approach.

    require(seqinr)
    require(ape)

    # create tree from alignment
    fasta_file = file.path(here::here(), "data", "raw", "TP53-mammals-alignment-aa.fa")
    aln = read.alignment(fasta_file, format = "fasta", whole.header=TRUE)
    D = dist.alignment(aln)
    tree = njs(D)

    # plot tree with MSA
    tree_plot = ggtree(tree)
    msaplot(tree_plot, fasta = fasta_file) + ggtitle("tree with MSA")

![](03-bio_files/figure-markdown_strict/unnamed-chunk-8-1.png)

References
==========

-   [Gene set
    used](https://www.gsea-msigdb.org/gsea/msigdb/cards/KEGG_ALZHEIMERS_DISEASE)
-   [`ggtree`](https://guangchuangyu.github.io/ggtree-book/chapter-ggtree.html)
-   [`seqinr`](https://seqinr.r-forge.r-project.org/)
-   [`ape`](https://www.rdocumentation.org/packages/ape/versions/5.4-1)
-   [`Biostrings`](https://bioconductor.org/packages/release/bioc/html/Biostrings.html)
-   [`Russell J. Gray's github`](https://github.com/RussellGrayxd)
-   [`clusterProfiler`](https://bioconductor.org/packages/release/bioc/html/clusterProfiler.html)

Session Info
============

    sessionInfo()

    ## R version 4.1.2 (2021-11-01)
    ## Platform: x86_64-pc-linux-gnu (64-bit)
    ## Running under: Ubuntu 18.04.6 LTS
    ## 
    ## Matrix products: default
    ## BLAS:   /usr/lib/x86_64-linux-gnu/openblas/libblas.so.3
    ## LAPACK: /usr/lib/x86_64-linux-gnu/libopenblasp-r0.2.20.so
    ## 
    ## locale:
    ##  [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C              
    ##  [3] LC_TIME=en_GB.UTF-8        LC_COLLATE=en_US.UTF-8    
    ##  [5] LC_MONETARY=en_GB.UTF-8    LC_MESSAGES=en_US.UTF-8   
    ##  [7] LC_PAPER=en_GB.UTF-8       LC_NAME=C                 
    ##  [9] LC_ADDRESS=C               LC_TELEPHONE=C            
    ## [11] LC_MEASUREMENT=en_GB.UTF-8 LC_IDENTIFICATION=C       
    ## 
    ## attached base packages:
    ## [1] grid      stats4    stats     graphics  grDevices utils     datasets 
    ## [8] methods   base     
    ## 
    ## other attached packages:
    ##  [1] ape_5.6-2             seqinr_4.2-8          ggtree_3.2.1         
    ##  [4] ComplexHeatmap_2.10.0 org.Hs.eg.db_3.14.0   AnnotationDbi_1.56.2 
    ##  [7] IRanges_2.28.0        S4Vectors_0.32.3      Biobase_2.54.0       
    ## [10] BiocGenerics_0.40.0   clusterProfiler_4.2.2 forcats_0.5.1        
    ## [13] stringr_1.4.0         dplyr_1.0.8           purrr_0.3.4          
    ## [16] readr_2.1.2           tidyr_1.2.0           tibble_3.1.6         
    ## [19] ggplot2_3.3.5         tidyverse_1.3.1      
    ## 
    ## loaded via a namespace (and not attached):
    ##   [1] circlize_0.4.14        readxl_1.3.1           shadowtext_0.1.1      
    ##   [4] backports_1.4.1        fastmatch_1.1-3        plyr_1.8.6            
    ##   [7] igraph_1.2.11          lazyeval_0.2.2         splines_4.1.2         
    ##  [10] BiocParallel_1.28.3    GenomeInfoDb_1.30.1    digest_0.6.29         
    ##  [13] foreach_1.5.2          yulab.utils_0.0.4      htmltools_0.5.2       
    ##  [16] GOSemSim_2.20.0        viridis_0.6.2          GO.db_3.14.0          
    ##  [19] fansi_1.0.2            magrittr_2.0.2         memoise_2.0.1         
    ##  [22] cluster_2.1.2          doParallel_1.0.17      tzdb_0.2.0            
    ##  [25] Biostrings_2.62.0      graphlayouts_0.8.0     modelr_0.1.8          
    ##  [28] matrixStats_0.61.0     enrichplot_1.14.2      colorspace_2.0-3      
    ##  [31] blob_1.2.2             rvest_1.0.2            ggrepel_0.9.1         
    ##  [34] haven_2.4.3            xfun_0.30              crayon_1.5.0          
    ##  [37] RCurl_1.98-1.6         jsonlite_1.8.0         scatterpie_0.1.7      
    ##  [40] iterators_1.0.14       glue_1.6.2             polyclip_1.10-0       
    ##  [43] gtable_0.3.0           zlibbioc_1.40.0        XVector_0.34.0        
    ##  [46] GetoptLong_1.0.5       shape_1.4.6            scales_1.1.1          
    ##  [49] DOSE_3.20.1            DBI_1.1.2              Rcpp_1.0.8            
    ##  [52] viridisLite_0.4.0      clue_0.3-60            gridGraphics_0.5-1    
    ##  [55] tidytree_0.3.9         bit_4.0.4              httr_1.4.2            
    ##  [58] fgsea_1.20.0           RColorBrewer_1.1-2     ellipsis_0.3.2        
    ##  [61] pkgconfig_2.0.3        farver_2.1.0           dbplyr_2.1.1          
    ##  [64] utf8_1.2.2             here_1.0.1             ggplotify_0.1.0       
    ##  [67] tidyselect_1.1.2       labeling_0.4.2         rlang_1.0.2           
    ##  [70] reshape2_1.4.4         munsell_0.5.0          cellranger_1.1.0      
    ##  [73] tools_4.1.2            cachem_1.0.6           downloader_0.4        
    ##  [76] cli_3.2.0              generics_0.1.2         RSQLite_2.2.10        
    ##  [79] ade4_1.7-18            broom_0.7.12           evaluate_0.15         
    ##  [82] fastmap_1.1.0          yaml_2.3.5             knitr_1.37            
    ##  [85] bit64_4.0.5            fs_1.5.2               tidygraph_1.2.0       
    ##  [88] KEGGREST_1.34.0        ggraph_2.0.5           nlme_3.1-155          
    ##  [91] aplot_0.1.2            DO.db_2.9              xml2_1.3.3            
    ##  [94] compiler_4.1.2         rstudioapi_0.13        png_0.1-7             
    ##  [97] reprex_2.0.1           treeio_1.18.1          tweenr_1.0.2          
    ## [100] stringi_1.7.6          highr_0.9              lattice_0.20-45       
    ## [103] Matrix_1.4-0           vctrs_0.3.8            pillar_1.7.0          
    ## [106] lifecycle_1.0.1        GlobalOptions_0.1.2    data.table_1.14.2     
    ## [109] bitops_1.0-7           patchwork_1.1.1        qvalue_2.26.0         
    ## [112] R6_2.5.1               gridExtra_2.3          codetools_0.2-18      
    ## [115] MASS_7.3-55            assertthat_0.2.1       rjson_0.2.21          
    ## [118] rprojroot_2.0.2        withr_2.5.0            GenomeInfoDbData_1.2.7
    ## [121] parallel_4.1.2         hms_1.1.1              ggfun_0.0.5           
    ## [124] rmarkdown_2.12         ggforce_0.3.3          lubridate_1.8.0
