# setwd()
library(data.table)
library(lubridate)

participants <- fread("participants_list.csv")

# 1.	Create a new column that contains the students' full names.
participants[, name := *******ADD YOUR CODE HERE*******(`First Name`, `Last Name`)]

# 2.	Then create a function that randomly picks a name from the input data.
# Use the newly generated column in myData as the input.

pick_a_random_student <- *******ADD YOUR CODE HERE*******(names){
  student <- *******ADD YOUR CODE HERE*******(names, 1)
  *******ADD YOUR CODE HERE*******
}

pick_a_random_student(participants[, name])