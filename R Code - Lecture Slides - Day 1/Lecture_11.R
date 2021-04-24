library(data.table)
library(lubridate)

myData <- fread("transactions.csv")
CustData <- fread("demographics.csv")

myData[, TransDate:=dmy(TransDate, tz = "UTC")]
CustData[, JoinDate:=ymd(JoinDate, tz = "UTC")]

# Note:
# instead of A we use myData
# instead of B we use CustData
# instead of ID we use Customer

# Merging: outer join
merge(myData, CustData, by="Customer", all=TRUE)

# Merging: left outer join
merge(myData, CustData, by="Customer", all.x=TRUE)

# Merging: right outer join
merge(myData, CustData, by="Customer", all.y=TRUE)

# What to do when IDs have different names
setnames(CustData, "Customer", "ID") # Rename variable to illustrate the following command
merge(myData, CustData, by.x="Customer", by.y="ID", all=FALSE)
setnames(CustData, "ID", "Customer") # Undo renaming

# Merging by multiple IDs
merge(myData, CustData, by.x=c("Customer", "TransDate"),
      by.y=c("Customer", "JoinDate"), all=FALSE)
