library(data.table)
library(lubridate)
library(ggplot2)

myData <- fread("transactions.csv", nrows = 10000)
myData[, TransDate:=dmy(TransDate, tz = "UTC")]

# Example 1: Create a histogram
ggplot(myData, aes(PurchAmount)) + geom_histogram()
ggplot(myData, aes(PurchAmount)) + geom_histogram(bins = 10) 

# Example 1: Flip the coordinates of the histogram
ggplot(myData, aes(PurchAmount)) + geom_histogram() + coord_flip()

# Example 2: Create a scatterplot
ggplot(myData, aes(x=PurchAmount, y =Cost)) +
  geom_point()

# Plot title
ggplot(myData, aes(PurchAmount)) +
  geom_histogram() +
  ggtitle("Histogram of Purchase Amount")

ggplot(myData,aes(x=PurchAmount, y =Cost)) +
  geom_point() +
  ggtitle("Costs by Purchase Amount")

# Axis labels
ggplot(myData, aes(PurchAmount))+   
  geom_histogram()+ ggtitle("Histogram of Purchase Amount") +
  xlab("Purchase Amount")

ggplot(myData,aes(x=PurchAmount, y =Cost)) +
  geom_point() + 
  ggtitle("Costs by Purchase Amount") +
  xlab("Purchase Amount") +
  ylab("Costs")

# Change point size and color
ggplot(myData, aes(x = PurchAmount, y = Cost, color= Cost)) + 
  ggtitle("Costs by Purchase Amount") +  
  xlab("Purchase Amount") + ylab("Costs") + 
  geom_point(size=2)

