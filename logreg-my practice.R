getwd()
setwd("C:\\Users\\seema sahu\\Downloads\\Analytic path R new")
credit_df = read.csv("UniversalBank 08-06-19.csv")

head(credit_df)
summary(credit_df)


#ID-numeric, Age-numeric, Experience-numeric Income-numeric, ZIP.Code-numeric, 
#Family-numeric, CCAvg-categorical, Education-categorical, Mortgage-num,
#Personal.Loan-categorical, Securities.Account-categorical, CD.Account-categorical,
# Online-categorical, CreditCard-categorical


hist(credit_df$Mortgage)
barplot(table(credit_df$Personal.Loan, credit_df$CD.Account))
prop.table(table(credit_df$Personal.Loan, credit_df$CD.Account))
boxplot(credit_df$Age~credit_df$Personal.Loan) # we observed by boxplot age don't hv impact
boxplot(credit_df$Income~credit_df$Personal.Loan) # observe means and outliers 
#we can perform 2-sample t-test(or anova , f-test acc.to no. of variables)


credit_df$ID = NULL
length(unique(credit_df$ZIP.Code))

credit_df$ZIP.Code = NULL ## we can use it to identify or classify the the region , contory etc 
# by using 1st 3 no.s of zipcode , currently i m dropping it.

sum(credit_df$Experience<0) # it shows zero values in summary 
credit_df$Age[credit_df$Experience<0]
credit_df$income[credit_df$Age]

credit_df$Experience = NULL


# find out correlation which variables are highly corelated
cor(credit_df)


# plot linear retionship b/w highly correlated variables 
#correlation can not perform in the categorical variables  
plot(credit_df$Age, credit_df$Experience)
 library(corrplot)
corrplot(credit_df)

summary(credit_df)

credit_df$CreditCard = as.factor(credit_df$CreditCard)
credit_df$Education = as.factor(credit_df$Education)
credit_df$Personal.Loan = as.factor(credit_df$Personal.Loan)
credit_df$Securities.Account = as.factor(credit_df$Securities.Account)
credit_df$CD.Account = as.factor(credit_df$CD.Account)
credit_df$Online = as.factor(credit_df$Online)

###  train test split
set.seed(123)
trainRows = sample(1:nrow(credit_df), round(0.7*nrow(credit_df)))
traindata = credit_df[trainRows, ]
testdata = credit_df[-trainRows, ]

## Model 
logreg = glm(Personal.Loan~., data = traindata,
             family = binomial(link = "logit"))
summary(logreg)
preds = predict(logreg, ) ## Will retun log odds
preds = predict(logreg, testdata, type='response') ## Will retun probs

preds_class = ifelse(preds >= 0.3,1,0)


## Conf Matrix
table(testdata$Personal.Loan, preds_class, dnn = c("Acts","Preds"))

###
#### ROC
library(ROCR)
pred = prediction(preds , testdata$Personal.Loan)
perf= performance(pred, "tpr","fpr")
# perf= performance(pred, "tnr","fnr")
# perf= performance(pred, "prec","rec")
# plot(perf,colorize = T)

plot(perf, colorize=T, print.cutoffs.at=seq(0,1,by=0.05), 
     text.adj=c(1.2,1.2), avg="threshold", lwd=3,
     main= "ROC")

AUC_1 = performance(pred, measure = 'auc')
AUC_1@y.values[[1]]
AUC_1


