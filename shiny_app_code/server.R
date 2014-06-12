library(shiny)
library(MASS)

shinyServer(function(input, output) {
    output$main_plot <- renderPlot({      
        hist(AirPassengers,
             breaks = as.numeric(input$n_breaks),
             xlab = "# of Passengers",  col="lightblue",
             main = "Histogram of Monthly BJ Airline Passenger Volume (1949-1960)")        
    })
})