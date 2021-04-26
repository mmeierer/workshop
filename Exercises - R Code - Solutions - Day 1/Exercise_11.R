# Load libraries
library(data.table)
library(lubridate)

# 1. Read in data and ensure correct date format
myData <- fread("transactions.csv")
myData[, TransDate:=dmy(TransDate)]

demographics <- fread("demographics.csv")
demographics[, Birthdate:=dmy(Birthdate)]

# 2. Merge the tables transactions and demographics by the column Customer
# using an outer left join.
merge(myData, demographics, by="Customer", all.x=TRUE)

# 3. Merge the tables transactions and demographics by the column Customer
# using an inner join. Do this only for the customers born after 1980. 
merge(myData, demographics[year(Birthdate)>1980], by="Customer")
