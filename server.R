#getwd()
#install.packages("shinyapps", type="source")
library(shiny)
library(shinythemes)
#library(shinyapps)
library(ggplot2)
theme_set(theme_bw())
library(reshape2)
library(dplyr)
library(shinythemes)
library(shinyBS)
#setwd("C:/RProjects/IndiApp")

shelf_s <- read.csv("./output/data/largescales/shelfsetq_filtered&interpolated_Patch_s.csv", header=TRUE, na.strings = "NA", sep=",", as.is=T, strip.white=T)
wss_s <- read.csv("./output/data/largescales/wsssetq_filtered&interpolated_Patch_s.csv", header=TRUE, na.strings = "NA", sep=",", as.is=T, strip.white=T)
ess_s <- read.csv("./output/data/largescales/esssetq_filtered&interpolated_Patch_s.csv", header=TRUE, na.strings = "NA", sep=",", as.is=T, strip.white=T)
shelf_melt <- melt(shelf_s, id=c('YEAR', 'ID'))
ess_melt <- melt(ess_s, id=c('YEAR', 'ID'))
wss_melt <- melt(wss_s, id=c('YEAR', 'ID'))
shelfesswss_melt <- rbind(shelf_melt, ess_melt, wss_melt)
names(shelfesswss_melt)[names(shelfesswss_melt)=="YEAR"] <- "time"

nafo4x_s<- read.csv("./output/data/largescales/nafo4Xsetq_filtered&interpolated_Patch_s.csv", header=TRUE, na.strings = "NA", sep=",", as.is=T, strip.white=T)
nafo4vs_s <- read.csv("./output/data/largescales/nafo4VSsetq_filtered&interpolated_Patch_s.csv", header=TRUE, na.strings = "NA", sep=",", as.is=T, strip.white=T)
nafo4vn_s <- read.csv("./output/data/largescales/nafo4VNsetq_filtered&interpolated_Patch_s.csv", header=TRUE, na.strings = "NA", sep=",", as.is=T, strip.white=T)
nafo4w_s <- read.csv("./output/data/largescales/nafo4Wsetq_filtered&interpolated_Patch_s.csv", header=TRUE, na.strings = "NA", sep=",", as.is=T, strip.white=T)
nafo4vn_melt <- melt(nafo4vn_s, id=c('YEAR', 'ID'))
nafo4vs_melt <- melt(nafo4vs_s, id=c('YEAR', 'ID'))
nafo4w_melt <- melt(nafo4w_s, id=c('YEAR', 'ID'))
nafo4x_melt <- melt(nafo4x_s, id=c('YEAR', 'ID'))
nafo_melt <- rbind(nafo4vn_melt, nafo4vs_melt, nafo4w_melt, nafo4vs_melt, nafo4x_melt)
names(nafo_melt)[names(nafo_melt)=="YEAR"] <- "time"

strata_melt <- read.csv("./output/data/strata/strata_Patch_s.csv", header=TRUE, na.strings = "NA", sep=",", as.is=T, strip.white=T)
names(strata_melt)[names(strata_melt)=="YEAR"] <- "time"
strata_melt$L1 <- NULL

shelfesswss_melt$time <- as.numeric(as.character(shelfesswss_melt$time))
nafo_melt$time <- as.numeric(as.character(nafo_melt$time))
strata_melt$time <- as.numeric(as.character(strata_melt$time))

shinyServer(function(input, output, session) {

          # Combine the selected variables into a new data frame
          selectedData <- reactive({
                        filter(shelfesswss_melt, variable %in% input$var, 
                        time %in% seq(input$range[1],
                                 input$range[2])
                        )
            
          })
  
          selectedData2 <- reactive({
            filter(nafo_melt, variable %in% input$var, 
                   time %in% seq(input$range[1],
                                 input$range[2])
                   )
            
          })
          
          
          selectedData3 <- reactive({
            filter(strata_melt, variable %in% input$var, 
                   time %in% seq(input$range[1],
                                 input$range[2])
                   )
            
          })
        
          
  output$plot1 <- renderPlot({
    ggplot(selectedData(), aes(x = time, y = value, color = variable)) +
      geom_line(size = 1, alpha = 0.5) + geom_point(size = 1) +    
      facet_grid(. ~ ID) +
      #facet_wrap( ~ ID) +
      scale_color_brewer(palette="Set1") +
      theme(text = element_text(size = 18), 
            legend.position = 'bottom')
  })
  
  output$plot2 <- renderPlot({
    ggplot(selectedData2(), aes(x = time, y = value, color = variable)) +
      geom_line(size = 1, alpha = 0.5) + geom_point(size = 1) +    
      facet_grid(. ~ ID) +
      #facet_wrap( ~ ID) +
      scale_color_brewer(palette="Set1") +
      theme(text = element_text(size = 18), 
            legend.position = 'bottom')
  })
 
  output$plot3 <- renderPlot({
    ggplot(selectedData3(), aes(x = time, y = value, color = variable)) +
      geom_line(size = 1, alpha = 0.5) + geom_point(size = 1) +    
      #facet_grid(. ~ ID) +
      facet_wrap( ~ ID, ncol = 4) +
      scale_color_brewer(palette="Set1") +
      theme(text = element_text(size = 18), 
            legend.position = 'bottom')
  }) 
  
  
  # output$downloadPlot <- downloadHandler(
  #   filename = function() { paste(input$dataset, '.png', sep='') },
  #   content = function(file) {
  #     ggsave(file,plotInput())
  #   }
  # )
  
  
  }) # final parenthesis - do not remove