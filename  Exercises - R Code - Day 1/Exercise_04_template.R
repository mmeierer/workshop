library(data.table)

# 1. Read in transactions.csv and call it myData
myData <- *******ADD YOUR CODE HERE*******("transactions.csv")

# only read in the first 10000 rows
# myData <- fread("transactions.csv",nrows = 10000) 

# check class PurchAmount
class(myData$PurchAmount)
# if not numeric, change class
myData[,PurchAmount := as.numeric(PurchAmount)]

# 2. Create a histogram for the variable PurchAmount(x)
# use either $ or the data.table way (dt[,columnname]) to select a column
*******ADD YOUR CODE HERE*******(myData$PurchAmount) 
*******ADD YOUR CODE HERE*******(myData[, PurchAmount]) 

# You can change the bin-width with breaks
hist(myData$PurchAmount, breaks = 50)

# 3. Create a scatter plot for the variables Cost(y) and PurchAmount(x).
# Can you observe any correlation? 
*******ADD YOUR CODE HERE*******(x=myData[, PurchAmount], y=myData[, Cost]) # Plot

# To check if there is a correlation
cor(x=myData[, PurchAmount], y=myData[, Cost]) # Correlation
