# Store results of a loop in a vector
cities <- c("New York", "Paris", 
            "London", "Tokyo", 
            "Cape Town")

# print to console
for(i in 1:length(cities)){
  print(nchar(cities[i]))
}

# save to an object 
numChars <- c()
for(i in 1:length(cities)){
  numChars[i] <- nchar(cities[i])
}
numChars

# Substitute loops with the sapply() function
help("sapply")
sapply(cities, nchar)
sapply(cities, nchar,  USE.NAMES=FALSE)

# Substitute loops with vectorization
cities <- c("New York", "Paris", 
            "London", "Tokyo", 
            "Cape Town")

nchar(cities)

