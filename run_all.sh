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



# variables

# paths

# inputs

# outputs

# run report
R -e "rmarkdown::render('reports/intro.Rmd', output_format='all')"
R -e "rmarkdown::render('reports/exercise.Rmd', output_format='all')"


echo "Done!"