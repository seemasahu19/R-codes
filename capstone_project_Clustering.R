getwd()
setwd("C:/Users/DELL/Downloads/")
churn = read.csv("Churn_MV.csv")
churn = churn[seq(2,nrow(churn),2),] #churn data set without na
table(churn$Churn)
names(churn)
churn$Area.Code = as.factor(churn$Area.Code)
churn$State = as.factor(churn$State)
churn$Churn = as.factor(churn$Churn)
churn_clust = churn[,c(8,20,21)]
churn_clust1 = churn[,-c(8,20,21,22)]
summary(churn_clust1)
#install.packages("reshape2")
library("reshape2")
x1 = dcast(churn_clust,State+Area.Code~Churn)
x1
x2 = data.frame(x1$`0`,x1$`1`)
### Kmeans clustering
clust =  kmeans(x2,centers = 15)
summary(clust)
clust$centers
clust$cluster
clust$withinss
clust$betweenss
table(clust$cluster)
withinByBetween = c()
for(i in 2:15){
  clust = kmeans(x2,centers = i)
  withinByBetween = c(withinByBetween,sum(clust$withinss)/clust$betweenss)
}
plot(2:15,withinByBetween,type = 'l')

clust =  kmeans(x2,centers = 6)
clust$centers
clust$cluster
clust$withinss
clust$betweenss
table(clust$cluster)

x1$cluster = clust$cluster
x1
churn_clust = merge.data.frame(churn,x1)
churn_clust$`0`=NULL
churn_clust$`1` = NULL
