shinyServer(
    function(input, output) {

        output$plot <- renderPlot({
            
            set.seed(input$seed)
            allData <- mtcars[sample(1:nrow(mtcars)),]
            edge <- round(input$proportion*32,0)
            trainData <- allData[1:edge,]
            testData <- allData[-((edge+1):32),]
            fit <- lm(data = trainData, mpg ~ disp)
            predictedValues <- predict(fit, testData)
            plot(  testData$disp, testData$mpg, xlab = "Disp", ylab = "Mpg", 
                   col = 2, pch = 19  )
            points( testData$disp, predictedValues, "l", lwd = 3 )
            for (i in 1 : nrow(testData)) {
                lines(c(testData$disp[i], testData$disp[i]),
                      c(testData$mpg[i], predictedValues[i]), col = "red" , lwd = 1)
            }
            op <- round( sum((testData$mpg - predictedValues  )^2)/(length(predictedValues)-2),2)
            usr <- par('usr')
            text(usr[2]-50, usr[4] - 5, labels = paste("Sigma =",op) )
        })
        
    }
)