#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(leaflet)
library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$mapPlot <- renderLeaflet({

        R = input$Radius

        # draw the histogram with the specified number of bins
        # hist(x, breaks = bins, col = 'darkgray', border = 'white')
        myrooms = data.frame(lat = c(1.373015),
                             lng = c(103.874895),
                             labels = c('Rosyth School'))
        
        myrooms %>% leaflet %>% addTiles %>% 
            addMarkers(popup=~labels) %>%
            addCircles(weight = 1, radius = R*30)
    })
    
    output$meter <- renderPrint({
        paste(as.character(input$Radius*30), "m")
    })
})
