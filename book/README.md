# Practical tools for quick data visualization

When starting a new project, designing new methods for data analysis or even when preparing
a new publication, data visualization is essential to both explore new hypotheses and
to validate our findings.

With this crash talk I aim to spread the word on the existence of a series of packages that have made my life much easier when it comes to exploratory data anlysis.

In case you are reading this from this project's repository checkout the [webpage](https://miqg.github.io/practical_tools_for_quick_data_visualization) for a nicer experience.


## Before starting
Please, make sure to have R and RStudio installed with the following packages:
- **Data Wrangling**
  - [`here`](https://cran.r-project.org/web/packages/here/vignettes/here.html): to automate locating your root directory.
  - [`readr`](https://readr.tidyverse.org/): to read and write files.
  - [`dplyr`](https://dplyr.tidyverse.org/): to play with dataframes through piping.
  - [`tidyr`](https://tidyr.tidyverse.org/): to cleanup dataframes.
  - [`reshape2`](https://www.rdocumentation.org/packages/reshape2/versions/1.4.4): to change data matrices from long to wide format and viceversa.
  - [`seqinr`](https://seqinr.r-forge.r-project.org/): to read and write files with biological sequences.
  - [`ape`](https://www.rdocumentation.org/packages/ape/versions/5.4-1): to compute distances between aligned sequences.
  - [`Biostrings`](https://bioconductor.org/packages/release/bioc/html/Biostrings.html): to wrangle biological sequences.


- **Visualization**
  - [`ggplot2`](https://ggplot2.tidyverse.org/): powerful suite for general data visualization in R.
  - [`ggpubr`](https://rpkgs.datanovia.com/ggpubr/): ggplot metapackage that wraps many funcitonalities together.
  - [`pheatmap`](https://www.rdocumentation.org/packages/pheatmap/versions/1.0.12): to make "pretty-heatmaps".
  - [`ggtree`](https://bioconductor.org/packages/release/bioc/html/ggtree.html): to visualize muliple sequence alignments as trees.
  - [`gridExtra`](https://cran.r-project.org/web/packages/gridExtra/vignettes/arrangeGrob.html): to arrange multiple plots not created through `ggplot`.
 

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
install.packages('gridExtra')

# visualization
install.packages('ggplot2')
install.packages('ggpubr') # requires libcurl4 in ubuntu
install.packages('pheatmap')

# install packages from Bioconductor
if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")
BiocManager::install('ggtree')
BiocManager::install('Biostrings')
```

Then, you can also download the notebooks for the talk with:
```r
git clone https://github.com/MiqG/practical_tools_for_quick_data_visualization.git
```
or just by clicking [here](https://codeload.github.com/MiqG/practical_tools_for_quick_data_visualization/zip/main).

## Reproducibility

In case you'd like to re-create all the outputs from the repository, you will need to have a github account and to install [`jupyter-book`](https://jupyterbook.org/intro.html) and [`ghp-import`](https://pypi.org/project/ghp-import/).
Then, you can run
```shell
bash run_all.sh
```

Enjoy!