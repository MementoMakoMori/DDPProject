##R. Holley DDP Course Project
##shiny webapp server

library(shiny)
library(forecast)

data(UKLungDeaths)
dataMonths <- time(ldeaths)
timeSet <- cbind(ldeaths, fdeaths, mdeaths, dataMonths)
##timeSet <- as.data.frame(timeSet)
colnames(timeSet) <- c("Total", "Female", "Male", "Time")

shinyServer(function(input, output) {

    output$timePlot <- renderPlot({

        # generate lines based on checkbox input
        gdata <- timeSet[,input$lines]
        # draw the graph with the specified vaiables
        plot(gdata, ylab="", xlab="", main = "Deaths Per Month")
    })
    
    output$predPlot <- renderPlot({
        
        #create prediction
        future <- forecast(timeSet[,1], h=400)
        #plot with user input
        plot(future, xlim=c(1978, as.numeric(input$pred)), main="Predicted Deaths")
    })

})
