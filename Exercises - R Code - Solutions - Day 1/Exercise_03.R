# 1. Set your working directory.
setwd("put your path here")

# 2. Read in the CSV file (with the help of the data.table package).
# Make the data available for further use and name it myData.
install.packages("data.table")
library(data.table)
myData <- fread("transactions.csv")

# 3. Take a closer look at the data (i.e. look at the first and last lines
# of the dataset, view the complete dataset, and check the data type).
myData

# view first and last lines of the data
head(myData) # first lines
tail(myData) # last lines

# View the complete data
View(myData)

# Data type
str(myData)

# 4. Use the lubridate package to format the TransDate column.
install.packages("lubridate")
library(lubridate)

myData[, TransDate:=dmy(TransDate, tz="UTC")] # if you run myData[, TransDate:=dmy(TransDate, tz="UTC")] twice, TransDate would be NA

# 5. Use str() to see if the change was made correctly.
str(myData)

# 6. Use summary
summary(myData)

# 7. Save the data.table object to a csv-file with the name "transactions_backup.csv".
fwrite(myData, "transactions_backup.csv")
