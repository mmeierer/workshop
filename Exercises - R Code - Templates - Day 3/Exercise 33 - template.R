# ------------------------------------------------------------------------------
# Underfitting and overfitting  
# ------------------------------------------------------------------------------


# 1. Split data
# ------------------------------------------------------------------------------

# Load packages
library("caret")

# Load data
d <- readRDS(file = "d.rds")  

# set starting point for random number generation with set.seed()
set.seed(123)

# split into test and training set
obs.num <- createDataPartition(d$purchased, times = 1,
                               p = *******ADD YOUR CODE HERE*******,
                               list = FALSE)
d.training <- d[obs.num,]
d.test <- d[-obs.num,]

# Save as RDS object
save("d.test", "d.training", file= "d_splitted_in_train_and_test.rdata")


# 2. Estimate knn only on training data
# ------------------------------------------------------------------------------
results.knn.1 <- train(purchased ~ ., 
                       data = d.training, 
                       method = *******ADD YOUR CODE HERE*******, 
                       tuneGrid = data.frame(k=5), 
                       trControl = trainControl("none"))


# 3. Calculate in sample and out of sample performance metrics
# ------------------------------------------------------------------------------

# (a) In sample performance metrics
d.training$prediction.knn5.class <- predict(object = results.knn.1,
                                            newdata = *******ADD YOUR CODE HERE*******)
tab.a <- table(d.training$prediction.knn5.class, d.training$purchased)
confusionMatrix(*******ADD YOUR CODE HERE*******)

# (b) Out of sample performance metrics
d.test$prediction.knn5.class <- predict(object = results.knn.1,
                                        newdata = *******ADD YOUR CODE HERE*******)
tab.b <- table(d.test$prediction.knn5.class, d.test$purchased)
confusionMatrix(*******ADD YOUR CODE HERE*******)
