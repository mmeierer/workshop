library(data.table)
library(lubridate)
library(ggplot2)

myData <- fread("transactions.csv", nrows = 10000)
myData[, TransDate:=dmy(TransDate, tz = "UTC")]

# Colors do matter!
ggplot(myData, aes(PurchAmount, Cost, color= Cost)) + 
  geom_point() + 
  ggtitle("Costs by Purchase Amount") +  
  xlab("Purchase Amount") + ylab("Costs") +
  scale_color_gradient(low="purple",high="yellow")

ggplot(myData, aes(PurchAmount, Cost, color= Cost)) + geom_point(size=2) + 
  ggtitle("Costs by Purchase Amount") +  
  xlab("Purchase Amount") + ylab("Costs") +
  scale_color_gradient(low="white",high="black")

# Download pre-existing color palettes
install.packages("wesanderson")
library(wesanderson)

# Using color palettes to indicate a third dimension
ggplot(myData, aes(PurchAmount, Cost, color= Cost)) + 
  geom_point()  +  
  ggtitle("Costs by Purchase Amount") +  
  xlab("Purchase Amount") + ylab("Costs") +
  scale_colour_gradientn(colours= wes_palette("Cavalcanti1")) 

# In ggplot2, we can use pre-defined themes
install.packages("ggthemes")
library(ggthemes)

ggplot(myData, aes(PurchAmount, Cost, color= Cost)) + 
  geom_point(size=2) + 
  ggtitle("Costs by Purchase Amount") +  
  xlab("Purchase Amount") + ylab("Costs") +
  theme_economist()


ggplot(myData, aes(PurchAmount, Cost, color= Cost)) + 
  geom_point(size=2) + 
  ggtitle("Costs by Purchase Amount") +  
  xlab("Purchase Amount") + ylab("Costs") +
  theme_stata()

# You can adapt any theme to your requirements
ggplot(myData, aes(PurchAmount, Cost, color= Cost)) + geom_point() +
  ggtitle("Costs by Purchase Amount") +  
  xlab("Purchase Amount") + ylab("Costs") + 
  theme(plot.title = element_text(hjust = 0.5),
        panel.background = element_blank(),
        legend.position = "bottom",
        axis.line = element_line(size = 2))
