# setwd()
library(data.table)
library(lubridate)

# read in and prepare data
myData <- fread("transactions.csv")
myData[, TransDate:=dmy(TransDate)]
setkey(myData, TransDate)

# 1. Use a for loop to sum the first 1000 transactions.
# Then use the vectorized sum() command to do the same.
# Use system.time() to compare the time used by both methods.

spending <- 0

system.time(
  for(i in 1:1000){
    spending <- spending + myData[i, PurchAmount]
  }
)

system.time(spending_sum <- sum(myData[1:1000, PurchAmount])) 
# sum() is much faster than the loop

