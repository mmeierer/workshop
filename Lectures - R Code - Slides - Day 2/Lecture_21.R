
library(data.table)

# Simulate data
simdata <- data.table(PurchAmount=3:7,Cost=1:5)

# Get some working code
(sum(simdata[,PurchAmount], na.rm=T)-
    sum(simdata[,Cost], na.rm=T))/
  sum(simdata[,Cost], na.rm=T)*
  100

# Rewrite the code using temporary variables
x <- simdata
r <- "PurchAmount"
c <- "Cost"

(sum(x[,r, with = FALSE],na.rm=T)-
    sum(x[,c, with = FALSE],na.rm=T))/
  sum(x[,c, with = FALSE],na.rm=T)*
  100

# All the following 4 ways are okay
(sum(x[,..r],na.rm=T)-sum(x[,..c],na.rm=T))/sum(x[,..c],na.rm=T)*100
(sum(x[,r,with=F],na.rm=T)-sum(x[,c,with=F],na.rm=T))/sum(x[,c,with=F],na.rm=T)*100
(sum(x[,get(r)],na.rm=T)-sum(x[,get(c)],na.rm=T))/sum(x[,get(c)],na.rm=T)*100
(sum(x[,mget(r)],na.rm=T)-sum(x[,mget(c)],na.rm=T))/sum(x[,mget(c)],na.rm=T)*100

# Turn your code into a function 
ROI <- function(x,r,c){
  value <- (sum(x[,r, with = FALSE],na.rm=T)-
              sum(x[,c, with = FALSE],na.rm=T))/
    sum(x[,c, with = FALSE],na.rm=T)*
    100
  return(value)
}

ROI(simdata,"PurchAmount","Cost")

# Apply your function
myData <- fread("transactions.csv")
ROI(myData,"PurchAmount","Cost")

