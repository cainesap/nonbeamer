## Shiny plots by RStudio: requires accompanying ui.R file in same dir
## to get started, see http://shiny.rstudio.com/tutorial/lesson1/

## runs from dir above: $ Rscript runShiny.R

## load packages here
library(shiny); library(ggplot2)

## call any Rscripts here; see http://shiny.rstudio.com/tutorial/lesson5/
source('rscripts/mtcars.R')

## colours for k-means example below
palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
  "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))


## server definitions
shinyServer(function(input, output, session) {


  # demo app from Shiny App lesson 1: http://shiny.rstudio.com/tutorial/lesson1/
  output$distPlot <- renderPlot({
    x    <- faithful[, 2]  # Old Faithful Geyser data
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'skyblue', border = 'white')
  })


  # demo app from Shiny k-means example: http://shiny.rstudio.com/gallery/kmeans-example.html
  # n.b. colour palette defined above
  selectedData <- reactive({
    iris[, c(input$xcol, input$ycol)]
  })
  clusters <- reactive({
    kmeans(selectedData(), input$clusters)
  })
  output$plot1 <- renderPlot({
    par(mar = c(5.1, 4.1, 0, 1))
    plot(selectedData(),
         col = clusters()$cluster,
         pch = 20, cex = 3)
    points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
  })


  # demo table output from file download example (minus download bit): http://shiny.rstudio.com/gallery/file-download.html
  datasetInput <- reactive({
    switch(input$dataset,
           "rock" = rock,
           "pressure" = pressure,
           "cars" = cars)
  })
  output$table <- renderTable({
    datasetInput()
  })


  # call plot objects from mtcars.R, output dependent on user input
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
