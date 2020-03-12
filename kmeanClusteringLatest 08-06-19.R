data1 = read.csv("C:/Users/phsivale/Documents/Trainings/universalBank.csv")
#
data1$ID = NULL

summary(data1)

# library(corrplot)
# corrplot(cor(data1[,c(2,3,4,6,7)]))
# skewpart()
data1$ZIP.Code = as.factor(data1$ZIP.Code)
data1$Family = as.factor(data1$Family)
data1$Education = as.factor(data1$Education)

data1$ZIP.Code = NULL

summary(data1)
# data1 = data1[-data1$Experience <0,]
sum(data1$Experience <0)

names(data1)
library(corrplot)
corrplot(cor(data1[,-c(4,6,8,9,10,11)]),method = 'number')
View(cor(data1[,-c(4,6,8,9,10,11)]))

data1$Experience = NULL # High cor with Age
# data1$CCAvg = NULL # High cor with Income Will drop this later

summary(data1)
data1$Family = as.factor(data1$Family)
names(data1)
str(data1)

### Convert Cat to numeric
library(dummies)
data1_dummies = dummy.data.frame(data1)
names(data1_dummies)
data1_dummies = data1_dummies[,-c(6,10)]

### Scaling
###Min max scaling
fnScaling = function(x){
  return((x-min(x))/(max(x)-min(x)))
}
for(i in 1:ncol(data1_dummies)){
  data1_dummies[,i] = fnScaling(data1_dummies[,i])
}
summary(data1_dummies)

### Kmeans clustering
clust =  kmeans(x=data1_dummies,centers = 3)
# data1_dummies$cluster = clust$cluster
length(clust$cluster)
clust$centers
clust$withinss
clust$betweenss
table(clust$cluster)
#######
withinByBetween = c()
for(i in 2:15){
  clust = kmeans(data1_dummies,centers = i)
  withinByBetween = c(withinByBetween,sum(clust$withinss)/clust$betweenss)
}

plot(2:15,withinByBetween,type = 'l')

#### Using 6 clusters
clust = kmeans(data1_dummies,centers = 6)
clust$centers

data1_dummies$cluster = clust$cluster

head(data1_dummies)

########



data1_dummies$clust = clust$cluster

clust$cluster ## CLUSTER ID
clust$centers ## Centroids
clust$betweenss ## 
clust$withinss
mean(clust$withinss)/clust$betweenss ## IntraCluster/interCluster

data1_dummies$clust = NULL
##
withinByBetween = c()
for(k in 2:15){
  clust = kmeans(x=data1_dummies,centers = k)
  ##betweenByTotal = c(betweenByTotal,clust$betweenss/clust$totss)
  withinByBetween = c(withinByBetween, mean(clust$withinss)/clust$betweenss)
}
# kmeans(x=data1_dummies,centers = 5)
plot(2:15,withinByBetween,type = 'l')


clust =  kmeans(x=data1_dummies,centers = 6)
clust$centers
data1_dummies$cluster = clust$cluster
View(data1_dummies[data1_dummies$cluster < 3,])
table(clust$cluster)

data1$cluster = clust$cluster

?kmeans
data1$cluster = as.factor(data1$cluster)

library(ggplot2)

ggplot()+
  geom_boxplot(aes(x="",y=data1$Mortgage))



data1_dummies$cluster = NULL
