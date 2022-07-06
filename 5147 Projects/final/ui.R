#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fixedPage(
  
  # Application title
  titlePanel("Data Scientists' Salary") ,
  
  fixedRow("Aim: The aim of this project is to give information through visualization for 
           Master of Data Science student to make better decisions for their career after graduating."),
  fixedRow("I have summarized different factors that is affecting data scientists' salary, which are
           country, company and personal aspect."),
  
  fixedRow("In order to explore the data, please click the bottons below to explore how countries, 
           company and personal factors affect data scientists' salary."),

  navbarPage("Factors",
    tabPanel("Countries", 
      fixedRow(
    # Sidebar with a slider input for the average salary
    fixedRow("Move the slide bar to select the range of average salary that you want to appear on the map.
             By clicking the dot on the map, it can shows the name of the country and the avager data
             scientists in that country."),
    sliderInput(inputId = "range", label = "Average Salary", min(addcountry$salary), 
    max(addcountry$salary), value= range(addcountry$salary), step = 5000),
    
    #print the map of data scientist salary
    leafletOutput("map"),
    fixedRow("The radius of the circle is proportional to the average salary of the data scientists. 
             The bigger the circle, the higher salary of the data scientists. From the map, we can spot 
             a few larger circle which is the USA, Russia, Japan, and Canada. Therefore, students may 
             have a reference to this data and choose where they could move for a better-paying job.")
                               )),
    navbarMenu("Company",
    tabPanel("Rating",plotOutput("rating"),
             fixedRow("We can see the relationship between a company’s rating and salary. The 
             points are quite dispersed and we cannot see a clear relationship. However, there
             are more points clustered between ratings 3 to 4 and the highest salary appears at 
             above 3 of the company’s rating. Comparing those points ranging from 1 to 3, those 
             data scientists’ salary in the rating range of 3 to 4 is generally higher. Besides, 
             the line is the regression line, which is plotted by geom_smooth, that tries to fit every 
             data. At the point of rating 4, a slight peak exists. It means the average salary is 
             slightly higher than others.  Therefore,  We can summarize that companies with an 
             average rating generally provide a relatively stable salary or a bit higher than those companies having a lower rating.")),
    tabPanel("Year Founded", plotOutput("founded"),
             fixedRow("Most of the companies are founded after the 1950s. Also, the points are more clustered between 1980 to 2000s. 
                      This only shows that there are more companies that started their business during this period. The salary 
                      is average all over the period and a little bit higher than average for those companies that started 
                      after 2000 since more points cluster around 100-150K.")),
    tabPanel("Size", plotOutput("size"),
             fixedRow("The box plot shows the average, lower quartile, and upper quartile of the salary. 
                      In general, the average salary is pretty much the same. It also does not show much 
                      difference in the upper quartile and lower quartile salaries. Besides, it does not 
                      show a clear trend. However, the difference in the range of the salary is quite 
                      obvious. For a big company, the difference between the highest and the lowest 
                      salary is above 200k. The difference is slowly shrinking while the company size 
                      becomes smaller. Therefore, we find out the range of data scientist salary is 
                      wider in a big company. If one aims to get the highest salary way above the 
                      industry average, one will have a higher chance to achieve it if one works in 
                      a big company.")),
    tabPanel("Type of Ownership", plotOutput("ownership"),
             fixedRow("Working in a business segment and public companies got more pay in the big picture. 
                      We could interpret that data science is helping some companies make more money. It is 
                      fair enough to get higher pay if the data scientists solve a business problem. In 
                      another aspect, working in college/university still get a lot of money because data 
                      scientist is contributing their value to research. ")),
    tabPanel("Industry", 
             fixedRow("Move the slide bar to select the range of average salary that you want to appear on the 
             bar chart. The bar chart will show the industry that data scientists' salary within your
                      selected range."),
             sliderInput(inputId = "rangeindus", label = "Average Salary", min(top5indvsal$avgsal), 
                                     max(top5indvsal$avgsal), value= range(top5indvsal$avgsal), step = 10),
             plotOutput("top5indus"),
             fixedRow("For the top few industries in which data scientists earn the most. 
                      It is no surprise that the highest average salary belongs to retail 
                      and Finance which always emphasize their sales. ")),
    tabPanel("Revenue", plotOutput("revenue"),
             fixedRow("The companies that earn the most are not those companies that pay the most for data 
                      scientists. That is interesting that companies earning $5M to $10M pay the most for 
                      the data scientists. We may interpret that some of the data scientists work in start-up 
                      companies that are growing. Therefore, they contribute more and get more shares from that. 
                      Another thing maybe companies earning the most is world-known companies which they have 
                      set a standard price for hiring each employee. That may be the reason why companies 
                      earning the most may not always pay data scientists for more.")),
    
    ),
    
    tabPanel("Personal ",plotOutput("seniority"),
             fixedRow("The graph below represents our common knowledge which is higher seniority gets paid more. 
                      This is just a reference for us as a student. We could see our future through this graph. 
                      For a fresh graduate, we generally can get around $60000 dollars for a year. If we want to 
                      earn more until more than $200k per year. We have to aim for being an executive.")),
    tabPanel("Summary",
             fixedRow("From the company perspective, I have investigated how rating, size, type of ownership, industry, and revenue affects data scientists’ salaries. Companies which have 4 marks are paying higher for the salary. Data scientists can get more pay and a higher potential to get a high-level position while they are working in the large companies working in the business or financial industry. In terms of companies’ revenue,  companies earning $5M to $10M pay the most for the data scientists which is a surprising result. It means companies earning more are not those who pay the most for their employees.
On a personal level, data science students can keep working on improving their skills by learning advanced machine learning tools. This can boost their salary. Another thing is the seniority, we have got a reference for students about how much they can get at a particular level. Their salary could be 4 fold more than entry-level if they can become the executive of the company.
Besides, in a global view, we could also compare the data scientists’ average salaries in different countries. Those companies in developed countries such as the USA, Canada, and Russia could pay more for data scientists. If the student is ambitious to get a higher-level job, the success rate in these countries is higher.
")
  
  )
  )
))
