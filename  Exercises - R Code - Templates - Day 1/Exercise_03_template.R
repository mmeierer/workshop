# 1. Set your working directory.
setwd("put your path here")

# 2. Read in the CSV file (with the help of the data.table package).
# Make the data available for further use and name it myData.
install.packages("data.table")
library(data.table)
myData <- *******ADD YOUR CODE HERE*******("transactions.csv")

# 3. Take a closer look at the data (i.e. look at the first and last lines
# of the dataset, view the complete dataset, and check the data type).
myData

# view first and last lines of the data
*******ADD YOUR CODE HERE*******(myData) # first lines
tail(myData) # last lines

# View the complete data
View(myData)

# Data type
*******ADD YOUR CODE HERE*******(myData)

# 4. Use the lubridate package to format the TransDate column.
install.packages("lubridate")
library(*******ADD YOUR CODE HERE*******)

myData[, TransDate:=*******ADD YOUR CODE HERE*******(TransDate, tz="UTC")]

# 5. Use again str() to see if the change was made correctly.
*******ADD YOUR CODE HERE*******(myData)

# 6. Use summary()
*******ADD YOUR CODE HERE*******(myData)

# 7. Save the data.table object to a csv-file with the name "transactions_backup.csv".
*******ADD YOUR CODE HERE*******(myData, "transactions_backup.csv")
