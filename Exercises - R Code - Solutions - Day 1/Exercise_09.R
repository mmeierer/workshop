library(data.table)
library(lubridate)

# Read in data 
myData <- fread("transactions.csv")
myData[, TransDate:=dmy(TransDate)]
# myData[, TransDate:=dmy(TransDate, tz="UTC")]

# 1. Select rows 10 to 20.
myData[10:20,]

# 2. Select all purchases from 2010.
myData[TransDate > dmy("31.12.2009") & TransDate <= dmy("31.12.2010"),]
# or:
myData[TransDate > dmy("31-12-2009") & TransDate <= dmy("31-12-2010"),]
# or:
myData[year(TransDate) == 2010,]

# 3. Select all purchases with purchase amount greater than 100
# which were made from 01.01.2009 onwards.
myData[PurchAmount > 100 & year(TransDate) > 2008]
# or:
myData[PurchAmount > 100 & TransDate >= dmy("01.01.2009")]

# 4. From myData, create a new column calculating the difference
# between PurchAmount and Cost. Call it Profit.
myData[, Profit := PurchAmount - Cost]
myData # Have a look at the resulting data table
# Be aware, changes with := are directly applied to the data table
# without (re-)assigning the modified data table a name using <-

# 5. Rename Profit to ProfitChange.
setnames(myData, old="Profit", new="ProfitChange")

# 6. Delete ProfitChange again.
myData[, ProfitChange:=NULL]

# or
# myData$ProfitChange <- NULL

