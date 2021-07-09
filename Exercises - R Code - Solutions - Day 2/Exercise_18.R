# setwd()
library(data.table)
library(lubridate)

# 1.	Create a loop that prints a countdown from 10 by using a for-loop.

for(i in 10:1){
  print(i)
}

# 2.	Create a loop that prints a countdown from 10 by using a while-loop.
i <- 10
while(i >=1){
  print(i)
  i <- i-1
}

# 3. Use a loop to go over all transactions and sum up the transaction's
# purchase amount one by one. Stop as soon as you reach a purchase amount of 1 million.
# At which date did the store reach this mark?

# Read in transactions.csv
myData <- fread("transactions.csv")

# Data preparation
myData[, TransDate:=dmy(TransDate)]

# sort by date
setkey(myData, TransDate)

spending <- 0
i <- 0
while (spending < 1000000){
  i <- i+1
  spending <- spending + myData[i, PurchAmount]
  print(i)
}

# At which date did the store reach this mark?
print(myData[i, TransDate])

