library(glmnet)
library(reshape)
data_path <- "/home/damian/Documents/books/regression/high_dim_stats4biology/data"
setwd(data_path)
raw_data <- read.csv("riboflavin.csv")
riboflavin <- as.data.frame(t(read.csv("riboflavin.csv")[1:4089,2:72]))

str(riboflavin)

## Check dimensions
x <- data.matrix(riboflavin[,-1])
y <- riboflavin[,1]
dim(x)
length(y)

## Fit whole solution path for illustration
fit <- glmnet(x=x,y=y)
plot(fit)

## Perform cross-validation error-path
set.seed(42)
fit.cv <- cv.glmnet(x=x,y=y)
##Visualize the cross-validation error-path
plot(fit.cv)

##Get selected genes
b <- as.matrix(coef(fit.cv))
length(rownames(b)[b != 0])
