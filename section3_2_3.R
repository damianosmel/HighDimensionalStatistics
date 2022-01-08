library(hdi)

data_path <- "/home/damian/Documents/books/regression/high_dim_stats4biology/data"
setwd(data_path)
raw_data <- read.csv("riboflavin.csv")
riboflavin <- as.data.frame(t(read.csv("riboflavin.csv")[1:4089,2:72]))
str(riboflavin)
## Check dimensions
x <- data.matrix(riboflavin[,-1])
y <- riboflavin[,1]


## Multi-split p-values
set.seed(12)
fit.multi <- hdi(x,y,method="multi-split", B=100)
fit.multi

## Ridge p-value
#fit.ridge <- hdi(x,y,method="pval-ridge")
#fit.ridge