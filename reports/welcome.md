# Practical tools for quick data visualization

When starting a new project, designing new methods for data analysis or even preparing
a new publication, data visualization is essential to both explore new hypotheses and
to validate our findings.


This crash talk aims to outline how using several packages that, once I discovered they existed, they made life much easier.


## Before starting
Please make sure to have R and RStudio installed with the following packages:
- **Data Wrangling**
  - [`here`](https://cran.r-project.org/web/packages/here/vignettes/here.html)
  - [`readr`](https://readr.tidyverse.org/)
  - [`dplyr`](https://dplyr.tidyverse.org/)
  - [`tidyr`](https://tidyr.tidyverse.org/)
  - [`reshape2`](https://www.rdocumentation.org/packages/reshape2/versions/1.4.4)
  - [`seqinr`](https://seqinr.r-forge.r-project.org/)
  - [`ape`](https://www.rdocumentation.org/packages/ape/versions/5.4-1)

- **Visualization**
  - [`ggplot2`](https://ggplot2.tidyverse.org/)
  - [`ggpubr`](https://rpkgs.datanovia.com/ggpubr/)
  - [`pheatmap`](https://www.rdocumentation.org/packages/pheatmap/versions/1.0.12)
  - [`ggtree`](https://bioconductor.org/packages/release/bioc/html/ggtree.html)
 

Here's the code snipped in case you need to install some of them.
```r
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

## Inspiration
- [bible](https://cran.r-project.org/web/packages/ggpubr/ggpubr.pdf)
