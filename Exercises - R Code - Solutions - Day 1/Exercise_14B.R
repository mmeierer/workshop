# 14A: Preparations ####

# 1. Set your working directory ####
setwd("")

# 2. Install (if necessary) and load the following packages. ####
library(data.table)
library(lubridate)
library(ggplot2)
library(Hmisc)

# 3. Read in the data transactions.csv and name it transactions. ####
transactions <- fread("transactions.csv")

# Check the data types
str(transactions)

# 4. Transform the variable TransDate. ####
transactions[, TransDate:=dmy(TransDate)]


# 14B: Aggregation of variables ####

# 1. Save the latest transaction as the object now in your R environment. ####
now <- max(transactions[, TransDate])
now

# 2. Create a new data.table called rfm. ####
# that includes the customer ID, as well as the measures for purchase recency,
# frequency and monetary value.
rfm <- transactions[ ,list(recency = as.numeric(now - max(TransDate)), #recency = difference between latest transaction and "today"
                           frequency = .N, #frequency = number of transactions
                           monetary = mean(PurchAmount)), #monetary = average amount spent per transaction
                     by=Customer]

# 3. Check the structure of the new table and ensure
# that all the variables are numeric. ####
str(rfm)