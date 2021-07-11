# ------------------------------------------------------------------------------
# Confusion matrix
# ------------------------------------------------------------------------------


# 1. Use the predictions of the kNN model with 5 neighbors and build the
# confusion matrix to compare the predicted to the actual class memberships 
# ------------------------------------------------------------------------------

# Load packages
library(caret)

# Load data
d <- readRDS(file = "d_with_predictions.rds")  

# Confusion matrix
tab <- table(*******ADD YOUR CODE HERE*******,
             *******ADD YOUR CODE HERE*******,
             dnn = c("pred", "actual"))
tab

# Confusion matrix as percentage
tab/nrow(d)


# 2. Get evaluation statistics by using the confusionMatrix() command
# ------------------------------------------------------------------------------
*******ADD YOUR CODE HERE*******(tab, positive = "1")
