# Script purpose
# --------------
# Run whole project.

set -euo pipefail

# prepare raw data
Rscript scripts/prepare_multiomic_data.R

# run report
R -e "rmarkdown::render('reports/intro.Rmd', output_format='md_document')"
R -e "rmarkdown::render('reports/exercise.Rmd', output_format='md_document')"

# move markdown and images
mv reports/*.md book/
cp -r reports/*_files book/
rm -r reports/*_files
cp -r reports/images book/

# copy README
cp README.md book/

# build book
jupyter-book build book/

# update webpage
#ghp-import -n -p -f book/_build/html

echo "Done!"