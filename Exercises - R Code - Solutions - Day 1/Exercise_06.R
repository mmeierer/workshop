library(data.table)
library(lubridate)

myData <- fread("transactions.csv")
myData[, TransDate:=dmy(TransDate, tz = "UTC")]

# Take a sample, if desired
myData <- myData[sample(nrow(myData), 10000), ]
myData[, TransDate:=dmy(TransDate, tz = "UTC")]

# 1. Install and load the package ggplot2
install.packages("ggplot2") # Install package
library(ggplot2) # Load package

# 2. Create a histogram for the variable PurchAmount(x) with ggplot.
ggplot(myData, aes(x=PurchAmount)) +
  geom_histogram() +
  ggtitle("Histogram of Purchase Amount") +
  xlab("Purchase Amount")

# 3. Create a scatter plot for the variables PurchAmount(x) and Cost(y) with ggplot.
ggplot(myData, aes(x=PurchAmount, y=Cost)) +
  geom_point() +
  xlab("Purchase Amount") + 
  ylab("Cost") + 
  ggtitle("Cost by Purchase Amount" )
