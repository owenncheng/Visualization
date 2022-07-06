#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic
shinyServer(function(input, output,session) {
  
  filteredData <- reactive({
    mapdata[mapdata$Sum >= input$range[1] & mapdata$Sum <= input$range[2],]
  })

    output$butmap <- renderLeaflet({
      
      
      leaflet(data = filteredData()) %>% addTiles() %>%
        addCircleMarkers(~longi, ~lati, radius = ~ filteredData()$Sum, 
                         popup = paste0(filteredData()$Site, "<br>", "Total Number of Butterfly:",filteredData()$Sum))})

    output$top5plot <- renderPlot({
      ggplot(top5, aes(x = Site, y = Sum)) + 
        geom_col()+
        ggtitle("Total Number of butterflies observed Grouped by Site")})
      
    output$top5withdateplot <- renderPlot({
      ggplot(top5withdate, aes(x = date, y = Sum, fill = Site)) + 
        geom_col() +
        ggtitle("Total Number of Butterflies Observed Each Day")
    })
  
})
