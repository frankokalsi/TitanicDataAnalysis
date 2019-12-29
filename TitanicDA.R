#Load Raw Data
train <- read.csv("train.csv", header=TRUE)
test <- read.csv("test.csv", header=TRUE)

#Add a "Survived" variable to the test set to allow for containing data sets
test.survived <- data.frame(Survived = rep("None", nrow(test)), test[,])

#Combine data sets
data.combined <- rbind(train, test.survived)

#Display structure
str(data.combined)

#Factoring
data.combined$Survived <- as.factor(data.combined$Survived)
data.combined$Pclass <- as.factor(data.combined$Pclass)

#Take a look at gross survival rates
table(data.combined$Survived)

#Distribution across classes
table(data.combined$Pclass)

#Load up ggplot2 package to use for visualisation
library(ggplot2)

#Hypothesis
train$Pclass <- as.factor(train$Pclass)
ggplot(train, aes(x = Pclass, fill = factor(Survived))) +
  geom_bar() +
  xlab("Pclass") +
  ylab("Total Count") +
  labs(fill = "Survived")