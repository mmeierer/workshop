# Load libraries
library(data.table)
library(lubridate)

# Read in data
myData <- fread("transactions.csv")
myData[, TransDate:=dmy(TransDate)]

# 1. Calculate the sum of purchase amount by customer and transaction date. 
myData[, list(AggPurch=*******ADD YOUR CODE HERE*******(PurchAmount)),
       by=list(*******ADD YOUR CODE HERE*******, *******ADD YOUR CODE HERE*******)]

# 2.Determine the highest purchase amount for a single transaction for each customer.
myData[, list(MaxPurch=*******ADD YOUR CODE HERE*******(PurchAmount)),
       by=*******ADD YOUR CODE HERE*******]

# 3. Create a new column in your data table and store, for each customer and
# transaction, the quantity purchased in the next transaction.
# Hint: You can do this by creating an aggregated lead shifting variable for
# the variable Cost. Use an offset of 1 and aggregate the data by customer.
# You can name the resulting column CostLead. 
myData[, CostLead := *******ADD YOUR CODE HERE*******(Cost, type="*******ADD YOUR CODE HERE*******"), by=Customer]