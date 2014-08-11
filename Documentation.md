Documentation to the Project App
==============================

The Shiny Application is called "Predictions: train/test proportions". The aim of the App is to show the relationship between train-to-test proportion and the accuracy of predictions.

The App works in the following way: 
* User chooses the proportion of train data to the whole samples data set (mtcars).
* The regression model is built. Regression finds the relationship between Displacement (cu.in.) (disp) and Miles/(US) gallon (mpg).
* Using test data and the model, we can predict mpg with disp given.
* Plot of predicted values, actual values and the residuals. Sigma of the residuals is provided.

The less is Sigma, the more is the accuracy of predictions. To avoid problems with randomization, the User may choose different randomization seeds.
