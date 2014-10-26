#shinyUI(navbarPage("CambR",
shinyUI(navbarPage("CambR", theme = "bootstrap.css",

  tabPanel("shiny",
    fluidRow(
      column(8, offset = 2,
	tabsetPanel(type = "tabs",
          tabPanel("hello",
	    hr(),
	    hr(),
            h1("CambR Shiny demo"),
    	    h4("Andrew Caines || University of Cambridge"),
	    hr(),
	    hr()
	  ),
	  tabPanel("shiny?",
	    h3("What's Shiny?"),
	    hr(),
	    includeMarkdown('markdown/overview.md')
	  ),
          tabPanel("ui.R",
	    h3("ui.R"),
	    hr(),
	    includeMarkdown('markdown/ui.md')
	  ),
          tabPanel("server.R",
	    h3("server.R"),
	    hr(),
	    includeMarkdown('markdown/server1.md')
	  ),
          tabPanel("e.g.",
	    h3("Hello Shiny!"),
	    hr(),
  	    sidebarLayout(
    	      sidebarPanel(
      	        sliderInput("bins",
                  "Number of bins:", min = 1, max = 50, value = 30
		)
    	      ),
	      mainPanel(
		plotOutput("distPlot")
	      )
	    )
	  ),
	  tabPanel("layout",
	    h3("Fluid Grid system"),
	    hr(),
	    img(src = "fluidgrid.png"),
	    hr(),
	    pre("fluidRow(column(2, offset = 1, content), column(2, offset = 1, ...), column(6, ...))")
	  ),
	  tabPanel("navigation",
	    h3("Tabsets"),
	    pre("tabsetPanel(type = 'tabs', tabPanel('#1', content), tabPanel('#2', ...), tabPanel('#3', ...)"),
	    hr(),
	    h3("Navlists"),
	    pre("navlistPanel('header', tabPanel('#1', content), tabPanel('#2', ...), tabPanel('#3, ...'))"),
	    hr(),
	    navlistPanel(
    	      "Header",
	      tabPanel("First",
      	        h3("This is the first panel")
    	      ),
    	      tabPanel("Second",
      	        h3("This is the second panel")
    	      ),
	      tabPanel("Third",
      	        h3("This is the third panel")
    	      )
  	    )
	  )
	)
      )
    )
  ),

  tabPanel("include",
    fluidRow(
      column(8, offset = 2,
	tabsetPanel(type = "tabs",
          tabPanel("text",
	    h3("includeText()"),
	    hr(),
	    includeText('text/include.txt'),
	    hr(),
	    pre(includeText('text/include.txt'))
	  ),
	  tabPanel("markdown",
            h3("includeMarkdown()"),
	    hr(),
	    includeMarkdown('markdown/remark.md')
	  ),
	  tabPanel("html1",
            h3("includeHTML()"),
	    hr(),
	    includeHTML('html/basic.html')
	  ),
	  tabPanel("html2",
            h3("includeHTML()"),
	    hr(),
	    includeHTML('html/tweets.html')
	  ),
	  tabPanel("html3",
            h3("includeHTML()"),
	    hr(),
	    includeHTML('html/usdomesticflights.html')
	  )
	)
      )
    )
  ),

  tabPanel("Rscript",
    fluidRow(
      column(8, offset = 2,
        tabsetPanel(type = "tabs",
      	  tabPanel("internal",
            h3("Server internal"),
	    includeMarkdown('markdown/server2.md'),
	    hr(),
  	    sidebarLayout(
	      sidebarPanel(
    	        selectInput('xcol', 'X Variable', names(iris)),
    		selectInput('ycol', 'Y Variable', names(iris),
                selected=names(iris)[[2]]),
    		numericInput('clusters', 'Cluster count', 3, min = 1, max = 9)
  	      ),
  	      mainPanel(
    	        plotOutput('plot1')
  	      )
	    )
	  ),
      	  tabPanel("external",
            h3("Server external"),
	    includeMarkdown('markdown/server3.md'),
	    hr(),
	    plotOutput('mtcarsPlot'),
            hr(),
            fluidRow(
              column(4, offset = 1,
                radioButtons("cars", label = h4("plot options"),
                  choices = list("cylinder colours" = "col", "cylinder shapes" = "shp", "transmission" = "facet"), selected = "col")
              )
            )
	  )
	)
      )
    )
  ),

  tabPanel("Pros+Cons",
    fluidRow(
      column(8, offset = 2,
	navlistPanel(
    	  "Pros+Cons",
	  tabPanel("+ve",
      	    h3("Positives"),
	    hr(),
	    includeMarkdown('markdown/positive.md')
    	  ),
	  tabPanel("-ve",
      	    h3("Negatives"),
	    hr(),
	    includeMarkdown('markdown/negative.md')
	  )
	)
      )
    )
  )
))
