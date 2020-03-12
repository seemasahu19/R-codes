library(ISLR)
data(iris)
head(iris)
iris = iris[, -(5)]
head(iris)
summary(iris)
mydata <- na.omit(iris) # listwise deletion of missing
mydata <- scale(mydata) # standardize variables 

head(mydata)


# Ward Hierarchical Clustering

d <- dist(mydata, method = "euclidean") # distance matrix
head(d)

fit <- hclust(d, method="ward") 
plot(fit) # display dendogram

names(fit)
### creating the clusters using cuttree function 

s = cutree(fit, k=3) # cluster number to 3 

s

table(s)

mydata_c = cbind( mydata, s)
head(mydata_c)
tail(mydata_c)

head(mydata_c)
# draw dendogram with red borders around the 3 clusters 
rect.hclust(fit, k=3, border="red") 

rect.hclust(fit, k=5, border="blue") 


head(iris)
# number of clusters
wss <- (nrow(mydata)-1)*sum(apply(mydata,2,var))

apply(mydata,2,var)

clust3 = kmeans(mydata, 3)
names(clust3)
clust3$withinss

for (i in 2:15) wss[i] <- sum(kmeans(mydata, 
                                     centers=i)$withinss)
plot(1:15, wss, type="b", xlab="Clusters",
     ylab="Within groups sum of squares")
# K-Means Cluster Analysis
fit <- kmeans(mydata, 3) # 5 cluster solution
head(mydata)
names(fit)
fit$cluster
####table(iris$Species)

cluster = fit$cluster
mydata = cbind(iris,cluster)

table(mydata$cluster)
head(mydata)
# get cluster means 
aggregate(iris,by=list(cluster),FUN=mean)
# append cluster as signment
mydata <- data.frame(iris, fit$cluster)

table(mydata[,5])

dim(cluster1)

cluster1 = mydata[mydata$cluster==1,]
cluster2 = mydata[mydata$cluster==2,]
summary(cluster1)
summary(cluster2)
table(mydata$fit.cluster)
write.csv(cluster1, "file1.csv", row.names = F)
mydata[mydata$cluster==2,]
# K-Means Clustering with 5 clusters
fit <- kmeans(mydata, 3)


#### exploration on clusters 

library(ggplot2)

mydata$cluster = as.factor(mydata_k$cluster)
ggplot(mydata, aes( Sepal.Length,Sepal.Width, color=cluster )) + geom_point()

ggplot( mydata , aes( Petal.Length , Petal.Width, color=cluster)) + geom_point()


ggplot( mydata , aes(Sepal.Length, Petal.Length, color=cluster )) + geom_point()
## using Principal components to view the cluster formation
# vary parameters for most readable graph
library(cluster) 
clusplot(mydata, fit$cluster, color=TRUE, shade=TRUE, 
         labels=2, lines=0)

a = kmeans(mydata, 3, method="manhattan")
install.packages("amap")
library(amap)
a = Kmeans(mydata, 3, method="manhattan")
a$cluster
