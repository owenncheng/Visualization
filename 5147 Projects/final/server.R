#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  filteredData <- reactive({
    addcountry[addcountry$salary >= input$range[1] & addcountry$salary <= input$range[2],]
  })

  output$map <- renderLeaflet({
    leaflet(data = filteredData()) %>% 
      addTiles() %>%
      addCircleMarkers(~longitude, ~latitude, radius = ~ (filteredData()$salary)/10000,
                       popup = paste0("Country: ", filteredData()$country,"<br>",
                                      "Average salary: ",filteredData()$salary))})
  output$seniority <- renderPlot({
    ggplot(experience,
           aes(x = experience_level,
               y = avgsal))  +
      geom_col() +
      ggtitle("Seniority Versus Average Salary") +
      xlab("Seniority") +
      ylab("Average Salary")})
  
  output$rating <- renderPlot({ggplot(ratevsal,
                                      aes(x = Rating,
                                          y = Avg.Salary.K.))  +
      geom_point() +
      ggtitle("Company Rating Against Average Salary") +
      geom_smooth()+
      xlab("Company Rating") +
      ylab("Average Salary (K)")})
  
  output$founded <- renderPlot({ggplot(foundvsal,
                                         aes(x = Founded,
                                             y = Avg.Salary.K.))  +
      geom_point() +
      ggtitle("Company Founded Year Against Average Salary") +
      geom_smooth()+
      xlab("Year") +
      ylab("Average Salary (K)")})
  
  
  
  output$size <- renderPlot({ggplot(sizevsal,
                                         aes(x = Size,
                                             y = Avg.Salary.K.))  +
      geom_boxplot() +
      ggtitle("Company Size Against Average Salary") +
      xlab("Company Size") +
      ylab("Average Salary (K)")})
  
  output$ownership <- renderPlot({ggplot(ownvsal,
    aes(x = avgsal,
        y = Type.of.ownership))  +
    geom_col() +
    ggtitle("Type of Ownership Against Average Salary") +
    xlab("Average Salary (K)") +
    ylab("Type of Ownership")})

  filteredindus <- reactive({
    top5indvsal[top5indvsal$avgsal >= input$rangeindus[1] & top5indvsal$avgsal <= input$rangeindus[2],]
  })
  
  output$top5indus <- renderPlot({ggplot(filteredindus(),
                                         aes(x = avgsal,
                                             y = Industry))  +
      geom_col() +
      ggtitle("Industry versus Average Salary") +
      xlab("Average Salary (K)") +
      ylab("Industry")})
  
  output$revenue <- renderPlot({ggplot(revvsal,
         aes(x = avgsal,
             y = Revenue))  +
    geom_col() +
    ggtitle("Revenue of a Company Versus Average Salary") +
    xlab("Average Salary (K)") +
    ylab("Revenue")})
  
})










