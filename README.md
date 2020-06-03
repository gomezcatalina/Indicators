# Indicators

# Supplementary material of the Technical Report: "Guidance framework for the selection and evaluation of ecological indicators"
https://waves-vagues.dfo-mpo.gc.ca/Library/40648886.pdf

This interactive supplementary material allows to display indicators that were calculated and used in the redundancy analysis. 

You can access the supplementary material in different ways.

Option 1
```R
If you are a DFO user, follow this link: http://dmapps/en/shiny-apps/
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
runGitHub("Indicators", "gomezcatalina")
```
Option 3 
```R
# First clone the repository with git. If you have cloned it into
# ~/Indicators, first set the working directory, then use runApp()(shiny package).
setwd("~/Indicators")
runApp()
```
***
