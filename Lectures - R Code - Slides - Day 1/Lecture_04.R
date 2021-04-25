library(data.table)
library(lubridate)

# Data preparation 
myData <- fread("transactions.csv")
myData[, TransDate:=dmy(TransDate, tz="UTC")]

# Create the plot
hist(myData[, PurchAmount])

# This will take a while as the data has over 200,000 rows
plot(x=myData[, PurchAmount], y=myData[, Cost])

# you can also use the following command to only use 10000 rows of transactions.csv
# myData <- fread("transactions.csv", nrows = 10000)






