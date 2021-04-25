# The sqlite3 module for working with SQLite databases
install.packages("RSQLite")
library(RSQLite)

# DB step 1: Open connection
con <- dbConnect(drv=RSQLite::SQLite(), dbname="database.sqlite")

# DB step 2a: Check which tables are in the database
dbListTables(conn=con)

# DB step 2b: Get a table from the database
dbReadTable(conn=con, name="transactions")

# DB step 2c: Create a new table in the database
library(data.table)
myData <- fread("transactions.csv")
dbWriteTable(conn=con, name="transactions_copy", value=myData)
# check if table was actually added
dbListTables(conn=con)

# DB step 2d: Remove a table from the database
dbRemoveTable(conn = con, name = "transactions_copy")	
dbListTables(con) # Check if table was actually removed

# DB step 3: Close connection to free resources
dbDisconnect(conn=con)


