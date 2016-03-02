shinyServer(function(input, output) {
  
  # Generates a histogram of the dataset that is based on user's input related to species and different variables
  output$histogram1 <- renderPlotly({
    # Filter out user's choice of species
    new_data <- iris %>% 
                  filter(Species == input$species) 
    plot_ly(new_data, 
            # this interprets a string as a variable name
            x = eval(parse(text = input$variables)),
            mode = 'markers',
            type = 'histogram',
            opacity = 0.6,
            marker = list(color = toRGB(input$color))
    ) %>%
      layout(title = "Histogram of Iris Data",
             xaxis = list(title = input$variables),
             yaxis = list(title = "Frequency"))
  })
  
})