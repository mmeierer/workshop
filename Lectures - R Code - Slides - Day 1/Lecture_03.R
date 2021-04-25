# Create CSV out of spreadsheet
# you need to put the csv files in the R project folder (i.e. together with the .Rproj file)
# or you need to specify the path to it 

# How to load data into R from a CSV file
read.csv("transactions.csv")
# read.csv2("transactions.csv") # this function has a different default value of "sep"

library(data.table)
fread("transactions.csv")


# Specifying your working directory
getwd()
setwd("") # this is an example of setting the path

# Make data available for use
variableName <- fread("transactions.csv")

# Observe and explore your data

# Look at your data
myData <- fread("transactions.csv")
myData

head(myData, n=3)
tail(myData, n=3)
help(head)
help(tail)

# Look at individual variables
str(myData)

# Package "lubridate"
install.packages("lubridate") # only install it once
library(lubridate)
myData[, TransDate:=dmy(TransDate, tz="UTC")]
str(myData)

# General command structure for data.table objects
myData[,1]
myData[2,]
myData[3,4]

# Look at summary statistics
summary(myData)

# what is the difference here (variable TransDate):
myData <- fread("transactions.csv")
summary(myData)
# versus:
myData <- fread("transactions.csv")
myData[, TransDate:=dmy(TransDate, tz="UTC")]
summary(myData)

# Write data as CSV
write.csv(myData, "myData1.csv")
fwrite(myData, "myData2.csv")

# Remove objects from your workspace
rm(myData)
# remove everything from environment
# rm(list = ls())
