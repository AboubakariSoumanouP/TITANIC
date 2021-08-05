Train<-read.csv(file.choose())
library(tidyverse)

## Question 1: Graph
dim(Train)

Train%>% ggplot(aes(x= Survived)) + geom_bar()

## Question 2: Factors
Train$Survived <- as.factor(Train$Survived)

Train%>% ggplot(aes(x= Survived)) + geom_bar()

Train$Survived = factor(Train$Survived, 
                        levels=c(0,1),
                        labels=c("Perished","Survived")) 

Train
Train%>% ggplot(aes(x= Survived)) + geom_bar()

## Question 3: Proportion Table

Train[, c("Survived")]
count(Train,Survived)
prop.table(count(Train,Survived)[2])

# Question 4: Survival Rate by Gender


Train%>% ggplot(aes(x= Sex)) + geom_bar() # without the legend

Train%>% ggplot() + geom_bar(aes(x=Sex,
                                 fill= Survived))


# Question 5: Survival Rate by Passenger Class

Train%>% ggplot(aes(x= Pclass)) + geom_bar() # without the legend


Train%>% ggplot() + geom_bar(aes(x= Pclass,
                                 fill=Survived))


# Question 6: Survival Rate by Gender and Ticket Class

ggplot(Train, aes(x=Sex, fill=Survived)) + geom_bar()+
  facet_wrap(~ Pclass)


Train%>% ggplot() + geom_bar(aes(x=Sex,
                                 fill= Survived))+
  facet_wrap(~ Pclass)





# Question 7: Survival Rate by Age

Train<-na.omit(Train)
Train

Train[ , c("Age")]

Train%>% ggplot(aes(x= Age)) + geom_histogram(binwidth = 5) # without the legend

ggplot(Train, aes(Age)) + geom_histogram(binwidth = 5)  # without the legend


Train%>% ggplot(aes(x= Age,fill=Survived)) + geom_histogram(binwidth = 5)


# Question 8: Survival Rate by Age, by Gender and Class


ggplot(Train, aes(x=Age,fill=Survived)) + facet_wrap(Sex~ Pclass) + 
  geom_histogram(binwidth = 5)