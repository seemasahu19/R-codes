##############################################################################
# R Session						                                                       #
# Date:  26/07/2017									                                         #
# Author: Manish                              							                 #	
##############################################################################

##############################################################################
# This Session will cover:
#        R Packages 
#        Functions 
#        User Defined Functions
#       
##############################################################################


##Packages are the collection of functions
##They are stored in the "library" in the R env.

## Check available path
.libPaths()

##Get the list of all packages installed
library()

##Get the packages currently loaded in te R environment
search()

##Install a package

##Load Package to Library
  ##Before the package can be used in the code, it must be loaded in the
  ##current R environment.


##########################################dplyr Starts##################################################

#dplyr is a new package which provides a set of tools for efficiently 
#manipulating datasets in R. dplyr is the next iteration of plyr, 
#focussing on only data frames. 
#dplyr is faster, has a more consistent API and should be easier to use.

##Handy dplyr Verb:
#Filter --> filter()
#Select --> select()
#Arrange --> arrange()
#Mutate --> mutate
#Summarise --> summarise()




#Structure:
  # First Argument is a DataFrame
  # Subsequent Argument say what to do with Data Frame
  # Always return a Data Frame
  # Never modify the place 
########################################################################################################

#install.packages("dplyr")
library(dplyr)
data(mtcars)
temp <- mtcars
head(mtcars)
str(mtcars)
View(mtcars)

#local_df <- tbl_df(mtcars)
#View(local_df)

#1. Filter or subset
#Base R approach to filter dataset
mtcars[mtcars$cyl==8 & mtcars$gear==5,]
#Use subset function
subset(mtcars,mtcars$cyl==8 & mtcars$gear==5)

#dplyr approach
#You can use "," or "&" to use and condition
filter(mtcars,cyl==8,gear==5)
filter(mtcars,cyl==8&gear==5)

filter(mtcars,cyl==8|cyl==6)

##You can use the %in% operator
filter(mtcars,cyl %in% c(6,8))

##Converting row names into column
temp <- mtcars
temp$myNames <- rownames(temp)
filter(temp,cyl==8,gear==5)

#2. Select: Pick columns by name
#Base R approach
mtcars[,c("mpg","cyl","gear")]

#dplyr Approach
select(mtcars,mpg,cyl,gear)

# Use ":" to select multiple contiguous columns, 
#and use "contains" to match columns by name
select(mtcars,1:3)
select(mtcars,mpg:disp)
select(mtcars,mpg:disp,contains("GEAR"),contains("carb"))
select(mtcars,mpg:disp,"gear","carb")

#Exclude a particular column 
select(mtcars,-contains("gear"))
select(mtcars,-gear)


filter(select(mtcars,gear,carb,cyl),cyl==8|cyl==6)


#To select all columns that start with the character string "c", 
#use the function starts_with()
head(select(mtcars, starts_with("c")))

##Some additional options to select columns based on specific criteria:
#ends_with() : Select columns that end with a character string
#contains() : Select columns that contain a character string



#3. Arrange : Reorder rows
#base Approach
mtcars[order(mtcars$cyl),c("cyl","gear")]
mtcars[order(mtcars$cyl,decreasing = T),c("cyl","gear")]
mtcars[order(mtcars$cyl,mtcars$gear),c("cyl","gear")]


#dplyr Approach
#Syntax:
#arrange(dataframe,orderby)
arrange(mtcars,cyl)
arrange(select(mtcars,"cyl","gear"),cyl)
arrange(select(mtcars,"cyl","gear"),cyl,gear)
arrange(select(mtcars,"cyl","gear"),desc(cyl))
arrange(select(mtcars,"cyl","gear"),desc(cyl),gear)


#mutate: Add new variable
#Base R Approach
temp <- mtcars
temp$new_variable <- temp$hp + temp$wt
str(temp)

##dplyr Approach
temp <- mutate(temp,mutate_new = temp$hp + temp$wt)
temp1 <- mutate(temp,mutate_new = temp$hp + temp$wt,
                mutate_new1 = temp$hp + temp$wt)

str(temp1)

# Fetch the unique values in dataframe

#Base Package approach - unique function
#unique()

unique(mtcars$cyl)
unique(mtcars["cyl"])
unique(mtcars[c("cyl","gear")])

#dplyr approach

#distinct() 
distinct(mtcars["cyl"])
distinct(mtcars[c("cyl","gear")])


#aggregate()
##base R approach (package:stats)
aggregate(mtcars, by=list(mtcars$cyl), 
          FUN=mean, na.rm=TRUE)

aggregate(mtcars[,c("mpg","disp","hp")], 
          by=list(mtcars$cyl,mtcars$gear), 
          FUN=mean, na.rm=TRUE)



#dplyr approach
#Summarise : Reduce variable to values
summarise(mtcars,avg_mpg = mean(mpg))
summarise(mtcars,avg_mpg = mean(mpg),
          avg_disp = mean(disp))

summarise(group_by(mtcars,cyl),avg_mpg = mean(mpg))
summarise(group_by(mtcars,cyl,gear),
          avg_mpg = mean(mpg,na.rm = T))

#Table is very handy to find the frequencies (mode)
#Base Package Approach 
table(mtcars$cyl)

a <- factor(rep(c("A","B","C"), 10))
a
table(a)
table(a, exclude = "B")

#dplyr approach
#Helper Function n() count the number of rows in a group 
#Helper Function n_distinct(vector) counts the number of
#unique item in that vector
summarise(group_by(mtcars,cyl),freq=n())
summarise(group_by(mtcars,cyl),freq=n(),
          n_distinct(gear))


##Merge two data frames

#Create first data frame:
name = c("Anne", "Pete", "Cath", "Cath1", "Cath2")
age = c(28,30,25,29,35)
child <- c(FALSE,TRUE,FALSE,TRUE,TRUE)
df <- data.frame(name,age,child)


#Create Second Dataframe:
name = c("Anne1", "Pete", "Cath", "Cath1", "Cath2")
occupation = c("Engg","Doc","CA","Forces","Engg")
df1 = data.frame(name,age,occupation)

#Base Package Approach
merge(df,df1)

#Creating anohter dataframe with different column name
name1 = c("Anne1", "Pete", "Cath", "Cath1", "Cath2")
df1 = data.frame(name1,age,occupation)
#merge(df,df1,by.x = "name",by.y = "name1")
#merge(df,df1,by.x = "name",by.y = "name1",all.x = T)


##dplyr approach
inner_join(df,df1)
#inner_join(df,df1,by = "name")
left_join(df,df1,by = c("name" = "name1"))
left_join(df,df1,by = c("age" = "age" , "name" = "name1"))


#Try
#left_join()
#full_join()


###pipeline

#The %>% command act as a pipeline
#x %>% f(y) is the same as f(x,y)
#x %>% f(y) %>% f2(z) is same as f2(f1(x,y),z)
#dplyr imports this operator from another package (magrittr)
#This operator allows you to pipe the output from one 
#function to the input of another function. 
#Instead of nesting functions (reading from the inside to the outside), 
#the idea of of piping is to read the functions from left to right


head(select(mtcars, cyl, gear))

mtcars %>% 
  select(cyl, gear) %>% 
  head


mtcars %>%
  arrange(cyl) %>%
  head(20)


mtcars %>%
  select(cyl,gear,disp) %>%
  arrange(cyl) %>%
  head(20)

##Assignment1: Use pipelien
#select "mpg","cyl","disp", "hp", "drat", "gear" and "carb".
#sort it by gear in decreasing order and filter only cyl = 8



### Solution 1

mtcars %>%
  select(mpg:drat,gear,carb) %>%
  arrange(desc(gear)) %>%
  filter(cyl == 8)


##Assignment 2: Use pipeline

#Copy mtcars into temp.
#Create a new column in temp dataset, call it "New_Col"
#Populate the column wt/drat
#dispaly top 10 rows




## Solution 2:

temp <- mtcars
temp %>%
  mutate(New_Col = wt/drat) %>%
  head(10)



## Assignment 3:

#Calculate the summary statistics for disp such 
#as sd(), min(), max(),mean(),median()


#Solution3:

mtcars %>%
  summarise(standard_deviation = sd(disp),
            Minimum = min(disp),
            Maximum = max(disp),
            Mean = mean(disp),
            Meadian = median(disp)
  )



## Assignment 4:

#Calculate the summary statistics for disp such 
#as sd(), min(), max(),mean(),
#median() and aggregate by cyl




##Solution 4:


mtcars %>%
  group_by(cyl) %>%
  summarise(standard_deviation = sd(disp),
            Minimum = min(disp),
            Maximum = max(disp),
            Mean = mean(disp),
            Meadian = median(disp)
  )



##########################################dplyr Ends##################################################

##################################################################################################

##User Defined Function
##################################################################################################

aaa <- function(){
  print("Hi this is user defined function")
}

#Calling a function
aaa()







#Create a function to print square of a number
aaa <- function(a){
  #b = list()
  for(i in 1:a){
    b[i] <- i^2
    #print(b)
  }
  return(b)
}

#Calling a function
aaa(5)




