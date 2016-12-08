#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(rpivotTable)
library(ggplot2)
library(dplyr)
library(xlsx)
library(reshape)
library(stringr)

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  
  tab2<-read.xlsx("/Users/Bhuti 1/Documents/Lab.xlsx",2)
  tab2<- tab2[-38,]
  tab2[,2:22]<- sapply(tab2[,2:22],as.character)
  tab2[,2:22]<- sapply(tab2[,2:22],as.numeric)
  df<-melt(tab2)
  out<- str_split_fixed(df$variable,"_",3)
  out<-out[,-3]
  df<- data.frame(df,out)
  
 # output$distPlot <- renderPlot({
  #  x <- df[,3]
   # hist(x, col = "blue")
    #ggplot(df,aes(x=X1))+geom_bar(stat = "identity")+facet_grid(X2~.)
    
  output$pivot <- renderRpivotTable({
    rpivotTable(data = df, rows = c("organisationunitname","X2"), cols = "X1", vals = "value",
                aggregatorName = "List Unique Values",inclusions = list(organisationunitname=list("All OUs")),
                rendererName = "Lab Table", width = "100%", height = "300px")
    })
  })