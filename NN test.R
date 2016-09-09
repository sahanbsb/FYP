#loading Boston dataset from MASS package
set.seed(500)
library(MASS)
data <- Boston
#data <- read.csv("combinedcsv.csv")
#data$Date <- as.Date(as.character(data$Date),format="%d/%m/%Y")

#check weather there are missing values
apply(data,2,function(x) sum(is.na(x)))

#randomly splitting data to train and test
index <- sample(1:nrow(data),round(0.75*nrow(data)))
train <- data[index,]
test <- data[-index,]

#Fitting data to a liner model
#lm.fit <- glm(Quantity~., data=train)
lm.fit <- glm(medv~., data=train)
summary(lm.fit)
pr.lm <- predict(lm.fit,test)
#MSE.lm <- sum((pr.lm - test$Quantity)^2)/nrow(test)
MSE.lm <- sum((pr.lm - test$medv)^2)/nrow(test)

#preparing data
maxs <- apply(data, 2, max) 
mins <- apply(data, 2, min)

scaled <- as.data.frame(scale(data, center = mins, scale = maxs - mins))

train_ <- scaled[index,]
test_ <- scaled[-index,]

#Parameters
library(neuralnet)
n <- names(train_)
f <- as.formula(paste("medv ~", paste(n[!n %in% "medv"], collapse = " + ")))
nn <- neuralnet(f,data=train_,hidden=c(5,3),linear.output=T)



