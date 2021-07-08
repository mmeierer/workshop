# while loop: Only execute some code if a condition is met 
x <- 1
while(x <= 7){
  print(paste("x is set to", x))
  x <- x + 1
}


# infinite loop
x <- 2
while(x == 2){
  print(x)
}
# to quit, hit the red octagon "STOP" in the GUI or the ESC button

# Sidenote: use paste() to combine characters
variable <- 100 
paste(variable, "%", sep="") #adds a % after the variable (no space)
paste(variable, "%", sep=" ") #same as above, with space as sep
paste("Customer spent", variable, "$") #inserts the variable into the sentence


# for loop: Loop over elements
cities <- c("New York", "Paris", 
            "London", "Tokyo", 
            "Cape Town")

for(i in 1:length(cities)){
  print(cities[i])
}


# for loop: Take a break
for(i in 1:length(cities)){
  if(cities[i] == "London"){
    break
  }
  print(cities[i])
}

# for loop: Skip with next
for(i in 1:length(cities)){
  if(cities[i] == "London"){
    next
  }
  print(cities[i])
}

# for loop: Loop over vectors
for(city in cities){
  print(city)
}

