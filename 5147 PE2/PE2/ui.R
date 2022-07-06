#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fixedPage(
    
    # Application title
    titlePanel("SURVEY OF BUTTERFLIES IN MELBOURNE 2017") ,
    
    fixedRow(h4("Project Description"), "The researchers recorded what butterflies they saw, if any, 
             when they walked through various areas of Melbourne. 
             A single site may have different plants and locations in which the 
             study occurred and the researcher visited these sites multiple times during the study."),
    
    fixedRow(
      column(width = 4, h4("Location of the survey"), "The map shows the location of the Site and the size of the
             circle represent the number of butterfly observed."
             ),
      column(width = 7,
             # Sidebar with a slider input for the number of butterflies
      sliderInput(inputId = "range", label = "Total Butterfly", min(mapdata$Sum), 
                  max(mapdata$Sum), value= range(mapdata$Sum), step = 1),
      
      leafletOutput("butmap"))),
    
    fixedRow(
      column(width = 4, plotOutput("top5plot")
      ),
      column(width = 3, h4("Top Sites for Butterflies"), "These are the plots for the total number of butterflies that the researchers 
             observed. The graph on the left is filtered for the top 5 site that have the most observed butterfly.
             The graph on the right is the total number of butterfly observe each day which is grouped by the top 5 site."
      ),
      column(width = 4, plotOutput("top5withdateplot")
      )
      
    )
    
    
     )
)

