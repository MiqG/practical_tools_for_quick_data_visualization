# Script purpose
# --------------
# Run whole project.

set -euo pipefail

# prepare raw data
Rscript scripts/prepare_multiomic_data.R

# run report
R -e "rmarkdown::render('reports/a_solution/01-intro_to_tidyverse.Rmd', output_format='md_document')"
R -e "rmarkdown::render('reports/a_solution/02-intro.Rmd', output_format='md_document')"
R -e "rmarkdown::render('reports/a_solution/03-tidytuesday.Rmd', output_format='md_document')"
R -e "rmarkdown::render('reports/a_solution/04-bio.Rmd', output_format='md_document')"
R -e "rmarkdown::render('reports/a_solution/05-exercise.Rmd', output_format='md_document')"

# move markdown and images
mv reports/a_solution/*.md book/
cp -r reports/a_solution/*_files book/
rm -r reports/a_solution/*_files
cp -r reports/a_solution/images book/

# copy README
cp README.md book/

# build book
jupyter-book build book/

# update github
git add .
git commit -m "re-run whole project"
git push origin main

# update webpage
ghp-import -n -p -f book/_build/html

echo "Done!"
