# 14A: Preparations ####

# 1. Set your working directory ####
setwd("")

# 2. Install (if necessary) and load the following packages. ####
library(data.table)
library(lubridate)
library(ggplot2)
library(Hmisc)

# 3. Read in the data transactions.csv and name it transactions. ####
transactions <- *******ADD YOUR CODE HERE*******("transactions.csv")

# Check the data types
str(transactions)

# 4. Transform the variable TransDate. ####
*******ADD YOUR CODE HERE*******


# 14B: Aggregation of variables ####

# 1. Save the latest transaction as the object now in your R environment. ####
now <- *******ADD YOUR CODE HERE*******(transactions[, TransDate])
now

# 2. Create a new data.table called rfm. ####
# that includes the customer ID, as well as the measures for purchase recency,
# frequency and monetary value.
rfm <- transactions[ ,list(recency = as.numeric(*******ADD YOUR CODE HERE******* - max(TransDate)), #recency = difference between latest transaction and "today"
                           frequency = *******ADD YOUR CODE HERE*******, #frequency = number of transactions
                           monetary = *******ADD YOUR CODE HERE*******(PurchAmount)), #monetary = average amount spent per transaction
                     by=Customer]

# 3. Check the structure of the new table and ensure
# that all the variables are numeric. ####
*******ADD YOUR CODE HERE*******(rfm)

# 14C: Descriptive Statistics ####

# 1. Get a first impression of the distribution of RFM measures ####
# by taking a look at the data summary.
*******ADD YOUR CODE HERE*******(rfm) 

# 2. Plot the histograms for all 3 measures in ggplot2 and arrange them in a single figure. ###

# 3. Adjust the title, labels, and colors of your plots in an appealing way. ####

plot1 <- ggplot(rfm, aes(recency)) + 
  *******ADD YOUR CODE HERE*******(fill="*******ADD YOUR CODE HERE*******",bins = *******ADD YOUR CODE HERE*******) + 
  ggtitle("Histogram: Recency") + 
  xlab("Recency") + 
  ylab("Count")

plot2 <- ggplot(rfm, aes(frequency)) + 
  *******ADD YOUR CODE HERE*******(fill="*******ADD YOUR CODE HERE*******", bins = *******ADD YOUR CODE HERE*******) +
  ggtitle("Histogram: Frequency") + 
  xlab("Frequency") + 
  ylab("Count")

plot3 <- ggplot(rfm, aes(monetary)) + 
  *******ADD YOUR CODE HERE*******(fill="*******ADD YOUR CODE HERE*******", bins = *******ADD YOUR CODE HERE*******) + 
  ggtitle("Histogram: Monetary Value") + 
  xlab("Monetary Value") + 
  ylab("Count")  

plot1
plot2
plot3

# plot all plots in one
*******ADD YOUR CODE HERE*******(plot1, plot2, plot3)
