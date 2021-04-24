library(data.table)
library(lubridate)

# read in the data
myData <- fread("transactions.csv", nrows = 10000)
myData[, TransDate:=dmy(TransDate, tz="UTC")]

# The standard plot output
plot(x=myData[, PurchAmount], y=myData[, Cost])

# Change the axis labels
plot(x=myData[, PurchAmount], y=myData[, Cost], 
     xlab="Purchase amount", ylab="Costs")


# Add a fitting and descriptive title
plot(x=myData[, PurchAmount], y=myData[, Cost],
     xlab="Purchase amount", ylab="Costs",
     main="Costs by Purchase Amount")

# Adjust the axes limits
plot(x=myData[, PurchAmount], y=myData[, Cost],
     xlab="Purchase amount", ylab="Costs",
     main="Costs by Purchase Amount",
     xlim=c(0,6000))

# Change the marker type to a crossed out circle
plot(x=myData[, PurchAmount], y=myData[, Cost], pch=13)

# Choose a nice color
plot(x=myData[, PurchAmount], y=myData[, Cost], pch=13, col="Royalblue")

# Change the size of the points
plot(x=myData[, PurchAmount], y=myData[, Cost], pch=13, col="Royalblue",
     cex=2)

# ... and the text size
plot(x=myData[, PurchAmount], y=myData[, Cost], pch=13, col="Royalblue", 
     cex.main=0.8, cex.lab=1.5, cex.axis=1.5)

# Make the title italic and the axis labels bold
plot(x=myData[, PurchAmount], y=myData[, Cost], pch=13, col="Royalblue", 
     cex.main=0.8, cex.lab=1.5, cex.axis=1.5,
     font.main=4, font.lab=2)

# Remove the box
plot(x=myData[, PurchAmount], y=myData[, Cost],
     pch=13, col="Royalblue", 
     cex.main=0.8, cex.lab=1.5, cex.axis=1.5,
     font.main=4, font.lab=2,
     bty="n")

# Change text color
plot(x=myData[, PurchAmount], y=myData[, Cost],
     pch=13, col="Royalblue", 
     cex.main=0.8, cex.lab=1.5, cex.axis=1.5,
     font.main=4, font.lab=2,
     bty="n",
     col.main="darkgreen", col.lab="firebrick", col.axis="cyan")

# Why not include everything?
plot(
  x=myData[, PurchAmount], 	y=myData[, Cost], 
  xlab="Purchase Amount", 	ylab="Costs", 
  main="Costs by Purchase Amount", 
  xlim=c(0,6000), 
  pch=13, 
  col="royalblue",
  cex=2, 
  cex.lab=1.4, 
  cex.main=0.8, 
  cex.axis=1.5, 
  font.main=4, 
  font.lab=2, 
  bty="n", 
  col.main="darkgreen", 	
  col.lab="firebrick", 	
  col.axis="cyan")

# Simple, coordinated plots are nicer
plot(
  x=myData[, PurchAmount],
  y=myData[, Cost], 
  xlab="Purchase Amount", 	ylab="Profit", 
  main="Profit by Purchase Amount", 
  pch= 21, bg="lightblue", 
  cex=1.5, 
  cex.lab=1.3, 
  cex.main=1.5, 
  cex.axis=1, 
  font.main=2)
