
# ----------------------------------------------------------------------------------------------------
# Kaggle competition - Simple example
# ----------------------------------------------------------------------------------------------------


# 0. Preparations
# ----------------------------------------------------------------------------------------------------

# set working directory
setwd("")

# Load required packages
library(data.table)
library(caret)
library(ROCR)


# 1. Run your regression (train the model) on the training data
# ----------------------------------------------------------------------------------------------------

# Load the data the training data
d.training <- fread(file = "hairdresser_training.csv", stringsAsFactors=TRUE)
# d.training <- fread(file = , stringsAsFactors=TRUE)

# Check the data
# str(d.training)
# summary(d.training)

# Train the model (rf)
results.rf <- train(No_show ~ Gender + Age +  Neighbourhood
                    + ScheduledDay + AppointmentDay
                    + TimeBetweenScheduleDayAppointment + WeekdayAppointmentDay
                    + Student_Discount + LoyaltyCard + BeautyPackage
                    + DiscountOffer + HairDye + SMSsent, 
                    data = d.training, 
                    preProcess = c("center", "scale"),
                    method = "rf",
                    metric="ROC",
                    trControl=trainControl(method = "repeatedcv", number=2, repeats=1, 
                                           search="grid", 
                                           savePredictions = T, classProbs = T,  
                                           summaryFunction = twoClassSummary, 
                                           verboseIter=T),
                    tuneGrid = data.frame(mtry=4:5))

# Prediction & Performance - Training sample
## Check AUC (in sample)
d.training$Predicted <- predict(object=results.rf,type="prob")[,2]
pred <- prediction(d.training$Predicted, d.training$No_show)
performance(prediction.obj = pred, measure = "auc")@y.values

## Check accuracy (in sample)
d.training$Predicted_Class <- predict(object=results.rf,type="raw")
tab <- table(d.training$Predicted_Class, d.training$No_show, dnn = c("pred", "actual"))
confusionMatrix(tab, positive = "Yes")


# 2. Make predictions on the test data
# ----------------------------------------------------------------------------------------------------

# Load the data the training data
d.test <- fread(file = "hairdresser_test.csv", stringsAsFactors=TRUE)

# Prediction - Test Sample
d.test$Predicted <- predict(object=results, newdata = d.test, type="prob")[,2]


# 3. Save prediction file 
# ----------------------------------------------------------------------------------------------------

# Save prediction file 
fwrite(d.test[, c("Id", "Predicted")], "submission_based_on_knn_model.csv")


# 4. Submit results to Kaggle and then repeat
# ----------------------------------------------------------------------------------------------------

# ==> GO TO: https://www.kaggle.com/c/uni-ml-course-competition/submit
