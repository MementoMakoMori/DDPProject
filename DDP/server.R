#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(haven)
library(dplyr)
library(doParallel)
library(caret)


##cdc.gov Behavioral Risk Factor Surveillance System is a treasure of data
##but it needs a LOT of cleanup

brfss <- read_xpt('what.XPT')

##subsetting to remove extraneous variables - day/time of interviews, phone/residence info
##subsetting to only use complete interviews - variable 'DISPCODE' calue 1100 for complete, 1200 for partial

subData <- brfss[which(brfss$DISPCODE==1100), c(1, 204:275)]
##Add column for state codes
stNAME <- tibble(c(1:2,4:6, 8:13, 15:42, 44:51, 53:56, 66, 72), c("Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "DC", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa",
                                                              "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire",
                                                              "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee",
                                                              "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming", "Guam", "Puerto Rico"))
colnames(stNAME) <- c("_STATE", "stNAME")
subData <- inner_join(subData, stNAME, by="_STATE")
subData %>% group_by("_STATE")
vras <- which(colnames(subData)!="_RFHLTH")


cluster <- makeCluster(detectCores() - 1)
registerDoParallel(cluster)
kControl <- trainControl(method = "cv", number = 5, allowParallel = TRUE)
mod1 <- train(x=subData[,vras], y=as.factor(subData$"_RFHLTH"), method="rf", trControl = kControl)
stopCluster(cluster)
registerDoSEQ()

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$distPlot <- renderPlot({

        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')

    })

})
