nonbeamer
====

Moving away from the LaTeX Beamer package: making presentations with remark.js (markdown), reveal.js (Rmarkdown), Shiny (R)

#### Contents
* Archive: unnecessary dev files;
* intro.*: LaTeX Beamer introductory/summary slides;
* remark: contains remark.js for remark demo;
* remarkPrez: remark.js demo presentation;
  - contents and output in remarkDemo.html
* revealPrez: reveal.js demo presentation;
  - contents in demoReveal.Rmd, render with `Rscript renderDemo.R`, output in demoReveal.html
* runShiny.R: run shiny demo with `Rscript runShiny.R`, opens in browser;
* shinyPrez: Shiny App demo presentation;
  - essential components are server.R and ui.R
  - additional content in html, markdown, rscripts, text, www directories
  - pre-constructed Google motion chart in googlevis dir
  - deploy to shinyapps.io with controlShinyAppDeployment.R
  - see [deployed demo](https://cainesap.shinyapps.io/shinydemo/)
