Data
====

``` r
require(readr)
require(dplyr)
require(tidyr)
ROOT = here::here()
```

Description
-----------

According to this
[article](https://www.nature.com/articles/d41586-017-07291-9), *TP53* is
the most popular gene in the human genome by far. In the practical part
of the talk, we will all dive into pubicly available data on this gene.

We collected harmonized multi-omic data from the XenaBrowser’s [TCGA Pan
Cancer (PANCAN)
dataset](https://xenabrowser.net/datapages/?cohort=TCGA%20Pan-Cancer%20(PANCAN)&removeHub=https%3A%2F%2Fxena.treehouse.gi.ucsc.edu%3A443):

-   Gene expression: log2(norm_value+1)
-   Exon expression: log2(RPKM+1)
-   Gene methylation 450k: beta value
-   Copy Number Variation: log( tumor / normal )
-   Mutations

Additionally, we downloaded a protein Multiple Sequence Alignment (MSA)
of 153 *TP53* mammal orthologues from
[NCBI](https://www.ncbi.nlm.nih.gov/), generated through their aligner
[COBALT](https://www.ncbi.nlm.nih.gov/gene/7157/ortholog/?scope=40674).

Overview
--------

The pre-processed data sets can be found in `data/prep`.

``` r
omics = read_tsv(file.path(ROOT,'data','prep','data_multiomics.tsv.gz'))
muts = read_tsv(file.path(ROOT,'data','prep','data_somatic_mutations.tsv.gz'))
```

The data sets contain data on all these cancer types:

``` r
omics %>% distinct(cancer_type) %>% pull()
```

    ##  [1] "GBM"  "OV"   "LUAD" "LUSC" "PRAD" "UCEC" "BLCA" "TGCT" "ESCA" "PAAD"
    ## [11] "KIRP" "LIHC" "CESC" "SARC" "BRCA" "THYM" "MESO" "COAD" "STAD" "SKCM"
    ## [21] "CHOL" "KIRC" "THCA" "HNSC" "LAML" "READ" "LGG"  "DLBC" "KICH" "UCS" 
    ## [31] "ACC"  "PCPG" "UVM"

I pre-processed different omic data sets into a long format data frame
in which every “value” is linked to an “omic_type”, which in turn can
have several “omic_names”. Additionally, we added information on the
sample metadata.

``` r
# available variables
colnames(omics)
```

    ##  [1] "sample"                              "omic_name"                          
    ##  [3] "value"                               "omic_type"                          
    ##  [5] "_primary_disease"                    "age_at_initial_pathologic_diagnosis"
    ##  [7] "clinical_stage"                      "gender"                             
    ##  [9] "histological_grade"                  "histological_type"                  
    ## [11] "OS"                                  "OS.time"                            
    ## [13] "residual_tumor"                      "sample_type"                        
    ## [15] "tumor_status"                        "_PATIENT"                           
    ## [17] "cancer_type"

``` r
# omic data types
omics %>% group_by(omic_type) %>% count()
```

    ## # A tibble: 4 x 2
    ## # Groups:   omic_type [4]
    ##   omic_type                  n
    ##   <chr>                  <int>
    ## 1 copy_number_variation  10873
    ## 2 exon_expression       125508
    ## 3 gene_expression        11060
    ## 4 methylation           318050

In the cases of exon expression and methylation, there are multiple
“omic_name”s that correspond to different exons and methylation sites.

``` r
# exons
omics %>% filter(omic_type=='exon_expression') %>% distinct(omic_name) %>% pull()
```

    ##  [1] "chr17:7580643-7580745:-" "chr17:7577019-7577155:-"
    ##  [3] "chr17:7577499-7577608:-" "chr17:7571720-7573008:-"
    ##  [5] "chr17:7576525-7576657:-" "chr17:7578371-7578811:-"
    ##  [7] "chr17:7590695-7590863:-" "chr17:7565097-7565332:-"
    ##  [9] "chr17:7579312-7579590:-" "chr17:7579700-7579940:-"
    ## [11] "chr17:7576853-7576926:-" "chr17:7573927-7574033:-"

``` r
# methylation sites
omics %>% filter(omic_type=='methylation') %>% distinct(omic_name) %>% pull()
```

    ##  [1] "cg21050342" "cg26539663" "cg17461511" "cg12373934" "cg06365412"
    ##  [6] "cg16397722" "cg14351634" "cg25896754" "cg18198734" "cg02045224"
    ## [11] "cg10792831" "cg22949073" "cg02166782" "cg12041075" "cg13468400"
    ## [16] "cg15206330" "cg05479194" "cg00807143" "cg05348746" "cg16203911"
    ## [21] "cg18311066" "cg02087342" "cg22175811" "cg06587969" "cg08119584"
    ## [26] "cg13169780" "cg06317056" "cg02690969" "cg02842899" "cg02855142"
    ## [31] "cg04009932" "cg25053252" "cg07991600"

Then, the mutations data set is structured as a list of mutations that
occur inthis gene in every sample:

``` r
colnames(muts)
```

    ##  [1] "sample"                              "chr"                                
    ##  [3] "start"                               "end"                                
    ##  [5] "gene"                                "reference"                          
    ##  [7] "alt"                                 "altGene"                            
    ##  [9] "effect"                              "aminoAcid"                          
    ## [11] "rnaVaf"                              "dnaVaf"                             
    ## [13] "_primary_disease"                    "age_at_initial_pathologic_diagnosis"
    ## [15] "clinical_stage"                      "gender"                             
    ## [17] "histological_grade"                  "histological_type"                  
    ## [19] "OS"                                  "OS.time"                            
    ## [21] "residual_tumor"                      "sample_type"                        
    ## [23] "tumor_status"                        "_PATIENT"                           
    ## [25] "cancer_type"

``` r
muts %>% drop_na(effect)
```

    ## # A tibble: 9,104 x 25
    ##    sample chr     start     end gene  reference alt   altGene effect aminoAcid
    ##    <chr>  <chr>   <dbl>   <dbl> <chr> <chr>     <chr> <lgl>   <chr>  <chr>    
    ##  1 TCGA-… chr17 7577094 7577094 TP53  G         A     NA      Misse… p.R282W  
    ##  2 TCGA-… chr17 7577538 7577538 TP53  C         T     NA      Misse… p.R248Q  
    ##  3 TCGA-… no v…      NA      NA no v… no varia… no v… NA      no va… no varia…
    ##  4 TCGA-… chr17 7578203 7578203 TP53  C         T     NA      Misse… p.V216M  
    ##  5 TCGA-… no v…      NA      NA no v… no varia… no v… NA      no va… no varia…
    ##  6 TCGA-… chr17 7577120 7577120 TP53  C         T     NA      Misse… p.R273H  
    ##  7 TCGA-… chr17 7577538 7577538 TP53  C         T     NA      Misse… p.R248Q  
    ##  8 TCGA-… no v…      NA      NA no v… no varia… no v… NA      no va… no varia…
    ##  9 TCGA-… no v…      NA      NA no v… no varia… no v… NA      no va… no varia…
    ## 10 TCGA-… chr17 7577099 7577099 TP53  C         A     NA      Misse… p.R280I  
    ## # … with 9,094 more rows, and 15 more variables: rnaVaf <lgl>, dnaVaf <dbl>,
    ## #   `_primary_disease` <chr>, age_at_initial_pathologic_diagnosis <dbl>,
    ## #   clinical_stage <chr>, gender <chr>, histological_grade <chr>,
    ## #   histological_type <chr>, OS <dbl>, OS.time <dbl>, residual_tumor <lgl>,
    ## #   sample_type <chr>, tumor_status <chr>, `_PATIENT` <chr>, cancer_type <chr>

Exploratory Data Analysis
=========================

In this section, we will try to answer the questions using functions
from the packages introduced previously. These solutions are completely
subjective, so feel free to find your own best ways of combining and
visualizing the different types of data.

\[This section will be updated the day of the talk to build some
“suspense”… :)\]

Counting
--------

### How many samples per cancer type are there?

### How many samples per cancer type and sample type are there?

Distributions
-------------

### What are the distributions of values for every omic type across cancer types?

### Could you now split them by sample type?

### Can you find a type of omic with statistically different values across cancer types when comparing “Primary Tumor” vs. “Solid Tissue Normal” sample types?

Mutations
---------

### How many samples have at least a mutation?

### Which are the most common effects of mutations?

### Are there mutations associated to certain cancer types?

### Are there mutations associated to sample types?

### How are mutation effects associated to certain positions?

Generating data overviews
-------------------------

### Could you use `pheatmap` to get an overview of the distributions of every omic type across samples? Could you also include “cancer_type” and “omic_name” as row and column annotations?

Pairwise associations
---------------------

### Could mutation effects be associated with gene expression?

### Could gene expression be associated with copy number variation?

### Visualize other pairwise associations that you found interesting

Try to visualize them considering different sample types, cancer types
and omic types and names.

References
==========

-   [Article on the most popular
    genes.](https://www.nature.com/articles/d41586-017-07291-9)
-   [XenaBrowser](https://xenabrowser.net/)
-   [NCBI](https://www.ncbi.nlm.nih.gov/)

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
    ##  [3] LC_TIME=es_ES.UTF-8        LC_COLLATE=en_US.UTF-8    
    ##  [5] LC_MONETARY=es_ES.UTF-8    LC_MESSAGES=en_US.UTF-8   
    ##  [7] LC_PAPER=es_ES.UTF-8       LC_NAME=C                 
    ##  [9] LC_ADDRESS=C               LC_TELEPHONE=C            
    ## [11] LC_MEASUREMENT=es_ES.UTF-8 LC_IDENTIFICATION=C       
    ## 
    ## attached base packages:
    ## [1] stats     graphics  grDevices utils     datasets  methods   base     
    ## 
    ## other attached packages:
    ## [1] tidyr_1.1.2 dplyr_1.0.4 readr_1.4.0
    ## 
    ## loaded via a namespace (and not attached):
    ##  [1] rstudioapi_0.13   knitr_1.31        magrittr_2.0.1    hms_1.0.0        
    ##  [5] tidyselect_1.1.0  here_1.0.1        R6_2.5.0          rlang_0.4.10     
    ##  [9] fansi_0.4.2       stringr_1.4.0     tools_4.0.3       xfun_0.20        
    ## [13] utf8_1.1.4        cli_2.3.0         htmltools_0.5.1.1 ellipsis_0.3.1   
    ## [17] assertthat_0.2.1  rprojroot_2.0.2   yaml_2.2.1        digest_0.6.27    
    ## [21] tibble_3.0.6      lifecycle_0.2.0   crayon_1.4.1      purrr_0.3.4      
    ## [25] ps_1.5.0          vctrs_0.3.6       glue_1.4.2        evaluate_0.14    
    ## [29] rmarkdown_2.6     stringi_1.5.3     compiler_4.0.3    pillar_1.4.7     
    ## [33] generics_0.1.0    pkgconfig_2.0.3
