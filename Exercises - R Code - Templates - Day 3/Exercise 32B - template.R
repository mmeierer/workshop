# ------------------------------------------------------------------------------
# Visual model evaluation with the Gain and Lift Charts
# ------------------------------------------------------------------------------


# 1. Gain chart
# ------------------------------------------------------------------------------

# Load R packages
library(ROCR)

# Load data
d <- readRDS(file = "d_with_predictions.rds")  

# computing predictions
pred <- prediction(d$prediction.knn5.prob, d$purchased)

gain.chart <- performance(prediction.obj = *******ADD YOUR CODE HERE*******,
                          measure = *******ADD YOUR CODE HERE*******,
                          x.measure = *******ADD YOUR CODE HERE*******)
plot(gain.chart)


# 2. Lift chart
# ------------------------------------------------------------------------------
lift.chart <- performance(prediction.obj = *******ADD YOUR CODE HERE*******,
                          measure = *******ADD YOUR CODE HERE*******,
                          x.measure = *******ADD YOUR CODE HERE*******)
plot(lift.chart)