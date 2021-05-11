library(readr)

#Load Library
library(e1071)

RemoveDollarSign <- function(ticker){
  ticker$Close = as.numeric(gsub("[\\$,]", "", ticker$Close))
  ticker$Open = as.numeric(gsub("[\\$,]", "", ticker$Open))
  ticker$High = as.numeric(gsub("[\\$,]", "", ticker$High))
  ticker$Low = as.numeric(gsub("[\\$,]", "", ticker$Low))
  
  return (ticker)
}

df <- read_csv("NFLX.csv")
df = RemoveDollarSign(df)

df2 <- data.frame(df$Close,df$Compound)

#initialize plot
plot(df2, pch=16)

#initlialize model
model <- svm(Compound ~ Close , data = df, ranges=list(elsilon=seq(0,1,0.1), cost=1:100))

# make a prediction for each X
predictedY <- predict(model, df)

#print(predictedY)

# display the predictions
points(df$Close, predictedY, col = "blue", pch=4)



