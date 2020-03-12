##################################################################################################

##User Defined Function
##################################################################################################


aaa

aaa <- function(){
  print("Hi this is user defined function")
}

#Calling a function
aaa()




aaa1 <- function(a,b){
  c = a + b
  return(c)
}

#Calling a function
aaa1(5,0)


aaa2 <- function(a,b=0){
  #c = rep(a,b)
  c = a+ b
  return(c)
}

#Calling a function
aaa2(5,5)


#Functions can accept arguments explicitly assigned to a variable name in 
#the function call functionName(variable = value), as well as arguments by order:

mySum <- function(input_1, input_2 = 10) {
  output <- input_1 + input_2
  print(input_1)
  print(input_2)
  return(output)
}


mySum(3,input_1 = 1)

#The imp idea behind functions is that object that are created within the
#function are local to the environment of the function - they do not
#exist outside of the function. But you can "return" the value of the 
#object from the function


#square the number
square_num <- function(x){
  square <- x*x
  return(square)
}

square_num(5)
square_num(c(2,3,4))
square_num("hi")
square_num(cbind(c(1,2,3),c(4,5,6)))

#Local vs global environment
#Now, it's not necessarily the case that you must use return() 
#at the end of your function. 
#The reason you return an object is if you've saved the value of your 
#statements into an object inside the function - in this case, 
#the objects in the function are in a local environment and 
#won't appear in your global environment.

fun1 <- function(x) {
  3 * x - 1
}
fun1(5)



fun2 <- function(x) {
  y1 <- 3 * x - 1
  return(y1)
}
fun2(5)

print(y1)


#You can return the list from the function

return_list <- function(sq.matrix, vector) {
  
  # transpose matrix and square the vector
  step1 <- t(sq.matrix)
  step2 <- vector * vector
  
  # save both results in a list and return
  final <- list(step1, step2)
  return(final)
}

## call the function and save result in object called outcome
outcome <- return_list(sq.matrix = cbind(c(1, 2), c(3, 4)), vector = c(2, 3))

print(outcome)


### extract first in list
outcome[[1]]


#Tricks for troubleshooting and debugging

multi_stat_fun <- function(X.matrix, y.vec, z.scalar) {
  sq.scalar <- square_num(z.scalar)
  mult <- X.matrix %*% y.vec
  final <- mult * sq.scalar
  return(final)
}

# save a matrix and a vector object
my.mat <- cbind(c(1, 3, 4), c(5, 4, 3))
my.vec <- c(4, 3)

# pass my.mat and my.vec into the my.fun function
multi_stat_fun(X.matrix = my.mat, y.vec = my.vec, z.scalar = 9)

#Error
multi_stat_fun(X.matrix = my.mat, y.vec = c(1,2,3,4), z.scalar = 9)


#Using Debug Function
#R has inbuilt function debug() to find at what point an error occurs
#YOu indicate which function you want to debug, then run the statement 
#calling the function and R shows you at what point the function stops 
#because of the error


debug(multi_stat_fun)
multi_stat_fun(X.matrix = my.mat, y.vec = c(1,2,3,4), z.scalar = 9)


#2. Use the multiple print statements inside the function 



#3. Use of stop() or stopifnot

multi_stat_fun1 <- function(X.matrix, y.vec, z.scalar) {
  sq.scalar <- square_num(z.scalar)
  if (dim(matrix)[2] != length(vector)) {
    stop("Can't multiply matrix%*%vector because the dimensions are wrong")
  }
  mult <- X.matrix %*% y.vec
  final <- mult * sq.scalar
  return(final)
}

multi_stat_fun1(X.matrix = my.mat, y.vec = c(1,2,3,4), z.scalar = 9)


#Good function writing practices

#1. Keep your functions short. 
  #Remember you can use them to call other functions!
  #If things start to get very long, you can probably split up your function 
  #into more manageable chunks that call other functions. 
  #This makes your code cleaner and easily testable.
  #It also makes your code easy to update. 
  #You only have to change one function and every other function that uses 
  #that function will also be automatically updated.
#2. Put in comments on what are the inputs to the function, 
  #what the function does, and what is the output.
#3. Check for errors along the way.
  #Try out your function with simple examples to make sure 
  #it's working properly
  #Use debugging and error messages, as well as sanity checks as you 
  #build your function.

#Assignment:

#Create a function to print square of a number (1 to n)





aaa <- function(a){
  #b = list()
  for(i in 1:a){
    b[i] <- i^2
    #print(b)
  }
  return(b)
}

#Calling a function
a <- aaa(5)
a



#Assignment:

#Create a function to print a number raise to 
#another with the one argument a default argument


raisefn<- function(num, r = 3) {
  i = 1
  raise = 1
  while(i<=r){
    raise = raise * num
    i=i+1
  }
  print(raise)
}


raisefn(4)

raisefn(4,5)




#Create a function to accept two matrix arguments and do 
#matrix operations with same.

SumMatr<-function(M1,M2){
  print("The Matrix1")
  print(M1)
  print("The Matrix2")
  print(M2)
  summat<-M1+M2
  print("Sum of Matrices")
  print(summat)
  
}


Mat1 <- matrix(3:14, nrow = 4,ncol=3,byrow = TRUE)
Mat2 <- matrix(6:17, nrow = 4,ncol=3,byrow = TRUE)
SumMatr(Mat1,Mat2)



#Create a user defined function to accept a name from the user

userread <- function()
{
  str <- readline(prompt="Enter the Name: ")
  return(as.character(str))
}

print(userread())



#Create a user defined function to accept values from the user using 
#scan and return the values

userread1<-function(){
  myvalues = scan()
  return(myvalues)
}

print(userread1())



#Create a user defined function to create a matrix and return the same.

userread2<-function(){
  print("Enter values for 4 columns(There should be multiples for 4 values)")
  mat = matrix(scan(),ncol=4,byrow=TRUE)
  return(mat)
}

print(userread2())
