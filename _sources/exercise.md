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
