library(lubridate)
library(RSQLite)
library(data.table)

setwd("")

# Open connection
con <- dbConnect(drv=RSQLite::SQLite(),dbname="database.sqlite")
dbListTables(conn = con)
dbListFields(conn=con, "demographics")
dbListFields(conn=con, "transactions")

transactions <- data.table(dbGetQuery(con,"SELECT * FROM transactions;"))
demographics <- data.table(dbGetQuery(con,"SELECT * FROM demographics;"))

# Selecting rows by condition (transactions > $100)

transactions[PurchAmount > 100, ]

dbGetQuery(con, "SELECT * FROM transactions
                 WHERE PurchAmount > 100;")

# Selecting multiple columns by column name

transactions[,list(Customer, TransDate, PurchAmount)]

dbGetQuery(con, "SELECT Customer, TransDate, PurchAmount
                 FROM transactions;")

# Combining operations to select by row and column

transactions[PurchAmount > 100, list(TransDate, Cost)]

dbGetQuery(con, "SELECT TransDate, Cost
                 FROM transactions
                 WHERE PurchAmount > 100;")

# Apply an aggregating function to a single variable by an aggregating dimension 

transactions[,list(AggPurch=sum(PurchAmount)),by=Customer]

dbGetQuery(con, "SELECT Customer, 
                 SUM(PurchAmount) AS AggPurch
                 FROM transactions
                 GROUP BY Customer;")

# Apply an aggregating function to multiple variables by an aggregating dimension

transactions[,list(AggPurch=sum(PurchAmount),
                   AggQuant=sum(Quantity)), by=Customer]

dbGetQuery(con, "SELECT Customer, SUM(PurchAmount) 
                 AS AggPurch, SUM(Quantity) AS AggQuant
                 FROM transactions
                 GROUP BY Customer;")

# Apply an aggregating function by a transformed aggregating dimension

transactions[,list(AggPurch=sum(PurchAmount)),
             by=(Date=floor_date(TransDate, unit="month"))]

dbGetQuery(con, "SELECT date(TransDate, 'start of month')
                 AS Month, SUM(PurchAmount) AS AggPurch
                 FROM transactions
                 GROUP BY Month;")

# Inner join

# Note:
# instead of A we use transactions
# instead of B we use demographics
# instead of ID we use Customer

merge(transactions, demographics, by = "Customer", all = FALSE)

dbGetQuery(con, "SELECT * FROM transactions
                INNER JOIN demographics
                ON transactions.Customer=demographics.Customer;")

# Left outer join

merge(transactions, demographics, by = "Customer", all.x = TRUE)

dbGetQuery(con, "SELECT * FROM transactions
                LEFT JOIN demographics
                ON transactions.Customer=demographics.Customer;")

# Inner join by multiple variables
merge(transactions, demographics, by.x =c("Customer", "TransDate"), 
      by.y=c("Customer", "JoinDate"), all=FALSE)

dbGetQuery(con, "SELECT * FROM transactions 
                 INNER JOIN demographics
                 ON transactions.Customer=demographics.Customer 
                 AND transactions.TransDate=demographics.JoinDate;")

# Close connection to free resources
dbDisconnect(conn=con)

