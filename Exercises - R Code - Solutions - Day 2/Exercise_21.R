# setwd()
library(data.table)
library(lubridate)

participants <- fread("participants_list.csv")

# 1.	Create a new column that contains the students' full names.
participants[, name := paste(`First Name`, `Last Name`)]

# 2.	Then create a function that randomly picks a name from the input data.
# Use the newly generated column in myData as the input.

pick_a_random_student <- function(names){
  student <- sample(names, 1)
  return(student)
}

pick_a_random_student(participants[, name])