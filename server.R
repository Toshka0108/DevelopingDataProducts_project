shinyServer(
    function(input, output) {
        library("caret")
        output$plot <- renderPlot({
            
            # create two set of data (train/test) according to choosen proportion
            set.seed(input$seed)
            edge <- createDataPartition(mtcars$mpg, p = input$proportion, list = F)
            trainData <- allData[edge,]
            testData <- allData[-edge,]
            
            # fit a regression model. mpg depends on disp
            fit <- lm(data = trainData, mpg ~ disp)
            
            # predict mpg by disp using test data set
            predictedValues <- predict(fit, testData)
            
            # plot predicted values, actual values, residuals
            plot(  testData$disp, testData$mpg, xlab = "Disp", ylab = "Mpg", 
                   col = 2, pch = 19 ,
                   xlim = c( min(testData$disp) - 10,max(testData$disp) + 10),
                   ylim = c(   min(testData$mpg,predictedValues) - 5, 
                               max(testData$mpg,predictedValues) + 5    ))
                               
            points( testData$disp, predictedValues, "l", lwd = 3 )
            
            for (i in 1 : nrow(testData)) {
                lines(c(testData$disp[i], testData$disp[i]),
                      c(testData$mpg[i], predictedValues[i]), col = "red" , lwd = 1)
            }
            
            # add sigma_sq of residuals on the plot
            op <- round( sum((testData$mpg - predictedValues  )^2)/(length(predictedValues)-2),2)
            usr <- par('usr')
            text(usr[2]-50, usr[4] - 5, labels = paste("Sigma =",op) )
        })
        
    }
)
