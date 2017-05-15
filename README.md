# Indicators

# Supplementary material of the Technical Report: "Selection and evaluation of indicators for an Ecosystem Approach to Fisheries Management (EAFM)" 

This interactive supplementary material allows the reader to download and display the indicators. 
Indicators were further evaluated and a final suite is presneted in the technical report.  

You can access the supplementary material in different ways.

Option 1
```R
Follow this link: https://incorporatingecosystemapproach.shinyapps.io/indiapp/
```
*For R users*

Option 2
```R
#Open R and read the following code
library(shiny)
library(shinythemes)
library (ggplot2)
library(plyr)
library(sm)
library(datasets)
library(markdown)
library(shinyBS)
# Easiest way is to use runGitHub (shiny package)
runGitHub(Indicators", "gomezcatalina")
```
Option 3 
```R
# First clone the repository with git. If you have cloned it into
# ~/Indicators, first set the working directory, then use runApp()(shiny package).
setwd("~/Indicators")
runApp()
```
***
