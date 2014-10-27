```
library(shiny); library(ggplot2)
source('rscripts/mtcars.R')

shinyServer(function(input, output, session) {

  output$mtcarsPlot <- renderPlot({
    if (input$cars == "col") {
      cylcol
    } else if (input$cars == "shp") {
      cylshp
    } else if (input$cars == "facet") {
      facets
    }
  })

})
```
