# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------

# --------------- RFM - REPETITION FROM DAY 1 ---------------------------------


# 14A: Preparations ####

# 1. Set your working directory ####
setwd("")

# 2. Install (if necessary) and load the following packages. ####
library(data.table)
library(lubridate)
library(ggplot2)
library(Hmisc)
library(gridExtra)

# 3. Read in the data transactions.csv and name it transactions. ####
transactions <- fread("transactions.csv")

# Check the data types
str(transactions)

# 4. Transform the variable TransDate. ####
transactions[, TransDate:=dmy(TransDate)]


# 14B: Aggregation of variables ####

# 1. Save the latest transaction as the object now in your R environment. ####
now <- max(transactions[, TransDate])
now

# 2. Create a new data.table called rfm. ####
# that includes the customer ID, as well as the measures for purchase recency,
# frequency and monetary value.
rfm <- transactions[ ,list(recency = as.numeric(now - max(TransDate)), #recency = difference between latest transaction and "today"
                           frequency = .N, #frequency = number of transactions
                           monetary = mean(PurchAmount)), #monetary = average amount spent per transaction
                     by=Customer]

# 3. Check the structure of the new table and ensure
# that all the variables are numeric. ####
str(rfm)

# 14C: Descriptive Statistics ####

# 1. Get a first impression of the distribution of RFM measures ####
# by taking a look at the data summary.
summary(rfm) 

# 2. Plot the histograms for all 3 measures in ggplot2 and arrange them in a single figure. ####

# 3. Adjust the title, labels, and colors of your plots in an appealing way. ####

plot1 <- ggplot(rfm, aes(recency)) + 
  geom_histogram(fill="blue",bins = 20) + 
  ggtitle("Histogram: Recency") + 
  xlab("Recency") + 
  ylab("Count")

plot2 <- ggplot(rfm, aes(frequency)) + 
  geom_histogram(fill="green", bins = 20) +
  ggtitle("Histogram: Frequency") + 
  xlab("Frequency") + 
  ylab("Count")

plot3 <- ggplot(rfm, aes(monetary)) + 
  geom_histogram(fill="red", bins = 20) + 
  ggtitle("Histogram: Monetary Value") + 
  xlab("Monetary Value") + 
  ylab("Count")

plot1
plot2
plot3

# plot all plots in one ####
gridExtra::grid.arrange(plot1, plot2, plot3)


# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------

# ------------------------------- RFM - DAY 2 ---------------------------------


# 24A: Calculation of RFM scores ####

# cut2() example
temp <- c(1, 1, 1, 3, 4, 7, 8, 9 ,10, 10)
cut2(temp, g=2)
as.numeric(cut2(temp, g=2))

# 1. Use the cut2() function  ####
#in order to transform recency, frequency, and monetary value into scores from 1 to 3.


rfm_scores <- rfm[,list(Customer,
                        recency = as.numeric(cut2(-recency, g=3)),
                        frequency = as.numeric(cut2(frequency, g=3)),
                        monetary = as.numeric(cut2(monetary, g=3))
)]

# 2. Plot histograms. ####

plot1 <- ggplot(rfm_scores, aes(recency)) +
  geom_histogram(fill="blue", bins = 20) + 
  ggtitle("Histogram: Recency Score") +
  xlab("Recency Score") + ylab("Count")

plot2 <- ggplot(rfm_scores, aes(frequency)) +
  geom_histogram(fill="green", bins = 20) +
  ggtitle("Histogram: Frequency Score") +
  xlab("Frequency Score") + ylab("Count")

plot3 <- ggplot(rfm_scores, aes(monetary)) +
  geom_histogram(fill="red", bins = 20) +
  ggtitle("Histogram: Monetary Value Score") +
  xlab("Monetary Value Score") + ylab("Count")  

plot1
plot2
plot3

gridExtra::grid.arrange(plot1, plot2, plot3)


# 24B: The overall RFM score ####

# 1. Calculation of unweighted RFM scores ####
rfm_scores[,overall:=mean(c(recency,frequency,monetary)),by=Customer]
rfm_scores

# 2. Calculation of weighted RFM scores ####
rfm_scores[,weighted_overall1:=0.2*recency+0.6*frequency+0.2*monetary] 
rfm_scores

rfm_scores[,weighted_overall2:=0.6*recency+0.2*frequency+0.2*monetary]
rfm_scores

# 3. Divide all customers in 3 distinct RFM groups by rounding the unweighted overall RFM score. ####
#?round
rfm_scores[,group:=round(overall)]

# 4. 4.	Display all customers with the highest achievable rating.
rfm_scores[group==3]
table(rfm_scores$group)
