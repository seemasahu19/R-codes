### Datatypes 
## numbers 
## Integer and Numeric data types 
a = 10 
class(a) # return the data type of object a
a = 10L
class(a)

##  type casting 
b = as.numeric(a) 
class(b)

class(a)

### type casting the same variable 
a = as.numeric(a)
class(a)

a= 5L

a = 10.5

b = 10L

b = as.numeric(b)
class(b)

## numeric to integer type casting 
a = 10.5
a = as.integer(a)

## character data types 

a = "apple"
A = 'Apple'
class(a)
## character data with digits 

b = "10"
class(b)

## type casting character to numeric 

c = as.numeric(b)
c
class(c)

## type casting character to numeric with alphabets 
a
c = as.numeric(a)
c

## logical data type 

a = T 
class(a)
a = TRUE
b = F 
b = FALSE
class(b)

## type casting to logical 

a = as.logical(10)
a
a = as.logical(0)
a

### verify a data type 

is.logical(a)
is.character(a)
is.integer(a)

### Data structures 

## one dimensional data structures 
## Vector 

age = c(10,20,30,40,50)
gen = c("M","F","M","F","M")
class(gen)

abc = c(10,20,30,"M","F")
abc

## factor data type 
class(gen)
gen = as.factor(gen)
class(gen)

## 

age
age[1] ## will return the first element 
age[3]## will return the third element 


## 
fn = 1:100
fn
sample(1:100, 10)
age = c( 5, 8, 11, 15, 17)

a = seq(1,10,2)
b = seq(2,10,2)

## silicng the vectors 
a[1]
a[4]
a[1:3]
## negative index means excluding 
a[-1]
a[-4]
a[-5]
a[-3:-5]
a[-(1:4)]
a[c(3,1,5)]

### APPENDING ELEMENTS 
a
a[6] = 11
a
## appening element with a skip position 
a[8] = 15
a

## change the value of any element 
a[7] = 13

## delete an element 
a = a[-8]
a

## change the order of elements 
a = a[c(7,6,5,1,2,3,4)]
temp=c()
temp[1] = a[1]
temp[2] = a[7]
a[1] = temp[2]
a[7] = temp[1]

## vector concatination 

a = c(1,3,5,7)
b = c(2,4,6,8)
c = c(a,b)
c
sort(c)
sort(c, decreasing = T)
## two dimensional ones 

age = c(10,20,30,40,50)
gen = c("M","F","M","F","M")
sal = c(100,200,300,400,500)

emp = data.frame(age, gen, sal)
emp

## slicing a dataframe 

emp[ 1:2, ] ## will return the first two rows 
emp[1:2, 1:2] ## will return two rows and two columns
emp[,1:2] ## all rows and two columns 
emp[,-3] ## same as above
emp[3:5, 1:2]

### random picks 

emp[c(1,3,5), ]
emp[c(2,5), c(1,3)]

## exclusion 

emp[,-3] ## exclude 3rs column 
emp[-1,] ## eclude 1st row
emp[ -1, -1]
emp[-(1:3), ]


## deletion 
emp1 = emp[,-3]
emp2 = emp[-1,]
emp2
emp2[1:2,]

## variables names 
colnames(emp) ## retrive column names 
names(emp) = c("Age","Gen","Sal") ## assign names to emp
colnames(emp)

## add a new column to the dataframe 

Dep = c("a","b","a","b","a")

emp[,4] = Dep
emp

## another way fo adding a column 

emp$Dep = Dep
emp

emp$Age
emp$Sal

## deleting a column on a dataframe
emp$V4 = NULL
emp
##  selecting using column names 

emp3 = emp[,c("Age","Gen")]
emp3
emp4 = emp[,c("Age","Gen","Dep")]
emp4 = emp[,c("Dep", "Age", "Sal")]
emp4

## create a dataframe from externalfile 
setwd("D:\\AP\\Dtrees") ## using bacward slash 
setwd("D:/AP/Dtrees") ## using fwd slash

Customers = read.csv("Churn.csv", header = T, sep=",")
head(Customers)
tail(Customers, 10)
dim(Customers)
nrow(Customers)
ncol(Customers)


### operations 

## arithematic operations 

a = 20 
b = 10 

## addition 

a + b  ## addtion
c = a+b 
a - b ## substraction
a/b ## division
a %% b ## reminder
a*b ## multiplication 
a**b ## power 
a^b ## power 
a**2 ## square 
a^2 ## square

### artithematic operations on vectors 
a = c(10,20,30,40)
b = c(1,2,3,4)
a+b 

a = c(10,20,30,40,NA)
b = c(1,2,3,4,5)
a+b

## vetors are of unqual length 

a = c(1,2,3,4,5,6)
b = c(10,20,30)
a+b 

a = c(1,2,3,4,5)
b = c(10,20,30)
a + b

## comparison operators 
 a = 20 
 b = 30 
a > b ## greater than 
a < b ## lesser than
a >= b ## greater than or equal to
a <= b ## leeser than or equal to 
a == b ## equals to 
a != b ## not equals to b 

## comparison operators on vectors 

a = c(10,20,30,40,50)
b = c(1,2,3,4,5)
a > b 
a < b

## comparison operators with unequal length vectors 

a = c(10,20,30,40)
b = c( 1,2)
a > b 

a = c(10,20,30,40,50)
b = c( 10,20,30)

a > b

## operations on data frame 

head(Customers)

Customers$Total.Mins = Customers$Day.Mins + Customers$Eve.Mins + Customers$Night.Mins
Customers$Total.Charge = Customers$Day.Charge + Customers$Night.Charge + Customers$Eve.Charge

Customers$avg.charge = Customers$Total.Charge/Customers$Total.Mins

## comparison operators 

Customers$Charge.flag = Customers$Total.Charge > 60

## logical operations 

a>b & a==b 

a>b | a ==b 

## slicing a dataframe 

df1 = Customers[ Customers$Total.Mins > 600 , ]
df2 = Customers[Customers$Day.Charge > 25, ]

## comparison with text data 

df1 = Customers[ Customers$State == "FL", ] ## equal to FL
df1 = Customers[Customers$State != "FL", ] ## not equal to FL 

## %in% operator for text data 

df3 = Customers[Customers$State %in% c("FL","NY","MA"), ]

df3 = Customers[Customers$State=="FL" | Customers$State == "NY", ]

df3 = Customers[! Customers$State %in% c("FL","NY","MA"),]

df3 = Customers[Customers$State %in% c("FL","fl","Fl"), ]

df3 = Customers[upcase(Customers$State) == "FL"]

### comparison and logical operations 

df3 = Customers[ Customers$Total.Mins > 700 & Customers$State == "NY",]

df3 = Customers[ Customers$State == "NY" & Customers$State == "NJ", ]

colnames(Customers)
## Merges (Joins)

id = c(1,2,3,4,5)
desg = c("A","B","A","B","A")
gen = c("M","F","M","F","M")

df1 = data.frame(id,desg,gen)

id = c(1,2,3,4,6)
sal = c(100,200,300,400,500)
age = c(20, 22, 26, 30 , 34)

df2 = data.frame(id, sal, age)

## inner merge 
?merge
df3 = merge(x = df1, y = df2, by ="id") ## inner merge 
df3 = merge(x = df1, y = df2, by = "id", all.x=T) #left merge
df3 = merge(x = df1, y = df2, by = "id", all.y = T)# right merge
df3 = merge(x = df1, y = df2, by = "id", all.x = T, all.y = T) # full merge 

## Special cases 

## 1. No duplicates 
# if there are duplicates in the key merge wil create cartesians 

id = c(1,1,2,2)
dept =c("A","B","A","B")
gen = c("M","F","M","F")
dfa = data.frame(id, dept, gen)

id = c(1,1,2,2)
dept=c("A","B","A","B")
sal = c(100,200,300,400)
dfb = data.frame(id, dept, sal)

## merge with id alone, will crate cartesians

dfc = merge( x = dfa, y = dfb, by = "id")

## using composite key to merge ( Unique keys )

dfc = merge(x = dfa, y = dfb, by = c("id","dept"))

## when we have diffrent  namesfor keys in dataframe 

df3 = merge( x = df1, y = df2, by.x ="id", by.y="sno")

## control structures 

## if condition 
age = 20 
if( age >=18 ){
  agegrp = "Adult"
} else {
  agegrp = "Child"
}

agegrp

num = 20 

if ( num %% 2 == 0){ 
  num_type = "Even"
} else { 
  num_type = "Odd"  
}
num_type

## Multiple if else condition 

age = 45

if (age <= 20 ){
  agegrp = '0-20'
}else if ( age > 20 & age <=40 ){ 
  agegrp = '21-40'
}else if ( age > 40 & age <= 60){ 
  agegrp = '41-60'  
}else { 
  agegrp = '60+'  
  }
agegrp

0-25, 25-40, 41-65, 65+
  
## conditional statements on vectors 
  
age = c(25, 36, 42, 54)
# agegrp 0-25, 25-40, 46-60, 60+
agegrp = c()
for( i in 1:4){ 
  
  if(age[i] <= 25){ 
    agegrp[i] = '0-25'
  }else if ( age[i] > 25 & age[i] <=40){ 
    agegrp[i] = '26-40'  
  }else if ( age[i] > 40 & age[i] <= 60){
      agegrp[i] = '41-60'
  }else agegrp[i] = '60+'
  
  }

agegrp  
age = c( 10,20,30,40,50,60)
agegrp = c()
for( i in 1:length(age)){ 
  
  if(age[i] <= 25){ 
    agegrp[i] = '0-25'
  }else if ( age[i] > 25 & age[i] <=40){ 
    agegrp[i] = '26-40'  
  }else if ( age[i] > 40 & age[i] <= 60){
    agegrp[i] = '41-60'
  }else agegrp[i] = '60+'
  
  }
agegrp

### conditional statements and loops on dataframe 
for( i in 1:nrow(df2)){
  
  if (df2$age[i] <= 25){ 
    df2$agegrp[i] = '0-25'
  } else if ( df2$age[i] > 25 & df2$age[i] <=50){
    df2$agegrp[i] = "26-50"
  } else df2$agegrp[i] = "50+"

}
df2 

### ifelse function 

age = 20 

agegrp = ifelse( age >=18, "Adult", "Child")

age = c(10,15,20,30,35)
agegrp = ifelse( age >=18, "Adult", "Child")
agegrp

## nested ifelse conditions 
age = c(21, 29, 33, 36, 41, 58, 64)
agegrp = ifelse(age <=25, "0-25",ifelse(age <=40, "26-40", ifelse(age <=60, '41-60','60+')))
agegrp

age = c("a", 20 ,30)
agegrp = c()
agegrp = ifelse(age <=25, "0-25",ifelse(age <=40, "26-40", ifelse(age <=60, '41-60','60+')))
agegrp

### ifelse on a dataframe 

df2$agegrp = ifelse(df2$age <=25, "0-25",ifelse(df2$age <=40, "26-40", ifelse(df2$age <=60, '41-60','60+')))
df2

## functions 

## Data inspection 
View(Customers) # tabular view of a dataframe 
head(Customers) # will print the first six records 
head(Customers, 10) ## will print the first 10 records
tail(Customers) # Prints last six records 
tail(Customers, 10) # Prints last 10 records 

## str function 
str(Customers) ## structure of a dataframe
Customers$Phone = as.character(Customers$Phone)
str(Customers)

## Dimensions 
nrow(Customers) # Reuturns number of rows
ncol(Customers) # Returns number of columns 
dim(Customers) # Retruns rows and columns 
colnames(Customers) # returns the list of column names
#names() ## will assign columns names, but need to pass as many names as we have column
summary(Customers)
mean(Customers$Day.Mins)
median(Customers$Day.Mins)
min(Customers$Day.Mins)
max(Customers$Day.Mins)

## for factor variables 
table(Customers$State)
table(Customers$Churn)
table(Customers$Intl.Plan)
table(Customers$Churn, Customers$Intl.Plan, Customers$State)
## for one state 
cust_va = Customers[ Customers$State == "VA",]
table(cust_va$Churn, cust_va$Intl.Plan)

## DOnt run table on numeric columns, as we may have many unique values 
table(Customers$CustServ.Calls)

## sorting or ordering a dataframe 

Customers = Customers[order(Customers$State), ]
View(Customers)

Customers = Customers[order(Customers$Day.Mins), ]
View(Customers)

Customers = Customers[order(Customers$Day.Mins, decreasing = T), ]
View(Customers)

## order by two columns 
Customers = Customers[order(Customers$Day.Mins, Customers$Eve.Mins), ]
View(Customers)

Customers = Customers[order(Customers$Day.Mins, -Customers$Eve.Mins), ]
View(Customers)

## string functions 
a = "apple"
#install.packages("stringr")
library(stringr)
str_length(a)
toupper(a)
tolower(a)
substr(a, start = 2,stop = 4) # substring 
a = "FirstName"
b = substr(a, start = 1, stop = 5)
b
st
## split strings
a = "Firstname Lastname"
b = unlist(str_split(a, pattern = " "))
b[1]
b[2]

## sting replacement 
a = "Firstname-Lastname"
## replace - with Space 
b = sub(pattern = "-", replacement = " ", a)
b
## sub will replace only the first instance of the pattern 
a = "First-Name-Last-Name"
b = sub(pattern = "-", replacement = " ", a)
b
## to replace all the occurances we use gsub 
b = gsub(pattern = "-", replacement = " ", a)
b
## handling dates in r 
d = "01-01-2019"
class(d) 
library(lubridate)
d1 = as.Date(d, "%d-%m-%Y")
d1
d = "01/01/2019"
d1 = as.Date(d,"%d/%m/%Y")
d1

d = "01-Apr-2019"
d1 = as.Date(d,"%d-%b-%Y")
d1

d = "01-04-19"
d1 = as.Date(d,"%d-%m-%y")
d1

### Data functions 
year(d1)
month(d1)
day(d1)
weekdays(d1)
week(d1)

## addon packages 

## odbc 
library("RODBC")
myconn = odbcConnect(dsn = mydb, uid ="v123" , pwd ="MYpwd" )
dffromdb = sqlQuery(channel = myconn, query = "select * from mydb.tablename where state = 'VA' ")

### 
library(sqldf)

df_slq = sqldf("select * from Customers where State = 'VA'")
count = sqldf("select count(*) from df_slq")
head(Customers)
count

colnames(Customers)

df_sql = sqldf(" select * from Customers where 'Day.Mins' > 250")
head(df_sql)

dfnames = colnames(Customers)
dfnames

for ( i in 1:length(dfnames)){ 
  dfnames[i] = sub(pattern = "\\.", "", dfnames[i])
}

dfnames

names(Customers) = dfnames

View(Customers)

df_sql = sqldf(" select * from Customers where DayMins > 250")

df_a = sqldf("select * from Customers limit 10")
df_a

## 
library(dplyr)

## select function 

df_ac = select(Customers, "AccountLength","DayMins","EveMins")
df_a1 = Customers[,c(1,2,3)]

## rename function 

Customers = rename(Customers, "Account_length" = "AccountLength", "Day_Mins = DayMins"  )
View(Customers)

Customers = rename(Customers, "Eve_Mins" = "EveMins", "Night_Mins" = "NightMins")
View(Customers)

## arrange 

Customers = arrange(Customers, DayMins)
View(Customers)
Customers = arrange(Customers, -DayMins)
View(Customers)

Customers = arrange(Customers, DayMins, -Eve_Mins)
View(Customers)

## Filter 

Customers_va = filter(Customers, State == "VA")
nrow(Customers_va)

Customers_va_2 = filter(Customers, State =="VA" & DayMins >250)
nrow(Customers_va_2)

## sample_n 

cust_samp = sample_n(Customers, 15)
View(cust_samp)

## sample_frac 

cust_samp = sample_frac(Customers, 0.3)
nrow(cust_samp)

## mutate 

dfk = mutate( Customers, totusage = DayMins + Eve_Mins+Night_Mins, totusage2 = totusage*2)

Customers$totusage = Customers$DayMins+Customers$Eve_Mins+Customers$Night_Mins
Customers$totusage_2 = customers$totusage*2

### Math functions 

a = 10 
log(a)
log2(a)
sqrt(a)
b = 10.123
round(b)
round(b, 2)
round(b, 1)

## ceiling and floor 
floor(b) ## will return the lowest integer 
ceiling(b) ## will return the next integer
abs(10.1)
abs(-10.1)
a = c(10,20,30,40)
sum(a)

aggregate(Customers$DayMins, by = list(Customers$Churn), FUN = mean)
head(Customers)

aggregate(DayMins ~ Churn, data = Customers, FUN=mean)


### distinct and unique 
library(dplyr)
?distinct
abc = distinct(Customers, Churn, .keep_all = TRUE)

