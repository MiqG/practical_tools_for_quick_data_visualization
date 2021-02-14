# 
# Author: Miquel Anglada Girotto
# Contact: miquelangladagirotto [at] gmail [dot] com
#
# Script purpose
# --------------
# 
#
#
# Outline
# -------

# prepare raw data
Rscript scripts/prepare_multiomic_data.R

# run report
R -e "rmarkdown::render('reports/intro.Rmd', output_format='md_document', output_dir='rendered')"
R -e "rmarkdown::render('reports/exercise.Rmd', output_format='md_document')"


echo "Done!"