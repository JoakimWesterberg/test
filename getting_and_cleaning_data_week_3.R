## Lecture 1: Subsetting and sorting

set.seed(13435)
X <- data.frame("var1" = sample(1:5), "var2" = sample(6:10), "var3" = sample(11:15))
X <- X[sample(1:5),]; X$var2[c(1,3)] = NA
X
X[,1]
X[, "var1"]
X[1:2, "var2"]
X[(X$var1 <= 3 & X$var3 >11),]
X[(X$var1 <= 3 | X$var3 >15),]
X[which(X$var2 > 8),] ##finding entries, taking into account NA
sort(X$var1)
sort(X$var1, decreasing = TRUE)
sort(X$var2, na.last = TRUE)
X[order(X$var1),]
X[order(X$var1, X$var2),]
library(plyr)
arrange(X, var1) ## same thing as the above, but easier..
arrange(X, desc(var1)) ## order in decreasing
## adding rows and columns
X$var4 <- rnorm(5)
X
Y <- cbind(X, rnorm(5)) ## adding a column to the right of X
Y

## Lecture 2: Summarizing data

if(!file.exists("./data")) {dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType = DOWNLOAD"
download.file(fileUrl, destfile = "./data/restaurants.csv")
restData <- read.csv("./data/restaurants.csv")
head(restData, n = 3)
tail(restData, n = 3)
summary(restData)
str(restData)
quantile(restData$councilDistrict, probs = c(0.5, 0.75, 0.9))
table(restData$zipCode, useNA = "ifany") ## useNA means if there is NA, tit will add column with number of NA
table(restData$councilDistrict, restData$zipCode) ## two-dimensional table
sum(is.na(restData$councilDistrict)) ## if equal to zero, there is no NA
any(is.na(restData$councilDistrict))
all(restData$zipCode > 0) ## actually, one zip-code have negative value
colSums(is.na(restData)) ## checking the whole table
all(colSums(is.na(restData)) == 0) ## no missing values in the whole dataset
table(restData$zipCode %in% c("21212")) ## are there any values in zipCode that "falls in" 21212 
table(restData$zipCode %in% c("21212", "21213"))
## to get the restaurants with zipCode 21212 or 21213, we can use  indexing
restData[restData$zipCode %in% c("21212", "21213"), ]
## how to make summaries, or cross tabs
data(UCBAdmissions)
DF = as.data.frame(UCBAdmissions)
summary(DF)
xt <- xtabs(Freq ~ Gender + Admit, data = DF) ## the parameter to the left (Freq in this case), broken down into 
## Gender and Admtim
xt
