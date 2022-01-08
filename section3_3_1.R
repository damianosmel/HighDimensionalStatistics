library(hdi)

data_path <- "/home/damian/Documents/books/regression/high_dim_stats4biology/data"
setwd(data_path)
raw_data <- read.csv("riboflavin.csv")
riboflavin <- as.data.frame(t(read.csv("riboflavin.csv")[1:4089,2:72]))
str(riboflavin)
## Check dimensions
x <- data.matrix(riboflavin[,-1])
y <- riboflavin[,1]

set.seed(37)
fit.stab <- hdi(x,y,method="stability", B=500, EV=1,threshold=1)#,q=20 not in use
fit.stab