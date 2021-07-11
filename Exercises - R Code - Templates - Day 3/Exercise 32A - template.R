# ------------------------------------------------------------------------------
# Visual model evaluation with the ROC curve
# ------------------------------------------------------------------------------


# 1. Draw ROC curve for the kNN with 5 neighbors
# (x-axis: fpr, y-axis: tpr)
# ------------------------------------------------------------------------------

# Load R packages
install.packages("ROCR")
library(ROCR)

# Load data
d <- readRDS(file = "d_with_predictions.rds")  

pred <- prediction(d$prediction.knn5.prob, d$purchased)
roc.curve <- performance(prediction.obj = *******ADD YOUR CODE HERE*******,
                         measure = *******ADD YOUR CODE HERE*******,
                         x.measure = *******ADD YOUR CODE HERE*******)
plot(roc.curve)
abline(a=0, b= 1)


# 2. Calculate AUC
# ------------------------------------------------------------------------------
auc.perf = performance(prediction.obj = *******ADD YOUR CODE HERE*******,
                       measure = *******ADD YOUR CODE HERE*******)
auc.perf@y.values

