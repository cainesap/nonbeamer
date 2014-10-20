## Shiny plots by RStudio: requires accompanying ui.R file in same dir
## to get started, see http://shiny.rstudio.com/tutorial/lesson1/

## runs from dir above: $ Rscript runShiny.R

## load packages here
library(shiny); library(ggplot2)

## call any Rscripts here; see http://shiny.rstudio.com/tutorial/lesson5/
source('rscripts/raspProbs.R')


# server definitions
shinyServer(function(input, output, session) {

  # corpora:datasets, from pilotCorpusCandidateCEFRs.R
  output$candcefrTable <- renderDataTable(
    pilotcefrcands, options = list(bFilter = FALSE, bPaginate = FALSE)
  )


  # transcription:evaluation, from transcrCpEval.R
  output$transcrPlot <- renderPlot({
    if (input$transcrFacet == FALSE) transcrCpEval else transcrCpEvalFacet
  })

  # Send a pre-rendered image, and don't delete the image after sending it; from http://shiny.rstudio.com/articles/images.html; currently renders without tooltips (which was whole point of .svg format)
#  output$transcrCpEval <- renderImage({
#    filename <- normalizePath(file.path('www/transcrCpEval.svg'))
    # Return a list containing the filename and alt text
#    list(src = filename)
#  }, deleteFile = FALSE)


  # segmentation:distribution:prosodic, from pauseLengthAnalysis.R
#  output$pausePlot <- renderPlot({
#    if (input$pauseFacet == FALSE) allIntensityhistPL else facetIntensityhistPL
#  })

  # segmentation:distribution:seglengths, from segmentLengthAnalysis.R
  output$seglenPlot <- renderPlot({
    if (input$seglens == "words") {
      wordcountsType
    } else if (input$seglens == "prosXcefr") {
      wordcountsProsCefr
    } else if (input$seglens == "synXcefr") {
      wordcountsSynCefr
    } else if (input$seglens == "seconds") {
      segdurs
    } else if (input$seglens == "secXcefr") {
      segdursCefr
    }
  })

  # segmentation:distribution:segdurs, from segmentLengthAnalysis.R
#  output$segdurPlot <- renderPlot({
#    if (input$segdurFacet == FALSE) synIntensityhistWC else synIntensityhistWCfacet
#  })


  # annotation:frequencies:table, from annotationScatters.R
  # mk.II (all data + annot subsets + table)
  output$annotTable <- renderDataTable(
    annottypeTable, options = list(bFilter = FALSE, bPaginate = FALSE)
  )

  # annotation:frequencies:plot, from annotationScatters.R
#  output$annotPlot <- renderPlot({
#    if (input$annottype == "all") {
#      p <- annotoverallplot
#    } else if (input$annottype == "disf") {
#      p <- annotdisfplot
#    } else if (input$annottype == "form") {
#      p <- annotformplot
#    } else if (input$annottype == "idio") {
#      p <- annotidioplot
#    }
    # deal with possible multiple selections with for loop and append()
#    for (statsmooth in input$statsmooth) {
#      if (statsmooth == "lm") {
#        p <- p + lm
#      } else if (statsmooth == "loess") {
#        p <- p + loess
#      } else if (statsmooth == "gam") {
#        p <- p + gam
#      }
#    }
    # now plot
#    p
#  })

  output$parseProbsTable <- renderDataTable(
    parseProbsTable, options = list(bFilter = FALSE, bPaginate = FALSE)
  )
  # parsing:results:plot
  output$annotPlot <- renderPlot({
    if (input$annottype == "all") {
      annotAll
    } else if (input$annottype == "disf") {
      annotDisf
    } else if (input$annottype == "form") {
      annotForm
    } else if (input$annottype == "idio") {
      annotIdio
    }
  })

  # annotation:subjectivity
  output$errorFramework <- renderImage({
    filename <- normalizePath(file.path('www/errorFramework.png'))
    # Return a list containing the filename and alt text
    list(src = filename)
  }, deleteFile = FALSE)


  # parsing:results, from parseProbs.R
  # parsing:results:table
  output$parseProbsTable <- renderDataTable(
    parseProbsTable, options = list(bFilter = FALSE, bPaginate = FALSE)
  )
  # parsing:results:plot
  output$parseProbsPlot <- renderPlot({
    if (input$ppPlot == "syn") {
      syntactic
    } else if (input$ppPlot == "synpros") {
      synpros
    } else if (input$ppPlot == "cefr") {
      synfacetcefr
    } else if (input$ppPlot == "cand") {
      synfacetcand
    }
  })

  # parsing:treebank
  output$brat <- renderImage({
    filename <- normalizePath(file.path('www/brat-screenshot.png'))
    # Return a list containing the filename and alt text
    list(src = filename)
  }, deleteFile = FALSE)

})
