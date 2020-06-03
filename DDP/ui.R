#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Lung Disease Deaths in the UK"),
    # Sidebar with a box input for line variables
    sidebarLayout(
        sidebarPanel(
            
            "With the Covid-19 outbreak still affecting nations around the globe, respiratory and lung diseases are becoming major topics of interest. These charts provide a glimpse into 'normal' lung disease deaths in the UK, and help illustrate how completely unprecedented is Covid-19's death toll.",
            
            checkboxGroupInput(inputId = "lines",
                        "Display:", choices = 
                       c("Total", "Female", "Male"),
                       selected = "Total",
                       inline = FALSE),
            selectInput(inputId = "pred", label="Predict Total to...", 
                        choices=c("1985", "1990", "1995", "2000", "2005"), selected="1985"),
            submitButton("Update Charts")
        ),

    # Show a plot of the generated line graph
    mainPanel(
        plotOutput("timePlot"),
        plotOutput("predPlot"),
        "R. Holley, June 3rd, 2020, Coursera/Johns Hopkins University Developing Data Products"
    )

    )
))
