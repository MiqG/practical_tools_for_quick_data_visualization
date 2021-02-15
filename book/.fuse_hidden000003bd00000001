When starting a new project, designing new methods for data analysis or
even preparing a new publication, data visualization is essential to
both explore new hypotheses and to validate our findings.

This crash talk aims to outline

Useful packages
===============

-   **Data Wrangling**
    -   [`here`](https://cran.r-project.org/web/packages/here/vignettes/here.html)
    -   [`readr`](https://readr.tidyverse.org/)
    -   [`dplyr`](https://dplyr.tidyverse.org/)
    -   [`tidyr`](https://tidyr.tidyverse.org/)
    -   [`reshape2`](https://www.rdocumentation.org/packages/reshape2/versions/1.4.4)
    -   [`seqinr`](https://seqinr.r-forge.r-project.org/)
    -   [`ape`](https://www.rdocumentation.org/packages/ape/versions/5.4-1)
-   **Visualization**
    -   [`ggplot2`](https://ggplot2.tidyverse.org/)
    -   [`ggpubr`](https://rpkgs.datanovia.com/ggpubr/)
    -   [`pheatmap`](https://www.rdocumentation.org/packages/pheatmap/versions/1.0.12)
    -   [`ggtree`](https://bioconductor.org/packages/release/bioc/html/ggtree.html)

Install packages
================

``` r
# install packages from CRAN
# wrangling
install.packages('here')
install.packages('readr')
install.packages('dplyr')
install.packages('tidyr')
install.packages('reshape2')
install.packages('seqinr')
install.packages('ape')

# visualization
install.packages('ggplot2')
install.packages('ggpubr') # requires libcurl4 in ubuntu
install.packages('pheatmap')

# install packages from Bioconductor
if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")
BiocManager::install('ggtree')
```

Basic plots
===========

-   [bible](https://cran.r-project.org/web/packages/ggpubr/ggpubr.pdf)

Bar plot
--------

Pie plot
--------

Histogram
---------

Box plot
--------

Strip plot
----------

Dot plot
--------

Violin plot
-----------

Scatter plot
------------

Heat map
--------

Phylogenetic tree
-----------------

[book](https://guangchuangyu.github.io/ggtree-book/chapter-ggtree.html)

``` r
library(ggtree)
set.seed(2017-02-16)
tree <- rtree(50)
ggtree(tree)
```

![](intro_files/figure-markdown_github/unnamed-chunk-10-1.png)

``` r
ggtree(tree, layout="slanted")
```

![](intro_files/figure-markdown_github/unnamed-chunk-10-2.png)

Add annotations
===============

Stats
-----

Labels
------

Other
=====

-   `ggparagraph`
-   `ggsummarytable`

Combine plots into figures
==========================

Save your figures
=================

References
==========

Session Info
============

``` r
sessionInfo()
```

    ## R version 4.0.3 (2020-10-10)
    ## Platform: x86_64-pc-linux-gnu (64-bit)
    ## Running under: Ubuntu 18.04.5 LTS
    ## 
    ## Matrix products: default
    ## BLAS:   /usr/lib/x86_64-linux-gnu/blas/libblas.so.3.7.1
    ## LAPACK: /usr/lib/x86_64-linux-gnu/lapack/liblapack.so.3.7.1
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
    ## [1] stats     graphics  grDevices utils     datasets  methods   base     
    ## 
    ## other attached packages:
    ## [1] ggtree_2.4.1
    ## 
    ## loaded via a namespace (and not attached):
    ##  [1] Rcpp_1.0.5          BiocManager_1.30.10 compiler_4.0.3     
    ##  [4] pillar_1.4.7        tools_4.0.3         digest_0.6.27      
    ##  [7] aplot_0.0.6         jsonlite_1.7.2      tidytree_0.3.3     
    ## [10] evaluate_0.14       lifecycle_0.2.0     tibble_3.0.4       
    ## [13] gtable_0.3.0        nlme_3.1-151        lattice_0.20-41    
    ## [16] pkgconfig_2.0.3     rlang_0.4.9         DBI_1.1.0          
    ## [19] rvcheck_0.1.8       patchwork_1.1.1     yaml_2.2.1         
    ## [22] parallel_4.0.3      xfun_0.19           treeio_1.14.3      
    ## [25] stringr_1.4.0       dplyr_1.0.4         knitr_1.30         
    ## [28] generics_0.1.0      vctrs_0.3.6         grid_4.0.3         
    ## [31] tidyselect_1.1.0    glue_1.4.2          R6_2.5.0           
    ## [34] rmarkdown_2.6       farver_2.0.3        tidyr_1.1.2        
    ## [37] ggplot2_3.3.2       purrr_0.3.4         magrittr_2.0.1     
    ## [40] scales_1.1.1        htmltools_0.5.0     ellipsis_0.3.1     
    ## [43] assertthat_0.2.1    ape_5.4-1           colorspace_2.0-0   
    ## [46] labeling_0.4.2      stringi_1.5.3       lazyeval_0.2.2     
    ## [49] munsell_0.5.0       crayon_1.3.4
