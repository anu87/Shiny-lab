#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/


library(shiny)
library(shinydashboard)
#dir.create("/Users/Bhuti 1/Documents/Shiny-Workshop copy/www")

# Define UI for application that draws a histogram
shinyUI(fluidPage(theme="bootstrap.css",
  
  # Application title
  headerPanel("Lab data"),
  sidebarPanel(
    sidebarMenu(
      menuItem(tabName = "plot", icon=icon("bar-chart-o"),text = "Histogram",selected = TRUE)
      
    )
  ), 
  mainPanel(
    tabItems(
      tabItem(tabName = "plot", 
              #slider input for number of bins
              # box(sliderInput("bins","Number of bins:", min = 1, max = 50,value = 30)),
              #Plot of the generated distribution
              box(rpivotTableOutput("pivot",width = 500))
              #box(plotOutput("distPlot"))
              
      )
      
    )
    )))

