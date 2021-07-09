# 1.	Create a function that takes two input arguments: variable X and variable Y.
# Create a function that divides variable X by variable Y.

divide <- function(x, y){
  result <- x / y
  return(result)
}
divide(1,2)

# You can also add "if" statement inside the function
divide <- function(x, y){
  if (y == 0){
    return(print("denominator should not be zero"))
  } else {
    result <- x / y
    return(result)
  }
}
divide(1,2)
divide(1,0)


