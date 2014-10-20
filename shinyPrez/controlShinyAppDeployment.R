## firstly you'll need to install the package from github and create a shinyapps.io account
## see http://shiny.rstudio.com/articles/shinyapps.html

## load package
library(shinyapps)

## deploy app to the following url: http://username.shinyapps.io/appName
## give it the appName of your choice
deployApp(appName = "shinydemo")

## stop your app (bear in mind that shinyapps.io URLs are public)
#terminateApp(appName = "shinydemo")
