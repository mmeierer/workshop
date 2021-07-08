# if statement: Only execute some code if a condition is met (1/2)
x <- -3
if(x < 0){
  print("x is a negative number")
}

# if statement: Only execute some code if a condition is met (2/2)
x <- 5
if(x < 0){
  print("x is a negative number")
} #no output because the condition is not met (i.e. FALSE)

# else statement: Only execute some code if a condition is not met (1/2)
x <- -3
if(x < 0){
  print("x is a negative number")
} else {
  print("x is either a positive number or zero")
}

# else statement: Only execute some code if a condition is not met (2/2)
x <- 5
if(x < 0){
  print("x is a negative number")
} else {
  print("x is either a positive number or zero")
}

# else if statement: Add another case (1/3)
x <- -3
if(x < 0){
  print("x is a negative number")
} else if (x == 0){
  print("x is zero")
} else {
  print("x is a positive number")
}

# else if statement: Add another case (2/3)
x <- 5
if(x < 0){
  print("x is a negative number")
} else if (x == 0){
  print("x is zero")
} else {
  print("x is a positive number")
}

# else if statement: Add another case (3/3)
x <- 0
if(x < 0){
  print("x is a negative number")
} else if (x == 0){
  print("x is zero")
} else {
  print("x is a positive number")
}


