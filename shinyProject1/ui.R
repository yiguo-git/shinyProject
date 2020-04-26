#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(leaflet)
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("My Shiny distance map"),

    # Sidebar with a slider input for number of Radius
    sidebarLayout(
        sidebarPanel(
            sliderInput("Radius",
                        "Radius:",
                        min = 1,
                        max = 50,
                        value = 30),
            submitButton('Submit'),
            h5('The radius in meter'),
            verbatimTextOutput("meter"),
            h6('Help documents: Change the radius in the slider bar between 1 and 50, 
               after clicking the submit button, a circle centered at roysth school will
               be drawn and the radius in meter will be shown')
        ),

        # Show a plot of the generated distribution
        mainPanel(
            leafletOutput("mapPlot")
        )
    )
))
