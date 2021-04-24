# Load libraries
library(data.table)
library(lubridate)

# 1. Read in data and ensure correct date format
myData <- fread("transactions.csv")
myData[, TransDate:=dmy(TransDate)]

demographics <- fread("demographics.csv")
demographics[*******ADD YOUR CODE HERE*******] #correct date format

# 2. Merge the tables transactions and demographics by the column Customer
# using an outer left join.
*******ADD YOUR CODE HERE*******(myData, demographics,
                                 by="Customer",
                                 *******ADD YOUR CODE HERE*******=TRUE)

# 3. Merge the tables transactions and demographics by the column Customer
# using an inner join. Do this only for the customers born after 1980. 
*******ADD YOUR CODE HERE*******(myData, demographics[*******ADD YOUR CODE HERE*******(Birthdate)>1980],
                                 by="*******ADD YOUR CODE HERE*******")
