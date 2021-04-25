library(data.table)
library(lubridate)
myData <- fread("transactions.csv")
myData[, TransDate:=dmy(TransDate)] 

# Apply an aggregating function to a variable by an aggregating dimension 
myData[, sum(PurchAmount), by=Customer]

myData[, list(AggPurch=sum(PurchAmount)), by=Customer]

# Apply an aggregating function to a variable by an aggregating dimension to a selection of rows
myData[2:5, list(AggPurch=sum(PurchAmount)), by=Customer]

# Sidenote: Create new columns in the original data.table with ":="
myData[, list(AggPurch = sum(PurchAmount))]

# Counting the number of transactions
myData[, relDate := 1:.N, by=Customer]

# Creating a lagged variable
myData[, CostLag := shift(Cost), by=Customer]

