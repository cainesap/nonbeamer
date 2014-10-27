* from: http://shiny.rstudio.com/gallery/file-download.html

```
shinyServer(function(input, output) {
  datasetInput <- reactive({
    switch(input$dataset,
           "rock" = rock,
           "pressure" = pressure,
           "cars" = cars)
  })
  output$table <- renderTable({
    datasetInput()
  })
})
```
