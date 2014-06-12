---
title       : Airline Histograms are Cool
subtitle    : A not-so-subtle pitch.
author      : John Doe
job         : Data Scientist
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Motivation

- Airlines want to meet passenger capacity demands (even peak loads)
- The __AirPassengers__ dataset from the __MASS__ package provides monthly passenger volume data from 1949-1960
- Our app uses the AirPassengers dataset to produce an interactive histogram to allow quick analysis for airline capacity management

--- .class #id 

## UI Code


```r
library(shiny)
shinyUI(bootstrapPage(title="BJ Airline Analysis", responsive=T,
    headerPanel("BJ Airline Analysis"),
    mainPanel(
        h4("By selecting the number of bins from the dropdown menu,
           you can generate histograms of varying granularity. 
           This interactive graph can be used for basic airline 
           capacity planning analysis (e.g. peak loads).", color="grey"),
        selectInput(inputId = "n_breaks",
                    label = "Select number of bins in histogram:",
                    choices = c(10, 20, 50, 100),
                    selected = 10),
        
        plotOutput(outputId = "main_plot", height = "300px")    
    )
))
```


--- .class #id 


## Server Code


```r
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
```


--- .class #id 

## Demo Output

library(MASS) ; hist(AirPassengers, breaks = 20, xlab = "# of Passengers", col="lightblue", main = "Histogram of Monthly BJ Airline Passenger Volume (1949-1960)")

![plot of chunk unnamed-chunk-3](assets/fig/unnamed-chunk-3.png) 
