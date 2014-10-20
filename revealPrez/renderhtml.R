## you first need to install rmarkdown from github
# devtools::install_github("rstudio/rmarkdown")

## load package
library(rmarkdown)

## process rmarkdown and output .html file
render('revealdemo.Rmd')

## comment back in if you want to immediately open .html in your browser after rendering
#system('open revealdemo.html')
