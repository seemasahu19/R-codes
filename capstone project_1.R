getwd()
setwd("C:\\Users\\seema sahu\\Desktop\\New folder")
churn_mv = read.csv("Churn_MV.csv")

churn_mv_1 = churn_mv[seq(2,nrow(churn_mv),2),] #churn data set without na

sum(is.na(churn_mv))

mean(churn_mv_1$Daily.Charges.MV,na.rm = T)#use na.rm for removing na values in a particular column because na.omit removes all the values from all the column

median(churn_mv_1$Daily.Charges.MV,na.rm = T)


churn_mv_1$Daily.Charges.MV_Mean = ifelse(is.na(churn_mv_1$Daily.Charges.MV),mean(churn_mv_1$Daily.Charges.MV,na.rm = T)
,churn_mv_1$Daily.Charges.MV)

churn_mv_1$Daily.Charges.MV_Median = ifelse(is.na(churn_mv_1$Daily.Charges.MV),median(churn_mv_1$Daily.Charges.MV,na.rm = T)
,churn_mv_1$Daily.Charges.MV)

#whichever has less error after subtracting actual values with expected values replace that with measure of central tendency

sum((churn_mv_1$Day.Charge - churn_mv_1$Daily.Charges.MV_Mean)**2)#since error is less for mean we select mean
sum((churn_mv_1$Day.Charge - churn_mv_1$Daily.Charges.MV_Median)**2)



length(unique(churn_mv_1$Account.Length))
churn_mv_1$Area.Code = as.factor(churn_mv_1$Area.Code)
churn_mv_1$VMail.Plan = as.factor(churn_mv_1$VMail.Plan)
churn_mv_1$Intl.Plan = as.factor(churn_mv_1$Intl.Plan)
churn_mv_1$Churn = as.factor(churn_mv_1$Churn)

str(churn_mv_1)
IQR(churn_mv_1$Intl.Charge)
?boxplot
cc = boxplot(churn_mv_1$Intl.Charge)
cc
cc$out
lower_whisker = cc$stats[1]
upper_whisker = cc$stats[5]

churn_mv_1$Intl.Charge = ifelse(churn_mv_1$Intl.Charge > upper_whisker,upper_whisker,churn_mv_1$Intl.Charge)

churn_mv_1$Intl.Charge = ifelse(churn_mv_1$Intl.Charge < lower_whisker,lower_whisker,churn_mv_1$Intl.Charge)

df_Num = churn_mv_1[,-c(8,9,10,13,20,21,22,24)]
colnames(df_Num)

df_Cat = churn_mv_1[,c(8,9,10,20,21,22)]

df_zscore = as.data.frame(scale(df_Num)) # scale gives you matrix

DF_zscore = data.frame(df_zscore,df_Cat)

new_func = function(x)
{
  result_1 = (x-min(x))/(max(x)-min(x))
  return(result_1)
}
df_min_max = new_func(df_Num)

install.packages("corrplot")

library(corrplot)


corrplot(cor(df_Num))

?t.test
#H0 = international plan is independent of Voicemail plan
#HA = international plan is dependent on Voicemail plan

table(churn_mv_1$Intl.Plan,churn_mv_1$VMail.Plan)
chisq.test(table(churn_mv_1$Intl.Plan,churn_mv_1$VMail.Plan))


#ANOVA : test between one categorical and one numerical data



a = DF_zscore$Intl.Mins
b = DF_zscore$Intl.Plan
df_new = data.frame(a,b)
n_u = aov(a~b,data = df_new) 
summary(n_u)


#Descriptive stats wont give you correlation for few categorical data
#EDA : for two variables; uni variant, bi-variant, multi variant(6-7 columns can be used)
#with respect to target we will compare two variables

boxplot(churn_mv_1$Churn, churn_mv_1$Intl.Charge)
?aov

ggplot(churn_mv_1,aes(Intl.Plan,fill = Churn))+geom_bar(size = 1)
#customer who has international plans have more tendency of churning out than who do not have international plan
?ggplot
ggplot(churn_mv_1,aes(CustServ.Calls,fill=Churn))+geom_bar()
ggplot(churn_mv_1,aes(jitter(as.numeric(Churn)),Day.Charge,col=Eve.Charge,size = Night.Charge))+geom_point()

unique(churn_mv_1$Intl.Plan)
       
#remove categorical colums
dfn1= churn_mv[,c(1:7,11)]

dfn2= churn_mv[,c(13:18)]
df<- data.frame(dfn1,dfn2)
View(df)
 
#split nulls and non nulls

split.data.frame(df , is.na(df$Daily.Charges.MV))
  

df_notnull<- na.omit(df)
df_notnull
View(df_notnull)
library(dplyr)
df_null<- arrange(df,desc(df$Daily.Charges.MV))
View(df_null)

#or
df_null <- df[is.na(df$Daily.Charges.MV),]
View(df_null)

# co-relation between daily charges with account length,and remaining all colums
cor(df_notnull$Day.Mins, df_notnull$Daily.Charges.MV) ## only day mins have strong corelation more than 0.70
cor(df_notnull$Account.Length, df_notnull$Daily.Charges.MV)
cor(df_notnull$VMail.Message, df_notnull$Daily.Charges.MV)
cor(df_notnull$Eve.Mins, df_notnull$Daily.Charges.MV)
cor(df_notnull$Night.Mins, df_notnull$Daily.Charges.MV)
cor(df_notnull$Intl.Mins, df_notnull$Daily.Charges.MV)
cor(df_notnull$CustServ.Calls, df_notnull$Daily.Charges.MV)
cor(df_notnull$Day.Calls, df_notnull$Daily.Charges.MV)
cor(df_notnull$Eve.Calls, df_notnull$Daily.Charges.MV)
cor(df_notnull$Eve.Charge, df_notnull$Daily.Charges.MV)
cor(df_notnull$Night.Calls, df_notnull$Daily.Charges.MV)
cor(df_notnull$Night.Charge, df_notnull$Daily.Charges.MV)
cor(df_notnull$Intl.Calls, df_notnull$Daily.Charges.MV)

set.seed(657)
df_notnull
ids<-sample(nrow(df_notnull),nrow(df_notnull)*0.8)
View(ids)
train=df_notnull[ids,]
test=df_notnull[-ids,]
lin_model=lm(train$Daily.Charges.MV ~., data = train)
summary(lin_model)
test$pred = predict(lin_model,newdata = test)
summary(lin_model)
install.packages(ggfortify)
library(ggfortify)
par(mfrow=c(2,2))
plot(lin_model)
plot(lin_model,2)

##rmse

test$error = test$Daily.Charges.MV - test$pred

test$error_sq = test$error^2
rmse = sqrt(mean(test$error_sq))
rmse
