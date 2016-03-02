library(shiny)
library(plotly)
library(dplyr)
data(iris)
shinyUI(fluidPage(
  # Header Panel
  titlePanel(h2("Iris Data Visualization", align = 'center')),
  
  # Sidebar Panel with three widgets 
  sidebarLayout(
    sidebarPanel(
    
    # Widge that allows user to select different species of iris  
    selectInput("species", label = h4("Select Species"), choices = list("Setosa" = "setosa", 
                "Versicolor" = "versicolor", "Virginica" = "virginica"), selected = "setosa"),
    
    # Widget that allows ueser to select x ais of different length/ width of sepal/petal
    selectInput("variables", label = h4("Select variables"), choices = list("Sepal Length" = "Sepal.Length",
                 "Sepal Width" = "Sepal.Width", "Petal Length" = "Petal.Length","Petal Width" = "Petal.Width"), 
                 selected = "Sepal Length"),
   
    # Widget that changes the color of histogram
    radioButtons("color", label = h4("3. Select the color of histogram"),
                 choices = c("Blue", "Yellow", "Red"), 
                 selected = "Blue")
  ),
  
 # Main Panel
  mainPanel(
        plotlyOutput("histogram1")
    )
  )
))