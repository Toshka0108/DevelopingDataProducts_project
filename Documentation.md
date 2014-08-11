Documentation to the Project App
==============================

The Shiny Application is called "Predictions: train/test proportions". The ain of the App is to show the relationship between traim-to-test proportion and the accuracy of predictions.
The App works in the following way. User chooses the proportion of train data to the whole samples data set (mtcars). Then the regression model is built, so we can make predictions on the test part of the data (whole data set minus train data set). Then the graph is showed as well as sigma of residuals. The less is Sigma, the more is the accuracy of predictions. Different randomization seeds may be choosed.
