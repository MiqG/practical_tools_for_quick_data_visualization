According to this
[article](https://www.nature.com/articles/d41586-017-07291-9), *TP53* is
the most popular gene in the human genome. We will look into it from
multiple perspectives.

Data description
================

We collected harmonized data from the [XenaBrowser]() and [NCBI](). -
XenaBrowser [TCGA Pan Cancer (PANCAN)
dataset](https://xenabrowser.net/datapages/?cohort=TCGA%20Pan-Cancer%20(PANCAN)&removeHub=https%3A%2F%2Fxena.treehouse.gi.ucsc.edu%3A443):
- Gene expression: log2(norm\_value+1) - Exon expression: log2(RPKM+1) -
Gene methylation 450k: beta value - Copy Number Variation: log( tumor /
normal ) - Mutations -
[COBALT](https://www.ncbi.nlm.nih.gov/gene/7157/ortholog/?scope=40674)
(from NCBI): - orthologues aminoacid alignment of 153 mammals

Exploratory Data Analysis
=========================

Overview across omics and cancer types
--------------------------------------

Total number of samples per cancer type
---------------------------------------

Total number of samples per cancer type and sample type
-------------------------------------------------------

Omic values differences between sample types
--------------------------------------------

How many samples have at least a mutation?
------------------------------------------

Which are the most common effects of mutations?
-----------------------------------------------

Are there mutations associated to cancer types?
-----------------------------------------------

Are there mutations associated to sample types?
-----------------------------------------------

How are mutation effects associated to certain positions?
---------------------------------------------------------

Pairwise associations
---------------------

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
    ## loaded via a namespace (and not attached):
    ##  [1] compiler_4.0.3  magrittr_2.0.1  tools_4.0.3     htmltools_0.5.0
    ##  [5] yaml_2.2.1      stringi_1.5.3   rmarkdown_2.6   knitr_1.30     
    ##  [9] stringr_1.4.0   xfun_0.19       digest_0.6.27   rlang_0.4.9    
    ## [13] evaluate_0.14
