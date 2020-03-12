#################################################################
                          # Analytics Path 
                    # Practice Session Solutions
#################################################################

#1. Create a numeric vector with elements 2,3,4,6.. call it as x
x=c(2,3,4,6)

#2. Check the data type of a vector
class(x)

#3. Check is datastructure is vector or not
is.vector(x)

#4. What is the length of the vector
length(x)

#5. name the vector index as "One", "Two", "Three" and "Four"
x=c("one"=1,"Two"=2,"Three"=3,"Four"=4)

#6. Create another vector with elements 'a','b' and 'c'.. call it as y
y=c("a","b","c")

#7. Concatinate x and y and call the new data structure as z
z=c(x,y)

#8. Check the data type of z
class(z)

#9. Check if z is vector or not
is.vector(z)

#10. What is the length of z
length(z)

#11.a) add each element of x with corresponding element of x only
x+x

#b) addition of all elements of vector x 
sum(x)

#12. Multiply each elemnt of x with 5
x*5

#13. Fetch first element from x
x[1]

#14. Fetch all elements except first from x.
x[-1]

#15. Fetch first and third elements together from x
x[c(1,3)]

#16. Create a vector with elements from 0 to 100 call it as a
a=c(0:100)

#17. Fetch first 20 elements from a
a[1:20]


#18. Fetch only those elements from a which are exactly divided by 10.
a[a%%10==0]

########################################################################################

#1. Create a matrix 5X5 with random numbers between 1 to 10,
#call it as m

#m=matrix(1:10,nrow=5,ncol=5)
m=matrix(sample(1:10,10),nrow=5,ncol=5)
m=matrix(sample(1:10,25,replace = T),nrow=5,ncol=5)

#2. Fetch the element of 1st row and 2nd column
m[1,2]

#3. Fetch the elements of 1st and 4th rows and 2nd and 4th column
m[c(1,4),c(2,4)]

#4. Add a column in the matrix with values 10,20,30,40,50 and make matrix 5X6
m=cbind(m,c(10,20,30,40,50))

#5. Add a row in the matrix with values 10,20,30,40,50 and make matrix 6X6
m=rbind(m,c(10,20,30,40,50))

#6. Name the row index as row1,row2,row3,row4,row5,row6
rownames(m)=c("row1","row2","row3","row4","row5","row6")

#7. Name the col index as col1,col2,col3,col4,col5,col6
colnames(m)=c("col1","col2","col3","col4","col5","col6")

########################################################################################

#1. Create a list where first element is a vector (0 to 10), second element is a 3X3 matrix
# with randon numbers between 1 to 10, third elemnt is a inner list with two elements, both
# are 2X3 matrix with randon numbers between 1 to 10
l=list(v=c(0:10),m1=matrix(sample(1:10,9),nrow=3,ncol=3),
     list(m2=matrix(sample(1:10,6),nrow=2,ncol=3),
              m3=matrix(sample(1:10,6),nrow=2,ncol=3)))

#2. Rename the index as Vector, Matrix and List
names(l)=c("vector","Matrix","List")

#3. Update the 4th element of the list with value 100.
l[4]=100

#4. Add the 4th elemnt as value 4 in list
l[[4]][2]=4

#5. Delete the 4th element from the list
l=l[-4]

######################################################################################

#Create a 10X5 matrix, populate each element as row index * column index 

m1=matrix(,nrow=10,ncol=5)
for (i in 1:nrow(m1)){
  for(j in 1:ncol(m1)){
    m1[i,j]=i*j
}  }
}