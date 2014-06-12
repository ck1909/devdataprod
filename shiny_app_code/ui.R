library(shiny)

shinyUI(bootstrapPage(title="BJ Airline Analysis", responsive=T,
    headerPanel("BJ Airline Analysis"),
    mainPanel(
        h4("By selecting the number of bins from the dropdown menu, you can generate histograms of varying granularity. This interactive graph can be used for basic airline capacity planning analysis (e.g. peak loads).", color="grey"),
        selectInput(inputId = "n_breaks",
                    label = "Select number of bins in histogram:",
                    choices = c(10, 20, 50, 100),
                    selected = 10),
        
        plotOutput(outputId = "main_plot", height = "300px")    
    )
))