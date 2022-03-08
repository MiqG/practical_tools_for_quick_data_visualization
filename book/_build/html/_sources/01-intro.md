Get started
===========

Load data
=========

<img src="images/palmerpenguins.png" width="25%">

To start playing around with the functions from these packages we will
use the
[`palmerpenguins`](https://allisonhorst.github.io/palmerpenguins/articles/intro.html)
data set. This simple data set has both continuous and categorical
variables that make it perfect for showcasing how different functions
work.

    require(tidyverse)

    penguins_url = "https://raw.githubusercontent.com/allisonhorst/palmerpenguins/master/inst/extdata/penguins.csv"
    dat = read_csv(url(penguins_url))
    dat = dat %>% drop_na()
    head(dat)

    ## # A tibble: 6 × 8
    ##   species island bill_length_mm bill_depth_mm flipper_length_… body_mass_g sex  
    ##   <chr>   <chr>           <dbl>         <dbl>            <dbl>       <dbl> <chr>
    ## 1 Adelie  Torge…           39.1          18.7              181        3750 male 
    ## 2 Adelie  Torge…           39.5          17.4              186        3800 fema…
    ## 3 Adelie  Torge…           40.3          18                195        3250 fema…
    ## 4 Adelie  Torge…           36.7          19.3              193        3450 fema…
    ## 5 Adelie  Torge…           39.3          20.6              190        3650 male 
    ## 6 Adelie  Torge…           38.9          17.8              181        3625 fema…
    ## # … with 1 more variable: year <dbl>

General plotting with `ggpubr`
==============================

    require(ggpubr)

`ggpubr` allows to make insightful plots quickly for exploration that in
turn can be further customized thanks to being built on top of
`ggplot2`.

These are useful links for using this package:

-   [function
    reference](http://rpkgs.datanovia.com/ggpubr/reference/index.html)
-   [palettes](http://rpkgs.datanovia.com/ggpubr/reference/get_palette.html)
-   [figure
    making](http://rpkgs.datanovia.com/ggpubr/reference/ggarrange.html)

Next, we will try to answer different questions using this library and
`ggplot2`.

How many penguins of each species did we observe in total?
----------------------------------------------------------

    # try ggpie()

How many penguins of each species and sex did we observe across the different islands?
--------------------------------------------------------------------------------------

    # try ggbarplot()

What are the distributions of flipper lengths considering penguin species, sex and islands of origin?
-----------------------------------------------------------------------------------------------------

    # try gghistogram()

Alternatively, we can use stripcharts charts:

    # try ggstripchart()

Are the differences of body mass between sexes significant if we control for species and island?
------------------------------------------------------------------------------------------------

    # ggstripchart() and stat_compare_means()

What is the relationship between flipper length, body mass and bill length?
---------------------------------------------------------------------------

    # ggscatter()

Could we have sampling bias in the relationship between flipper length and body mass?
-------------------------------------------------------------------------------------

    # try ggscatter()'s fill option

What is the spearman correlation coefficient between body mass and flipper length?
----------------------------------------------------------------------------------

    # try ggscatter() with "cor.coef" and "add" options

Create and save a figure
------------------------

    # try ggarrange() and ggsave()

![](images/myfig.png)

Heatmaps with `ComplexHeatmap`
==============================

A part from `ggpubr`, one of the most common packages to visualize
multiple types of data altogether is `ComplexHeatmap`, which allows to
combine hierarchical clustering of rows and columns with continuous and
categorical data.

    require(ComplexHeatmap)

References
==========

-   [`ggplot2`](https://ggplot2.tidyverse.org/)
-   [`ggpubr`](https://rpkgs.datanovia.com/ggpubr/)
-   [`ComplexHeatmap`](http://bioconductor.org/packages/release/bioc/html/ComplexHeatmap.html)

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
    ## [1] grid      stats     graphics  grDevices utils     datasets  methods  
    ## [8] base     
    ## 
    ## other attached packages:
    ##  [1] ComplexHeatmap_2.10.0 ggpubr_0.4.0          forcats_0.5.1        
    ##  [4] stringr_1.4.0         dplyr_1.0.8           purrr_0.3.4          
    ##  [7] readr_2.1.2           tidyr_1.2.0           tibble_3.1.6         
    ## [10] ggplot2_3.3.5         tidyverse_1.3.1      
    ## 
    ## loaded via a namespace (and not attached):
    ##  [1] httr_1.4.2          bit64_4.0.5         vroom_1.5.7        
    ##  [4] jsonlite_1.8.0      foreach_1.5.2       carData_3.0-5      
    ##  [7] modelr_0.1.8        assertthat_0.2.1    stats4_4.1.2       
    ## [10] cellranger_1.1.0    yaml_2.3.5          pillar_1.7.0       
    ## [13] backports_1.4.1     glue_1.6.2          digest_0.6.29      
    ## [16] RColorBrewer_1.1-2  ggsignif_0.6.3      rvest_1.0.2        
    ## [19] colorspace_2.0-3    htmltools_0.5.2     pkgconfig_2.0.3    
    ## [22] GetoptLong_1.0.5    broom_0.7.12        haven_2.4.3        
    ## [25] scales_1.1.1        tzdb_0.2.0          IRanges_2.28.0     
    ## [28] generics_0.1.2      car_3.0-12          ellipsis_0.3.2     
    ## [31] withr_2.5.0         BiocGenerics_0.40.0 cli_3.2.0          
    ## [34] magrittr_2.0.2      crayon_1.5.0        readxl_1.3.1       
    ## [37] evaluate_0.15       fs_1.5.2            fansi_1.0.2        
    ## [40] doParallel_1.0.17   rstatix_0.7.0       xml2_1.3.3         
    ## [43] tools_4.1.2         hms_1.1.1           GlobalOptions_0.1.2
    ## [46] lifecycle_1.0.1     matrixStats_0.61.0  S4Vectors_0.32.3   
    ## [49] munsell_0.5.0       reprex_2.0.1        cluster_2.1.2      
    ## [52] compiler_4.1.2      rlang_1.0.2         iterators_1.0.14   
    ## [55] rstudioapi_0.13     circlize_0.4.14     rjson_0.2.21       
    ## [58] rmarkdown_2.12      gtable_0.3.0        codetools_0.2-18   
    ## [61] abind_1.4-5         DBI_1.1.2           R6_2.5.1           
    ## [64] lubridate_1.8.0     knitr_1.37          fastmap_1.1.0      
    ## [67] bit_4.0.4           utf8_1.2.2          clue_0.3-60        
    ## [70] shape_1.4.6         stringi_1.7.6       parallel_4.1.2     
    ## [73] Rcpp_1.0.8          vctrs_0.3.8         png_0.1-7          
    ## [76] dbplyr_2.1.1        tidyselect_1.1.2    xfun_0.30
