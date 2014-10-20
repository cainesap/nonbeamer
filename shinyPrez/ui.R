shinyUI(navbarPage("ALTA-DTAL Group", theme = "bootstrap.css",

  tabPanel("#",
    fluidRow(
      column(10, offset = 1,
        h1("Spoken corpus annotation"),
    	h4("Paula Buttery, Andrew Caines, Calbert Graham || Department of Theoretical & Applied Linguistics")
      )
    ),
    fluidRow(
      column(10,
	includeHTML('html/candidateCountries.html')
      )
    )
  ),

  tabPanel("Corpora",
    fluidRow(
      column(10, offset = 1,
        tabsetPanel(type = "tabs",
      	  tabPanel("tasks",
            h3("BULATS (Business Language Testing Service) speaking test"),
	    includeMarkdown('markdown/corp_task.md'),
	    br(),
	    tags$audio(src = "SCPER76QWK_SD_01_extract.wav", type = "audio/wav", controls = NA)
      	  ),
      	  tabPanel("datasets",
            h3("BULATS (Business Language Testing Service) speaking test"),
	    includeMarkdown('markdown/corp_dsets1.md'),
	    fluidRow(
	      column(7, offset = 1,
	        dataTableOutput("candcefrTable")
	      )
	    ),
	    fluidRow(
	      hr(),
	      includeMarkdown('markdown/corp_dsets2.md')
	    )
      	  )
	)
      )
    )
  ),

  tabPanel("Transcription",
    fluidRow(
      column(10, offset = 1,
        tabsetPanel(type = "tabs",
      	  tabPanel("motivation",
            h3("Gold-standard versus crowd-sourced transcripts"),
	    includeMarkdown('markdown/transcr_cp.md')
	  ),
          tabPanel("fid.1",
	    column(10, offset = 1,
	      h3("Fidelity 1: years"),
	      includeHTML('html/SCPER76QWK_SD_01_extract.html')
	    )
	  ),
          tabPanel("fid.2",
	    column(10, offset = 1,
	      h3("Fidelity 2: expectation"),
	      includeHTML('html/S4EJWRJ898_SC_01_extract.html')
	    )
	  ),
          tabPanel("fid.3",
	    column(10, offset = 1,
	      h3("Fidelity 3: disfluencies"),
	      includeHTML('html/S4EJWRJ898_SD_01_extract.html')
	    )
	  ),
          tabPanel("sp.1",
	    column(10, offset = 1,
	      h3("Spelling"),
	      includeHTML('html/SQYVWTHN5M_SE_05_extract.html')
	    )
	  ),
          tabPanel("pron.1",
	    column(10, offset = 1,
	      h3("Pronunciation"),
	      includeHTML('html/S5NEPVUFKC_SE_03_extract.html')
	    )
	  ),
      	  tabPanel("evaluation",
#            h3("Gold-standard versus Crowd-sourced transcripts"),
	    column(9, offset = 1,
	      h3("µ accuracy: 82%"),
	      plotOutput('transcrPlot'),  # via server.R, source() rscript in preamble
	      hr(),
	      fluidRow(
	        column(4, offset = 1,
	          checkboxInput("transcrFacet", label = "facet", value = FALSE)
	        )
	      )
	    )
	  )
	)
      )
    )
  ),

  tabPanel("Segmentation",
    fluidRow(
      column(10, offset = 1,
        tabsetPanel(type = "tabs",
      	  tabPanel("overview",
	    h3("How to segment text"),
	    includeMarkdown('markdown/seg_oview.md')
      	  ),
      	  tabPanel("prosodic",
	    column(10, offset = 1,
	      includeHTML('html/S5NEPVUFKC_SD_01_prosodic.html')
	    )
      	  ),
      	  tabPanel("syntactic",
	    column(10, offset = 1,
	      includeHTML('html/S5NEPVUFKC_SD_01_syntactic.html')
	    )
      	  ),
      	  tabPanel("distributions",
	    column(9, offset = 1,
	      plotOutput('seglenPlot'),  # via server.R, source() rscript in preamble
	      hr(),
	      fluidRow(
	        column(4, offset = 1,
		  radioButtons("seglens", label = h4("segment lengths"),
    		    choices = list("words [prosodic|syntactic]" = "words", "prosodic x CEFR" = "prosXcefr", "syntactic x CEFR" = "synXcefr", "seconds [prosodic]" = "seconds", "seconds x CEFR" = "secXcefr"), selected = "words")
	        )
	      )
	    )
	  )
	)
      )
    )
  ),

  tabPanel("Annotation",
    fluidRow(
      column(10, offset = 1,
        tabsetPanel(type = "tabs",
      	  tabPanel("overview",
            h3("What to annotate"),
	    includeMarkdown('markdown/annot_oview.md')
      	  ),
      	  tabPanel("e.g.1",
	    column(10, offset = 1,
              h3("example 1: iterative correction in right direction? [B1]"),
	      includeHTML('html/SXMBHT5CNR_SC_01_extract.html')
	    )
      	  ),
      	  tabPanel("e.g.2",
	    column(10, offset = 1,
              h3("example 2: entire word order correction [B1]"),
	      includeHTML('html/SXMBHT5CNR_SE_01_extract.html')
	    )
      	  ),
      	  tabPanel("e.g.3",
	    column(10, offset = 1,
              h3("example 3: requires idiomatic correction but how? [B1]"),
	      includeHTML('html/SXMBHT5CNR_SE_02_extract.html')
	    )
      	  ),
      	  tabPanel("e.g.4",
	    column(10, offset = 1,
              h3("example 4: requires idiomatic correction but how? [B2]"),
	      includeHTML('html/S4GFZ8MKG8_SE_05_extract.html')
	    )
      	  ),
      	  tabPanel("e.g.5",
#            h3("example 5: requires idiomatic correction but how? [C1]"),  # reduce examples from 6 to 5
#	    includeHTML('html/S3F6AKMFU6_SE_05_extract.html')
	    column(10, offset = 1,
              h3("example 6: more idiomatic correction the better the text [C1]"),
	      includeHTML('html/SQYVWTHN5M_SD_01_extract.html')
	    )
      	  ),
      	  tabPanel("frequencies",
            h3("Annotation Types"),
	    tabsetPanel(type = "tabs",
	      tabPanel("table",
	        column(9, offset = 1,
	          dataTableOutput("annotTable")
		)
	      ),
	      tabPanel("plot",
	        column(9, offset = 1,
	          plotOutput('annotPlot'),  # via server.R, source() rscript in preamble  ## mk.II (all data + annot subsets)
		  hr(),
		  fluidRow(
		    column(4, offset = 1,
		      radioButtons("annottype", label = h4("annotation type"),
    		        choices = list("overall" = "all", "disfluencies x CEFR" = "disf", "formal x CEFR" = "form", "idiomatic x CEFR" = "idio"), selected = "all")
		    )
#		    column(4,
#        	      checkboxGroupInput("statsmooth", label = h6("stat_smooth()"), 
#          	        choices = list("linear model (^2) [pink]" = "lm","LOESS [purple]" = "loess", "generalized additive model [green]" = "gam"), selected = "lm"
#		      )
#		    )
		  )
		)
	      )
	    )
      	  ),
      	  tabPanel("subjectivity",
            h3("How to annotate"),
	    includeMarkdown('markdown/annot_subj.md'),
	    hr(),
	    column(9, offset = 1,
	      imageOutput("errorFramework")
	    )
      	  )
	)
      )
    )
  ),

  tabPanel("Parsing",
    fluidRow(
      column(10, offset = 1,
        tabsetPanel(type = "tabs",
	  tabPanel("transcr-mode",
            h3("Canonical <-> Non-canonical distance"),
	    tabsetPanel(type = "tabs",
	      tabPanel("overview",
	        includeMarkdown('markdown/parsing_oview.md')
	      ),
	      tabPanel("e.g.",
	        column(9, offset = 1,
        	  includeHTML('html/parsing_egs.html')
		)
	      )
	    )
      	  ),
      	  tabPanel("results",
            h3("Parse tree log likelihoods (normalized)"),
	    tabsetPanel(type = "tabs",
	      tabPanel("table",
	        dataTableOutput("parseProbsTable")
	      ),
	      tabPanel("plot",
	        plotOutput('parseProbsPlot'),  # via server.R, source() rscript in preamble
	        hr(),
	        fluidRow(
	          column(4, offset = 1,
		    radioButtons("ppPlot", label = h4("plot type"),
    		    choices = list("syntactic" = "syn", "prosodic|syntactic" = "synpros", "CEFR" = "cefr", "candidate" = "cand"), selected = "syn")
	          )
	        )
	      )
	    )
      	  ),
      	  tabPanel("treebank",
	    imageOutput("brat")
	  )
	)
      )
    )
  ),

  tabPanel("Future",
    fluidRow(
      column(10, offset = 1,
        tabsetPanel(type = "tabs",
      	  tabPanel("current work",
            h3("Future directions: current work"),
	    includeMarkdown('markdown/future_curr.md')
      	  ),
      	  tabPanel("planned work",
            h3("Future directions: planned work"),
	    includeMarkdown('markdown/future_plan.md')
	  )
	)
      )
    )
  )
))
