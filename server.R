rm(list=ls())
#getwd()
#install.packages("shinyapps", type="source")
library(shiny)
#library(shinyapps)
library(ggplot2)
theme_set(theme_bw())
library(shinyBS)
library(reshape2)
library(plyr)
library(dplyr)
#setwd("C:/RProjects/IndiApp")

#Read data
shelf_s <- read.csv("./output/data/largescales/shelfsetq_filtered&interpolated_Patch_s.csv", header=TRUE, na.strings = "NA", sep=",", as.is=T, strip.white=T)
wss_s <- read.csv("./output/data/largescales/wsssetq_filtered&interpolated_Patch_s.csv", header=TRUE, na.strings = "NA", sep=",", as.is=T, strip.white=T)
ess_s <- read.csv("./output/data/largescales/esssetq_filtered&interpolated_Patch_s.csv", header=TRUE, na.strings = "NA", sep=",", as.is=T, strip.white=T)
shelf_melt <- melt(shelf_s, id=c('YEAR', 'ID'))
ess_melt <- melt(ess_s, id=c('YEAR', 'ID'))
wss_melt <- melt(wss_s, id=c('YEAR', 'ID'))
shelfesswss_melt <- rbind(shelf_melt, ess_melt, wss_melt)
names(shelfesswss_melt)[names(shelfesswss_melt)=="YEAR"] <- "time"
shelfesswss_melt$ID <- mapvalues(shelfesswss_melt$ID, from = c("WSS"), to = c("WSS, 4X"))
nafo4x_s<- read.csv("./output/data/largescales/nafo4Xsetq_filtered&interpolated_Patch_s.csv", header=TRUE, na.strings = "NA", sep=",", as.is=T, strip.white=T)
nafo4vs_s <- read.csv("./output/data/largescales/nafo4VSsetq_filtered&interpolated_Patch_s.csv", header=TRUE, na.strings = "NA", sep=",", as.is=T, strip.white=T)
nafo4vn_s <- read.csv("./output/data/largescales/nafo4VNsetq_filtered&interpolated_Patch_s.csv", header=TRUE, na.strings = "NA", sep=",", as.is=T, strip.white=T)
nafo4w_s <- read.csv("./output/data/largescales/nafo4Wsetq_filtered&interpolated_Patch_s.csv", header=TRUE, na.strings = "NA", sep=",", as.is=T, strip.white=T)
nafo4vn_melt <- melt(nafo4vn_s, id=c('YEAR', 'ID'))
nafo4vs_melt <- melt(nafo4vs_s, id=c('YEAR', 'ID'))
nafo4w_melt <- melt(nafo4w_s, id=c('YEAR', 'ID'))
nafo4x_melt <- melt(nafo4x_s, id=c('YEAR', 'ID'))
#nafo_melt <- rbind(nafo4vn_melt, nafo4vs_melt, nafo4w_melt, nafo4vs_melt, nafo4x_melt)
nafo_melt <- rbind(nafo4vn_melt, nafo4vs_melt, nafo4w_melt, nafo4vs_melt)
names(nafo_melt)[names(nafo_melt)=="YEAR"] <- "time"
nafo_melt <- nafo_melt[nafo_melt$variable %in% c('Biomass_s','BiomassClupeids_s','BiomassFinfish_s','BiomassFlatfish_s','BiomassForage_s','BiomassGadoids_s','BiomassGroundfish_s','BiomassSkates_s','BiomassTL2_s','BiomassTL3_s','BiomassTL4_s','BPelagicToDemersal_s','BTGLargeBenthivore_s','BTGMediumBenthivore_s','BTGPiscivore_s','BTGPlanktivore_s','BTGZoopiscivore_s','CCLargeBenthivore_s','CCMediumBenthivore_s','CCPiscivore_s','CCPlanktivore_s','CCZoopiscivore_s','CommunityCondition_s','DiversityTargetSpp.L_s', 'FishinginBalance.L_s','FishingPressure.L_s','FPClupeids.L_s','FPFinfish.L_s', 'FPFlatfish.L_s','FPForageFish.L_s','FPGadoids.L_s','FPGroundfish.L_s','FPSkates.L_s','Heips_s','HillN1Diversity_s','HillN2Dominance_s', 'Intrinsicvulnerabilityindex.L_s','InverseCVBiomass_s', 'KemptonQ_s','Landings.L_s','LargeFishIndicator_s','LargeSpeciesIndicator_s','LClupeids.L_s','LFinfish.L_s','LFlatfish.L_s','LForageFish.L_s','LGadoids.L_s','LGroundfish.L_s','LInvertebrates.L_s','LLargePelagic.L_s','LSkates.L_s','MargalefGroundfish_s','MargalefRichness_s','MarineTrophicIndex.L_s','MeanLengthAbundance_s','MeanLengthBiomass_s','MeanLifespan_s','MeanTrophicLevel_s','MeanTrophicLevel.L_s','PielouEvenness_s','PropPredatoryFish_s','ShannonDiversity_s','SpeciesRichness_s','MMLengthBiomass_s','MMLengthAbundance_s'),]
strata_melt <- read.csv("./output/data/strata/strata_Patch_s.csv", header=TRUE, na.strings = "NA", sep=",", as.is=T, strip.white=T)
names(strata_melt)[names(strata_melt)=="YEAR"] <- "time"
strata_melt$L1 <- NULL
strata_melt <- strata_melt[strata_melt$variable %in% c('Biomass_s','BiomassClupeids_s','BiomassFinfish_s','BiomassFlatfish_s','BiomassForage_s','BiomassGadoids_s','BiomassGroundfish_s','BiomassSkates_s','BiomassTL2_s','BiomassTL3_s','BiomassTL4_s','BPelagicToDemersal_s','BTGLargeBenthivore_s','BTGMediumBenthivore_s','BTGPiscivore_s','BTGPlanktivore_s','BTGZoopiscivore_s','CCLargeBenthivore_s','CCMediumBenthivore_s','CCPiscivore_s','CCPlanktivore_s','CCZoopiscivore_s','CommunityCondition_s', 'Heips_s','HillN1Diversity_s','HillN2Dominance_s','InverseCVBiomass_s', 'KemptonQ_s','LargeFishIndicator_s','LargeSpeciesIndicator_s','MargalefGroundfish_s','MargalefRichness_s','MeanLengthAbundance_s','MeanLengthBiomass_s','MeanLifespan_s','MeanTrophicLevel_s','MeanTrophicLevel.L_s','PielouEvenness_s','PropPredatoryFish_s','ShannonDiversity_s','SpeciesRichness_s','MMLengthBiomass_s','MMLengthAbundance_s'), ]
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
            filter(strata_melt, variable %in% input$var2, 
                   time %in% seq(input$range[1],
                                 input$range[2])
                   )
            
          })
        
          
          output$plot1 <- renderPlot({
            ggplot(selectedData(), aes(x = time, y = value, color = variable)) +
              geom_line(size = 1.1, alpha = 0.5) + geom_point(size = 1) +    
              facet_grid(. ~ ID) +
              #facet_wrap( ~ ID) +
              scale_color_brewer(palette="Set1") +
              theme(text = element_text(size = 26), 
                    legend.position = 'top')+
              theme(strip.text.x = element_text(size=26),
                    strip.background = element_rect(fill="white")) +
              theme(axis.title.x=element_blank()) + theme(axis.title.y=element_blank()) 
          })
          
          output$plot2 <- renderPlot({
            ggplot(selectedData2(), aes(x = time, y = value, color = variable)) +
              geom_line(size = 1.1, alpha = 0.5) + geom_point(size = 1) +    
              facet_grid(. ~ ID) +
              #facet_wrap( ~ ID) +
              scale_color_brewer(palette="Set1") +
              theme(text = element_text(size = 26), 
                    legend.position = 'none') +
              theme(strip.text.x = element_text(size=26),
                    strip.background = element_rect(fill="white")) +
              theme(axis.title.x=element_blank()) + theme(axis.title.y=element_blank()) 
          })
          
          output$plot3 <- renderPlot({
            ggplot(selectedData3(), aes(x = time, y = value, color = variable)) +
              geom_line(size = 1, alpha = 0.5) + geom_point(size = 1) +    
              #facet_grid(. ~ ID) +
              facet_wrap( ~ ID, ncol = 6) +
              scale_color_brewer(palette="Set1") +
              theme(text = element_text(size = 26), 
                    legend.position = 'top')+
              theme(strip.text.x = element_text(size=20),
                    strip.background = element_rect(fill="white")) +
              theme(axis.title.x=element_blank()) + 
              theme(axis.title.y=element_blank()) 
          })  
  
  
  # output$downloadPlot <- downloadHandler(
  #   filename = function() { paste(input$dataset, '.png', sep='') },
  #   content = function(file) {
  #     ggsave(file,plotInput())
  #   }
  # )
  
  
  }) # final parenthesis - do not remove