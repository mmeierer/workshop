
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

# Load the data the training data
d.training <- fread(file = "hairdresser_training.csv", stringsAsFactors=TRUE)  

# Check the data
# str(d.training)
# summary(d.training)


# 1. Run your knn (train the model) on the training data
# ----------------------------------------------------------------------------------------------------

# Train the model (kNN)
results.knn <- train(No_show ~ Gender + Age +  Neighbourhood
                     + ScheduledDay + AppointmentDay
                     + TimeBetweenScheduleDayAppointment + WeekdayAppointmentDay
                     + Student_Discount + LoyaltyCard + BeautyPackage
                     + DiscountOffer + HairDye + SMSsent, 
                     preProcess = "scale",
                     data = d.training, 
                     method = "knn",
                     metric="ROC",
                     trControl=trainControl(method="none", 
                                            classProbs = TRUE,
                                            summaryFunction = twoClassSummary))


# 2. Make predictions on the test data
# ----------------------------------------------------------------------------------------------------

# Load the data the training data
d.test <- fread(file = "hairdresser_test.csv", stringsAsFactors=TRUE)

# Prediction - Test Sample
d.test$Predicted <- predict(object=results.knn, newdata = d.test, type="prob")[,2]


# 3. Save prediction file 
# ----------------------------------------------------------------------------------------------------

# Save prediction file 
fwrite(d.test[, c("Id", "Predicted")], "submission_based_on_knn_model.csv")


# 4. Submit results to Kaggle and then repeat
# ----------------------------------------------------------------------------------------------------

# ==> GO TO: https://www.kaggle.com/c/uni-ml-course-competition/submit
