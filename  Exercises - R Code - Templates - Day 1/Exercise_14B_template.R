# 14A: Preparations ####

# 1. Set your working directory ####
setwd("")

# 2. Install (if necessary) and load the following packages. ####
library(data.table)
library(lubridate)
library(ggplot2)
library(Hmisc)

# 3. Read in the data transactions.csv and name it transactions. ####
transactions <- *******ADD YOUR CODE HERE*******("transactions.csv")

# Check the data types
str(transactions)

# 4. Transform the variable TransDate. ####
*******ADD YOUR CODE HERE*******


# 14B: Aggregation of variables ####

# 1. Save the latest transaction as the object now in your R environment. ####
now <- *******ADD YOUR CODE HERE*******(transactions[, TransDate])
now

# 2. Create a new data.table called rfm. ####
# that includes the customer ID, as well as the measures for purchase recency,
# frequency and monetary value.
rfm <- transactions[ ,list(recency = as.numeric(*******ADD YOUR CODE HERE******* - max(TransDate)), #recency = difference between latest transaction and "today"
                           frequency = *******ADD YOUR CODE HERE*******, #frequency = number of transactions
                           monetary = *******ADD YOUR CODE HERE*******(PurchAmount)), #monetary = average amount spent per transaction
                     by=Customer]

# 3. Check the structure of the new table and ensure
# that all the variables are numeric. ####
*******ADD YOUR CODE HERE*******(rfm)

