## you first need to install rmarkdown and revealjs from github
# devtools::install_github("rstudio/rmarkdown")
# devtools::install_github("jjallaire/revealjs")

## load package
library(rmarkdown)
library(revealjs)

## process rmarkdown and output .html file; for options see https://github.com/jjallaire/revealjs
render('demoReveal.Rmd', revealjs_presentation(theme = "night", transition = "fade", center = TRUE, highlight = "monochrome", incremental = TRUE))

## if you want to immediately open .html in your browser after rendering
system('open demoReveal.html')
