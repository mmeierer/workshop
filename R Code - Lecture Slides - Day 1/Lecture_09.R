library(data.table)
library(lubridate)
myData <- fread("transactions.csv")
myData[, TransDate:=dmy(TransDate)]

# General command structure for data.table objects
myData[1,]
myData[1]
str(myData[1,])
str(myData[1])

# Select the first 3 and the 5th row
myData[c(1:3,5),]

# Select the last row
myData[.N,]
help(".N")

tail(myData,1)
myData[nrow(myData),]

# Selecting rows by condition
myData[TransDate > ymd("2010-12-24") & PurchAmount > 70, ]

# Selecting rows by condition - Select the transactions of multiple customers
myData[Customer %in% c(149332, 172951), ]

# Select multiple columns by column name / number
myData[, list(Customer, TransDate, PurchAmount)]
myData[, c(1:2, 4)]

# Combine operations to select by rows and columns
myData[PurchAmount > 100, list(TransDate, Cost)]
subset(myData, PurchAmount > 100, select = c(TransDate, Cost))

