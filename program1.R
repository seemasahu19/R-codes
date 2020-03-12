a=10
b=20
a+b

#install.packages("forecast")

library("forecast")

### syntax 
a = 10 
a <- 10 
10 -> a
a

## class function 
class(a)

a = as.integer(a)

class(a)

a = 11L
a
class(a)

### Character data types 

a = "apple" ## single quotes or double quotes 

class(a)

a = "office"


## Type casting 

a = 10.5 

class(a)

a = as.integer(a)

class(a)

a

a = as.numeric(a)
class(a)
a

### character to numeric 

a = "10"

a = as.numeric(a)
class(a)
a

a = "10A"

a = as.numeric(a)
class(a)
a

## numeric to character 
a = 10.5
a = as.character(a)
a

#Data types 
# Integer, Numeric, character, factor, logical, date, strings 


## Logical data type 

a = TRUE # ( TRUE,FALSE)

class(a)

a = F # (T, F)

class(a)

## Date type 

a = '10/2/2018'
class(a)

a = as.Date(a,format = "%d/%m/%Y" )
a

b = "10-02-2018"

 d = as.Date(b, format = "%d-%m-%Y")
d 

## Data structures 

## vector 

a = c(1,2,3,4,5)

a

a[2] ## slicing a vector 

class(a)

### character a vector 

a = c("A","B","C","D")
class(a)
a[3]

## homogenous vector ( combination of char and numeric)

a = c(10,20,"A","B")
class(a)
a


###

a = c(10,20,30, T, F)
a
class(a)

## Vector slicing 

a = c(10,20,30,40)

b = a[2]
## sequence operator 
1:10
## sequqnce operator for slicing
b = a[2:3]
b

## - is for ommision
b = a[-3]
b

b = a[-2:-3]
b

## appending 

b[3] = 30
b

b[5] = 50

b

b =  b[-4]

b = b[-1]
b
b[4] = 60
b
## two dimensiona data structures 




## dataframe 

a = c(1,2,3,4,5)
b = c("A","B","A","B","A")
c = c(10,20,30,40,50)

### 

class(b)

df = data.frame(a,b,c)
df
str(df)


### importing data into a dataframe 
getwd()
setwd("D:/AP/baging and  RF") ## chnage the working directory
df2 = read.csv("credit.csv", header = T, sep = ",")

df3 = read.csv("filename.txt", header = T, sep = ";") ## if semicolon the sep 

df3 = read.csv("filename.tsv", header = T, sep = "/t")

df3 = read.csv("filename.xyz", header = T, sep = "||")

?read.csv

str(df2)

## Dataframes 

str(df2)
## inspecting 
dim(df2)
nrow(df2)
ncol(df2)
head(df2) ## first six observations
tail(df2) ## last six observations 
View(df2)

## slicing a dataframe 
df2[1,2] ## First row and second column value
df3 = df2[1:10,] ## First 10 rows and all columns
df3 = df2[,1:10] ## All rows and first 10 columns
df3 = df2[1:100, 10:17] ## first 100 rows and 10:17 columns

## 
df3 = df2[, -3] ## all rows and exclude 3rd column
df3 = df2[, -1:-5] ## all rows exclude first five columns

df3 = df2[,c(1,3,5,6,7,9,17)] ## selected columns 
df3 = df2[,c(9, 1, 7, 17, 2, 6)] ## selected columns in specific order


### exclusion 

df3 = df2[,-c(8, 10, 17, 14)] ## exclude those columns 

df3 = df2[, -c(1:6, 15)] ## eclude the columns in seuquence and few more 

### Column names 

df3 = df2[,c("checking_balance","credit_history","default")]

### delete a variable 

df2 = df2[,-1] ## deletion of a variable 

## refering a variable by variable name 

balance = df2$checking_balance

df2$checking_balance = NULL ## deletes the variable

df2$cheking_balance = balance 

### row silicing 

df3 = df2[ 1:100, ] ## first 100 rows 

df3 = df2[c(1,10,20,30,40,50), ] # six rows 

## sequence function 

seq( 1,100,5)

seq(from = 1, to = 100, by = 5)
seq(from = 5, to = 100, by = 5)
?seq

df3 = df2[ seq(from = 1, to = nrow(df2), 5), ]

seq(from=2, to = nrow(df2), 2)

df3 = df2[ , seq(1, ncol(df2), 2)]

df3 = df2[-(1:100), ]

## Matrices 

a = c(10,20,30,40)

b = matrix(a)
b

b = matrix(a, nrow = 2, ncol = 2)
b

b = matrix(a, nrow =2, ncol=2, byrow = T)
b

b[1,2]

b[1,3] = 50 ## error, we cant add elements to a unknown column 

b[1,]
b[,2]
## replace a value 
b[1,1] = 11
b

## repleace a value with character 
b[1,2] = "P"
b

## Matrices is only good for handling numneric values 
## for arithematic operations on matrices 

id = c(1,2,3,4)
age = c(25,30,35,40)
gen = c("M","F","M","F")

df1 = data.frame(id, age, gen)

id = c(1,2,3,5)
desg = c("A","B","A","B")
sal = c(100,200,300,400)

df2 = data.frame(id, desg, sal)

## merge 
## inener merge 

df3 = merge( x = df1, y = df2, by = "id") ## inner merge

df3

## left merge 

df3 = merge(x=df1, y = df2, by = "id", all.x=T) ## left merge
df3

## right merge 

df3 = merge(x = df1, y = df2, by = "id", all.y=T) ## right merge
df3

## full merge 

df3 = merge(x = df1, y = df2, by = "id", all.x = T, all.y = T) ## full merge

df3

sno = c(1,2,3,5)

df2 = data.frame(sno, desg, sal)
df2

## merging with different variable names 

df3 = merge(x = df1, y = df2, by.x = "id", by.y = "sno") ## inner merge
df3

## merging with duplicates ( creates cartesians)

id = c(1,1,2,2)
dept = c("A","B","A","B")
age = c(25,26,27,28)

df1 = data.frame(id,dept,age)

id = c(1,1,2,2)
dept = c("A","B","A","B")
gen = c("M","F","M","F")

df2 = data.frame(id, dept, gen)

df1
df2

df3 = merge( x = df1, y = df2, by ="id") # inner merge 
df3

### merge with a compiste keys ( combination of variables)


df3 = merge(x = df1, y = df2, by = c("id","dept")) ## inner merge

df3


## appending and binding 

age = c(20,25,30,35)
gen = c("M","F","M","F")

df1 = data.frame(age, gen)

desg = c("A","B","A","B")
sal = c(100,200,300,400)

df2 = data.frame(desg, sal)

df3 = cbind(df1, df2)

## cbind, # of rows in both the datframes should match 

## row binding 

id = c(1,2,3)
age = c(10,20,30)
gen = c("M","F","M")

df1 = data.frame(id, age, gen)

id = c(4,5,6)
age = c(20, 25, 30)
gen = c("F","M","F")

df2 = data.frame(id, age, gen)

df1
df2

## for rbind both the dataframes should have same structure 

df3 = rbind(df1, df2)

df3

## arithematic operations 

a = 10 ; b =2

a + b # addition
a - b # substraction
a * b # multiplication
a / b # division(quotient)
a %% b # division(remainder)
a ** b ## power
a^b ## power

## artithematic operations on vectors 

a = c(10,20,30,40)
b = c(1,2,3,4)
a + b

a = c(10,20,30,40)
b = c(1,2)
a + b 

a = c(10,20,30,40,50)
b = c(1,2)
a * b 

## arithematic operations on datframes 

df2 = read.csv("credit.csv", header = T, sep = ",")
head(df2)


df2$emi = df2$amount / df2$months_loan_duration


### churn data 

churn = read.csv("Churn.csv")

churn$Tot.Mins = churn$Day.Mins + churn$Eve.Mins + churn$Night.Mins

churn$Day.rate = churn$Day.Charge / churn$Day.Mins

## comparison operators 

a = 10 
b = 20
a > b ## greater than 
a < b ## less than 
a >= b ## greater than or equal to 
a <= b ## less than or equal to
a == b ## equal to
a != b ## not equal to

## vectors 

a = c(10,20,30,40,50)
b = c( 20,40, 10, 30, 50)
c = a > b 
c

c = a < b ## less than 
c

c = a>=b # greater tha or equal to
c

c = a<=b  ## less than or equal to

c = a==b ## equal to b
c

c = a!=b ## not equal to 
c

## comparison operations on dataframes 

churn$Night.Mins_gt_Day.Mins = churn$Night.Mins > churn$Day.Mins

## comparison operators for slicing data in dataframes 

churn2 = churn[churn$Day.Mins>= 200 ,]

churn3 = churn[churn$State=="NY", ]

## night mins is less than 100

churn4 = churn[churn$Night.Mins < 100,]

### logical operations 

## and operation 

a = 10 ; b = 20; c= 30

a>b & b>c ## and operation
b>a & b>c ## 
a>b & c>b 
b>a & c>b

## or operation 

a>b | b>c ## false
b>a | b>c ## True
a>b | c>b ## True
b>a | c>b ## True

## logical operations on dataframes 

chrun5 = churn[ churn$Day.Mins>200 & churn$State =="NY",]

### Control structures 

## 1. Conditional statements 

# if else conditional statements 
age = 25 ## create age group : Age >+18 (agegrp = "Adult"), else(agegrp = "Child")

if (age < 18){ 
  agegrp = "Child"
}else{ 
    agegrp = "Adult"
    }
agegrp

age = 10

agegrp 

## Multiple if else conditions 

age = -1 ## agegrp: "0-25", "26-35","36-45","45+"

## conditional statments 
if( age <= 25) { 
  agegrp = "0-25"
}else if (age > 25 & age <=35 ){
  agegrp = "26-35"  
  
}else if (age > 35 & age <= 45){
    
  agegrp = "36-45"
}else { 
  agegrp = "45+"  
  }

agegrp

## using ifelse fucntion

 age = 90
 
agegrp = ifelse( age<18, "Child","Adult")
agegrp 


## multiple ifelse conditions in ifelse function

## agrgp : '0-25', '26-35', 36-45', '45+'
age = 32
agegrp = ifelse(age <=25, "0-25",ifelse(age<=35,"26-35",ifelse(age<=45,"36-45","45+")))
agegrp
 

### iterating over a vector 

## loops (for loop)
age = c(20, 28, 39, 44)
for( i in 1:4){ 
  
  if( age[i] <= 25) { 
    agegrp[i] = "0-25"
  }else if (age[i] > 25 & age[i] <=35 ){
    agegrp[i] = "26-35"  
    
  }else if (age[i] > 35 & age[i] <= 45){
    
    agegrp[i] = "36-45"
  }else { 
    agegrp[i] = "45+"  
  }
  
}

agegrp

age = c(20, 28, 39, 44, 60)
for( i in 1:length(age)){ 
  
  if( age[i] <= 25) { 
    agegrp[i] = "0-25"
  }else if (age[i] > 25 & age[i] <=35 ){
    agegrp[i] = "26-35"  
    
  }else if (age[i] > 35 & age[i] <= 45){
    
    agegrp[i] = "36-45"
  }else { 
    agegrp[i] = "45+"  
  }
  
}

agegrp

age = c(20,28, 39, 41)

agegrp = c()

for( i in 1:length(age)){ 
  
  if( age[i] <= 25) { 
    agegrp[i] = "0-25"
  }else if (age[i] > 25 & age[i] <=35 ){
    agegrp[i] = "26-35"  
    
  }else if (age[i] > 35 & age[i] <= 45){
    
    agegrp[i] = "36-45"
  }else { 
    agegrp[i] = "45+"  
  }
  
}

agegrp

## dataframe 

a = c(1,2,3,4,5)
age = c(10,20,30,40,50)
gen = c('M','F',"M",'F','M')

df = data.frame(a,age,gen)
df

## create agegrp as a variable on the dataframe df, agegrp : '0-25', '26-35',,'36-45','45+'

for(i in 1:nrow(df)){ 
  
  if(df$age[i] <= 25){ 
    df$agegrp[i] = '0-25'
  }else if(df$age[i]>25 & df$age[i] <=35){
      df$agegrp[i] = '26-35'
  }else if(df$age[i] > 35 & df$age[i] <= 45){
      df$agegrp[i] = '36-45'
    }else df$agegrp[i] = '45+'
  
}

df

### ifelse function 

## on a vector 

age = c(21, 33, 42, 56)
agegrp = ifelse(age <=25, "0-25", ifelse(age<=35,"26-35",ifelse(age<=45,"36-45","45+")))
agegrp


## on a dataframe 

df$agegrp1 = ifelse(df$age <=25, "0-25", ifelse(df$age<=35,"26-35",ifelse(df$age<=45,"36-45","45+")))

df

## agegrp : '0-30', '31-50', '50-80', '80+'

age = c(20, 40, 61, 89)


### Functions 

## start with a vector 

a = c(1,2,3,4)
length(a)
class(a)

## numeric functions 
sum(a) ## sum of a vector or, vectors
mean(a) ## average value of a vector
## rounding  a decial place 
a = 10.25
round(a,digits = 1)
round(a, 0)
ceiling(a) ## the next integer of a numeric value with decimal places
a = 10.01
ceiling(a)

## floor  
floor(a) ## will give lowest integer
a = 10.99
floor(a)

### sqrt 

a = 25 
sqrt(a) ## sqrt of a  element or a vector 

a = c(10,25,49,80)
sqrt(a)

## log 

log(a)

### string functions 

a = "apple"

substr(a, start = 1, stop = 3)

d = "10/10/2018"

day = substr(d,1,2)
mon = substr(d,4,5)
year = substr(d,7, 10)

### strsplit 

name = "firstname lastname"

names = strsplit(name,split = " ")
names

## substitue 

sub(pattern = " ", replacement = "-",x = name)

sub(pattern="/", replacement = "-", d) 
## sub repalces only the first occurence of a pattern 

## use gsub to replace all the occurences of a pattern 

gsub("/", replacement = "-", d)

## for a dataframe 
str(df) ## structure of a dataframe
dim(df) # number of rows and number of columns
nrow(df) ## number of rows
summary(df) ## Summary on a dataframe 

setwd("D:/AP/baging and  RF")
churn = read.csv("churn.csv")
summary(churn)

table(df$gen)

table(churn$Churn)
prop.table(table(churn$Churn))

## table on two variables 

gen = c("M","F","M","F","M","F")
id = c(1,2,3,4,5,6)
loan = c("Y","N","N","Y","Y","Y")

df = data.frame(id, gen, loan)
table(df$gen)

table(df$gen, df$loan)

### table should be ran on columns with few unique values 

table(df$id)

table(churn$State)

## string func


