shinyUI(navbarPage('Indicator Selection Guidance Framework', 
                   theme = "bootstrap.css",    #https://bootswatch.com/
                   header=tags$head(tags$style(type='text/css', ".irs-grid-text { font-size: 13pt; }")),
                   
  #headerPanel('Supplementary material: Guidance framework for the selection and evaluation of indicators for an Ecosystem Approach to Fisheries Management (EAFM) '),

  #************************************************************************************     
  tabPanel("Context",  
           mainPanel(
             h4("With the on-going development of an Ecosystem Approach (EA) in Canada, there is an increasing need to select appropriate indicators for ecosystem reporting, ecosystem assessment, and evaluation of fisheries and spatial management. 
                A comprehensive evaluation and selection of robust ecological indicators is one of the key steps in the process of implementing EA and to track progress towards meeting ecosystem goals. "),

             h4("This interactive app is the supplementary material of two publications that provide a guidance framework for the selection and evaluation of indicators for assessment of ecosystem status, trends monitoring, analysis, and reporting:"),
             
             a("Guidance framework for the selection and evaluation of ecological indicators", href="https://waves-vagues.dfo-mpo.gc.ca/Library/40648886.pdf"),
             
             h4("and"),
             
             a("Scrupulous proxies: Defining and applying a rigorous framework for the selection and evaluation of a suite of ecological indicators", href="https://www.sciencedirect.com/science/article/abs/pii/S1470160X19300524"),
             
             h4("We recommend the use of this Indicator Selection Guidance Framework by Fisheries and Oceans Canada (DFO) for the selection of indicators for State of the Ocean reporting, the MPA Network program and for Ecosystem Approaches to fisheries and oceans management")#,
             )#closing mainPanel
           ),#closing tabPanel 

  #************************************************************************************       

  tabPanel("Framework",  
           
           mainPanel(
             a("Indicator Selection Guidance Framework", href="https://waves-vagues.dfo-mpo.gc.ca/Library/40648886.pdf"),
             img(src = "framework.png", align = "center")
           )#closing mainPanel
  ),#closing tabPanel 
    
  #***********************************************************************************  
  tabPanel("Ecosystem Synthesis",  
           
           mainPanel(
             a("Synthesis of the suite of ecosystem indicators selected by applying the guidance framework", href="https://www.sciencedirect.com/science/article/abs/pii/S1470160X19300524"),
             h4("The framework and indicators presented in this app were successfully tested for the Scotian Shelf Bioregion at multiple spatial scales and a final suite of 30 ecological indicators, derived from fisheries dependent and independent data, was selected. Application of this suite of indicators to the eastern and western Scotian Shelves highlighted large coherent trends across indicators and ecosystem attributes, indicating that this system has undergone massive, negative change since 1970."),
             img(src = "synthesis.png", align = "center")
           )#closing mainPanel
  ),#closing tabPanel 
  
#***********************************************************************************  
  
  
  
  
#************************************************************************************     
tabPanel("Large Scales",  
    sidebarPanel(width = 2,
                      checkboxGroupInput('var', 'Indicator',
                                         choices = c('Biomass_s','BiomassClupeids_s','BiomassFinfish_s','BiomassFlatfish_s','BiomassForage_s','BiomassGadoids_s','BiomassGroundfish_s','BiomassSkates_s','BiomassTL2_s','BiomassTL3_s','BiomassTL4_s','BPelagicToDemersal_s','BTGLargeBenthivore_s','BTGMediumBenthivore_s','BTGPiscivore_s','BTGPlanktivore_s','BTGZoopiscivore_s','CCLargeBenthivore_s','CCMediumBenthivore_s','CCPiscivore_s','CCPlanktivore_s','CCZoopiscivore_s','CommunityCondition_s','DiversityTargetSpp.L_s', 'FishinginBalance.L_s','FishingPressure.L_s','FPClupeids.L_s','FPFinfish.L_s', 'FPFlatfish.L_s','FPForageFish.L_s','FPGadoids.L_s','FPGroundfish.L_s','FPSkates.L_s','Heips_s','HillN1Diversity_s','HillN2Dominance_s', 'Intrinsicvulnerabilityindex.L_s','InverseCVBiomass_s', 'KemptonQ_s','Landings.L_s','LargeFishIndicator_s','LargeSpeciesIndicator_s','LClupeids.L_s','LFinfish.L_s','LFlatfish.L_s','LForageFish.L_s','LGadoids.L_s','LGroundfish.L_s','LInvertebrates.L_s','LLargePelagic.L_s','LSkates.L_s','MargalefGroundfish_s','MargalefRichness_s','MarineTrophicIndex.L_s', 'MeanLengthAbundance_s','MeanLengthBiomass_s','MeanLifespan_s','MeanTrophicLevel_s','MeanTrophicLevel.L_s','PielouEvenness_s','PropPredatoryFish_s','ShannonDiversity_s','SpeciesRichness_s','MMLengthBiomass_s','MMLengthAbundance_s'),
                                         selected = c('Biomass_s'))),
    mainPanel(
          h3("Indicators calculated and evaluated using the guidance framework at different spatial scales in the Scotian Shelf Bioregion (SHELF)", align = "left"),
          h4("Western Scotian Shelf (WSS) is equivalent to NAFO Division 4X, and Eastern Scotian Shelf (ESS) includes NAFO Divisions 4VW", align = "left"),
           sliderInput('range', 'Range', min = 1970,max = 2015, width='60%', value = c(1970, 2015)), #when changed sliderInput('range' to 'integer' RStudio crashes
           plotOutput('plot1',width = "120%"),
           plotOutput('plot2',width = "120%"),
           img(src = "map.png", height = 780, width = 980, align = "center")
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
           h3("Indicators calculated and evaluated at the strata scale"),
           h4("WSS is equivalent to strata 470 to 495. ESS is equivalent to strata 440 to 466.", align = "left"),
           sliderInput('range', 'Range', min = 1970,max = 2015, width='60%', value = c(1970, 2015)), #when changed sliderInput('range' to 'integer' RStudio crashes
           plotOutput('plot3', width = "125%", height = "2400px")
           )#closing mainPanel
)#closing tabPanel 

#************************************************************************************     

)) # end parenthesis - do not delete