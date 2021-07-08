# setwd()
library(data.table)
library(lubridate)

# 1.	Read in participants_list.csv. 
participants <- *******ADD YOUR CODE HERE*******("participants_list.csv")
setnames(participants,c("first","last","gender"))
participants[,name := paste(first,last)]
participants

# 2. Introduce a variable q.type with values theory or coding.
*******ADD YOUR CODE HERE******* <- "coding" # q.type <- "theory"

# 3. Write an if else statement
# If we provide a theory question, make sure that a male participant (gender = 1) is drawn,
# if it's a coding question, 
# make sure a girl (gender = 0) will answer the question.
# To randomly draw an element, use sample(x, size = 1).

if(q.type=="coding"){
  *******ADD YOUR CODE HERE*******(participants[gender== *******ADD YOUR CODE HERE*******, name], 1) 
} else{
  *******ADD YOUR CODE HERE*******(participants[gender== *******ADD YOUR CODE HERE*******, name], 1) 
}

# 3.

# Introduce a variable q.difficulty with values difficult or easy. 

q.difficulty <- "difficult"
# q.difficulty <- "easy"
q.type <- "coding"

# If the question is difficult, the question should go to both
# male and female participants (independent of q.type).  

if(*******ADD YOUR CODE HERE*******=="difficult"){              # if question is "difficult"
  sample(participants$*******ADD YOUR CODE HERE*******, 1)              # question can go to male and female participants
} else if(q.type=="*******ADD YOUR CODE HERE*******"){                # if question not "difficult" and question is theory 
  sample(participants[gender==*******ADD YOUR CODE HERE*******, name], 1)  # select male participants
}else {
  sample(participants[gender==*******ADD YOUR CODE HERE*******, name], 1)  # otherwise female participant
}


