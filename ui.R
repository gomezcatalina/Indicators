shinyUI(navbarPage('Indicator Selection Guidance Framework', 
                   theme = "bootstrap.css",    #https://bootswatch.com/
                   header=tags$head(tags$style(type='text/css', ".irs-grid-text { font-size: 13pt; }")),
                   
  #headerPanel('Supplementary material: Guidance framework for the selection and evaluation of indicators for an Ecosystem Approach to Fisheries Management (EAFM) '),

#************************************************************************************     
tabPanel("Large Scales",  
    sidebarPanel(width = 2,
                      checkboxGroupInput('var', 'Indicator',
                                         choices = c('Biomass_s','BiomassClupeids_s','BiomassFinfish_s','BiomassFlatfish_s','BiomassForage_s','BiomassGadoids_s','BiomassGroundfish_s','BiomassSkates_s','BiomassTL2_s','BiomassTL3_s','BiomassTL4_s','BPelagicToDemersal_s','BTGLargeBenthivore_s','BTGMediumBenthivore_s','BTGPiscivore_s','BTGPlanktivore_s','BTGZoopiscivore_s','CCLargeBenthivore_s','CCMediumBenthivore_s','CCPiscivore_s','CCPlanktivore_s','CCZoopiscivore_s','CommunityCondition_s','DiversityTargetSpp.L_s', 'FishinginBalance.L_s','FishingPressure.L_s','FPClupeids.L_s','FPFinfish.L_s', 'FPFlatfish.L_s','FPForageFish.L_s','FPGadoids.L_s','FPGroundfish.L_s','FPSkates.L_s','Heips_s','HillN1Diversity_s','HillN2Dominance_s', 'Intrinsicvulnerabilityindex.L_s','InverseCVBiomass_s', 'KemptonQ_s','Landings.L_s','LargeFishIndicator_s','LargeSpeciesIndicator_s','LClupeids.L_s','LFinfish.L_s','LFlatfish.L_s','LForageFish.L_s','LGadoids.L_s','LGroundfish.L_s','LInvertebrates.L_s','LLargePelagic.L_s','LSkates.L_s','MargalefGroundfish_s','MargalefRichness_s','MarineTrophicIndex.L_s', 'MeanLengthAbundance_s','MeanLengthBiomass_s','MeanLifespan_s','MeanTrophicLevel_s','MeanTrophicLevel.L_s','PielouEvenness_s','PropPredatoryFish_s','ShannonDiversity_s','SpeciesRichness_s','MMLengthBiomass_s','MMLengthAbundance_s'),
                                         selected = c('Biomass_s'))),
    mainPanel(
          h3("Indicators calculated at different spatial scales in the Scotian Shelf Bioregion (SHELF). Western Scotian Shelf (WSS) is equivalent to NAFO Division 4X, and Eastern Scotian Shelf (ESS) includes NAFO Divisions 4VW", align = "left"),
           sliderInput('range', 'Range', min = 1970,max = 2015, width='60%', value = c(1970, 2015)), #when changed sliderInput('range' to 'integer' RStudio crashes
           plotOutput('plot1',width = "120%"),
           plotOutput('plot2',width = "120%"),
           img(src = "map.png", height = 780, width = 980, align = "center"), 
           h4("Supplementary material in Bundy A, Gomez C, Cook A. In preparation. Indicator Selection Guidance Framework.  
                    Canadian Technical Report of Fisheries and Aquatic Sciences. Fisheries and Oceans Canada")#,
           #plotOutput('plot3', width = "125%", height = "3400px")
         )#closing mainPanel
),#closing tabPanel 

#************************************************************************************     
tabPanel("Strata Scales",  
         sidebarPanel(width = 2,
                      checkboxGroupInput('var2', 'Indicator',
                                         choices = c('Biomass_s','BiomassClupeids_s','BiomassFinfish_s','BiomassFlatfish_s','BiomassForage_s','BiomassGadoids_s','BiomassGroundfish_s','BiomassSkates_s','BiomassTL2_s','BiomassTL3_s','BiomassTL4_s','BPelagicToDemersal_s','BTGLargeBenthivore_s','BTGMediumBenthivore_s','BTGPiscivore_s','BTGPlanktivore_s','BTGZoopiscivore_s','CCLargeBenthivore_s','CCMediumBenthivore_s','CCPiscivore_s','CCPlanktivore_s','CCZoopiscivore_s','CommunityCondition_s', 'Heips_s','HillN1Diversity_s','HillN2Dominance_s','InverseCVBiomass_s', 'KemptonQ_s','LargeFishIndicator_s','LargeSpeciesIndicator_s','MargalefGroundfish_s','MargalefRichness_s','MeanLengthAbundance_s','MeanLengthBiomass_s','MeanLifespan_s','MeanTrophicLevel_s','MeanTrophicLevel.L_s','PielouEvenness_s','PropPredatoryFish_s','ShannonDiversity_s','SpeciesRichness_s','MMLengthBiomass_s','MMLengthAbundance_s'),
                                         selected = c('Biomass_s'))),
         mainPanel(
           h3("Indicators calculated at the strata scale. WSS is equivalent to strata 470 to 495. ESS is equivalent to strata 440 to 466. ", align = "left"),
           sliderInput('range', 'Range', min = 1970,max = 2015, width='60%', value = c(1970, 2015)), #when changed sliderInput('range' to 'integer' RStudio crashes
           plotOutput('plot3', width = "125%", height = "2400px"),
           h4("Supplementary material in Bundy A, Gomez C, Cook A. In preparation. Indicator Selection Guidance Framework.  
               Canadian Technical Report of Fisheries and Aquatic Sciences. Fisheries and Oceans Canada")#,
           )#closing mainPanel
),#closing tabPanel 

#************************************************************************************     
tabPanel("Framework",  
           mainPanel(
           img(src = "framework.png", align = "center"), 
           h4("Indicator Selection Guidance Framework: Figure 1 in Bundy A, Gomez C, Cook A. In preparation. Indicator Selection Guidance Framework.  
            Canadian Technical Report of Fisheries and Aquatic Sciences. Fisheries and Oceans Canada")#,
           )#closing mainPanel
         )#closing tabPanel 
#************************************************************************************  

)) # end parenthesis - do not delete