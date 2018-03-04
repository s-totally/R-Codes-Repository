<<<<<<< HEAD
download.file("https://github.com/s-totally/R-Codes-Repository/blob/master/Sri_Tolety.R",
              destfile = "C:/users/sridevi.tolety/Documents/Sri_Tolety.R")

# Basics ------------------------------------------------------------------


# # 5 basic classes of objects in R:
#   1. Character
#   2. Numeric
#   3. Integer
#   4. Complex 
#   5. Logical (T/F)

# An object can have the following attributes:
#   1. Name, dimension names
#   2. Dimensions
#   3. Length
#   4. Class

# Data types in R
# 1. Vector -> Objects of the same class
# 2. List -> Elements of diff data types
# 3. Matrix -> Row & col dimension. All elems same class
# 4. Data frame -> Elems of diff classes 

# Class vs Mode
# For a simple vector, class and mode are the same thing: the data type of the values inside the vector 
# But for matrix, array, dataframe, class and mode differ
# Class of a matrix is matrix whereas mode is the type of data within the matrix (char, nu, logical etc )

# To assign:
a <- 3
'<-'(a,3)
# To print a after assigning, enclose the entire statement within ()
(a <- 3)

x <- 2
if (x > 1) "orange" else "apple"
#typeof() determines the type or storage mode of any object
#quote() is a special function that doesn't evaluate its argument 
typeof(quote(if (x>1) "orange" else "apple")) #language
typeof(x) #double
typeof("A") #character
typeof(2) #double
mode(2) # numeric
lapply(as.list(quote(if (x>1) "orange" else "apple")), typeof) #symbol, language, character, character


# Dealing with duplicate values 
x <- c(9:20, 1:5, 3:7, 0:8)
x <- x[!duplicated(x)]
data("airquality")
dupair1 <- airquality[!duplicated(airquality[,c(2)]),]

#Creating subsets of data 
newdata <- subset(airquality, Temp>80, select = c(Ozone, Temp))
newdata2 <- subset(airquality, Day==1, select = Ozone:Wind)
subset_1 <- airquality[airquality$Temp==80,]
subset_2 <- airquality[airquality$Temp %in% c(70,80), ]

# Accessing built in datasets
data()
help(women) #brings up documentation for women dataset 

library("gtools") #Various functions to assist in R programming
smartbind() #library(gtools)
myvec <- c(1,2,5,3,4)
length(myvec) #Length 
myvec[1]
sort(myvec) #[1] 1 2 3 4 6
sort(myvec,decreasing = TRUE)

a <- c(4.1, 2.2, 6.1, 3.1)
a
order(a) # Returns rank of each element if it were sorted 

sort_Temp <- airquality[order(airquality$Temp),]
head(airquality)
head(sort_Temp)

sort_2 <- airquality[order(-airquality$Month, airquality$Temp),] # Sort by month in decreasing and temp in increasing
head(sort_2)

mylist <- list("a",2,TRUE) #[1] 6 4 3 2 1
mylist[1]
mylist[2:3]

#Named lists 
# lists are usually named because this allows elements to be accessed by name rather than position
movie <- list(name = "Toy Story",
              year = 1995,
              genre = c("Animation", "Adventure", "Comedy")) # "Toy Story" & "1995" get populated across all rows in the list 
movie$genre # [1] "Animation" "Adventure" "Comedy"   
class(movie$name) #[1] "character"

# Adding items to a list 
movie[["age"]] <- 5

# Concatenating lists
# We split our previous list in two sublists
movie_part1 <- list(name = "Toy Story")
movie_part2 <- list(year = 1995, genre = c("Animation", "Adventure", "Comedy"))
# Now we call the function c() to put everything together again
movie_concatenated <- c(movie_part1, movie_part2)
# Check it out
movie_concatenated


# Naming elements of a vector 
names(myvec) <- c("First","Second","Third","fourth","fifth")
#Retrieving based on names
myvec["Third"] #5
myvec[c("Third","First")] # 5 1 
#Logical operations on vectors 
myvec >2 # FALSE  FALSE   TRUE   TRUE   TRUE 
myvec[myvec>2]# Return the elements greater than 2, not just T or F. 5      3      4 
myvec != 2 # TRUE  FALSE   TRUE   TRUE   TRUE 
#Retrieve vector without first item
myvec[-1] # 2      5      3      4 
mymatrix <- myvec
dim(mymatrix) <- c(2,2)
mydf <- data.frame(name=c("Chinni","Pintu","Momo"),age=c(25,28,1), stringsAsFactors = F)
mydf
mydf <- edit(mydf) # Interactively edit the dataframe
fix(mydf)
save(mydf, file="/homefractaluser/Documents/mydf.rdata")
save("C:/users/sridevi.tolety/Documents")
load(mydf)


Sys.Date()
Sys.time()
date()
today <- Sys.Date()
today
date.i.started <- as.Date("1/18/1992", "%m/%d/%Y")
date.i.started
today - date.i.started

x <- c("1jan1960", "2jan1960", "31mar1960", "30jul1960")
as.Date(x, "%d%b%Y") #Y denotes full year e.g. 1992

dates <- c("02/27/92", "02/27/92", "01/14/92", "02/28/92", "02/01/92")
as.Date(dates, "%m/%d/%y") # y is for last 2 digits of year

# Identifying and converting Data types 
# is.character, is.numeric(), is.vector(), is.matrix(), is.dataframe()
# is.character, is.numeric(), is.vector(), is.matrix(), is.dataframe(), as.factor(), as.list()
#Assigning names to values in a vector 

#Look at list of objects in the environment saved so far
ls()

#Remove an item that you don't want
rm(x)
ls()

#Remove all objects at once
rm(list=ls()) #IMP

# FACTORS
# Take on a limited number of values. Categorical variable.
# Types are:
# 1. Nominal categorical variable
# 2. Ordinal categorical variable

movie_length <- c("Very Short", "Short", "Medium","Short", "Long","Very Short", "Very Long")
movie_length
# factor() by default converts a vector into unordered factor. To order:
movie_length_ordered <- factor(movie_length, ordered=TRUE, levels=c("Very Short", "Short", "Medium", "Long","Very Long"))

movie_length_ordered > "Short" # Test whether movie length is greater than short 
# FALSE FALSE  TRUE FALSE  TRUE FALSE  TRUE

#Sequence of 10 numbers  between 1 and 20
x <- seq(1, 20, length=10)
#or
x <- 1:20

x <- 1:9; names(x) <- x
# > x
# 1 2 3 4 5 6 7 8 9 
# 1 2 3 4 5 6 7 8 9 

# Multiplication & Power Tables
x %o% x
y <- 2:8; names(y) <- paste(y,":", sep = "")
# 2: 3: 4: 5: 6: 7: 8: 
#   2  3  4  5  6  7  8 
outer(y, x, "^")

# 1  2   3    4     5      6       7        8         9
# 2: 2  4   8   16    32     64     128      256       512
# 3: 3  9  27   81   243    729    2187     6561     19683
# 4: 4 16  64  256  1024   4096   16384    65536    262144
# 5: 5 25 125  625  3125  15625   78125   390625   1953125
# 6: 6 36 216 1296  7776  46656  279936  1679616  10077696
# 7: 7 49 343 2401 16807 117649  823543  5764801  40353607
# 8: 8 64 512 4096 32768 262144 2097152 16777216 134217728


#ARRAY
# Multidimensional structure that holds values grouped together 
# More general version of a matrix, as matrix can have only 2 dimensions 
# The array data type can still only have one data type inside of it, but the set of data types it can store is larger. In addition to the data types an array can store matrices as its elements. 
sample_array <- array(1:12, dim = c(3, 2, 2)) # create an array with dimensions 3 x 2 x 2 
sample_array
class(sample_array) #array
mode(sample_array) #numeric 

#lets first create a vector of nine movies
movie_vector <- c("Boggart", "Toy Story", "Room", "The Wave", "Whiplash","Star Wars", "The Ring", "The Artist", "Jumanji")
movie_vector
movie_array <- array(movie_vector, dim=c(4,3)) #last 3 empty spaces are filled with 1st few movie names again
movie_array[2,3] #Array indexing 


#CONTOUR PLOTS
y=x
f = outer(x, y, function(x,y)y/(x+1))
contour(x,y,f) #IMP

image(x,y,f) #IMP

persp(x,y,f) #IMP

#Create a matrix
myMatrix <- matrix(c(1,2,3,4), nrow=2, ncol=2, byrow = TRUE)


#Missing values (NA, NaN)
Inf-Inf #Nan
0/0 #NaN

mydf[1:2,2] <- NA #Injecting NAs in 2nd col of first two rows
is.na(mydf)
table(is.na(mydf))
# FALSE  TRUE 
# 4     2 

v <- c(1,2,3,4)
length(v) <- 5
v # [1]  1  2  3  4 NA

mydf[!complete.cases(mydf),]
mean(mydf$age) #Returns NA
mean(mydf$age, na.rm = TRUE) #Returns 1 by ignoring the NAs

#Generate a set of random normal variables
set.seed(1303)
x <- rnorm(50, mean=50,sd=1)


y <- x+rnorm(50, mean = 50, sd=1)

cor(x,y)

#Indexing 
A = matrix(1:16, 4, 4)
A[2,3]
A[c(2,3), c(1,4)] #Rows 2 & 3 with cols 1 & 4
A[1:3, 2:4]
A[1:2, ] #Rows 1 & 2 with all columns
A[-c(1,3), ] #All except 1 & 3 row

dim(A) #Checking dimension 

# MERGING DATA FRAMES
#JOINS IN R 
x <- data.frame(k1 = c(NA,NA,3,4,5), k2 = c(1,NA,NA,4,5), data.x = 1:5)
y <- data.frame(k1 = c(NA,2,NA,4,5), k2 = c(NA,NA,3,4,5), data.y = 1:5)
x; y

merge(x, y, by = c("k1","k2"))
merge(x, y, all = TRUE)


# CONTROL STRUCTURES IN R
# Controls the flow of code/commands written inside a function 
#*********************    
# if, else: This structure is used to test a condition. Below is the syntax:
# if (<condition>){
#   ##do something
# } else {
#   ##do something
# }
#*********************
# for: This structure is used when a loop is to be executed fixed number of times. 
# It is commonly used for iterating over the elements of an object (list, vector). 
#   
#   for (<search condition>){
#     #do something
#   }
#*********************
# while : It begins by testing a condition, and executes only if the condition is found to be true.
# Once the loop is executed, the condition is tested again.

#*********************
# Other control structures:

# repeat: It executes an infinite loop
# break: It breaks the execution of a loop
# next: It allows to skip an iteration in a loop
# return: It help to exit a function

a <- 14

if (a>13){
  print("More than a dozen")
} else if (a==13){
  print("Baker's dozen")
} else (print("less than a dozen"))

i=5
if (i%%2 == 1){
  print(c(i, "odd"))
} else
{
  print(c(i,"even"))
}


# For loop
samples <- c(rep(1:10))
samples

for (i in 1:10)
{
  if (i==3) break
  str <- paste(samples[i],"is current sample", sep = " ")
  print(str)
}


for (i in 1:10){
  if (i%%2==0) next
  str <- paste(samples[i], "is current sample", sep = "")
  print(str)
}

for (i in 1:10){
  print(paste(i," raised to itself is ",i^i))
}

#Print squares of numbers between 1 and 50 that are divisible by 7
for (i in 1:50){
  if (!i%%7 == 0) next
  print(paste(i," squared is ",i^2))
}


# While loop
# Test a condtn, and execute loop body if true
count <- 0
while (count<10){
  print(count)
  count <- count+1
}


# Next
# Used to skip an iteration of the loop


# code to download the dataset
download.file("https://ibm.box.com/shared/static/n5ay5qadfe7e1nnsv5s01oe1x62mq51j.csv", destfile="/home/fractaluser/Documents/BDU Python 101/movies-db.csv")

movies_Data <- read.csv("/home/fractaluser/Documents/BDU Python 101/movies-db.csv", header=TRUE, sep=",")

# if()
movie_year=199
if(movie_year>2000){
  #Print message saying greater than 2000
  print('Movie year is greater than 2000')
}else{
  print('Movie year is less than 2000')}

#Logical operators
if(movie_year<2000 & movie_year>1990)
{print('Movie year between 1990 and 2000')}

if(movie_year>2000 | movie_year<1990)
{print('Movie year not between 1990 and 2000')}

#Subset()
decade='recent'
# If the decade is recent 
if(decade=='recent'){
  #Subset the dataset to include only movies after year 2000
  subset(movies_Data, year>2000)
}else{
  subset(movies_Data, year<2000)
}


#Loops 
# for loop to print all the years present in the year column
# Get the data for the "year" column in the data frame.
years <- movies_Data['year']
for (val in years){
  print(val)
}

# Print numbers in 1 to 10 raised to their own powers
for(i in 1:10){
  print(paste0(i, " raised to ", i, " equals ", i^i))
}

# while()
# Tool for repeated execution based on a condition. The code block will keep being executed until the given logical condition returns a False boolean value.

# while to print the first five movie names
iteration=1

while(iteration<=5){
  print(c("This is iteration number", as.character(iteration)))
  print(movies_Data[iteration,]$name)
  iteration=iteration+1
}

# Use while to print all integers from 1 to 20
count <- 0
while(count<21){
  print(count)
  count <- count+1
}

#____Functions____
# Functions in R are first class objects (can be treated as any other object)
# Can be passed as arguments to other functions. Can be nested 


# User defined functions 

# Square function
f <- function(a){
  return (a^2)
}
f(100)

f1 <- function(x, y){
  return(x+y)
}
f1(102,1)

# Scope of a cunction determines whether a variable name is locally or globally accessible 

#Function that returns the factorial of a number 
factorialfn <- function(x) {
  n <- 1
  for(i in 1:x) {
    n <- n*i
  }
  return(n)
}

factorialfn(3)  

#Function subsetData that has following functionality:
# Input parms: dataframe, starting row, ending row
# Output: Df that is subset of input df from starting row to ending row
subsetData <- function(df, startrow, endrow){
  df.Subset <- tail(head(df, n=endrow), n=endrow-startrow+1)
  return(df.Subset)
}
subsetData(10,1,2)

#Function renameVariable that has following functionality:
# Input parms: dataframe, oldvarname, newvarname
# Output: Df with old variable name changed to new variable name
renameVariable <- function(df, oldvarname, newvarname){
  names(df)[names(df)==oldvarname] <- newvarname
  return (df)
}


printHelloWorld <- function(){
  print("Hello World")
}
printHelloWorld() # To use, simply run with () at the end 

add <- function(x, y){
  print(x+y)
}

add(3,4)

# The return() function is particularly useful if you have any IF statements in the function, when you want your output to be dependent on some condition

isGoodRating <- function(rating){
  if(rating>7){
    return("Yes")
  }else{
    return("No")}
}
isGoodRating(9)

#Setting default values in custom functions 
isGoodRating <- function(rating, threshold=7){
  if(rating>threshold){
    return("Yes")
  }else{
    return("No")}
}

isGoodRating(1)

#Function within a function 


# function that can help us decide on which movie to watch, based on its rating. We should be able to provide the name of the movie, and it should return NO if the movie rating is below 7, and YES otherwise.

watchMovie <- function(moviename){
  rating <- movies_Data[movies_Data[,1]==moviename,"average_rating"]
  isGoodRating(rating)
}

watchMovie("Boggart")

# paste()
watchMovie <- function(moviename, my_threshold){
  rating <- movies_Data[movies_Data[,1]==moviename,"average_rating"]
  print(paste("The movie rating for",moviename,"is",rating))
  isGoodRating(rating)
}

watchMovie("Akira")

#Error catching 
# tryCatch tries to run the code, and if it results in an error, you can ask it to do something else.
tryCatch(10+10)
tryCatch(10+"a", error=function(e) print("Oops, something went wrong"))

#If error, return "10a" without an error
x <- tryCatch(10 + "a", error = function(e) return("10a") ) #No error
x

# Packages to explore
# *** Importing Data*** 
#R offers wide range of packages for importing data available in any format such as .txt, .csv, .json,
# .sql etc. Install and use data.table, readr, RMySQL, sqldf, jsonlite.
# Reading excel files 
install.packages("readxl")
library(readxl)
my_excel_data <- read_excel()


# Data.table --------------------------------------------------------------

library(data.table)
system.time(read.csv('C:/Users/sridevi.tolety/Documents/7. FC Royal Born/4. Working Folder/cheeselevel_final.csv'))
# user  system elapsed 
# 20.07    0.44   21.03 

system.time(fread('C:/Users/sridevi.tolety/Documents/7. FC Royal Born/4. Working Folder/cheeselevel_final.csv')) #Reads everything as character 
# user  system elapsed 
# 2.21    0.06    2.40 

# Deep copy: When entire data frame is copied to another location in memory
#Shallow copy: Data isn't physically copied, just a copy of pointers (column names)

# fwrite() function is also very fast 
# http://download.geonames.org/export/zip/GB_full.csv.zip

DT <- fread('C:/Users/sridevi.tolety/Documents/Study References/GB_full.csv')

# Read 1720673 rows and 12 (of 12) columns from 0.191 GB file in 00:00:08

sub_rows <- DT[V4=='England' & V3=="Beswick"]

sub_columns <- DT[,.(V2,V3,V4)]

#Subsetting even faster using keys in data table 


# *** Data Visualization ***
# R has in built plotting commands as well. They are good to create simple graphs.Install ggplot2.

# Impr high level plotting functions
# 1. plot(): Generic x-y plotting
# 2. barplot() : Plotting bars
# 3. boxplot(): box & whispers plot
# 4. hist(): Histograms 
# 5. pie(): Pie charts 
# 6. dotchart() : Cleveland dot plots 
# 7. image, heatmap, contour, perspective: Fns to generate image type plots
# 8. qqplot, qqline, qqnorm: Plots to compare distributions 

# 4 types of bar charts 
# 1. Discrete variable bar chart
# 2. Dodged bar chart (2 or more variables, where each variable has components)
# 3. Cts variable bar chart 
# 4. Stacked bar chart 

#Plotting a function
curve(x^2, from = 0, to = 10, n = 10, col = 'red', xlab = "x", ylab = "Square", lwd = 4)
curve(-x*log2(x)-(1-x)*log2(1-x),
      col = 'red', xlab = 'x', ylab = 'Entropy', lwd=4)


# *** Data Manipulation ***
# dplyr, plyr, tidyr, lubridate, stringr. 

# *** Modeling / Machine Learning ***
# For modeling, caret package in R is powerful enough to cater to every need for creating machine learning models. However, you can install packages algorithms wise such as randomForest, rpart, gbm etc

#

# Strings & Dates ---------------------------------------------------------

# Download the data file
download.file("https://ibm.box.com/shared/static/l8v8g8e6uzk7yj2j1qc8ypezbhzukphy.txt", destfile="/home/fractaluser/Documents/The_Artist.txt")

my_data <- readLines("/home/fractaluser/Documents/The_Artist.txt")
my_data[1]
length(my_data)
file.size("/home/fractaluser/Documents/The_Artist.txt")
# Difference in readLines() and scan() method is that, readLines() is used to read text files line by line whereas scan() method read the text files word by word.
my_data <- scan("/home/fractaluser/Documents/The_Artist.txt", "") #Second argument is the separator we want for words 

nchar(my_data[1]) #ow many characters are there in the first element of my_data variable

toupper(my_data[3]) #"IS"

# replace any characters in given string
# first argument is the characters which we want to replace in string, second argument is the new characters and the last argument is the string on which operation will be performed.
chartr(" ","-",my_data[1])

# strsplit() method provides a list at the output which contains all the separated words as single element which is more complex to read. 
characterlist <- strsplit(my_data[1]," ")
wordlist <- unlist(characterlist)
wordlist

# substr() to get subsection of a string 
sub_String <- substr(my_data[1], start=4,stop=50)
sub_String

trimws(sub_String) #Get rid of white space in beginning and at the end 

library(stringr)
str_sub(my_data[1],-8, -1) #e read string from -1 till -8 and it gives talkies. with full stop mark at the output.

# R stringr package
library(stringr)
# str_detect(string, pattern) Detect the presence of a pattern match in a string.
str_detect("fruit","a") #False
str_detect("fruit","ui") #TRUE

# str_which(string, pattern) Find the indexes of strings that contain a pattern match.
str_which("fruit", "a") # integer(0)
str_which("fruityfruity fruit", "ui") #1

# str_count(string, pattern) Count the number of matches in a string.
str_count("fruit", "a")
str_count("fruit", "ui") #1
str_count("fruityfruity", "ui") #2

# str_locate(string, pattern) Locate the positions of pattern matches in a string. Also str_locate_all. 
str_locate("fruit", "a")
str_locate("fruit", "ui")
# start end
# [1,]     3   4

# Exporting as text file 
m <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 2, ncol = 3)
m
write(m, file="/home/fractaluser/Documents/my_txt_file.txt", ncolumns = 3, sep=" ")

#Exporting as Excel file 
install.packages("xlsx")
library(xlsx)
write.xlsx(CO2, file="/home/fractaluser/Documents", row.names=FALSE)

#Exporting as .RData file 
var1 <- "var1"
var2 <- "var2"
var3 <- "var3"
save(list = c("var1", "var2", "var3"), file = "/home/fractaluser/Documents", safe = T)


# Regular expressions in R ------------------------------------------------
email_df <- read.csv("https://ibm.box.com/shared/static/cbim8daa5vjf5rf4rlz11330lvqbu7rk.csv")
email_df

# Regular Expressions are generic expressions that are used to match patterns in strings and text. 
# test@testing.com
# So, an email is composed by a string followed by an '@' symbol followed by another string. In R regular expressions, we can express this as:
# .+@.+
# The '.' symbol matches with any character.
# The '+' symbol repeats the previous symbol one or more times. So, '.+' will match with any string.
# The '@' symbol only matches with the '@' character.

# The grep function below takes in a Regular Expression and a list of strings to search through and returns the positions of where they appear in the list.
grep("@.+", c("test@testing.com", "not an email","test2@testing.com")) #[1] 1 3
grep("@.+", c("test@testing.com", "not an email","test2@testing.com"), value=TRUE) #[1] "test@testing.com"  "test2@testing.com" (The parameter called 'value' changes the output to display the strings rather than list positions)

#grepl() returns a logical vector stating whether match or not for each element of x
grepl("sri",c("sridevi tolety","blah","sri")) #[1]  TRUE FALSE  TRUE

# sub() and gsub()
# Substitution function. Takes in a regular expression, the string you want to swap in with the matches and a list of strings you want to perform the swap with. 
# sub() replaces the first occurence of a pattern 
# gsub() replaces all occurences of the pattern
x <- c("This is the first sentence","This is the second pattern")
sub(" is", " was", x)

gsub("[[:digit:]]","","She is 25 years old and weighs 52 kgs")

gsub("@.+", "@newdomain.com", c("test@testing.com", "not an email", "test2@testing.com"))

# regexpr returns an integer vector of the same length as text giving the starting position of the first match or -1 if there is none, with attribute "match.length", an integer vector giving the length of the matched text (or -1 for no match). 

regexpr("@.*", c("test@testing.com", "not an email", "test2@testing.com"))
# [1]  5 -1  6

matches <- regexpr("@.*\\.", email_df[,'Email'])
email_df[,'Domain'] = regmatches(email_df[,'Email'], matches)

email_df

table(email_df[,'Domain'])
# Reference: http://www.endmemo.com/program/R/grep.php


# Character Basics --------------------------------------------------------

# sprintf
# A wrapper for the C function sprintf that returns a character vector containin a formatted combination of text and variable values 

# To substitute a string or a string variable use %s
x <- "print strings"
y <- "in R"
sprintf("Learning to %s %s", x, y)

#For integers use %d or a variant 
version <- 3
sprintf("This is R version %d", version)

#Print with leading spaces
sprintf("This is R version %4d", version)

#Print with 4 leading  0s 
sprintf("This is R version %04d", version)

#For floating point numbers 
sprintf("%f", pi) #Fixed point decimal

sprintf("%.3f", pi) # Decimal notation with 3 decimal digits 

sprintf("%1.0f",pi) #Decimal notation with 1 integer and 0 decimal digits 

sprintf("%5.1f", pi) # Decimal notation with total of 5 digits, and only of them being a decimal digit 

sprintf("%05.1f", pi) # Total 5 digits but fill blanks with 0s 

sprintf("%+f", pi) #Print with sign (positive)

sprintf("% f", pi) #Prefix with a space

sprintf("%e", pi) #Exponential decimal notation 'e'

sprintf("%E", pi) #Exponential decimal notation 'E'

# With() ------------------------------------------------------------------
library(Lock5Data)
data(SleepStudy)
with(Carseats, CompPrice+Income)  #package ISLR
with(Carseats, table(ShelveLoc,Urban)) 
with(Carseats, summary(Sales, Income))

#Proportions & Percentages 
tab <- with(Carseats, table(ShelveLoc))
tab*100 / nrow(Carseats)
round((tab*100 / nrow(Carseats)),1)

path <- "~/Documents/BigMart"

setwd(path)

#Load datasets
train <- read.csv("Train_UWu5bXk.csv")
test <- read.csv("Test_u94Q5KV.csv")
dim(train)
dim(test)
names(train)
table(is.na(train))
# FALSE   TRUE 
# 100813   1463 
colSums(is.na(train))   #Which columns contain these missing values? Ans: Item identifier column
# Item_Identifier               Item_Weight          Item_Fat_Content           Item_Visibility 
# 0                      1463                         0                         0 
# Item_Type                  Item_MRP         Outlet_Identifier Outlet_Establishment_Year 
# 0                         0                         0                         0 
# Outlet_Size      Outlet_Location_Type               Outlet_Type         Item_Outlet_Sales 
# 0                         0                         0                         0 

summary(train)
# Item_Identifier  Item_Weight     Item_Fat_Content Item_Visibility                   Item_Type   
# FDG33  :  10    Min.   : 4.555   LF     : 316     Min.   :0.00000   Fruits and Vegetables:1232  
# FDW13  :  10    1st Qu.: 8.774   low fat: 112     1st Qu.:0.02699   Snack Foods          :1200  
# DRE49  :   9    Median :12.600   Low Fat:5089     Median :0.05393   Household            : 910  
# DRN47  :   9    Mean   :12.858   reg    : 117     Mean   :0.06613   Frozen Foods         : 856  
# FDD38  :   9    3rd Qu.:16.850   Regular:2889     3rd Qu.:0.09459   Dairy                : 682  
# FDF52  :   9    Max.   :21.350                    Max.   :0.32839   Canned               : 649  
# (Other):8467    NA's   :1463                                        (Other)              :2994  
#     Item_MRP      Outlet_Identifier Outlet_Establishment_Year Outlet_Size   Outlet_Location_Type
#  Min.   : 31.29   OUT027 : 935      Min.   :1985                    :2410   Tier 1:2388         
#  1st Qu.: 93.83   OUT013 : 932      1st Qu.:1987              High  : 932   Tier 2:2785         
#  Median :143.01   OUT035 : 930      Median :1999              Medium:2793   Tier 3:3350         
#  Mean   :140.99   OUT046 : 930      Mean   :1998              Small :2388                       
#  3rd Qu.:185.64   OUT049 : 930      3rd Qu.:2004                                                
#  Max.   :266.89   OUT045 : 929      Max.   :2009                                                
#                   (Other):2937                                                                  
#             Outlet_Type   Item_Outlet_Sales 
#  Grocery Store    :1083   Min.   :   33.29  
#  Supermarket Type1:5577   1st Qu.:  834.25  
#  Supermarket Type2: 928   Median : 1794.33  
#  Supermarket Type3: 935   Mean   : 2181.29  
#                           3rd Qu.: 3101.30  
#                           Max.   :13086.97  

#Observations
# 1463 obs have NA item weight
# There are mismatched factor levels in item_fat_content (LF, low fat, reg, regular)
# Some obs hv 0 item visibility which doesn't make sense
# 2410 obs have unmatched outlet sizes

# Apply,Sapply,Lapply -----------------------------------------------------

m <- matrix(data= cbind(rnorm(30,0), rnorm(30,2), rnorm(30,5)),nrow=30, ncol=3)

# 1. 1 Apply function -----------------------------------------------------


# Works on arrays
#   Traverses data either row-wise or col-wise (2nd argument) and perform some task (3rd arg)
# Syntax: apply(X, margin, Function )
apply(m,2,mean) #Mean of the 3 columns 

#How many -ve numbers in each column
apply(m, 2, function(x) length(x[x<0]))
# [1] 18  0  0 So 18 -ve values in col 1, 0 in cols 2 & 3

# Above, the argument of the fn is x. Is it a single column of the matrix or just a vector?
apply(m, 2, function(x) is.matrix(x))
# [1] FALSE FALSE FALSE
apply(m, 2, function(x) class(x))
# [1] "numeric" "numeric" "numeric"
apply(m, 2, is.vector) # [1] TRUE TRUE TRUE


# 1.2 Lapply --------------------------------------------------------------

# Apply fn to every element of a list and return a list 
#Unlike apply(), can be used on other objects like dataframes, lists or vectors 
# Output is returned as a list and has same no. of elements as the object passed to it 
a <- 1:10
b <- 11:20
l <- list(a,b) #List with 2 elements, where each elements is a list 
lapply(l, mean)
# [[1]]
# [1] 5.5
# 
# [[2]]
# [1] 15.5

# 1.3 Sapply --------------------------------------------------------------

# Returns vector or matrix instead of list object 
sapply(l, mean) #[1]  5.5 15.5
class(sapply(l, mean)) #Numeric, whereas lapply returned list 
# If we want a list returned instead, can specify simplify=FALSE
sapply(l, mean, simplify=FALSE)

# 1.4 Tapply --------------------------------------------------------------
# Break a vector into pieces and apply some fn to each piece
data("mtcars")
str(mtcars$cyl)
levels(as.factor(mtcars$cyl)) # [1] "4" "6" "8"
# There are 3 types of cylinders & we want avg MPG for each type of cylinder
#Syntax: tapply(data'sColumn, ColtoGroupBy, function)
tapply(mtcars$mpg, mtcars$cyl, mean) 

#Summary
# ______________________________________________________________________________
# Fn Name     | Obj the fn works on   |   Wt fn sees as elements    |   Result type
# ______________________________________________________________________________
# apply       | Matrix                |   Rows/columns              |   Vec/mat/arr/list
#             | Array                 |   Rows/columns/any dims     |   Vec/mat/arr/list
#             | Dataframe             |   Rows/columns              |   Vec/mat/arr/list
# sapply      | vector                |   Elements                  |   Vec/ mat/ list
#             | dataframe             |   Variables                 |   Vec/ mat/ list
#             | list                  |   Elements                  |   Vec/ mat/ list
# lapply      | vector                |   Elements                  |   List
#             | dataframe             |   Variables                 |   List
#             | list                  |   Elements                  |   List


# 1.5 by() ----------------------------------------------------------------
data("iris")
# [1] "Sepal.Length" "Sepal.Width"  "Petal.Length" "Petal.Width"  "Species"   
# Calc means for each col, grouped by species
by(iris[1:4], iris$Species, colMeans)
# iris$Species: setosa
# Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
# 5.006        3.428        1.462        0.246 
# -------------------------------------------------------------------------------- 
#   iris$Species: versicolor
# Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
# 5.936        2.770        4.260        1.326 
# -------------------------------------------------------------------------------- 
#   iris$Species: virginica
# Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
# 6.588        2.974        5.552        2.026 


# 1.6 Mapply --------------------------------------------------------------
Q <- matrix(c(rep(1,4), rep(2,4),rep(3,4),rep(4,4)), 4, 4)
print(Q) 
# [,1] [,2] [,3] [,4]
# [1,]    1    2    3    4
# [2,]    1    2    3    4
# [3,]    1    2    3    4
# [4,]    1    2    3    4
# Can simplify the use of rep() function by mapply
#Syntax: mapply(FUN,data)
mapply(rep,1:4,4)


# 1.7 Aggregate -----------------------------------------------------------
aggregate(mtcars$mpg, by=mtcars["cyl"],FUN=mean)
# cyl        x
# 1   4 26.66364
# 2   6 19.74286
# 3   8 15.10000


# Graphics ----------------------------------------------------------------

#PLOTS
x=rnorm(100)
y=rnorm(100)
myFig <- plot(x,y, xlab = "x-Axis", ylab = "y-Axis", main = "Plot of x vs y", sub = "Also my first plot", col="green")

pdf("myFig.pdf")
dev.off()


# ggplot2 -----------------------------------------------------------------

#Graphing template 
ggplot(data=<DATA>) + <GEOM_FUNCTION>(mapping=aes(<MAPPINGS>))

options(scipen = 999) #Turn off scientific notation like 1e+06
library(ggplot2)

data("midwest", package = "ggplot2")

#Init ggplot
ggplot(midwest, aes(x=area, y=poptotal)) #Blank ggplot is drawn. Only x & y specified, but no points or lines 

ggplot(data = mpg) + geom_point(aes(x=displ, y=hwy)) #Scatterplot by adding a geom layer called geom_point()

ggplot(midwest, aes(x=area, y=poptotal)) + geom_point()

# can map aesthetics of the plot to the variables in the dataset. E.G. in mpg data map 'class' variable to colors of the scatterplot 
ggplot(data=mpg) + geom_point(mapping = aes(x=displ,y=hwy, color=class))

# can instead map 'class' variable to size aesthetic 
ggplot(data=mpg) + geom_point(aes(x=displ, y=hwy, size = class))

# can instead map 'class' variable to shape (25 poss shapes) aesthetic. WARNING: Max 6 shapes, so 7th and above categories will go unplotted
ggplot(data=mpg) + geom_point(aes(x=displ, y=hwy), shape = class)

# can instead map 'class' variable to transparency aesthetic 
ggplot(data=mpg) + geom_point(aes(x=displ, y=hwy, alpha = class))

#Setting the aesthetics properties, e.g. all points as blue 
ggplot(data=mpg) + geom_point(mapping=aes(x=displ, y=hwy), color='blue')

#Adding a smoothing layer using lm() method
g <- ggplot(midwest, aes(x=area, y=poptotal)) + geom_point() + geom_smooth(method='lm', se= FALSE) # To turn off confidence intervals around regression line, se=FALSE


#To adjust the range of x or y axis to be displayed 
g1 <- g + xlim(c(0,0.1)) + ylim(c(0,1000000)) #First method to delete points 
g + xlim(0,0.1) + ylim(0,1000000) #Second method to delete points
#Note: xlim() & ylim() delete points, so the lm() is refit based on those 

#If want to just adjust the view without actually deleting the points, use coord_cartesian()
g2 <- g + coord_cartesian(xlim=c(0,0.1), ylim=c(0, 1000000)) #This just zooms in 
plot(g2)

# Title and axis labels 
g3 <- g2 + labs(title="Area vs Population", subtitle="From Midwest dataset", y="Population", x="Area", caption="Midwest Demographics") #Method 1 
g3

g3 <- g2 + ggtitle("Area vs Population", subtitle = "From midwest data") + xlab("Area") + ylab("Population") #Method 2
g3

#Changing the color and size of points
ggplot(midwest, aes(x=area, y=poptotal))+
  geom_point(col="dodgerblue4", size=3)+ #Set static color and static size for points 
  geom_smooth(method="lm", col="brown4")+ #Change the color of the line 
  coord_cartesian(xlim=c(0,0.1), ylim=c(0,1000000))+
  labs(title="Area vs Population", subtitle="From Midwest Dataset", x="Area", y="Population", caption="Midwest Demographics")

#Change color to reflect categories in another column
mygg <- ggplot(midwest, aes(x=area, y=poptotal))+
  geom_point(aes(col=state), size=2.5)+ #Set color to vary based on state categories 
  geom_smooth(method = "lm", col="firebrick", size=2)+
  coord_cartesian(xlim = c(0,0.1), ylim = c(0,1000000))+
  labs(title="Area vs Population",subtitle="From Midwest Dataset",x="Area",y="Population",caption="Midwest Demographics")
#Similar to color by categories, can use shape, stroke and fill inside the aes() in geom_point() to discriminate groupings 
mygg

mygg+theme(legend.position = "None") #Can remove the legend as well

mygg+scale_color_brewer(palette=3)

#For more color palettes
library(RColorBrewer)
head(brewer.pal.info, 10)

#Change the x-axis text and ticks location. 2 aspects: Breaks and labels 
mygg + scale_x_continuous(breaks = seq(0, 0.1, 0.01), labels=letters[1:11]) 

#Customize text for axis labels by formatting original values 
mygg + scale_x_continuous(breaks = seq(0, 0.1, 0.01), labels = sprintf("%1.2f%%", seq(0, 0.1, 0.01))) + scale_y_continuous(breaks = seq(0, 1000000, 200000), labels = function(x){paste0(x/1000, "K")})


#To reverse the scale 
mygg + scale_x_reverse()


# To change the entire theme in one shot usign pre-built themes
mygg + theme_set(theme_classic()) + labs(subtitle="Classic Theme")
mygg + theme_set(theme_bw()) + labs(subtitle="BW Theme")

#For more themes, packages are ggthemes and ggthemr package 


# AV Case Study 

ggplot(train, aes(x=Item_Visibility, y=Item_Outlet_Sales)) + geom_point(size=2.5, color="navy")+xlab("Item Visibility")+ ylab("Item Outlet Sales") + ggtitle("Item Visibility vs Item Outlet Sales")

ggplot(train, aes(x=Outlet_Identifier, y=Item_Outlet_Sales))+geom_bar(stat = "identity",color="purple")+theme(axis.text.x = element_text(angle=70, vjust=0.5, color="black"))+ggtitle("Outlets vs Tot sales")

ggplot(train, aes(Item_Type,Item_Outlet_Sales))+geom_bar(stat="identity")+theme(axis.text.x = element_text(angle=70,vjust=0.5, color="navy"))+xlab("Item Type")+ylab("Item Outlet Sales")

ggplot(train, aes(Item_Type, Item_MRP))+geom_boxplot()+ggtitle("Box Plot")+theme(axis.text.x=element_text(angle=70, vjust=0.5, color="red"))+xlab("Item Type")+ylab("Item MRP")+ggtitle("Item Type vs Item MRP")


# Joins -------------------------------------------------------------------

x <- data.frame(k1=c(NA,NA,3,4,5), k2=c(1,NA,NA,4,5), data.x=1:5)
y <- data.frame(k1=c(NA,2,NA,4,5), k2=c(NA,NA,3,4,5), data.y=1:5)

merge(x, y, all=TRUE) #Full outer join
merge(x, y, all.x = TRUE) #Left outer join
merge(x, y, all.y=all.y = TRUE) #Right outer join
merge(x, y, by.x = "data.x", by.y = "data.y")

# Dplyr -------------------------------------------------------------------


library(dplyr)
library(knitr)
cars <- mtcars

colors <- data_frame(
  cyl = unique(cars$cyl),
  color=c("Blue","Green","Red")
)

View(cars[1:10,])
View(colors)

#Now doing a left join and using pipe operator %>%. This allows output fm one fn to input of another
left_join(cars, colors, by="cyl") %>%
  filter(row_number() %in% 1:10) %>%
  View()

left_join(cars, colors, by="cyl") %>%
  group_by(color) %>%
  summarise(mean_displacement=mean(disp),
            mediandisp=median(disp)) %>%
  View()

cars %>%
  summarise(meanweight=mean(wt),
            min_wt=min(wt),
            max_wt=max(wt),
            sd_wt=sd(wt),
            median_wt=median(wt),
            sum_wt=sum(wt),
            total=n())



#Generalizing through functions
join_And_summarize <- function(df, color_df){
  left_join(df, color_df, by="cyl") %>%
    group_by(color) %>%
    summarize(mean_disp=mean(disp))
}
join_And_summarize(cars, colors)

#Select columns from data frame
cars_subset <- select(cars, cyl, gear, carb) %>%
  View()

#Select all except a column
cars_bigsubset <- select(cars, -hp) %>%
  View()

#Select a range of columns using "-" operator
cars_lasttwo <- select(cars, gear:carb) %>%
  head() %>%
  View()

#Use starts_with to select columns that start with "ge" (i.e. column "gear")
head(select(cars, starts_with("ge")))

head(select(cars, ends_with("at")))

head(select(cars, contains("ea")))

head(select(cars, one_of("cyl", "hp")))

#FILTERING 
filter(cars, disp>160, qsec>18)

#Arranging/re-ordering rows by a particular column
cars %>%
  arrange(wt) %>%
  head()
#Selecting mpg, disp and wt, arranging rows by wt and then arranging by mpg. Show only those
# with wt greater than 5, arranged in descending order
cars %>%
  select(mpg, disp, wt)%>%
  arrange(wt)%>%
  arrange(mpg, desc(wt))%>%
  filter(wt>5)

#New columns using mutate(). wt per cylinder

select(cars, cyl, wt) %>%
  mutate(wt_per_cyl = wt / cyl) %>%
  head()



# Data Exploration -------------------------------------------------------

# ML from R (Brett Lantz) starts here
usedcars <- read.csv("https://raw.githubusercontent.com/stedy/Machine-Learning-with-R-datasets/master/usedcars.csv", stringsAsFactors = F)

#Percentiles : First and 99th percentiles 
quantile(usedcars$price, probs = c(0.01,0.99))

quantile(seq(from=0, to=1, by=0.01))
# 0%  25%  50%  75% 100% 
# 0.00 0.25 0.50 0.75 1.00

boxplot(usedcars$mileage)
hist(usedcars$price, main = "Histogram of prices", xlab = "Price ($)")
hist(usedcars$price, main = "Histogram of prices", xlab = "Price ($)", breaks = 20)

var(usedcars$mileage) #Variance
sd(usedcars$mileage) #Std deviation

table(usedcars$color)
# Black   Blue   Gold   Gray  Green    Red  Silver White Yellow 
# 35       17      1     16      5     25     32    16      3  


round(prop.table(table(usedcars$color))*100,2) #For percentages
# Black   Blue   Gold   Gray  Green    Red Silver  White Yellow 
# 0.23   0.11   0.01   0.11   0.03   0.17   0.21   0.11   0.02

library(gmodels)
#Two way cross tabulations for relationship between two nominal variables 
usedcars$conservative <- usedcars$color %in% c("Black", "Gray", "Silver", "White")
prop.table(table(usedcars$conservative)*100) #66% cars are conservative 
CrossTable(x=usedcars$model, y=usedcars$conservative)

# ML from R (Brett Lantz) ends here

Auto <- read.table("/home/fractaluser/Documents/ISLR_Labs/Data/Auto.data", header=T, na.strings="?")
View(Auto)
fix(Auto) #View and edit the data in a spreadsheet like window
dim(Auto) #[1] 397  9
Auto = na.omit(Auto) #Remove rows that contain missing observations
dim(Auto)

#Check the variable names
names(Auto)
plot(Auto$cylinders, Auto$mpg) #one way to type variable names

attach(Auto) #attach allows you to use directly

plot(cylinders, mpg)

cylinders=as.factor(cylinders) #Small number of values for cylinder, so treat as qualitative

plot(cylinders, mpg, col="red", varwidth=T, horizontal=T, xlab="Cylinders",ylab="MPG") #boxplot

hist(mpg, col=2, breaks=15) #col=2 same as col=red

pairs(Auto) #Creates a scatterplot matrix

pairs(~ mpg + displacement + horsepower + weight + acceleration, Auto) #For just a subset

plot(horsepower, mpg)

identify(horsepower, mpg, name) #Identify value for a variable on a plot

summary(Auto) #Numerical summary of each variable in the dataset

summary(mpg)

q() #Exit R


# APPLIED EXERCISES

###### COLLEGE ########
library(MASS)
library(ISLR)
data("College")

# rownames(College)=College[,1]   This is when reading the csv file. I loaded directly
# from ISLR Library
# fix(College)

summary(College)
pairs(College[,1:10])
plot(College$Private, College$Outstate)

# Creating a new qualitative variable called "Elite" which is flagged "Yes" if more than
#  50% students in that college come from top 10% percentile of their high scool class

Elite=rep("No", nrow(College))
Elite[College$Top10perc > 50] <- "Yes"
Elite <- as.factor(Elite)
college <- data.frame(College, Elite)
summary(college$Elite) #78 elite colleges out of 777
plot(college$Elite, college$Outstate)

par(mfrow=c(2,2))
hist(college$Apps, col=3, xlab = "Applications recd")
hist(college$perc.alumni, col=2, xlab="% alumni who donate")
hist(college$Enroll, col=4, xlab="% accepted")
hist(college$Outstate, col=5, xlab="oustate", breaks=breaks = 100)

par(mfrow=c(1,1))
plot(college$Outstate, college$Grad.Rate)
# High tuition correlates to high graduation rate.
plot(college$Accept / college$Apps, college$S.F.Ratio)
# Colleges with low acceptance rate tend to have low S:F ratio.
plot(college$Top10perc, college$Grad.Rate)
# Colleges with the most students from top 10% perc don't necessarily have
# the highest graduation rate. Also, rate > 100 is erroneous!


############## AUTO ##############

data(Auto)
Auto = na.omit(Auto)
dim(Auto)
str(Auto)
# quantitative: mpg, cylinders, displacement, horsepower, weight,acceleration, year
# qualitative: name, origin

# apply the range function to the first 7 (quant) columns of Auto
sapply(Auto[1:7], range)
sapply(Auto[1:7], mean)
sapply(Auto[1:7], sd)

sapply(Auto[-c(10:85),1:7], range)
sapply(Auto[-c(10:85),1:7], mean)
sapply(Auto[-c(10:85),1:7], sd)


pairs(Auto)
plot(Auto$mpg, Auto$weight)
# Heavier weight correlates with lower mpg.
plot(Auto$mpg, Auto$cylinders)
# More cylinders, less mpg.
plot(Auto$mpg, Auto$year)
# Cars become more efficient over time.

# (f)
pairs(Auto)
# See descriptions of plots in (e).
# All of the predictors show some correlation with mpg. The name predictor has 
# too little observations per name though, so using this as a predictor is 
# likely to result in overfitting the data and will not generalize well.


########## BOSTON ############
data("Boston")
str(Boston)
# 506 obs. of  14 variables

# (b) Make some pairwise scatterplots of the predictors (columns) in
# this data set. Describe your findings.
pairs(Boston)
# X correlates with: a, b, c
# crim: age, dis, rad, tax, ptratio
# zn: indus, nox, age, lstat
# indus: age, dis
# nox: age, dis
# dis: lstat
# lstat: medv


# (c) Are any of the predictors associated with per capita crime rate?
# If so, explain the relationship.

plot(Boston$age, Boston$crim)
# Older homes, more crime
plot(Boston$dis, Boston$crim)
# Closer to work-area, more crime
plot(Boston$rad, Boston$crim)
# Higher index of accessibility to radial highways, more crime
plot(Boston$tax, Boston$crim)
# Higher tax rate, more crime
plot(Boston$ptratio, Boston$crim)
# Higher pupil:teacher ratio, more crime

# (d) Do any of the suburbs of Boston appear to have particularly
# high crime rates? Tax rates? Pupil-teacher ratios? Comment on
# the range of each predictor.

# (d)
par(mfrow=c(1,3))
hist(Boston$crim[Boston$crim>1], breaks=25)
# most cities have low crime rates, but there is a long tail: 18 suburbs appear
# to have a crime rate > 20, reaching to above 80
hist(Boston$tax, breaks=100)
# there is a large divide between suburbs with low tax rates and a peak at 660-680
hist(Boston$ptratio, breaks=25)
# a skew towards high ratios, but no particularly high ratios


# (e) How many of the suburbs in this data set bound the Charles
# river?
dim(subset(Boston, chas == 1))
# 35 suburbs

# (f) What is the median pupil-teacher ratio among the towns in this
# data set?
median(Boston$ptratio)

# (g) Which suburb of Boston has lowest median value of owner-
# occupied homes? What are the values of the other predictors
# for that suburb, and how do those values compare to the overall
# ranges for those predictors? Comment on your findings.
t(subset(Boston, medv == min(Boston$medv)))  #IMP

# (h) In this data set, how many of the suburbs average more than
# seven rooms per dwelling? More than eight rooms per dwelling?
dim(subset(Boston, rm > 7))
# 64
dim(subset(Boston, rm > 8))
# Comment on the suburbs that average more than eight rooms
# per dwelling.
summary(subset(Boston, rm > 8))
summary(Boston)

# Creating histograms 
set.seed(111)
hist(rnorm(1000, mean=1.75, sd=0.5), xlab = 'Employee height (in m)', main = 'Employee heights', ylab = 'Frequency', breaks=c(0, 0.5, 1, 1.5, 2, 2.5, 3, 3.5,4), col = 'black')

# Association Mining ------------------------------------------------------

# Referencez: https://datascienceplus.com/implementing-apriori-algorithm-in-r/


#Libraries
library(plyr)
library(arulesViz)
library(arules)

# Data Cleaning 
asndata <- read.csv("Z://FC SCM/OTIF_All_months_36SKUsdmat1month.csv")
str(asndata)

df_sorted <- asndata[order(asndata$Sales.document),] # Sorting materials in order of increasing Sales doc IDs 

df_sorted$Sales.document <- as.numeric(df_sorted$Sales.document) #Converting to numeric 


#Converting the data frame into transactions 'basket' format based on Sales doc ID 

df_itemlist <- ddply(asndata, c("Sales.document"),
                     function(df1)paste(df1$Material, collapse=",")) # This creates one row per 
# transaction, with each row containing all the materials purchased together, separated by comma. 
View(df_itemlist)

df_itemlist$Sales.document <- NULL #Remove sales docs since no longer needed. We now have raw transactions 

colnames(df_itemlist) <- c("itemList") #renaming 

write.csv(df_itemlist, file = "Z://FC SCM/ItemList.csv", quote = FALSE, row.names = TRUE) #Write out the file, so that can read it again as transactions data format as required by the apriori algorithm 



# Association Rules Creation  

txn <- read.transactions(file = "Z://FC SCM/ItemList.csv", rm.duplicates = TRUE, format="basket", sep=",", cols = 1)

View(txn)

txn@itemInfo$labels <- gsub("\"","",txn@itemInfo$labels) # Replacing some quotes "" in the strings 

basket_rules <- apriori(txn, parameter = list(sup=0.01, conf=0.5, target="rules"))

df_basket <- as(basket_rules, "data.frame")
View(df_basket)

write.csv(df_basket, file="Z://FC SCM/AssociationRules.csv")



# Plots 
#http://r-statistics.co/Association-Mining-With-R.html

plot(basket_rules)
plot(basket_rules, method="grouped", control = list(k=5))
plot(basket_rules, method = "graph", control = list(type="items"))
plot(basket_rules, method = "paracoord", control=list(alpha=0.5, reorder=TRUE))
plot(basket_rules, measure=c("support", "lift"), shading="confidence", interactive = T)

itemFrequencyPlot(txn, topN=5)

# SAMPLE EXAMPLE 
https://www.r-bloggers.com/association-rule-learning-and-the-apriori-algorithm/
  data("Groceries")
class(Groceries) #Data of type transactions 
inspect(head(Groceries))
items                     
# [1] {citrus fruit, semi-finished bread, margarine, ready soups}             
# [2] {tropical fruit, yogurt, coffee}                  
# [3] {whole milk}              
# [4] {pip fruit, yogurt, cream cheese , meat spreads}  

size(head(Groceries)) #Number of items in each observation
# [1] 4 3 1 4 4 5

#  eclat() function takes in a transactions object and gives the most frequent items in the data based on the support you provide in the supp argument. 
# maxlen defines the maximum number of items in each itemset of frequent items 
frequenItems <- eclat(Groceries, parameter = list(supp=0.07, maxlen=15))
# inspect(frequenItems)
# items                         support    count
# [1]  {other vegetables,whole milk} 0.07483477  736 
# [2]  {whole milk}                  0.25551601 2513 
# [3]  {other vegetables}            0.19349263 1903 
# [4]  {rolls/buns}                  0.18393493 1809 
# [5]  {yogurt}                      0.13950178 1372 
# [6]  {soda}                        0.17437722 171

itemFrequencyPlot(Groceries, topN=10, type="absolute", main="Item Frequency")


# DataExplorer ------------------------------------------------------------
library(DataExplorer)
# https://www.kaggle.com/rtatman/chocolate-bar-ratings/data
choco <- download.file('https://raw.githubusercontent.com/s-totally/R-Codes-Repository/master/flavors_of_cacao.csv', destfile = 'C://Users/sridevi.tolety/Desktop/flavors_of_cacao.csv')

choco <- read.csv('C://Users/sridevi.tolety/Desktop/flavors_of_cacao.csv', stringsAsFactors = F)
str(choco)
choco$Cocoa.Percent <- as.numeric(gsub('%', "", choco$Cocoa.Percent))
choco$Review.Date <- as.character(choco$Review.Date)

plot_str(choco)
plot_missing(choco)
plot_histogram(choco)
plot_density(choco)
plot_correlation(choco, type = 'continuous', 'Review.Date')
plot_bar(choco)
create_report(choco)
# Clustering --------------------------------------------------------------

setwd("/home/fractaluser/Downloads")
dat <- read.csv("/home/fractaluser/Downloads/Clustering data.csv")
dat$Norm.CFR[dat$Norm.CFR=="(Empty)"] <- NA
dat$Norm.COV[dat$Norm.COV=="(Empty)"] <- NA
colSums(is.na(dat))
str(dat)
dat$Norm.CFR <- as.numeric(dat$Norm.CFR)
dat$Norm.COV <- as.numeric(dat$Norm.COV)
cleandat <- dat[,c(2:3)] #Removing DFUID column 
# set.seed(2)
# x=matrix(rnorm(50*2), ncol=2)
# x[1:25,1]=x[1:25,1]+3 # First 25 obs are just a mean shift relative to next 25 
# x[1:25,2]=x[1:25]-4

# corMatrix <- cor(cleandat[,1:4], use="complete.obs")
# corMatrix

# cleandat2 <- rep(0,711)
# cleandat2$Norm.CFR <- cleandat$Norm.CFR[which(!is.na(cleandat$Norm.CFR))]
wss <- (nrow(cleandat)-1)*sum(apply(cleandat,2,var))
for (i in 1:25) wss[i] <- sum(kmeans(cleandat, centers = i)$withinss)
plot(1:25, wss, type="b",xlab="No. of clusters",ylab="Within gps SS")
# Decide on 5 clusters 

km.out = kmeans(na.omit(cleandat),5,nstart = 20) # K-Means Code 
km.out
#Note: nstart > 1 means that the clustering will be performed using multiple random assignments & the kmeans() algorithm will choose only the best results  
km.out$cluster
dat$cluster[which(!is.na(dat$Norm.COV))] <- km.out$cluster
table(dat$cluster)
km.out

plot(dat$DFU, dat$cluster, pch=21)

plot(cleandat, col=(km.out$cluster+1), main = "K-means clustering results with K=5", pch=20,cex=2) # Cluster plot 

#If didn't know that 2 clusters, and tried 3 
set.seed(4)
km.out = kmeans(x, 3, nstart=20)
km.out

#How does nstart=1 compare to nstart=20?
set.seed(3)
km.out = kmeans(x, 3, nstart=1)
km.out$tot.withinss # 64.81 #
# Note that km.out$tot.withinss is the total within-cluster sum of squares, which we seek to minimize by performing K-means clustering

km.out = kmeans(x, 3, nstart=20)
km.out$tot.withinss # 51.74

#Generally prefer large value of nstart, otherwise an undesirable local optimum might be obtained



# KNN ---------------------------------------------------------------------

#https://www.kaggle.com/uciml/breast-cancer-wisconsin-data/data
wbcd <- read.csv('C:/Sridevi_Tolety_Backup/Ubuntu backup/wbcd.csv')
wbcd <- wbcd[-1] #Exclude the first (ID) column
DataExplorer::create_report(wbcd)
wbcd$X <- NULL #Column of NAs

round(prop.table(table(wbcd$diagnosis))*100, digits = 1) #62% benign, 37% malignant 
wbcd$diagnosis <- factor(wbcd$diagnosis, levels = c("B","M"), labels = c("Benign", "Malignant"))
round(prop.table(table(wbcd$diagnosis))*100, digits = 1)
summary(wbcd[c('radius_mean','area_mean', 'smoothness_mean')]) #Ranges of each differ greatly, and scale of variables impacts the KNN calculations. Are will have larger impact than smoothness. Need to apply normalization to rescale features to a standard range of values. 

#Function for normalizing: Subtract min from value and divide by (max-min)
normalize <- function(x){
  (x - min(x))/(max(x)-min(x))
}

eg <- c(1,2,3,4,5); normalize(eg) #Testing 

wbcd_n <- as.data.frame(lapply(wbcd[2:31], normalize))
summary(wbcd$radius_mean)

#Train and test splits of data
wbcd_train <- wbcd_n[1:(nrow(wbcd_n)-100),] #Were already randomly ordered 
wbcd_test <- wbcd_n[(nrow(wbcd_n)-99):nrow(wbcd_n), ]#100 rows for test set 
wbcd_train_labels <- wbcd[1:(nrow(wbcd_n)-100),1] 
wbcd_test_labels <- wbcd[(nrow(wbcd_n)-99):nrow(wbcd_n),1]

library(class)

ptm <- proc.time()
wbcd_pred <- class::knn(train = wbcd_train, test = wbcd_test, cl = wbcd_train_labels, k = 21) #k=21 is Sqrt of 469, our training data length
proc.time() - ptm
#No need to use predict() after knn() because it already generates a factor vector of predicted classes for the test data

gmodels::CrossTable(x = wbcd_test_labels, y = wbcd_pred, digits = 3, prop.chisq = F)
# 2% misclassification rate, malignant wrongly classified as benign 

#Model improvements
#Transforming by standardising rather than normalizing
# The scale() function rescales values using Z-score standardization
#Might be better in terms of allowing outliers to influence the model better
wbcd_z <- as.data.frame(lapply(wbcd[2:31], scale))
summary(wbcd$radius_mean); summary(wbcd_n$radius_mean); summary(wbcd_z$radius_mean)

wbcd_train <- wbcd_z[1:(nrow(wbcd_z)-100),] #Were already randomly ordered 
wbcd_test <- wbcd_z[(nrow(wbcd_z)-99):nrow(wbcd_z), ]#100 rows for test set 
wbcd_train_labels <- wbcd[1:(nrow(wbcd_z)-100),1] 
wbcd_test_labels <- wbcd[(nrow(wbcd_z)-99):nrow(wbcd_z),1]
wbcd_pred <- knn(train = wbcd_train, test = wbcd_test, cl = wbcd_train_labels, k=21)
gmodels::CrossTable(x = wbcd_test_labels, y = wbcd_pred, prop.chisq = F)

# CLUSTERING 


# Naive Bayes Algorithm ---------------------------------------------------

download.file('https://raw.githubusercontent.com/stedy/Machine-Learning-with-R-datasets/master/sms_spam.csv', destfile = 'C://Users/sridevi.tolety/Desktop/sms_raw.csv')
download.file('https://raw.githubusercontent.com/s-totally/R-Codes-Repository/master/sms_raw.csv', destfile = 'C://Users/sridevi.tolety/Desktop/sms_raw.csv')

sms_raw <- read.csv('C://Users/sridevi.tolety/Desktop/sms_raw.csv', stringsAsFactors = F)
sms_raw$type <- factor(sms_raw$type)
table(sms_raw$type) # Ham: 4827, spam is 747
round(prop.table(table(sms_raw$type))*100,1) #86% ham, 13% spam
library(tm)

#Create a corpus (collection of documents). Here it is a collection of text messages
sms_corpus <- tm::VCorpus(x = VectorSource(sms_raw$text)) #Vcorpus means volatile corpus (stored in memory and not in disk)
# VectorSource creates a source object from existing sms_raw$text vector
# To access a permanent corpus stored on disk, can use Pcorpus()
#Can also import data from pdfs and MS word files using readerControl() parameter
print(sms_corpus)
inspect(sms_corpus[1:2]) # TO view 1st and 2nd smses
# <<VCorpus>>
#   Metadata:  corpus specific: 0, document level (indexed): 0
# Content:  documents: 2
# 
# [[1]]
# <<PlainTextDocument>>
#   Metadata:  7
# Content:  chars: 111
# 
# [[2]]
# <<PlainTextDocument>>
#   Metadata:  7
# Content:  chars: 29
as.character(sms_corpus[[1]])

#To view multiple messages 
lapply(sms_corpus[1:2], as.character)

# Cleaning up the corpus 

# Standardize to lowercase 
sms_corpus_clean <- tm_map(sms_corpus, FUN = content_transformer(tolower)) #Can use other proc & cleanup methods like grep(). Wrap in in content_transformer() and apply via tm_map()

lapply(sms_corpus_clean[1:5], as.character) #checking

#Removing numbers 
sms_corpus_clean <- tm_map(sms_corpus_clean, removeNumbers)

getTransformations()  

#Remove stop words like to, and, but 
stopwords()
sms_corpus_clean <- tm_map(sms_corpus_clean, removeWords, stopwords())

lapply(sms_corpus_clean[1:5], as.character)

sms_corpus_clean <- tm_map(sms_corpus_clean, removePunctuation) #but this removes punctuatuons and may actually merge words together. Would rather replace punctuations with a " "

replacePunctuation <- function(x){
  gsub("[[punct:]]+", " ", x)
} #http://www.endmemo.com/program/R/gsub.php

# STEMMING 
# Reducing words to their root form 
library(SnowballC)
wordStem(c("learning","learned", "learns")) #All converted to "learn"

#To apply stemming to entire document 
sms_corpus_clean <- tm_map(sms_corpus_clean, stemDocument)

#Removing additional whitespaces 
sms_corpus_clean <- tm_map(sms_corpus_clean, stripWhitespace)
inspect(DocumentTermMatrix(sms_corpus_clean[1:2]))

#TOKENIZATION 
# Split messages into single elements of text strings 
# Avble structures: Document Term Matrix (DTM) & Term Document Matrix (Transposed DTM)

DocumentTermMatrix(sms_corpus_clean[1:2]) #Sparse matrix of 1st 2 messages
inspect(DocumentTermMatrix(sms_corpus_clean[1:2]))

sms_dtm <- DocumentTermMatrix(sms_corpus_clean) #Creates tokenized corpus with minimal processing 

#TO include some proccessing, e.g. creating from raw sms corpus 
sms_dtm2 <- DocumentTermMatrix(sms_corpus, control = list(
  tolower=T,
  removeNumbers=T,
  removePunctuation=T,
  stemming=T
  ))
# Word counts differ between sms_dtm and sms_dtm2 because of the differing order in which the processing steps are applied in the control parameter. Words are first tokenized and then cleaned

#Split into train and test sets: 75% train and 25% test 
sms_dtm_train <- sms_dtm[(1:floor(0.75*nrow(sms_dtm))),]
sms_dtm_test <- sms_dtm[(floor(0.75*nrow(sms_dtm))+1):nrow(sms_dtm),]

#Saving the labels of the train and test datasets
sms_train_labels <- sms_raw[(1:floor(0.75*nrow(sms_dtm))),]$type
sms_test_labels <- sms_raw[(floor(0.75*nrow(sms_dtm))+1):nrow(sms_dtm),]$type
#Check balance of spam and ham in train and test 
prop.table(table(sms_train_labels))*100 # 86.5%, 13.5% 
prop.table(table(sms_test_labels))*100 # 86.9% 13.06%


#Visulating text data 
library(wordcloud)
wordcloud(words = sms_corpus_clean, min.freq = 50, random.order = F)
#If we want to compare wordclouds for SMS spam and ham 
spam <- subset(sms_raw, type == "spam")
ham <- subset(sms_raw, type == "ham")
wordcloud(spam$text, max.words = 40, scale = c(3, 0.5))
wordcloud(spam$text, max.words = 40, scale = c(3, 0.5))

# Transform sparse matrix into data structure that can be used to train a Naive Bayes classifier 
#sms_dtm has over 6,500 features (words), but not all will be important
sms_freq_words <- findFreqTerms(sms_dtm_train, lowfreq = 5) # Returns character vector containing words that appear at least 5 times 
sms_freq_words <- sapply(sms_freq_words, function(x) iconv(x, 'latin1', 'ASCII', sub = ''))
str(sms_freq_words)
sms_freq_words <- sms_freq_words[sms_freq_words!=""]
sms_freq_words <- unique(sms_freq_words)

# Limit the sparse matrix to all rows but only those columns corresponding to the words from frequent words are present

sms_dtm_freq_train <- sms_dtm_train[,sms_dtm_train$dimnames$Terms %in% sms_freq_words]
sms_dtm_freq_test <- sms_dtm_test[, sms_dtm_test$dimnames$Terms %in% sms_freq_words]

# Naive Bayes Classifier is typically trained on data with categorical features. But cells in the sparse matrix are numeric and measure the # times a word occurs in that document (sms). can convert to a yes or no 

convert_counts <- function(x){
  x <- ifelse(x>0, "Yes", "No")
}

#Apply convert_counts() to each column in the sparse matrix 
sms_train <- apply(sms_dtm_freq_train, MARGIN = 2, FUN = convert_counts)
sms_test <- apply(sms_dtm_freq_test, MARGIN = 2, FUN = convert_counts)

library(e1071)

sms_classifier <- naiveBayes(x = sms_train, y = sms_train_labels)
sms_test_pred <- predict(sms_classifier, sms_test)
gmodels::CrossTable(x = sms_test_pred, y = sms_test_labels, prop.chisq = F, prop.t = F, dnn = c("Predicted", "Actual")) #Only 29 of 1394 smses wrongly classified (2.08%)

# Improving model performance by use of the Laplace estimator 
sms_classifier2 <- naiveBayes(x = sms_train, y = sms_train_labels, laplace = 1)
sms_test_pred2 <- predict(sms_classifier2, sms_test)
gmodels::CrossTable(sms_test_pred2, sms_test_labels, prop.chisq = F, prop.t = F, prop.r = F, dnn = c('predicted', 'actual'))

# Whatsapp chat analysis
d <- readLines("C://Users/sridevi.tolety/Documents/Fractal Files/Personal/whatsapp_mm.txt")

len <- length(d) #40,105 lines 
#Regex pattern to extract conversation only 
r <- ".*?\\s(.*)"
txtdf <- character(0) #Initiate blank character

for (i in 1:len) {
  m <- stringr::str_match(d[i], r)
  txtdf <- c(txtdf, m[2])
}

#Convert the conversation into a corpus
txt_corpus <- Corpus(VectorSource(txtdf), readerControl = list(language = 'en'))

#Simple processing 
txt_corpus <- tm_map(txt_corpus, removePunctuation)
txt_corpus <- tm_map(txt_corpus, content_transformer(tolower))
txt_corpus <- tm_map(txt_corpus, stemDocument)
txt_corpus <- tm_map(txt_corpus, removeNumbers)
txt_corpus <- sapply(txt_corpus, function(x) iconv(x, 'latin1', 'ASCII', sub = '')) #Remove emoticons 
lapply(txt_corpus[1:50], as.character) #To view it 
txt_corpus <- Corpus(VectorSource(txt_corpus))
add_ons <- c("media", "omit", "pm", "am", "mayuresh", "sri", "will","ill","veri") #additional stop words 
txt_corpus <- tm_map(txt_corpus, removeWords, stopwords())
txt_corpus <- tm_map(txt_corpus, removeWords, add_ons)
txt_corpus <- tm_map(txt_corpus, stripWhitespace)
wordcloud(txt_corpus, min.freq = 5, random.order = FALSE, colors = brewer.pal(8, "Dark2"))

#Sentiment analysis
library('syuzhet')
library(qdap)
text_frequency <- qdap::freq_terms(txt_corpus, at.least=1)

# PCA ---------------------------------------------------------------------

train <- read.csv("/home/fractaluser/Documents/BigMart/Train_UWu5bXk.csv")
test <- read.csv("/home/fractaluser/Documents/BigMart/Test_u94Q5KV.csv")
str(train)
test$Item_Outlet_Sales <- 1 #Add target column to test data as well
combi <- rbind(train, test) #Combine train & test data

colSums(is.na(combi))
# Item_Identifier               Item_Weight 
#                        0                      2439 
#         Item_Fat_Content           Item_Visibility 
#                        0                         0 
#                Item_Type                  Item_MRP 
#                        0                         0 
#        Outlet_Identifier Outlet_Establishment_Year 
#                        0                         0 
#              Outlet_Size      Outlet_Location_Type 
#                        0                         0 
#              Outlet_Type         Item_Outlet_Sales 
#                        0                         0 

#Item_Weight has 2439 missing values, lets impute with median
combi$Item_Weight[is.na(combi$Item_Weight)] <- median(combi$Item_Weight, na.rm = TRUE)

combi$Item_Visibility[combi$Item_Visibility==0] <- median(combi$Item_Visibility) #0 item visibility is meaningless, so lets impute with median
levels(combi$Item_Fat_Content)
# [1] "LF"      "low fat" "Low Fat" "reg"     "Regular"
combi$Item_Fat_Content <- as.character(combi$Item_Fat_Content)
combi$Item_Fat_Content[combi$Item_Fat_Content %in% c("LF","low fat","Low Fat")] <- "Low Fat"

combi$Item_Fat_Content[combi$Item_Fat_Content %in% c("reg","Regular")] <- "Regular"
combi$Item_Fat_Content <- as.factor(combi$Item_Fat_Content)


# Linear Mixed Effects Model ----------------------------------------------

# http://www.bodowinter.com/tutorial/bw_LME_tutorial2.pdf

library(lme4)
politeness <- read.csv("http://www.bodowinter.com/tutorial/politeness_data.csv")
names(politeness)
# [1] "subject"   "gender"    "scenario"  "attitude"  "frequency"
nrow(politeness) #84 
which(is.na(politeness$frequency)) #row 39 has a missing value
boxplot(frequency~gender*attitude, col=c("darksalmon","darkseagreen3"), data=politeness)
# The median frequency for females is higher than that of males

politeness.model <- lmer(frequency~attitude+(1|subject)+(1|scenario), data=politeness)
summary(politeness.model)

# Linear mixed model fit by REML ['lmerMod']
# Formula: frequency ~ attitude + (1 | subject) + (1 | scenario)
# Data: politeness

# REML criterion at convergence: 793.5

# Scaled residuals: 
#   Min      1Q  Median      3Q     Max 
# -2.2006 -0.5817 -0.0639  0.5625  3.4385 

# Random effects:
#   Groups   Name        Variance Std.Dev.
# scenario (Intercept)  219     14.80   
# subject  (Intercept) 4015     63.36   Much more variability than scenario
# Residual              646     25.42   
# Number of obs: 83, groups:  scenario, 7; subject, 6

# Fixed effects:
#   Estimate Std. Error t value
# (Intercept)  202.588     26.754   7.572
# attitudepol  -19.695      5.585  -3.527   Slope for categorical effect of politeness. Have to lower pitch by 19.695 Hz to go down from informal to polite 

# But intercept here is 202, which is halfway through male and female pitch, so need to add that as a fixed effect? Why as fixed and not random? Because relationship between sex and pitch is systematic and predictable, as we expect females to have a higher pitch. Diff fm random effects subject & item where relation with pitch much more unpredictable 

summary(politeness.model)

politeness.model <- lmer(frequency~attitude+gender+(1|subject)+(1|scenario), data=politeness)
summary(politeness.model)
# Now the varation associated with subject dropped considerably. Earlier the variation due to gender was being confounded with variation due to subject 


# Correlation of Fixed Effects:
#   (Intr)
# attitudepol -0.103
# Logistic Regression -----------------------------------------------------

# ROCR curve
library(ROCR)
library(caTools)
Carseats$High <- ifelse(Carseats$Sales>=8,1,0)
set.seed(1)
split <- sample.split(Carseats$High, SplitRatio = 0.75)
Carseats.train <- subset(Carseats,split==TRUE)
Carseats.test <- subset(Carseats, split==FALSE)

#Logistic regression Model
model1 <- glm(High~.-Sales, data=Carseats.train, family = binomial)
summary(model1)
# 
# Null deviance: 406.12  on 299  degrees of freedom
# Residual deviance: 114.68  on 288  degrees of freedom
# AIC: 138.68
# 
# Number of Fisher Scoring iterations: 7

#Deviance 
#  Deviance is a measure of goodness of fit of a generalized linear model. The null deviance shows how well the response variable is predicted by a model that includes only the intercept (grand mean). The Residual Deviance has reduced by 291.44 with a loss of 11 degrees of freedom.

# Fisher Scoring
# # Fisher's scoring algorithm is a derivative of Newton's method for solving maximum likelihood problems numerically.Doesn't really tell you a lot that you need to know, other than the fact that the model did indeed converge, and had no trouble doing it.


## Hosmer Lemeshow Goodness of Fit 
install.packages("ResourceSelection")
library(ResourceSelection)
hoslem.test(Carseats.train$High, fitted(model1))
# Hosmer and Lemeshow goodness of fit (GOF) test
# 
# data:  Carseats.train$High, fitted(model1)
# X-squared = 0.59757, df = 8, p-value = 0.9997
# Our model appears to fit well because we have no significant difference between the model and the observed data (i.e. the p-value is above 0.05).

preds <- predict(model1, type = 'response')

#Confusion matrix 
table(Carseats.train$High, preds>0.5)
(168+109)/(169+9+14+109)# Accuracy 92.03% 

ROCRpred <- prediction(preds, Carseats.train$High)
ROCRperf <- performance(ROCRpred, 'tpr','fpr')
plot(ROCRperf, colorize=TRUE, text.adj=c(-0.2,1.7))

#plot glm
library(ggplot2)
ggplot(Carseats.train, aes(x=Income, y=High)) + geom_point() + 
  stat_smooth(method="glm", family="binomial", se=FALSE)



# LDA ---------------------------------------------------------------------
library(ISLR)
library(MASS)
names(Smarket)
# [1] "Year"      "Lag1"      "Lag2"      "Lag3"      "Lag4"     
# [6] "Lag5"      "Volume"    "Today"     "Direction"
dim(Smarket)
summary(Smarket)
pairs(Smarket)

train <- (Smarket$Year<2006)
lda.fit <- lda(Direction ~ Lag1 + Lag2, data=Smarket, subset=train)
lda.fit


# Prior probabilities of groups:
#   Down     Up 
# 0.4816 0.5184 
# 48.16% of training obs correspond to days during which the market went down

# Group means:
#   Lag1        Lag2
# Down  0.05068605  0.03229734
# Up   -0.03969136 -0.02244444
# These are the averages of each predictor within each class, used as estimates of Mu_k
# Shows that there is a tendency for previous 2 days' returns to be negative on days when the market increases, and tendency for previous day's returns to be positive on days when the market declines 

# Coefficients of linear discriminants:
#   LD1
# Lag1 -0.7567605
# Lag2 -0.4707872
# These coeff.s provide the linear combi of Lag1 & Lag2 that are used to form the LDA decision rule 

plot(lda.fit)

Smarket.2005 <- Smarket[!train,]
lda.pred <- predict(lda.fit, Smarket.2005)
names(lda.pred)

# KNN ---------------------------------------------------------------------



# 5 Resampling Methods ------------------------------------------------------


# 5.1 Validation Set Approach -------------------------------------------------
library(ISLR)
set.seed(1)
#Using the Auto dataset. 392 rows, 9 variables
train <- sample(392,196)
Automodel <- lm(mpg~horsepower, data=Auto, subset=train)
mean((Auto$mpg-predict(Automodel, Auto))[-train]^2) # 26.14
Automodel2 <- lm(mpg~poly(horsepower,2), data=Auto, subset=train)
mean((Auto$mpg-predict(Automodel2,Auto))[-train]^2)  # 19.82
Automodel3 <- lm(mpg~poly(horsepower, 3), data=Auto, subset=train)
mean((Auto$mpg-predict(Automodel3, Auto))[-train]^2) # 19.78


# 5.2 LOOCV ---------------------------------------------------------------


glmModel <- glm(mpg~horsepower, data=Auto) # Fitting lm() using glm()
coef(glmModel)
#Using glm because we can use with cv.glm()
library(boot)
cvError <- cv.glm(Auto, glmModel) #K not specified, so its LOOCV by default
cvError$delta
#delta is a vector os length 2. 1st component is raw CV est of pred error. 2nd component is adjusted CV est to compensate for bias introduced by not using LOOCV
cvErr <- rep(0,5)
for(i in 1:5){
  glmModel <- glm(mpg~poly(horsepower, i), data=Auto)
  cvErr[i] <- cv.glm(Auto, glmModel)$delta[1]
}
#Here delta's values differ slightly. Not identical as in LOOCV 
cvErr #[1] 24.23151 19.24821 19.33498 19.42443 19.03321




# 5.3 K-fold CV -----------------------------------------------------------

set.seed(17)
kfcvErr <- rep(0,10)
for(i in 1:10){
  kfglmMod<- glm(mpg~poly(horsepower,i), data=Auto)
  kfcvErr[i] <- cv.glm(Auto, kfglmMod, K=10)$delta[1]
} #Shorter runtime than LOOCV
kfcvErr
plot(kfcvErr) #Quadratic is good fit 


# 5.4 Bootstrap -----------------------------------------------------------

x =c(10,20,30,40, 50)
d = c(3,2,2)

x[d]
samplemean <- function(x,d){
  return(mean(x[d]))
}

b= boot(x,samplemean, R=1000)
# b$t is a matrix containing 1000 rows which holds all the results of estimation.
# The 1st column in it is the only thing being estimated by samplemedian(), which is the sample median.

plot(b)

# ESTIMATING ACCURACY OF LINEAR REGRESSION MODEL FROM BOOTSTRAP
# Lets compare variability of lin reg coeffs obtained from bootstrap to SEs from lin reg model itself

boot.fn = function(data, index)
  return(coef(lm(mpg~horsepower, data=Auto, subset=index)))


boot.fn(Auto, 1:392)

set.seed(1)
boot.fn(Auto, sample(392, 392, replace = T)) #Sampling with replacement 

boot(Auto, boot.fn, 1000) #Computing s.e.s of 1000 bootdtrap estimates for intercept and slope terms 
# Bootstrap Statistics :
#   original      bias    std. error
# t1* 39.9358610  0.02972191 0.860007896
# t2* -0.1578447 -0.00030823 0.007404467

#NOte: These differ from lin reg model s.e. estimates 
# No assumptions underlying bootstrap (unlike lin reg) 


# 6. Missing Value imputation ---------------------------------------------

data <- iris
summary(iris)
library(missForest)
library(mice)
library(VIM)

#Creating 10% missing values at random in the data
iris.mis <- prodNA(data, noNA=0.1)
summary(iris.mis)

#Remove categorical variables
iris.mis <- subset(iris.mis, select = -c(Species))

# 6.1 MICE Package --------------------------------------------------------
#Multivariate Imputation via Chained Equations 
# Assumes that data is missing at random (MAR),  which means that the probability that a value is missing depends only on the observed values and can be predicted using them
# Imputes data on a variable-by-variable basis by specifying an imputation model per variable
# e.g.: If X1, X2..Xk variables. If X1 has missing values, then it will be regressed on other variables X2 to Xk. The missing values in X1 will be then replaced by predictive values obtained. 
# Similarly, if X2 has missing values, then X1, X3 to Xk variables will be used in prediction model as independent variables. Later, missing values will be replaced with predicted values.
#Methods used:
#   1.PMM (Predictive Mean Modelling) - For numeric variables 
#   2.logreg (Logistic regression) - For factor (binary) variables 
#   3. polyreg (Bayesian polytomous regression) - For factor variables (>=2 levels)
#   4. Proportional odds model - Ordered (>=2 levels) 

#Generate tabular form of missing value patterns in each variable in a data set 
md.pattern(iris.mis)
#         Petal.Length Sepal.Length Sepal.Width Petal.Width   
# 96            1            1           1           1  0
# 9            1            0           1           1  1
# 14            1            1           0           1  1
# There are 96 obs with no missing values
# There are 9 obs with missing values in Sepal length


#Visually represent missing values
mice_plot <- aggr(iris.mis,col=c('blue','yellow'),numbers=TRUE,sortVars=TRUE,labels=names(iris.mis), cex.axis=0.7,gap=3, ylab=c("Missing data","Pattern"))

imputed_data <- mice(iris.mis, m=5, maxit=50, method = 'pmm', seed=500) #m: No. of imputed datasets 

summary(imputed_data)
#Check imputed values 
imputed_data$imp$Sepal.Width

#There are 5 imputed data sets so can select any using complete() function 
completed_data <- complete(imputed_data,2)

#Can also pool the results from all 5 datasets & obtain consolidated results 

fit <- with(data=iris.mis, exp=lm(Sepal.Width~Sepal.Length+Petal.Width))
fit
combined <- pool(fit)


# 6.2 Amelia Package ------------------------------------------------------

# Assumes:
#   1. All variables in data have multivariate normal distribution. Uses means & covs to summarize the data
#   2. Data is missing at random (MAR)

# Methodology
#   1. Takes m bootstrap samples to get m estimates of mean and variance 
#   2. Each set of estimates are used to impute each set of missing values 

# Shortcomings (vs MICE):
#   1. Joing modelling approach based on multivariate normal dist. Not a variable by variable basis
#   2. Variables in MVN need to be normally distributed or transformed to approximate normality
#   3. Cannot manage imputations based on a subset of the data, while MICE can


install.packages("Amelia")
library("Amelia")
data("iris")

iris.mis <- prodNA(iris, noNA=0.1)
summary(iris.mis)

# The only thing that you need to be careful about is classifying variables. It has 3 parameters:
# 1. idvars - keep all ID variables and other variables which you don't want to impute
# 2. noms - keep nominal variables here

amelia_fit <- amelia(iris.mis, m=5, parallel = "multicore", noms="Species")

#Access imputed outputs
amelia_fit$imputations[[1]]

#To check a particular column
amelia_fit$imputations[[5]]$Sepal.Length
# Export outputs to a csv file
write.amelia(amelia_fit, file.stem = "imputed_data_set")


# 6.3 Package Hmisc -------------------------------------------------------
# Multiprupose package
# 2 powerful functions for omputing missing values:
# 1. impute(): Imputes missing values using user defined stat methods (default is median)
# 2. aregimpute(): Imputes missing values using additive regression, bootstrapping and predictive mean matching 

#Assumptions:
#   1. Assumes linearity in variables being predicted
#   2. Fisher's optimum scoring method is used for predicting categorical variables 

install.packages("Hmisc")
library("Hmisc")
#impute with mean value
iris.mis$imputed_1 <- with(iris.mis, impute(Sepal.Length, mean))
#impute with random values 
iris.mis$imputed_2 <- with(iris.mis, impute(Sepal.Length, 'random'))
# Similarly can use min, max, median

impute_arg <- aregImpute(~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width+Species, data=iris.mis, n.impute = 5)

impute_arg

# The output shows R� values for predicted missing values. Higher the value, better are the values predicted. You can also check imputed values using the following command

#check imputed variable Sepal.Length
impute_arg$imputed$Sepal.Length

# 7. 1 Poly Reg & Step Fns ------------------------------------------------

fit <- lm(wage~poly(age,4), data=Wage) #Fits a linear model to predict wage using 4th degree polynomial in age
coef(summary(fit))
Estimate Std. Error    t value     Pr(>|t|)
# (Intercept)    111.70361  0.7287409 153.283015 0.000000e+00
# poly(age, 4)1  447.06785 39.9147851  11.200558 1.484604e-28
# poly(age, 4)2 -478.31581 39.9147851 -11.983424 2.355831e-32
# poly(age, 4)3  125.52169 39.9147851   3.144742 1.678622e-03
# poly(age, 4)4  -77.91118 39.9147851  -1.951938 5.103865e-02
# Columns of this matrix are a basis of orthogonal polynomials. i.e. each column is a linear combination of the variables age, age^2, age^3 and age^4 

# Create a grid of values of age for which we want predictions 
agelimits <- range(Wage$age)
age.grid <- seq(agelimits[1], agelimits[2])

preds <- predict(fit, newdata = list(age=age.grid), se=TRUE)
se.bands <- cbind(preds$fit+2*preds$se.fit, preds$fit-2*preds$se.fit)

par(mfrow=c(1,2), mar=c(4.5, 4.5, 1, 1), oma=c(0,0,4,0))
plot(Wage$age, Wage$wage, xlim=agelimits, cex=0.5, col="darkgrey")
title("Degree-4 polynomial", outer=T)
lines(age.grid, preds$fit, lwd=2, col="blue")
matlines(age.grid, se.bands, lwd=1, col="blue",lty=3)

fit.1= lm (wage~age , data=Wage)
fit.2= lm(wage~poly ( age ,2) , data = Wage)
fit.3= lm (wage~poly ( age ,3) , data = Wage )
fit.4= lm (wage~poly ( age ,4) , data = Wage )
fit.5= lm (wage~poly ( age ,5) , data = Wage)
anova(fit.1 , fit.2 , fit.3 , fit.4 , fit.5)

# Res.Df     RSS Df Sum of Sq        F    Pr(>F)    
# 1   2998 5022216                                    
# 2   2997 4793430  1    228786 143.5931 < 2.2e-16 ***
#   3   2996 4777674  1     15756   9.8888  0.001679 ** 
#   4   2995 4771604  1      6070   3.8098  0.051046 .  
# 5   2994 4770322  1      1283   0.8050  0.369682    
# ---
#   Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

# The p-value comparing the linear Model 1 to the quadratic Model 2 is essentially zero (<10???15 ), indicating that a linear fit is not sufficient. Similarly the p-value comparing the quadratic Model 2 to the cubic Model 3 is very low (0.0017), so the quadratic fit is also insufficient. The p-value comparing the cubic and degree-4 polynomials, Model 3 and Model 4, is approximately 5 % while the degree-5 polynomial Model 5 seems unnecessary because its p-value is 0.37. Hence, either a cubic or a quartic polynomial appear to provide a reasonable fit to the data, but lower- or higher-order models are not justified.


#Now how to decide on the degree of the polynomial to use in a polynomial regression?
# Can do hypothesis tests using anova() fn, which performs an analysis of variance using F test in order to test the null hypothesis of the M1 model's sufficiency to explain the data against alternate hypothesis that more complex model M2 is required. M1 and M2 must be nested models, i.e. predictors in M1 must be a subset of predictors in M2

# 8.1 Regression Trees --------------------------------------------------------
#The concept of entropy 
# Suppose partition of data has below proportion of 0's and 1's: 
#  60% 0's and 40% 1's
#Entropy:
- 0.4 * log2(0.4) - 0.6 * log2(0.6) # 0.97 High entropy, heteregenous group 
curve(-x*log2(x)-(1-x)*log2(1-x),
      col='red', xlab='x', ylab='Entropy', lwd=4) #Maximum entropy 0.5 is when both classes equal at 50% 



library(tree)

#Fitting a regression tree on the Boston dataset, where we try to predict median value of 
#homes based on predictors like crime, % in lower socioecon status, pupil teacher ratio etc

library(MASS)
set.seed(1)
#Total data size is 506 rows with 14 columns
#Training dataN
train = sample(1:nrow(Boston), nrow(Boston)/2) #253 training observations

#Build the tree on training data
# tree() 
tree.boston <- tree(Boston$medv~., data=Boston, subset=train)
# Regression tree:
#   tree(formula = Boston$medv ~ ., data = Boston, subset = train)
# Variables actually used in tree construction:
#   [1] "lstat"(% from lower socioecon status)  "rm"(avg no. of rooms per dwelling) 
# "dis"(weighted mean of distances from 5 employmt centers) "ptratio"(pupil teacher ratio)
# Number of terminal nodes:  8 
# Residual mean deviance:  12.65 = 3099 / 245 (Deviance divided by n-|To|, )
# Distribution of residuals:
#   Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
# -14.10000  -2.04200  -0.05357   0.00000   1.96000  12.60000 
summary(tree.boston)

#Plotting the tree
plot(tree.boston)
text(tree.boston, pretty=0, cex=0.75)
#Interpreting:
# When lstat is lower, i.e. lower ppl from low socioecon status, higher house values
# For suburbs where residents have high socioeco status (lstat<9.7)
# and where house are larger (rm>7.44), we have highest pred value, $ 46,400

cv.boston <- cv.tree(tree.boston) 
cv.boston
# $size
# [1] 8 7 6 5 4 3 2 1
# 
# $dev
# [1]  5226.322  5228.360  6462.626  6692.615  6397.438  7529.846 11958.691 21118.139
# 
# $k
# [1]      -Inf  255.6581  451.9272  768.5087  818.8885 1559.1264 4276.5803 9665.3582
# 
# $method
# [1] "deviance"
# 
# attr(,"class")
# [1] "prune"         "tree.sequence"

plot(cv.boston$size, cv.boston$dev, type = "b") #Type "p" is for pts, "l" for lines and "b" for both
# Clearly minizes at a tree of size 8
#Cross validation also selects the most complex tree, size=8

#Now lets predict on the test set based on our tree
yhat <- predict(tree.boston, newdata = Boston[-train,])
mean((yhat-Boston[-train,"medv"])^2) #MSE = 25.05
#So sqrt of MSE of 5.005
#So test predictions are within aroud $5,005 of true median home value for the suburb
plot(yhat, Boston[-train,"medv"])
abline(0,1)



#If we still want to prune the tree to say 5 terminal nodes
prune.boston = prune.tree(tree.boston,best = 5)
plot(prune.boston)
text(prune.boston, pretty=0)
summary(prune.boston) #Gives residual mean deviance of 18.45, which is higher than 12 obtained from the unpruned 8-node tree

#_____________________________
# ISLR APPLIED EXERCISES
#____________________________
# Q. 8. Will predict sales using regression trees. Carseats data
# (a) Split data into training and test set
set.seed(1)
train <- sample(1:nrow(Carseats), nrow(Carseats)/2) # 50-50 train test
Carseats.train <- Carseats[train,]
Carseats.test <- Carseats[-train,]

# (b)  Fit a regression tree to the training set. Plot the tree, and interpret the results. What test error rate do you obtain?
Carseats.tree <- tree(Sales~., data=Carseats.train)
Carseats.tree
plot(Carseats.tree)
text(Carseats.tree, pretty=0)


# Train error seems to minimize at a size of 2 leaves
yhat <- predict(Carseats.tree, newdata = Carseats.test)
mean((yhat-Carseats.test$Sales)^2) # 2.793 is test MSE 

# (c) Use cross-validation in order to determine the optimal level of tree complexity. Does pruning the tree improve the test error rate?
Carseats.cv.tree <- cv.tree(Carseats.tree)
plot(Carseats.cv.tree$size, Carseats.cv.tree$dev, type="b")
Carseats.cv.tree
tree.min <- which.min(min(Carseats.cv.tree$dev)) #1, i.e. 1st tree with 12 splits 
points(tree.min, Carseats.cv.tree$dev[tree.min],col="red", cex=2, pch=20)
Carseats.pruned <- prune.tree(Carseats.tree, best=3)
plot(Carseats.pruned)
text(Carseats.pruned, cex=0.75, pretty=0)
yhat <- predict(Carseats.pruned, newdata = Carseats.test)
mean((yhat-Carseats.test$Sales)^2) # 2.92

# (d) Use the bagging approach in order to analyze this data. What test error rate do you obtain? Use the importance() function to determine which variables are most important.

bag.carseats <- randomForest(Sales~., data=Carseats.train, mtry=10, ntree=500, importance=TRUE)

yhat.bag <- predict(bag.carseats, newdata = Carseats.test)
mean((yhat.bag-Carseats.test$Sales)^2) # Bagging reduces test MSE to 2.56 
importance(bag.carseats)
#Price and SelveLoc are the 2 most imp variables 

# (e) Use random forests to analyze this data. What test error rate do you obtain? Use the importance() function to determine which variables are most important. Describe the effect of the number of variables considered at each split, on the error rate obtained.
rf.carseats <- randomForest(Sales~., data=Carseats.train, mtry=3, ntree=500, importance=TRUE)
yhat.rf <- predict(rf.carseats, newdata = Carseats.test)
mean((yhat.rf-Carseats.test$Sales)^2) # 3.37 MSE with mtry=sqrt(10)=3)

# Q.9. 
#_______________________________
# Regression Tree from ADAfEPoV
#_______________________________
calif = read.table("http://www.stat.cmu.edu/~cshalizi/350/hw/06/cadata.dat",
                   header = TRUE)

treefit <- tree(log(MedianHouseValue)~Latitude+Longitude, data=calif)
summary(treefit2)
plot(treefit)
text(treefit, pretty=0, cex=0.75, digits=3)

price.deciles <- quantile(calif$MedianHouseValue, 1:10/10)
cut.prices <- cut(calif$MedianHouseValue,price.deciles, include.lowest = TRUE)
plot(calif$Longitude, calif$Latitude, col=grey(10:2/11)[cut.prices], pch=20, xlab = "Longitude", ylab = "Longitude")

partition.tree(treefit, ordvars = c("Longitude","Latitude"), add = TRUE)

# mindev (default=0.01) controls how much the error is reduced by adding a node.
treefit2 <- tree(log(MedianHouseValue)~Longitude+Latitude, data=calif, mindev=0.001)

#Trying all variables
train <- sample(nrow(calif),nrow(calif)/2)
calif.test <- calif[-train,]
treefit3 <- tree(log(MedianHouseValue)~., data=calif, subset=train)
plot(treefit3)
text(treefit3, cex=0.75, pretty=0)
summary(treefit3)
yhat <- predict(treefit3, newdata=calif.test)
mean((yhat-calif.test$MedianHouseValue)^2)
treefit3.cv <- cv.tree(treefit3)
plot(treefit3.cv$size, treefit3.cv$dev, type="b") #Min around 12 trees 
prune.tree(treefit3, best=12)
prune.tree(treefit3, best=12,newdata=calif.test)
mytreeseq <- prune.tree(treefit3)
plot(mytreeseq)
mytreeseq$dev
opt.trees <- which(mytreeseq$dev==min(mytreeseq$dev))
opt.trees
best.leaves <- min(treefit3.cv$size[opt.trees])
best.leaves #12
treefit3.pruned <- prune.tree(treefit3, best = best.leaves)
plot(treefit3.pruned)
text(treefit3.pruned, cex=0.75)

plot(calif) 

# The function prune.tree takes a tree you fit by tree , and evaluates error of the tree and various prunings of the tree, all the way down to the stump. The # evaluation can be done either on new data, if supplied, or on the training data (the
#default). If you ask it for a particular size of tree, it gives you the best pruning of that size 3 . If you don't ask it for the best tree, it gives an object which shows the number of leaves in the pruned trees, and the error of each one. This object can be plotted.

# my.tree = tree(y ~ x1 + x2, data = my.data)
# prune.tree(my.tree, best = 5)
# prune.tree(my.tree, best = 5, newdata = test.set)
# my.tree.seq = prune.tree(my.tree)
# plot(my.tree.seq)
# my.tree.seq$dev
# opt.trees = which(my.tree.seq$dev == min(my.tree.seq$dev))
# min(my.tree.seq$size[opt.trees])


# 8.2 Classification Trees -----------------------------------------------------
#Missing values?
#Do we need to transform any of the variables?

library(ISLR)
library(MASS)
library(tree)


#Reassign sales as a categorical variable "High"
High <- ifelse(Carseats$Sales<=8, "No", "Yes")
Carseats <- data.frame(Carseats[,-c(1)], High)
tree.Carseats <- tree(Carseats$High~., data=Carseats) #Run tree on all cols except sales 
summary(tree.Carseats)
plot(tree.Carseats)
text(tree.Carseats, pretty=0)
tree.Carseats

#With train and test 
set.seed(2)
train <- sample(1:nrow(Carseats),200) #Training sample of 200 obs
Carseats.test <- Carseats[-train,] #Test group
High.test <- High[-train] #Response for test group

tree.Carseats <- tree(High~., data = Carseats, subset = train) #Tree on training data

tree.pred <- predict(tree.Carseats, newdata = Carseats.test, type="class")
table(tree.pred, High.test)
# High.test
# tree.pred No Yes
# No  86  27
# Yes 30  57

#Accuracy = (86+57)/200 = 0.715

#______________________
# ISLR APPLIED EXERCISES
#_______________________

# 3. Consider the Gini index, classification error, and cross-entropy in a simple classificatIon setting with two classes. Create a single plot # that displays each of these quantities as a function of p ^ m1. The x- axis should display p ^ m1 , ranging from 0 to 1, and the y-axis should display the value of the Gini index, classification error, and entropy. Hint: In a setting with two classes, p ^ m1 = 1 ??? p ^ m2 . You could make this plot by hand, but it will be much easier to make in R.
p = seq(from=0, to=1, by=0.01)
giniindex = 2*p*(1-p)
crossentropy = -(p*log(p)+(1-p)*log(1-p))
classificationerror = 1-pmax(p, 1-p)
matplot(p, cbind(giniindex, crossentropy, classificationerror), col=c("red","blue","green"))

# Q.9 9. This problem involves the OJ data set which is part of the ISLR package.
# (a) Create a training set containing a random sample of 800 observations, and a test set containing the remaining observations.
str(OJ)
train <- sample(nrow(OJ),800)
OJ.train <- OJ[train,]
OJ.test <- OJ[-train,]

# (b) Fit a tree to the training data, with Purchase as the response and the other variables except for Buy as predictors. Use the summary() function to prouce summary statistics about the tree, and describe the results obtained. What is the training error rate? How many terminal nodes does the tree have?
tree.oj <- tree(Purchase~., data=OJ.train)
summary(tree.oj) #Tree has 8 terminal nodes 
#Training error rate is 
130/800 #16.25% 

# (c) Type in the name of the tree object in order to get a detailed text output. Pick one of the terminal nodes, and interpret the information displayed.
tree.oj
# 7) LoyalCH > 0.764572 257   71.26 CH ( 0.96887 0.03113 ) *
#Picked node 7 which is terminal leaf (has asterisk) 
# Split criterion is LoyalCH>0.764, there are 257 obs in that leaf, the deviance is 10.07 and overall prediction for that branch is CH. Less than 3% of obs in that leaf have value MM, rest have CH


# (d) Create a plot of the tree, and interpret the results.
plot(tree.oj)
text(tree.oj, cex=0.75, pretty=0)
#Most imp predictor of purchase appears to be LoyalCH. In fact top 3 nodes contain LoyalCH


# (e) Predict the response on the test data, and produce a confusion matrix comparing the test labels to the predicted test labels. What is the test error rate?
yhat <- predict(tree.oj, newdata=OJ.test, type = "class")
table(yhat, OJ.test$Purchase)
# yhat  CH  MM
# CH 147  27
# MM  19  77
(27+19)/270 # Test error rate is 17.04% 

# (f) Apply the cv.tree() function to the training set in order to determine the optimal tree size.

oj.cv <- cv.tree(tree.oj, FUN = prune.misclass)
oj.cv

# (g) Produce a plot with tree size on the x-axis and cross-validated classification error rate on the y-axis.
plot(oj.cv$size, oj.cv$dev, xlab="Tree size", ylab="Deviance", type="b")

# (h) Which tree size corresponds to the lowest cross-validated classification error rate?
The 2-node tree seems to be the smallest tree with lowest classification error rate 

# (i) Produce a pruned tree corresponding to the optimal tree size obtained using cross-validation. If cross-validation does not lead to selection of a pruned tree, then create a pruned tree with five terminal nodes.
oj.prune <- prune.tree(tree.oj, best=2)
plot(oj.prune)
text(oj.prune, pretty=0, cex=0.75)

# (j) Compare the training error rates between the pruned and unpruned trees. Which is higher?
summary(tree.oj) # training err rate is 130/800 = 16.25%
summary(oj.prune) # training err rate is 130/800 = 18.62%
# Misclass error slightly higher for pruned tree

# (k) Compare the test error rates between the pruned and unpruned trees. Which is higher?
prune.yhat <- predict(oj.prune, newdata = OJ.test, type = "class")
table(yhat, OJ.test$Purchase) # 17.04%
table(prune.yhat, OJ.test$Purchase) #24.8% 
# In this case, the pruning process increased the test error rate to about 25%, but it produced a way more interpretable tree.


# 8.3 Bagging -------------------------------------------------------------

library(randomForest)
library(hmeasure)
library(StatMeasures)
set.seed(1)

#Same commane for randomForest & Bagging. But bagging is mtry=all variables
bag.Boston <- randomForest(medv~., data=Boston, subset=train, mtry=13, importance=TRUE) #Setting mtry=13 to include all predictors in making the split. Default number of trees is already 500.
bag.Boston

yhat.bag.Boston <- predict(bag.Boston, newdata = Boston[-train,])
mean((yhat.bag.Boston-Boston[-train,"medv"])^2)
importance(bag.Boston)
# %IncMSE IncNodePurity    
# crim    12.536631     664.55142
# zn       2.145881      24.02478
# indus    7.037060      90.65980
# chas    -1.741527      38.69733
# nox      5.527521     129.88161
# rm      35.994059    6047.15113
# age      8.728854     346.57692
# dis     18.360245    1517.04400
# rad      3.917899      94.46401
# tax      9.118393     215.52131
# ptratio  9.547187     289.53441
# black    3.166552     236.05967
# lstat   40.719293    7692.90761
# %IncMSE explains how much MSE increases (Acc decreases) wn tht variable excluded fm the model)
# IncNodePurity explains how much the node impurity decreases with a split on tht variable, avgd over all trees

varImpPlot(bag.Boston)


# 8.4 Random Forest -------------------------------------------------------
#Default mtry is sqrt(p) for r.f. of classification trees and p/3 for r.f.  of regression trees
rf.Boston <- randomForest(medv~., data=Boston, subset=train, mtry=6, importance=TRUE)

rf.Boston
yhat.rf.Boston <- predict(rf.Boston, newdata = Boston[-train,])
mean((yhat.rf.Boston-Boston[-train,"medv"])^2)
varImpPlot(rf.Boston)

#Carseats Data
Carseats$High <- ifelse(Carseats$Sales>=8,"Yes","No")
Carseats$High <- as.factor(Carseats$High)
train <- sample(nrow(Carseats),nrow(Carseats)/2)
Carseats.train <- Carseats[train,] 
Carseats.test <- Carseats[-train,]
rf.Carseats <- randomForest(High~.-Sales, data=Carseats.train, mtry=3, importance=TRUE)
rf.Carseats
yhat.rf.Carseats <- predict(rf.Carseats, newdata=Carseats.test)
yhatprobs.rf.Carseats <- predict(rf.Carseats, newdata=Carseats.test, type = "prob")

# KS stat
actvspred(as.numeric(Carseats.test$High), yhatprobs.rf.Carseats[,2], 10) #Takes in actual, predicted linear response and quantile value, and returns average actual and predicted response in each quantile
ks(as.numeric(Carseats.test$High), yhatprobs.rf.Carseats[,2])

# LIFT, chart also
# Classification performace
accuracy(Carseats.test$High, yhatprobs.rf.Carseats[,2],cutoff=0.5)

# VIFs

# 8.5 Boosting ------------------------------------------------------------

#Function gbm() with distribution="gaussian"for reg problm and "bernoulli" for classfn problm
# n.trees indicates how many trees we want
# interaction.depth limits depth of each tree
# shrinkage specifies the shrinkage parameter, default is 0.001

library(gbm)
set.seed(1)
boost.Boston <- gbm(medv~., data=Boston[train,], n.trees=5000, interaction.depth = 4, distribution = "gaussian", verbose=T) #Default shrinkage=0.001
boost.Boston
summary(boost.Boston) #produces relative influence plot and outputs rel infl statistics

#Partial dependence plots
#Illustrate marginal effect of selected variables on reponse aftr integrating out the other variables 
par(mfrow=c(1,2))
plot(boost.Boston,i="lstat")
plot(boost.Boston,i="rm")
yhat.boost.Boston <- predict(boost.Boston, newdata = Boston[-train,], n.trees = 5000)
mean((yhat.boost.Boston-Boston[-train,"medv"])^2) #15.33

#With shrinkage parameter also specified
boost.Boston2 <- gbm(medv~., data=Boston[train,], distribution="gaussian", n.trees=5000, interaction.depth = 4, shrinkage = 0.2, verbose=T)
yhat.boost.Boston2 <- predict(boost.Boston2, newdata = Boston[-train,], n.trees = 5000)
mean((yhat.boost.Boston2-Boston[-train,"medv"])^2) #14.47 

#____________________________________________
# ISLR APplied Exercises 
#___________________________________________
#Q  10. We now use boosting to predict Salary in the Hitters data set.
# (a) Remove the observations for whom the salary information is unknown, and then log-transform the salaries.
hitters <- na.omit(Hitters) #59 obs removed 
hitters$Salary <- log(hitters$Salary)

# (b) Create a training set consisting of the first 200 observations, and a test set consisting of the remaining observations.
train <- 1:200
hitters.train <- hitters[train,]
hitters.test <- hitters[-train,]

# (c) Perform boosting on the training set with 1,000 trees for a range of values of the shrinkage parameter ??. Produce a plot with different shrinkage values on the x-axis and the corresponding training set MSE on the y-axis.
library(gbm)
set.seed(1)
powers <- seq(-10,-0.2,by=0.1)
lambdas <- 10^powers
train.err <- rep(NA, length(lambdas))
for(i in 1:length(lambdas)){
  hitters.boost <- gbm(Salary~., data = hitters.train, distribution="gaussian", n.trees = 1000, shrinkage = lambdas[i])
  pred.train <- predict(hitters.boost, hitters.train, n.trees=1000)
  train.err[i] <- mean((pred.train-hitters.train$Salary)^2)
}

plot(lambdas, train.err, type="b", xlab="Shrinkage parameter", ylab="Train MSE")

# (d) Produce a plot with different shrinkage values on the x-axis and the corresponding test set MSE on the y-axis.
test.err <- rep(NA, length(lambdas))
for(i in 1:length(lambdas)){
  hitters.boost <- gbm(Salary~., data = hitters.test, distribution="gaussian", n.trees = 1000, shrinkage = lambdas[i])
  pred.test <- predict(hitters.boost, hitters.test, n.trees=1000)
  test.err[i] <- mean((pred.test-hitters.test$Salary)^2)
}

plot(lambdas, test.err, type="b", xlab="Shrinkage parameter", ylab="test MSE")
min(test.err)
lambdas[which.min(test.err)] # The minimum test MSE is 0.25, and is obtained for ??=0.079??=0.079.

# (e) Compare the test MSE of boosting to the test MSE that results from applying two of the regression approaches seen in Chapters 3 and 6.
library(glmnet)
fit1 <- lm(Salary ~ ., data = hitters.train)
pred1 <- predict(fit1, hitters.test)
mean((pred1 - hitters.test$Salary)^2) ## [1] 0.4917959

x <- model.matrix(Salary ~ ., data = Hitters.train)
x.test <- model.matrix(Salary ~ ., data = Hitters.test)
y <- Hitters.train$Salary
fit2 <- glmnet(x, y, alpha = 0)
pred2 <- predict(fit2, s = 0.01, newx = x.test)
mean((pred2 - Hitters.test$Salary)^2) # [1] 0.4570283
# The test MSE for boosting is lower than for linear regression and ridge regression.

# (f) Which variables appear to be the most important predictors in the boosted model?
boost.hitters <- gbm(Salary~., data=hitters.train, distribution = "gaussian", n.trees = 1000, shrinkage = lambdas[which.min(test.err)])
summary(boost.hitters) #We may see that "CAtBat" is by far the most important variable.

# (g) Now apply bagging to the training set. What is the test set MSE for this approach?
bag.hitters <- randomForest(Salary~., data=hitters.train, mtry=19, ntree=500)
yhat.bag <- predict(bag.hitters,newdata = hitters.test)
mean((yhat.bag-hitters.test$Salary)^2) #The test MSE for bagging is 0.23, which is slightly lower than the test MSE for boosting.


# Q 11. This question uses the Caravan data set.
# (a) Create a training set consisting of the first 1,000 observations, and a test set consisting of the remaining observations.
train <- 1:1000
Caravan$Purchase <- ifelse(Caravan$Purchase=="Yes",1,0)
caravan.train <- Caravan[train,] 
caravan.test <- Caravan[-train,]

# (b) Fit a boosting model to the training set with Purchase as the response and the other variables as predictors. Use 1,000 trees, and a shrinkage value of 0.01. Which predictors appear to be the most important?
caravan.boost <- gbm(Purchase~., data=caravan.train, n.trees = 1000, shrinkage = 0.01,distribution="bernoulli")
summary(caravan.boost)
# The variables "PPERSAUT" and "MKOOPKLA" are the two most important variables.

# (c) Use the boosting model to predict the response on the test data. Predict that a person will make a purchase if the estimated probability of purchase is greater than 20 %. Form a confusion matrix. What fraction of the people predicted to make a purchase do in fact make on ? How does this compare with the results obtained from applying KNN or logistic regression to this data set?
probs.test <- predict(caravan.boost, newdata = caravan.test, n.trees = 1000, type="response")
preds.test <- ifelse(probs.test>0.2,1,0)
table(caravan.test$Purchase, preds.test)
# preds.test
#     0    1
# 0 4405  128
# 1  256   33

33/(33+128)# For boosting, the fraction of people predicted to make a purchase that in fact make one is 0.2049689


#Applying logistic regression
logit.caravan <- glm(Purchase~., data=caravan.train, family="binomial")
probs.test2 <- predict(logit.caravan, newdata = caravan.test, type="response")
pred.test2 <- ifelse(probs.test2 > 0.2, 1, 0)
table(caravan.test$Purchase, pred.test2)
# pred.test2
#     0    1
# 0 4183  350
# 1  231   58
58/(58+350) #For logistic regn, fraction of people predicted to make a purchase that in fact make one if 14.2% 

# GBM from "A working guide to Boosted Trees" (Elith, Leathwick & Hastie)
# Load custom commands from the BRT paper code provided:
source('~/Documents/WorkingGuidetoBoostedTrees/brt.functions.R', encoding = 'UTF-8')

library(gbm)
model.data <- read.csv("/home/fractaluser/Documents/WorkingGuidetoBoostedTrees/data/model.data.csv", as.is=TRUE)
View(model.data) #1000 rows of 14 variables (1000 sites with presence absence)
#column Angaus specifies presence/absence of Anguilla Australis
str(model.data)



# 9 Ensembling ------------------------------------------------------------


# 9.1 Ensembles -----------------------------------------------------------


library(caret)
set.seed(1)
data <- read.csv(url('https://datahack-prod.s3.ap-south-1.amazonaws.com/train_file/train_u6lujuX_CVtuZ9i.csv'))
str(data)
sum(is.na(data)) # 86 

#Impute missing values using median
preProcValues <- preProcess(data, method=c("medianImpute","center","scale"))
library(RANN)
data_processed <- predict(preProcValues, data)
sum(is.na(data_processed)) #0, so now no NAs 

# Split dataset into 2 parts based on outcome: 75% and 25% 
index <- createDataPartition(data_processed$Loan_Status, p=0.75, list=FALSE)
trainSet <- data_processed[index,]
testSet <- data_processed[-index,]

fitControl <- trainControl(method = "cv",number = 5, savePredictions = "final", classProbs = T)

predictors <- c('ApplicantIncome','CoapplicantIncome','LoanAmount','Loan_Amount_Term','Credit_History')
outcomeName <- 'Loan_Status'

#Random forest model
model_rf <- train(trainSet[,predictors], trainSet[,outcomeName], method='rf',trControl=fitControl, tuneLength=3)

testSet$pred_rf <- predict(object = model_rf, testSet[,predictors])

#Checking accuracy
confusionMatrix(testSet$Loan_Status, testSet$pred_rf)

# KNN Model
model_knn <- train(trainSet[,predictors], trainSet[,outcomeName], method='knn', trControl=fitControl, tuneLength=3)

testSet$pred_knn <- predict(object=model_knn, testSet[,predictors])

#Checking accuracy
confusionMatrix(testSet$Loan_Status, testSet$pred_knn)

#Logistic Regression Model
model_lr <- train(trainSet[,predictors], trainSet[,outcomeName], method='glm',trControl=fitControl, tuneLength=3)

testSet$pred_lr <- predict(object = model_lr, testSet[,predictors])

confusionMatrix(testSet$Loan_Status, testSet$pred_lr)

# Ensembling by Averaging predictions 
testSet$pred_rf_prob <- predict(object = model_rf, testSet[,predictors], type='prob')[,2]
testSet$pred_knn_prob <- predict(object = model_knn, testSet[,predictors], type='prob')[,2]
testSet$pred_lr_prob <- predict(object=model_lr, testSet[,predictors], type='prob')[,2]

testSet$pred_avg <- (testSet$pred_rf_prob+testSet$pred_knn_prob+testSet$pred_lr_prob)/3
testSet$pred_avg_YN <- ifelse(testSet$pred_avg>0.5,"Y","N")
testSet$pred_avg_YN <- as.factor(testSet$pred_avg_YN)

# Ensembling by Majority Voting 

testSet$pred_majority <- as.factor(
  ifelse(testSet$pred_rf=="Y" & testSet$pred_knn=="Y","Y",
         ifelse(testSet$pred_rf=="Y" & testSet$pred_lr=="Y","Y",
                ifelse(testSet$pred_knn=="Y" & testSet$pred_lr=="Y","Y","N"))))

# Weighted average
# Assign weight of 0.5 to LR predictions and 0.25 to RF and KNN

testSet$pred_weighted_avg <- (testSet$pred_rf_prob*0.25)+(testSet$pred_lr_prob*0.5)+(testSet$pred_knn_prob*0.25)

testSet$pred_weighted_avg <- as.factor(ifelse(testSet$pred_weighted_avg>0.5,'Y','N'))


# 9.2 Stacking ------------------------------------------------------------

# Using a ML model for training the preds of the bottom layer predictions 

# 1. Train indvl base layer models on training data 
fitControl <- trainControl(
  method='cv',
  number=10,
  savePredictions = 'final', #To save out of fold predictions for the best parm combos
  classProbs = T #To save class probabilities of the Out of Fold predictions 
)

predictors <- c("ApplicantIncome","CoapplicantIncome","LoanAmount","Loan_Amount_Term","Credit_History")

outcomeName <- 'Loan_Status'

model_rf <- train(trainSet[,predictors], trainSet[,outcomeName], method='rf', trControl=fitControl, tuneLength=3)

model_knn <- train(trainSet[,predictors], trainSet[,outcomeName], method='knn',trControl=fitControl, tuneLength=3)

model_lr <- train(trainSet[,predictors], trainSet[,outcomeName], method='glm', trControl=fitControl, tuneLength=3)

# Predicting out of fold pred probs for training data
trainSet$OOF_pred_rf <- model_rf$pred$Y[order(model_rf$pred$rowIndex)]
trainSet$OOF_pred_knn <- model_knn$pred$Y[order(model_knn$pred$rowIndex)]
trainSet$OOF_pred_lr <- model_lr$pred$Y[order(model_lr$pred$rowIndex)]

# Prediciting probs for test data
testSet$OOF_pred_rf <- predict(object = model_rf, testSet[,predictors], type='prob')

# 10 SVM ------------------------------------------------------------------

# SVR ---------------------------------------------------------------------

data <- read.csv("/home/fractaluser/Documents/svm.csv", header = TRUE)
head(data)
plot(data, main="Scatter Plot")
model <- lm(Y~X, data) #Fit model using OLS
abline(model)

predY <- predict(model, data)
plot(data, pch=16)
points(data$X, predY, col="blue", pch=16)

RMSE <- sqrt(mean((data$Y - predY)^2)) #0.9410077 
#Fit SVR model and visualize using scatter plot 
library(e1071)
modelsvm <- svm(Y~X, data)
predYsvm <- predict(modelsvm, data)
plot(data)
points(data$X, predYsvm, col="red", pch=16)
RMSEsvm <- sqrt(mean(((data$Y-predYsvm)^2))) # 0.4339366

### Tuning SVR model by varying values of maximum allowable error and cost parameter
OptModelsvm <- tune(svm, Y~X, data=data, ranges = list(elsilon=seq(0,1,0.1), cost=1:100))
print(OptModelsvm)
plot(OptModelsvm)

#Find the best model
BestModel <- OptModelsvm$best.model
BestModel
predYBest <- predict(BestModel, data)
RMSEBestModel <- sqrt(mean((data$Y - predYBest)^2))
RMSEBestModel # 0.2708242


# Time Series -------------------------------------------------------------

kings <- scan("https://robjhyndman.com/tsdldata/misc/kings.dat",skip=3)
kings
kingstimeseries <- ts(kings)
kingstimeseries

births <- scan("https://robjhyndman.com/tsdldata/data/nybirths.dat") #Births per month in NY fm Jan 1946 to Dec 1959
births
birthstimeseries <- ts(births, frequency = 12, start = c(1946,1))
birthstimeseries

souvenir <- scan("https://robjhyndman.com/tsdldata/data/fancy.dat") #monthly sales for a souvenir shop at a beach resort town in Queensland, Australia, for January 1987-December 1993

souvenirtimeseries <- ts(souvenir, frequency = 12, start=c(1987, 1))
souvenirtimeseries

# PLOTTING TIME SERIES 
plot.ts(kingstimeseries)
plot.ts(birthstimeseries)
plot.ts(souvenirtimeseries) #Size of seasonal fluctuations and random fluctuations seem to increase with the level of the time series. May need to transform the ts

logsouvenirtimeseries <- log(souvenirtimeseries)
plot.ts(logsouvenirtimeseries) #Now the size of seasonal fluctuations and random fluctuations in the log-transformed series seem roughly constant over time and don't depend on the level of the ts 

# DECOMPOSING A TIME SERIES 
# Into trend, seasonal, irregular components
# SMA() function in TTR package can be used to smooth ts using simple moving average 
library(TTR)
kingstimeseriesSMA3 <- SMA(kingstimeseries, n=3) #SMA of order 3
plot.ts(kingstimeseriesSMA3) # Still a lot of random fluctuations. Try higher order
kingstimeseriesSMA8 <- SMA(kingstimeseries, n=8)
plot.ts(kingstimeseriesSMA8) # Gives a clearer picture of the trend component. Age of death of the English kings seems to have decreased from about 55 years old to about 38 years old during the reign of the first 20 kings, and then increased after that to about 73 years old by the end of the reign of the 40th king in the time series


birthstimeseriescomponents <- decompose(birthstimeseries)
plot(birthstimeseriescomponents)

# To seasonally adjust the time series
birthstimeseriesseasonallyadjusted <- birthstimeseries - birthstimeseriescomponents$seasonal

plot(birthstimeseriesseasonallyadjusted)

# Forecasts using exponential smoothing 
# If a ts can be described using additive model wt constant level & no seasonality, can use simple exponential smoothing to make short-term f.c.s
# parameter alpha: if close to 0 then little weight on latest obs while making fc of future obs 

rain <- scan("https://robjhyndman.com/tsdldata/hurst/precip1.dat",skip=1) #total annual rainfall in inches London, from 1813-1912
raints <- ts(rain, start=c(1823))
plot.ts(raints) # Roughly constant level. Random also are roughly similar over time

# HOLT WINTERS
# Makes f.c.s using simple exponential smoothing 
raintsforecasts <- HoltWinters(raints, beta = FALSE, gamma = FALSE) # beta=1 for exponential smoothing. gamme=1 for fitting seasonal model
raintsforecasts
# Smoothing parameters:
#   alpha: 0.02412151   This is close to 0. F.c.s are based on both recent & less recent obs
# beta : FALSE
# gamma: FALSE
# 
# Coefficients:
#   [,1]
# a 24.67819

raintsforecasts$fitted
plot(raintsforecasts) # Fc is in red line 
raintsforecasts$SSE #[1] 1828.855

# First value in the ts is by default as initial value for level. Can separately specify diff value for initial level as below:
raintsforecasts2 <- HoltWinters(raints, beta = FALSE, gamma=FALSE, l.start = 23)

# To f.c. Holt Winter model preds, need forecast() fn fm library forecast
library(forecast)
raintsforecasts3 <- forecast(raintsforecasts, h=20) # h=How many further time pts you want to mk prediction fr
plot(raintsforecasts3) #Here the forecasts for 1913-1920 are plotted as a blue line, the 80% prediction interval as an dark gray shaded area,and the 95% prediction interval as a gray shaded area

#If the predictive model cannot be improved upon, there should be no correlations between forecast errors for successive predictions. Correlogram of the forecast errors using the "acf()" function in R.

acf(raintsforecasts3$residuals, na.action = na.pass, lag.max = 10) # Autocorrelation at lag 3 is just touching the significance bounds.

# LJUNG BOX TEST using Box.test()
# Test for significance of autocorrelations at lags 1-20 
Box.test(raintsforecasts3$residuals, lag=20, type = "Ljung-Box")
# data:  raintsforecasts3$residuals
# X-squared = 17.401, df = 20, p-value = 0.6268
# Null hyp: No autocorrel. Obs are independent 
# LB test stat is 17.401 and p-value is large at 0.63 so can't reject null of zero autocorrelations. There is no dependence between in-sampel residuals at lags 1-20 
#The Simple Exponential Smoothing method thus provides an adequate predictive model for London rainfall

plot.ts(raintsforecasts3$residuals)

# TO check whether f.c. errors normally distributed with mean zero, can plot hist of f.c. errors with overlaid normal curve 

plotForecastErrors <- function(forecasterrors){
  thebinsize <- IQR(forecasterrors, na.rm = TRUE)/4
  thesd <- sd(forecasterrors, na.rm = TRUE)
  themin <- min(forecasterrors, na.rm = TRUE)-thesd*5
  themax <- max(forecasterrors, na.rm = TRUE)+thesd*3
  #Generate normally distributed data with mean 0 and sd=thesd
  thenorm <- rnorm(10000, mean=0, sd=thesd)
  themin2 <- min(thenorm)
  themax2 <- max(thenorm)
  if (themin2 < themin) {themin <- themin2}
  if (themax2 > themax) {themax <- themax2}
  #Make a red hist of fc errors with norm dist overlaid
  thebins <- seq(themin, themax, thebinsize)
  hist(forecasterrors, col="red", freq=FALSE, breaks=thebins)
  #freq=FALSE ensures area under curve is 1 
  thehist <- hist(thenorm, plot=FALSE, breaks=thebins)
  points(thehist$mids, thehist$density, type="l", col="blue", lwd=2)
}

plotForecastErrors(raintsforecasts3$residuals) #Dist of fc errors roughly centred on 0, mostly normally distributed 

# ARIMA MODELS 
# Exponential smoothing methods make no assumptions about correlations between successive values of fc errors. But prediction intervals require the fc errors to be uncorrelated and normally dist with mean 0 and constant variance
# ARIMA models icnlude explicit statistical model for irregular component of ts tht allows for non-0 autocors
# diff() fn can be used to difference a ts 
skirts <- scan("https://robjhyndman.com/tsdldata/roberts/skirts.dat",skip=5) #TS with trend and no seasonality is the time series of the annual diameter of women's skirts at the hem, from 1866 to 1911. T
skirtsts <- ts(skirts, start=c(1866))
plot.ts(skirtsts)
skirtstsdiff1 <- diff(skirtsts, differences = 1)
plot.ts(skirtstsdiff1) #Still doesn't appear stationary in mean
skirtstsdiff2 <- diff(skirtsts, differences = 2)
plot.ts(skirtstsdiff2) #This appears mean as well as variance stationary 


#Similarly, king's deaths ts are not appearing mean stationary
kingstimeseriesdiff1 <- diff(kingstimeseries, differences = 1)
plot.ts(kingstimeseriesdiff1) #Appears mean and variance stationary

# Selecting a candidate ARIMA Model through ACF & PACF 
# Use "acf()" and "pacf()" functions in R
#To get actual values of the acf and pacfs, we set "plot=FALSE" in the "acf()" and "pacf()" functions.

acf(kingstimeseriesdiff1, lag.max = 20)
acf(kingstimeseriesdiff1, lag.max = 20, plot = FALSE)
# Autocorrelations of series 'kingstimeseriesdiff1', by lag
# 
# 0      1      2      3      4      5      6      7      8 
# 1.000 -0.360 -0.162 -0.050  0.227 -0.042 -0.181  0.095  0.064 
# 9     10     11     12     13     14     15     16     17 
# -0.116 -0.071  0.206 -0.017 -0.212  0.130  0.114 -0.009 -0.192 
# 18     19     20 
# 0.072  0.113 -0.093 
# aCF AT LAG 1 EXCEEEds the bounds of significance

########## CROSS VALIDATION
library(fpp)
str(a10)
plot(a10, ylab="$ milion", xlab="Year", main="Antidiabetic drug sales")
plot(log(a10), ylab="", xlab="Year", main="Log antidiabetic drug sales")
k <- 60 #Min data length for fitting model
n <- length(a10)
mae1 <- mae2 <- mae3 <- matrix(NA, n-k, 12)
st <- tsp(a10)[1] + (k-2)/12

for (i in 1:(n-k)){
  xshort <- window(a10, end=st+ i/12)
  xnext <- window(a10, start=st+(i+1)/12, end=st+(i+12)/12)
  fit1 <- tslm(xshort~trend+season, lambda=0)
  fcast1 <- forecast(fit1,h=12)
  fit2 <- Arima(xshort, order=c(3,0,1), seasonal=list(order=c(0,1,1), period=12), include.drift=TRUE, lambda=0, method="ML")
  fcast2 <- forecast(fit2, h=12)
  fit3 <- ets(xshort,model="MMM",damped=TRUE)
  fcast3 <- forecast(fit3, h=12)
  mae1[i,1:length(xnext)] <- abs(fcast1[['mean']]-xnext)
  mae2[i,1:length(xnext)] <- abs(fcast2[['mean']]-xnext)
  mae3[i,1:length(xnext)] <- abs(fcast3[['mean']]-xnext)
}

plot(1:12, colMeans(mae1, na.rm=TRUE), type="l", col=2, xlab="horizon", ylab="MAE", ylim=c(0.65, 1.05))
lines(1:12, colMeans(mae2, na.rm=TRUE), type="l", col=3)
lines(1:12, colMeans(mae3, na.rm=TRUE), type="l", col=4)
legend("topleft", legend=c("LM", "ARIMA","ETS"), col=2:4, lty=1)

# EXERCISES
sales <- scan("https://www.r-exercises.com/wp-content/uploads/2017/04/sales.csv",skip=1)

sales_ts <- ts(sales, frequency = 12, start=c(1992,1))
print(sales_ts)
plot.ts(sales_ts, ylim=c(0,40000))
gghistogram(sales_ts, add.normal = TRUE, add.kde = TRUE)


## ICE CREAM
icecream <- read.csv("Icecream.csv")
fit <- auto.arima(icecream$cons)
fcast <- forecast(fit, h=8)
autoplot(fcast) + theme_classic()
=======
download.file("https://github.com/s-totally/R-Codes-Repository/blob/master/Sri_Tolety.R",
              destfile = "C:/users/sridevi.tolety/Documents/Sri_Tolety.R")

# Basics ------------------------------------------------------------------


# # 5 basic classes of objects in R:
#   1. Character
#   2. Numeric
#   3. Integer
#   4. Complex 
#   5. Logical (T/F)

# An object can have the following attributes:
#   1. Name, dimension names
#   2. Dimensions
#   3. Length
#   4. Class

# Data types in R
# 1. Vector -> Objects of the same class
# 2. List -> Elements of diff data types
# 3. Matrix -> Row & col dimension. All elems same class
# 4. Data frame -> Elems of diff classes 

# Class vs Mode
# For a simple vector, class and mode are the same thing: the data type of the values inside the vector 
# But for matrix, array, dataframe, class and mode differ
# Class of a matrix is matrix whereas mode is the type of data within the matrix (char, nu, logical etc )

# To assign:
a <- 3
'<-'(a,3)
# To print a after assigning, enclose the entire statement within ()
(a <- 3)

x <- 2
if (x > 1) "orange" else "apple"
#typeof() determines the type or storage mode of any object
#quote() is a special function that doesn't evaluate its argument 
typeof(quote(if (x>1) "orange" else "apple")) #language
typeof(x) #double
typeof("A") #character
typeof(2) #double
mode(2) # numeric
lapply(as.list(quote(if (x>1) "orange" else "apple")), typeof) #symbol, language, character, character


# Dealing with duplicate values 
x <- c(9:20, 1:5, 3:7, 0:8)
x <- x[!duplicated(x)]
data("airquality")
dupair1 <- airquality[!duplicated(airquality[,c(2)]),]

#Creating subsets of data 
newdata <- subset(airquality, Temp>80, select = c(Ozone, Temp))
newdata2 <- subset(airquality, Day==1, select = Ozone:Wind)
subset_1 <- airquality[airquality$Temp==80,]
subset_2 <- airquality[airquality$Temp %in% c(70,80), ]

# Accessing built in datasets
data()
help(women) #brings up documentation for women dataset 

library("gtools") #Various functions to assist in R programming
smartbind() #library(gtools)
myvec <- c(1,2,5,3,4)
length(myvec) #Length 
myvec[1]
sort(myvec) #[1] 1 2 3 4 6
sort(myvec,decreasing = TRUE)

a <- c(4.1, 2.2, 6.1, 3.1)
a
order(a) # Returns rank of each element if it were sorted 

sort_Temp <- airquality[order(airquality$Temp),]
head(airquality)
head(sort_Temp)

sort_2 <- airquality[order(-airquality$Month, airquality$Temp),] # Sort by month in decreasing and temp in increasing
head(sort_2)

mylist <- list("a",2,TRUE) #[1] 6 4 3 2 1
mylist[1]
mylist[2:3]
#Named lists 
movie <- list(name = "Toy Story",
              year = 1995,
              genre = c("Animation", "Adventure", "Comedy")) # "Toy Story" & "1995" get populated across all rows in the list 
movie$genre # [1] "Animation" "Adventure" "Comedy"   
class(movie$name) #[1] "character"

# Adding items to a list 
movie[["age"]] <- 5

# Concatenating lists
# We split our previous list in two sublists
movie_part1 <- list(name = "Toy Story")
movie_part2 <- list(year = 1995, genre = c("Animation", "Adventure", "Comedy"))
# Now we call the function c() to put everything together again
movie_concatenated <- c(movie_part1, movie_part2)
# Check it out
movie_concatenated


# Naming elements of a vector 
names(myvec) <- c("First","Second","Third","fourth","fifth")
#Retrieving based on names
myvec["Third"] #5
myvec[c("Third","First")] # 5 1 
#Logical operations on vectors 
myvec >2 # FALSE  FALSE   TRUE   TRUE   TRUE 
myvec[myvec>2]# Return the elements greater than 2, not just T or F. 5      3      4 
myvec != 2 # TRUE  FALSE   TRUE   TRUE   TRUE 
#Retrieve vector without first item
myvec[-1] # 2      5      3      4 
mymatrix <- myvec
dim(mymatrix) <- c(2,2)
mydf <- data.frame(name=c("Chinni","Pintu","Momo"),age=c(25,28,1), stringsAsFactors = F)
mydf
mydf <- edit(mydf) # Interactively edit the dataframe
fix(mydf)
save(mydf, file="/homefractaluser/Documents/mydf.rdata")
save("C:/users/sridevi.tolety/Documents")
load(mydf)


Sys.Date()
Sys.time()
date()
today <- Sys.Date()
today
date.i.started <- as.Date("1/18/1992", "%m/%d/%Y")
date.i.started
today - date.i.started

x <- c("1jan1960", "2jan1960", "31mar1960", "30jul1960")
as.Date(x, "%d%b%Y") #Y denotes full year e.g. 1992

dates <- c("02/27/92", "02/27/92", "01/14/92", "02/28/92", "02/01/92")
as.Date(dates, "%m/%d/%y") # y is for last 2 digits of year

# Identifying and converting Data types 
# is.character, is.numeric(), is.vector(), is.matrix(), is.dataframe()
# is.character, is.numeric(), is.vector(), is.matrix(), is.dataframe(), as.factor(), as.list()
#Assigning names to values in a vector 

#Look at list of objects in the environment saved so far
ls()

#Remove an item that you don't want
rm(x)
ls()

#Remove all objects at once
rm(list=ls()) #IMP

# FACTORS
# Take on a limited number of values. Categorical variable.
# Types are:
# 1. Nominal categorical variable
# 2. Ordinal categorical variable

movie_length <- c("Very Short", "Short", "Medium","Short", "Long","Very Short", "Very Long")
movie_length
# factor() by default converts a vector into unordered factor. To order:
movie_length_ordered <- factor(movie_length, ordered=TRUE, levels=c("Very Short", "Short", "Medium", "Long","Very Long"))

#Sequence of 10 numbers  between 1 and 20
x <- seq(1, 20, length=10)
#or
x <- 1:20

x <- 1:9; names(x) <- x
# > x
# 1 2 3 4 5 6 7 8 9 
# 1 2 3 4 5 6 7 8 9 

# Multiplication & Power Tables
x %o% x
y <- 2:8; names(y) <- paste(y,":", sep = "")
# 2: 3: 4: 5: 6: 7: 8: 
#   2  3  4  5  6  7  8 
outer(y, x, "^")

# 1  2   3    4     5      6       7        8         9
# 2: 2  4   8   16    32     64     128      256       512
# 3: 3  9  27   81   243    729    2187     6561     19683
# 4: 4 16  64  256  1024   4096   16384    65536    262144
# 5: 5 25 125  625  3125  15625   78125   390625   1953125
# 6: 6 36 216 1296  7776  46656  279936  1679616  10077696
# 7: 7 49 343 2401 16807 117649  823543  5764801  40353607
# 8: 8 64 512 4096 32768 262144 2097152 16777216 134217728


#ARRAY
# Multidimensional structure that holds values grouped together 
# More general version of a matrix, as matrix can have only 2 dimensions 
# The array data type can still only have one data type inside of it, but the set of data types it can store is larger. In addition to the data types an array can store matrices as its elements. 
sample_array <- array(1:12, dim = c(3, 2, 2)) # create an array with dimensions 3 x 2 x 2 
sample_array
class(sample_array) #array
mode(sample_array) #numeric 

#lets first create a vector of nine movies
movie_vector <- c("Boggart", "Toy Story", "Room", "The Wave", "Whiplash","Star Wars", "The Ring", "The Artist", "Jumanji")
movie_vector
movie_array <- array(movie_vector, dim=c(4,3)) #last 3 empty spaces are filled with 1st few movie names again
movie_array[2,3] #Array indexing 


#CONTOUR PLOTS
y=x
f = outer(x, y, function(x,y)y/(x+1))
contour(x,y,f) #IMP

image(x,y,f) #IMP

persp(x,y,f) #IMP

#Create a matrix
myMatrix <- matrix(c(1,2,3,4), nrow=2, ncol=2, byrow = TRUE)


#Missing values (NA, NaN)
Inf-Inf #Nan
0/0 #NaN

mydf[1:2,2] <- NA #Injecting NAs in 2nd col of first two rows
is.na(mydf)
table(is.na(mydf))
# FALSE  TRUE 
# 4     2 

v <- c(1,2,3,4)
length(v) <- 5
v # [1]  1  2  3  4 NA

mydf[!complete.cases(mydf),]
mean(mydf$age) #Returns NA
mean(mydf$age, na.rm = TRUE) #Returns 1 by ignoring the NAs

#Generate a set of random normal variables
set.seed(1303)
x <- rnorm(50, mean=50,sd=1)


y <- x+rnorm(50, mean = 50, sd=1)

cor(x,y)

#Indexing 
A = matrix(1:16, 4, 4)
A[2,3]
A[c(2,3), c(1,4)] #Rows 2 & 3 with cols 1 & 4
A[1:3, 2:4]
A[1:2, ] #Rows 1 & 2 with all columns
A[-c(1,3), ] #All except 1 & 3 row

dim(A) #Checking dimension 

# MERGING DATA FRAMES
#JOINS IN R 
x <- data.frame(k1 = c(NA,NA,3,4,5), k2 = c(1,NA,NA,4,5), data.x = 1:5)
y <- data.frame(k1 = c(NA,2,NA,4,5), k2 = c(NA,NA,3,4,5), data.y = 1:5)
x; y

merge(x, y, by = c("k1","k2"))
merge(x, y, all = TRUE)


# CONTROL STRUCTURES IN R
# Controls the flow of code/commands written inside a function 
#*********************    
# if, else: This structure is used to test a condition. Below is the syntax:
# if (<condition>){
#   ##do something
# } else {
#   ##do something
# }
#*********************
# for: This structure is used when a loop is to be executed fixed number of times. 
# It is commonly used for iterating over the elements of an object (list, vector). 
#   
#   for (<search condition>){
#     #do something
#   }
#*********************
# while : It begins by testing a condition, and executes only if the condition is found to be true.
# Once the loop is executed, the condition is tested again.

#*********************
# Other control structures:

# repeat: It executes an infinite loop
# break: It breaks the execution of a loop
# next: It allows to skip an iteration in a loop
# return: It help to exit a function

a <- 14

if (a>13){
  print("More than a dozen")
} else if (a==13){
  print("Baker's dozen")
} else (print("less than a dozen"))

i=5
if (i%%2 == 1){
  print(c(i, "odd"))
} else
{
  print(c(i,"even"))
}


# For loop
samples <- c(rep(1:10))
samples

for (i in 1:10)
{
  if (i==3) break
  str <- paste(samples[i],"is current sample", sep = " ")
  print(str)
}


for (i in 1:10){
  if (i%%2==0) next
  str <- paste(samples[i], "is current sample", sep = "")
  print(str)
}

for (i in 1:10){
  print(paste(i," raised to itself is ",i^i))
}

#Print squares of numbers between 1 and 50 that are divisible by 7
for (i in 1:50){
  if (!i%%7 == 0) next
  print(paste(i," squared is ",i^2))
}


# While loop
# Test a condtn, and execute loop body if true
count <- 0
while (count<10){
  print(count)
  count <- count+1
}


# Next
# Used to skip an iteration of the loop


# code to download the dataset
download.file("https://ibm.box.com/shared/static/n5ay5qadfe7e1nnsv5s01oe1x62mq51j.csv", destfile="/home/fractaluser/Documents/BDU Python 101/movies-db.csv")

movies_Data <- read.csv("/home/fractaluser/Documents/BDU Python 101/movies-db.csv", header=TRUE, sep=",")

# if()
movie_year=199
if(movie_year>2000){
  #Print message saying greater than 2000
  print('Movie year is greater than 2000')
}else{
  print('Movie year is less than 2000')}

#Logical operators
if(movie_year<2000 & movie_year>1990)
{print('Movie year between 1990 and 2000')}

if(movie_year>2000 | movie_year<1990)
{print('Movie year not between 1990 and 2000')}

#Subset()
decade='recent'
# If the decade is recent 
if(decade=='recent'){
  #Subset the dataset to include only movies after year 2000
  subset(movies_Data, year>2000)
}else{
  subset(movies_Data, year<2000)
}


#Loops 
# for loop to print all the years present in the year column
# Get the data for the "year" column in the data frame.
years <- movies_Data['year']
for (val in years){
  print(val)
}

# Print numbers in 1 to 10 raised to their own powers
for(i in 1:10){
  print(paste0(i, " raised to ", i, " equals ", i^i))
}

# while()
# Tool for repeated execution based on a condition. The code block will keep being executed until the given logical condition returns a False boolean value.

# while to print the first five movie names
iteration=1

while(iteration<=5){
  print(c("This is iteration number", as.character(iteration)))
  print(movies_Data[iteration,]$name)
  iteration=iteration+1
}

# Use while to print all integers from 1 to 20
count <- 0
while(count<21){
  print(count)
  count <- count+1
}

#____Functions____
# Functions in R are first class objects (can be treated as any other object)
# Can be passed as arguments to other functions. Can be nested 


# User defined functions 

# Square function
f <- function(a){
  return (a^2)
}
f(100)

f1 <- function(x, y){
  return(x+y)
}
f1(102,1)

# Scope of a cunction determines whether a variable name is locally or globally accessible 

#Function that returns the factorial of a number 
factorialfn <- function(x) {
  n <- 1
  for(i in 1:x) {
    n <- n*i
  }
  return(n)
}

factorialfn(3)  

#Function subsetData that has following functionality:
# Input parms: dataframe, starting row, ending row
# Output: Df that is subset of input df from starting row to ending row
subsetData <- function(df, startrow, endrow){
  df.Subset <- tail(head(df, n=endrow), n=endrow-startrow+1)
  return(df.Subset)
}
subsetData(10,1,2)

#Function renameVariable that has following functionality:
# Input parms: dataframe, oldvarname, newvarname
# Output: Df with old variable name changed to new variable name
renameVariable <- function(df, oldvarname, newvarname){
  names(df)[names(df)==oldvarname] <- newvarname
  return (df)
}


printHelloWorld <- function(){
  print("Hello World")
}
printHelloWorld() # To use, simply run with () at the end 

add <- function(x, y){
  print(x+y)
}

add(3,4)

# The return() function is particularly useful if you have any IF statements in the function, when you want your output to be dependent on some condition

isGoodRating <- function(rating){
  if(rating>7){
    return("Yes")
  }else{
    return("No")}
}
isGoodRating(9)

#Setting default values in custom functions 
isGoodRating <- function(rating, threshold=7){
  if(rating>threshold){
    return("Yes")
  }else{
    return("No")}
}

isGoodRating(1)

#Function within a function 


# function that can help us decide on which movie to watch, based on its rating. We should be able to provide the name of the movie, and it should return NO if the movie rating is below 7, and YES otherwise.

watchMovie <- function(moviename){
  rating <- movies_Data[movies_Data[,1]==moviename,"average_rating"]
  isGoodRating(rating)
}

watchMovie("Boggart")

# paste()
watchMovie <- function(moviename, my_threshold){
  rating <- movies_Data[movies_Data[,1]==moviename,"average_rating"]
  print(paste("The movie rating for",moviename,"is",rating))
  isGoodRating(rating)
}

watchMovie("Akira")

#Error catching 
# tryCatch tries to run the code, and if it results in an error, you can ask it to do something else.
tryCatch(10+10)
tryCatch(10+"a", error=function(e) print("Oops, something went wrong"))

#If error, return "10a" without an error
x <- tryCatch(10 + "a", error = function(e) return("10a") ) #No error
x

# Packages to explore
# *** Importing Data*** 
#R offers wide range of packages for importing data available in any format such as .txt, .csv, .json,
# .sql etc. Install and use data.table, readr, RMySQL, sqldf, jsonlite.
# Reading excel files 
install.packages("readxl")
library(readxl)
my_excel_data <- read_excel()

# *** Data Visualization ***
# R has in built plotting commands as well. They are good to create simple graphs.Install ggplot2.

# Impr high level plotting functions
# 1. plot(): Generic x-y plotting
# 2. barplot() : Plotting bars
# 3. boxplot(): box & whispers plot
# 4. hist(): Histograms 
# 5. pie(): Pie charts 
# 6. dotchart() : Cleveland dot plots 
# 7. image, heatmap, contour, perspective: Fns to generate image type plots
# 8. qqplot, qqline, qqnorm: Plots to compare distributions 

# 4 types of bar charts 
# 1. Discrete variable bar chart
# 2. Dodged bar chart (2 or more variables, where each variable has components)
# 3. Cts variable bar chart 
# 4. Stacked bar chart 



# *** Data Manipulation ***
# dplyr, plyr, tidyr, lubridate, stringr. 

# *** Modeling / Machine Learning ***
# For modeling, caret package in R is powerful enough to cater to every need for creating machine learning models. However, you can install packages algorithms wise such as randomForest, rpart, gbm etc

#

# Strings & Dates ---------------------------------------------------------

# Download the data file
download.file("https://ibm.box.com/shared/static/l8v8g8e6uzk7yj2j1qc8ypezbhzukphy.txt", destfile="/home/fractaluser/Documents/The_Artist.txt")

my_data <- readLines("/home/fractaluser/Documents/The_Artist.txt")
my_data[1]
length(my_data)
file.size("/home/fractaluser/Documents/The_Artist.txt")
# Difference in readLines() and scan() method is that, readLines() is used to read text files line by line whereas scan() method read the text files word by word.
my_data <- scan("/home/fractaluser/Documents/The_Artist.txt", "") #Second argument is the separator we want for words 

nchar(my_data[1]) #ow many characters are there in the first element of my_data variable

toupper(my_data[3]) #"IS"

# replace any characters in given string
# first argument is the characters which we want to replace in string, second argument is the new characters and the last argument is the string on which operation will be performed.
chartr(" ","-",my_data[1])

# strsplit() method provides a list at the output which contains all the separated words as single element which is more complex to read. 
characterlist <- strsplit(my_data[1]," ")
wordlist <- unlist(characterlist)
wordlist

# substr() to get subsection of a string 
sub_String <- substr(my_data[1], start=4,stop=50)
sub_String

trimws(sub_String) #Get rid of white space in beginning and at the end 

library(stringr)
str_sub(my_data[1],-8, -1) #e read string from -1 till -8 and it gives talkies. with full stop mark at the output.

# R stringr package
library(stringr)
# str_detect(string, pattern) Detect the presence of a pattern match in a string.
str_detect("fruit","a") #False
str_detect("fruit","ui") #TRUE

# str_which(string, pattern) Find the indexes of strings that contain a pattern match.
str_which("fruit", "a") # integer(0)
str_which("fruityfruity fruit", "ui") #1

# str_count(string, pattern) Count the number of matches in a string.
str_count("fruit", "a")
str_count("fruit", "ui") #1
str_count("fruityfruity", "ui") #2

# str_locate(string, pattern) Locate the positions of pattern matches in a string. Also str_locate_all. 
str_locate("fruit", "a")
str_locate("fruit", "ui")
# start end
# [1,]     3   4

# Exporting as text file 
m <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 2, ncol = 3)
m
write(m, file="/home/fractaluser/Documents/my_txt_file.txt", ncolumns = 3, sep=" ")

#Exporting as Excel file 
install.packages("xlsx")
library(xlsx)
write.xlsx(CO2, file="/home/fractaluser/Documents", row.names=FALSE)

#Exporting as .RData file 
var1 <- "var1"
var2 <- "var2"
var3 <- "var3"
save(list = c("var1", "var2", "var3"), file = "/home/fractaluser/Documents", safe = T)


# Regular expressions in R ------------------------------------------------
email_df <- read.csv("https://ibm.box.com/shared/static/cbim8daa5vjf5rf4rlz11330lvqbu7rk.csv")
email_df

# Regular Expressions are generic expressions that are used to match patterns in strings and text. 
# test@testing.com
# So, an email is composed by a string followed by an '@' symbol followed by another string. In R regular expressions, we can express this as:
# .+@.+
# The '.' symbol matches with any character.
# The '+' symbol repeats the previous symbol one or more times. So, '.+' will match with any string.
# The '@' symbol only matches with the '@' character.

# The grep function below takes in a Regular Expression and a list of strings to search through and returns the positions of where they appear in the list.
grep("@.+", c("test@testing.com", "not an email","test2@testing.com")) #[1] 1 3
grep("@.+", c("test@testing.com", "not an email","test2@testing.com"), value=TRUE) #[1] "test@testing.com"  "test2@testing.com" (The parameter called 'value' changes the output to display the strings rather than list positions)

#grepl() returns a logical vector stating whether match or not for each element of x
grepl("sri",c("sridevi tolety","blah","sri")) #[1]  TRUE FALSE  TRUE

# sub() and gsub()
# Substitution function. Takes in a regular expression, the string you want to swap in with the matches and a list of strings you want to perform the swap with. 
# sub() replaces the first occurence of a pattern 
# gsub() replaces all occurences of the pattern
x <- c("This is the first sentence","This is the second pattern")
sub(" is", " was", x)

gsub("[[:digit:]]","","She is 25 years old and weighs 52 kgs")

gsub("@.+", "@newdomain.com", c("test@testing.com", "not an email", "test2@testing.com"))

# regexpr returns an integer vector of the same length as text giving the starting position of the first match or -1 if there is none, with attribute "match.length", an integer vector giving the length of the matched text (or -1 for no match). 

regexpr("@.*", c("test@testing.com", "not an email", "test2@testing.com"))
# [1]  5 -1  6

matches <- regexpr("@.*\\.", email_df[,'Email'])
email_df[,'Domain'] = regmatches(email_df[,'Email'], matches)

email_df

table(email_df[,'Domain'])
# Reference: http://www.endmemo.com/program/R/grep.php


# Character Basics --------------------------------------------------------

# sprintf
# A wrapper for the C function sprintf that returns a character vector containin a formatted combination of text and variable values 

# To substitute a string or a string variable use %s
x <- "print strings"
y <- "in R"
sprintf("Learning to %s %s", x, y)

#For integers use %d or a variant 
version <- 3
sprintf("This is R version %d", version)

#Print with leading spaces
sprintf("This is R version %4d", version)

#Print with 4 leading  0s 
sprintf("This is R version %04d", version)

#For floating point numbers 
sprintf("%f", pi) #Fixed point decimal

sprintf("%.3f", pi) # Decimal notation with 3 decimal digits 

sprintf("%1.0f",pi) #Decimal notation with 1 integer and 0 decimal digits 

sprintf("%5.1f", pi) # Decimal notation with total of 5 digits, and only of them being a decimal digit 

sprintf("%05.1f", pi) # Total 5 digits but fill blanks with 0s 

sprintf("%+f", pi) #Print with sign (positive)

sprintf("% f", pi) #Prefix with a space

sprintf("%e", pi) #Exponential decimal notation 'e'

sprintf("%E", pi) #Exponential decimal notation 'E'

# With() ------------------------------------------------------------------
library(Lock5Data)
data(SleepStudy)
with(Carseats, CompPrice+Income)  #package ISLR
with(Carseats, table(ShelveLoc,Urban)) 
with(Carseats, summary(Sales, Income))

#Proportions & Percentages 
tab <- with(Carseats, table(ShelveLoc))
tab*100 / nrow(Carseats)
round((tab*100 / nrow(Carseats)),1)

path <- "~/Documents/BigMart"

setwd(path)

#Load datasets
train <- read.csv("Train_UWu5bXk.csv")
test <- read.csv("Test_u94Q5KV.csv")
dim(train)
dim(test)
names(train)
table(is.na(train))
# FALSE   TRUE 
# 100813   1463 
colSums(is.na(train))   #Which columns contain these missing values? Ans: Item identifier column
# Item_Identifier               Item_Weight          Item_Fat_Content           Item_Visibility 
# 0                      1463                         0                         0 
# Item_Type                  Item_MRP         Outlet_Identifier Outlet_Establishment_Year 
# 0                         0                         0                         0 
# Outlet_Size      Outlet_Location_Type               Outlet_Type         Item_Outlet_Sales 
# 0                         0                         0                         0 

summary(train)
# Item_Identifier  Item_Weight     Item_Fat_Content Item_Visibility                   Item_Type   
# FDG33  :  10    Min.   : 4.555   LF     : 316     Min.   :0.00000   Fruits and Vegetables:1232  
# FDW13  :  10    1st Qu.: 8.774   low fat: 112     1st Qu.:0.02699   Snack Foods          :1200  
# DRE49  :   9    Median :12.600   Low Fat:5089     Median :0.05393   Household            : 910  
# DRN47  :   9    Mean   :12.858   reg    : 117     Mean   :0.06613   Frozen Foods         : 856  
# FDD38  :   9    3rd Qu.:16.850   Regular:2889     3rd Qu.:0.09459   Dairy                : 682  
# FDF52  :   9    Max.   :21.350                    Max.   :0.32839   Canned               : 649  
# (Other):8467    NA's   :1463                                        (Other)              :2994  
#     Item_MRP      Outlet_Identifier Outlet_Establishment_Year Outlet_Size   Outlet_Location_Type
#  Min.   : 31.29   OUT027 : 935      Min.   :1985                    :2410   Tier 1:2388         
#  1st Qu.: 93.83   OUT013 : 932      1st Qu.:1987              High  : 932   Tier 2:2785         
#  Median :143.01   OUT035 : 930      Median :1999              Medium:2793   Tier 3:3350         
#  Mean   :140.99   OUT046 : 930      Mean   :1998              Small :2388                       
#  3rd Qu.:185.64   OUT049 : 930      3rd Qu.:2004                                                
#  Max.   :266.89   OUT045 : 929      Max.   :2009                                                
#                   (Other):2937                                                                  
#             Outlet_Type   Item_Outlet_Sales 
#  Grocery Store    :1083   Min.   :   33.29  
#  Supermarket Type1:5577   1st Qu.:  834.25  
#  Supermarket Type2: 928   Median : 1794.33  
#  Supermarket Type3: 935   Mean   : 2181.29  
#                           3rd Qu.: 3101.30  
#                           Max.   :13086.97  

#Observations
# 1463 obs have NA item weight
# There are mismatched factor levels in item_fat_content (LF, low fat, reg, regular)
# Some obs hv 0 item visibility which doesn't make sense
# 2410 obs have unmatched outlet sizes

# Apply,Sapply,Lapply -----------------------------------------------------

m <- matrix(data= cbind(rnorm(30,0), rnorm(30,2), rnorm(30,5)),nrow=30, ncol=3)

# 1. 1 Apply function -----------------------------------------------------


# Works on arrays
#   Traverses data either row-wise or col-wise (2nd argument) and perform some task (3rd arg)
# Syntax: apply(X, margin, Function )
apply(m,2,mean) #Mean of the 3 columns 

#How many -ve numbers in each column
apply(m, 2, function(x) length(x[x<0]))
# [1] 18  0  0 So 18 -ve values in col 1, 0 in cols 2 & 3

# Above, the argument of the fn is x. Is it a single column of the matrix or just a vector?
apply(m, 2, function(x) is.matrix(x))
# [1] FALSE FALSE FALSE
apply(m, 2, function(x) class(x))
# [1] "numeric" "numeric" "numeric"
apply(m, 2, is.vector) # [1] TRUE TRUE TRUE


# 1.2 Lapply --------------------------------------------------------------

# Apply fn to every element of a list and return a list 
#Unlike apply(), can be used on other objects like dataframes, lists or vectors 
# Output is returned as a list and has same no. of elements as the object passed to it 
a <- 1:10
b <- 11:20
l <- list(a,b) #List with 2 elements, where each elements is a list 
lapply(l, mean)
# [[1]]
# [1] 5.5
# 
# [[2]]
# [1] 15.5

# 1.3 Sapply --------------------------------------------------------------

# Returns vector or matrix instead of list object 
sapply(l, mean) #[1]  5.5 15.5
class(sapply(l, mean)) #Numeric, whereas lapply returned list 
# If we want a list returned instead, can specify simplify=FALSE
sapply(l, mean, simplify=FALSE)

# 1.4 Tapply --------------------------------------------------------------
# Break a vector into pieces and apply some fn to each piece
data("mtcars")
str(mtcars$cyl)
levels(as.factor(mtcars$cyl)) # [1] "4" "6" "8"
# There are 3 types of cylinders & we want avg MPG for each type of cylinder
#Syntax: tapply(data'sColumn, ColtoGroupBy, function)
tapply(mtcars$mpg, mtcars$cyl, mean) 

#Summary
# ______________________________________________________________________________
# Fn Name     | Obj the fn works on   |   Wt fn sees as elements    |   Result type
# ______________________________________________________________________________
# apply       | Matrix                |   Rows/columns              |   Vec/mat/arr/list
#             | Array                 |   Rows/columns/any dims     |   Vec/mat/arr/list
#             | Dataframe             |   Rows/columns              |   Vec/mat/arr/list
# sapply      | vector                |   Elements                  |   Vec/ mat/ list
#             | dataframe             |   Variables                 |   Vec/ mat/ list
#             | list                  |   Elements                  |   Vec/ mat/ list
# lapply      | vector                |   Elements                  |   List
#             | dataframe             |   Variables                 |   List
#             | list                  |   Elements                  |   List


# 1.5 by() ----------------------------------------------------------------
data("iris")
# [1] "Sepal.Length" "Sepal.Width"  "Petal.Length" "Petal.Width"  "Species"   
# Calc means for each col, grouped by species
by(iris[1:4], iris$Species, colMeans)
# iris$Species: setosa
# Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
# 5.006        3.428        1.462        0.246 
# -------------------------------------------------------------------------------- 
#   iris$Species: versicolor
# Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
# 5.936        2.770        4.260        1.326 
# -------------------------------------------------------------------------------- 
#   iris$Species: virginica
# Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
# 6.588        2.974        5.552        2.026 


# 1.6 Mapply --------------------------------------------------------------
Q <- matrix(c(rep(1,4), rep(2,4),rep(3,4),rep(4,4)), 4, 4)
print(Q) 
# [,1] [,2] [,3] [,4]
# [1,]    1    2    3    4
# [2,]    1    2    3    4
# [3,]    1    2    3    4
# [4,]    1    2    3    4
# Can simplify the use of rep() function by mapply
#Syntax: mapply(FUN,data)
mapply(rep,1:4,4)


# 1.7 Aggregate -----------------------------------------------------------
aggregate(mtcars$mpg, by=mtcars["cyl"],FUN=mean)
# cyl        x
# 1   4 26.66364
# 2   6 19.74286
# 3   8 15.10000


# Graphics ----------------------------------------------------------------

#PLOTS
x=rnorm(100)
y=rnorm(100)
myFig <- plot(x,y, xlab = "x-Axis", ylab = "y-Axis", main = "Plot of x vs y", sub = "Also my first plot", col="green")

pdf("myFig.pdf")
dev.off()


# ggplot2 -----------------------------------------------------------------

#Graphing template 
ggplot(data=<DATA>) + <GEOM_FUNCTION>(mapping=aes(<MAPPINGS>))

options(scipen = 999) #Turn off scientific notation like 1e+06
library(ggplot2)

data("midwest", package = "ggplot2")

#Init ggplot
ggplot(midwest, aes(x=area, y=poptotal)) #Blank ggplot is drawn. Only x & y specified, but no points or lines 

ggplot(data = mpg) + geom_point(aes(x=displ, y=hwy)) #Scatterplot by adding a geom layer called geom_point()

ggplot(midwest, aes(x=area, y=poptotal)) + geom_point()

# can map aesthetics of the plot to the variables in the dataset. E.G. in mpg data map 'class' variable to colors of the scatterplot 
ggplot(data=mpg) + geom_point(mapping = aes(x=displ,y=hwy, color=class))

# can instead map 'class' variable to size aesthetic 
ggplot(data=mpg) + geom_point(aes(x=displ, y=hwy, size = class))

# can instead map 'class' variable to shape (25 poss shapes) aesthetic. WARNING: Max 6 shapes, so 7th and above categories will go unplotted
ggplot(data=mpg) + geom_point(aes(x=displ, y=hwy), shape = class)

# can instead map 'class' variable to transparency aesthetic 
ggplot(data=mpg) + geom_point(aes(x=displ, y=hwy, alpha = class))

#Setting the aesthetics properties, e.g. all points as blue 
ggplot(data=mpg) + geom_point(mapping=aes(x=displ, y=hwy), color='blue')

#Adding a smoothing layer using lm() method
g <- ggplot(midwest, aes(x=area, y=poptotal)) + geom_point() + geom_smooth(method='lm', se= FALSE) # To turn off confidence intervals around regression line, se=FALSE


#To adjust the range of x or y axis to be displayed 
g1 <- g + xlim(c(0,0.1)) + ylim(c(0,1000000)) #First method to delete points 
g + xlim(0,0.1) + ylim(0,1000000) #Second method to delete points
#Note: xlim() & ylim() delete points, so the lm() is refit based on those 

#If want to just adjust the view without actually deleting the points, use coord_cartesian()
g2 <- g + coord_cartesian(xlim=c(0,0.1), ylim=c(0, 1000000)) #This just zooms in 
plot(g2)

# Title and axis labels 
g3 <- g2 + labs(title="Area vs Population", subtitle="From Midwest dataset", y="Population", x="Area", caption="Midwest Demographics") #Method 1 
g3

g3 <- g2 + ggtitle("Area vs Population", subtitle = "From midwest data") + xlab("Area") + ylab("Population") #Method 2
g3

#Changing the color and size of points
ggplot(midwest, aes(x=area, y=poptotal))+
  geom_point(col="dodgerblue4", size=3)+ #Set static color and static size for points 
  geom_smooth(method="lm", col="brown4")+ #Change the color of the line 
  coord_cartesian(xlim=c(0,0.1), ylim=c(0,1000000))+
  labs(title="Area vs Population", subtitle="From Midwest Dataset", x="Area", y="Population", caption="Midwest Demographics")

#Change color to reflect categories in another column
mygg <- ggplot(midwest, aes(x=area, y=poptotal))+
  geom_point(aes(col=state), size=2.5)+ #Set color to vary based on state categories 
  geom_smooth(method = "lm", col="firebrick", size=2)+
  coord_cartesian(xlim = c(0,0.1), ylim = c(0,1000000))+
  labs(title="Area vs Population",subtitle="From Midwest Dataset",x="Area",y="Population",caption="Midwest Demographics")
#Similar to color by categories, can use shape, stroke and fill inside the aes() in geom_point() to discriminate groupings 
mygg

mygg+theme(legend.position = "None") #Can remove the legend as well

mygg+scale_color_brewer(palette=3)

#For more color palettes
library(RColorBrewer)
head(brewer.pal.info, 10)

#Change the x-axis text and ticks location. 2 aspects: Breaks and labels 
mygg + scale_x_continuous(breaks = seq(0, 0.1, 0.01), labels=letters[1:11]) 

#Customize text for axis labels by formatting original values 
mygg + scale_x_continuous(breaks = seq(0, 0.1, 0.01), labels = sprintf("%1.2f%%", seq(0, 0.1, 0.01))) + scale_y_continuous(breaks = seq(0, 1000000, 200000), labels = function(x){paste0(x/1000, "K")})


#To reverse the scale 
mygg + scale_x_reverse()


# To change the entire theme in one shot usign pre-built themes
mygg + theme_set(theme_classic()) + labs(subtitle="Classic Theme")
mygg + theme_set(theme_bw()) + labs(subtitle="BW Theme")

#For more themes, packages are ggthemes and ggthemr package 


# AV Case Study 

ggplot(train, aes(x=Item_Visibility, y=Item_Outlet_Sales)) + geom_point(size=2.5, color="navy")+xlab("Item Visibility")+ ylab("Item Outlet Sales") + ggtitle("Item Visibility vs Item Outlet Sales")

ggplot(train, aes(x=Outlet_Identifier, y=Item_Outlet_Sales))+geom_bar(stat = "identity",color="purple")+theme(axis.text.x = element_text(angle=70, vjust=0.5, color="black"))+ggtitle("Outlets vs Tot sales")

ggplot(train, aes(Item_Type,Item_Outlet_Sales))+geom_bar(stat="identity")+theme(axis.text.x = element_text(angle=70,vjust=0.5, color="navy"))+xlab("Item Type")+ylab("Item Outlet Sales")

ggplot(train, aes(Item_Type, Item_MRP))+geom_boxplot()+ggtitle("Box Plot")+theme(axis.text.x=element_text(angle=70, vjust=0.5, color="red"))+xlab("Item Type")+ylab("Item MRP")+ggtitle("Item Type vs Item MRP")


# Joins -------------------------------------------------------------------

x <- data.frame(k1=c(NA,NA,3,4,5), k2=c(1,NA,NA,4,5), data.x=1:5)
y <- data.frame(k1=c(NA,2,NA,4,5), k2=c(NA,NA,3,4,5), data.y=1:5)

merge(x, y, all=TRUE) #Full outer join
merge(x, y, all.x = TRUE) #Left outer join
merge(x, y, all.y=all.y = TRUE) #Right outer join
merge(x, y, by.x = "data.x", by.y = "data.y")

# Dplyr -------------------------------------------------------------------


library(dplyr)
library(knitr)
cars <- mtcars

colors <- data_frame(
  cyl = unique(cars$cyl),
  color=c("Blue","Green","Red")
)

View(cars[1:10,])
View(colors)

#Now doing a left join and using pipe operator %>%. This allows output fm one fn to input of another
left_join(cars, colors, by="cyl") %>%
  filter(row_number() %in% 1:10) %>%
  View()

left_join(cars, colors, by="cyl") %>%
  group_by(color) %>%
  summarise(mean_displacement=mean(disp),
            mediandisp=median(disp)) %>%
  View()

cars %>%
  summarise(meanweight=mean(wt),
            min_wt=min(wt),
            max_wt=max(wt),
            sd_wt=sd(wt),
            median_wt=median(wt),
            sum_wt=sum(wt),
            total=n())



#Generalizing through functions
join_And_summarize <- function(df, color_df){
  left_join(df, color_df, by="cyl") %>%
    group_by(color) %>%
    summarize(mean_disp=mean(disp))
}
join_And_summarize(cars, colors)

#Select columns from data frame
cars_subset <- select(cars, cyl, gear, carb) %>%
  View()

#Select all except a column
cars_bigsubset <- select(cars, -hp) %>%
  View()

#Select a range of columns using "-" operator
cars_lasttwo <- select(cars, gear:carb) %>%
  head() %>%
  View()

#Use starts_with to select columns that start with "ge" (i.e. column "gear")
head(select(cars, starts_with("ge")))

head(select(cars, ends_with("at")))

head(select(cars, contains("ea")))

head(select(cars, one_of("cyl", "hp")))

#FILTERING 
filter(cars, disp>160, qsec>18)

#Arranging/re-ordering rows by a particular column
cars %>%
  arrange(wt) %>%
  head()
#Selecting mpg, disp and wt, arranging rows by wt and then arranging by mpg. Show only those
# with wt greater than 5, arranged in descending order
cars %>%
  select(mpg, disp, wt)%>%
  arrange(wt)%>%
  arrange(mpg, desc(wt))%>%
  filter(wt>5)

#New columns using mutate(). wt per cylinder

select(cars, cyl, wt) %>%
  mutate(wt_per_cyl = wt / cyl) %>%
  head()



# Data Exploration -------------------------------------------------------



Auto <- read.table("/home/fractaluser/Documents/ISLR_Labs/Data/Auto.data", header=T, na.strings="?")
View(Auto)
fix(Auto) #View and edit the data in a spreadsheet like window
dim(Auto) #[1] 397  9
Auto = na.omit(Auto) #Remove rows that contain missing observations
dim(Auto)

#Check the variable names
names(Auto)
plot(Auto$cylinders, Auto$mpg) #one way to type variable names

attach(Auto) #attach allows you to use directly

plot(cylinders, mpg)

cylinders=as.factor(cylinders) #Small number of values for cylinder, so treat as qualitative

plot(cylinders, mpg, col="red", varwidth=T, horizontal=T, xlab="Cylinders",ylab="MPG") #boxplot

hist(mpg, col=2, breaks=15) #col=2 same as col=red

pairs(Auto) #Creates a scatterplot matrix

pairs(~ mpg + displacement + horsepower + weight + acceleration, Auto) #For just a subset

plot(horsepower, mpg)

identify(horsepower, mpg, name) #Identify value for a variable on a plot

summary(Auto) #Numerical summary of each variable in the dataset

summary(mpg)

q() #Exit R


# APPLIED EXERCISES

###### COLLEGE ########
library(MASS)
library(ISLR)
data("College")

# rownames(College)=College[,1]   This is when reading the csv file. I loaded directly
# from ISLR Library
# fix(College)

summary(College)
pairs(College[,1:10])
plot(College$Private, College$Outstate)

# Creating a new qualitative variable called "Elite" which is flagged "Yes" if more than
#  50% students in that college come from top 10% percentile of their high scool class

Elite=rep("No", nrow(College))
Elite[College$Top10perc > 50] <- "Yes"
Elite <- as.factor(Elite)
college <- data.frame(College, Elite)
summary(college$Elite) #78 elite colleges out of 777
plot(college$Elite, college$Outstate)

par(mfrow=c(2,2))
hist(college$Apps, col=3, xlab = "Applications recd")
hist(college$perc.alumni, col=2, xlab="% alumni who donate")
hist(college$Enroll, col=4, xlab="% accepted")
hist(college$Outstate, col=5, xlab="oustate", breaks=breaks = 100)

par(mfrow=c(1,1))
plot(college$Outstate, college$Grad.Rate)
# High tuition correlates to high graduation rate.
plot(college$Accept / college$Apps, college$S.F.Ratio)
# Colleges with low acceptance rate tend to have low S:F ratio.
plot(college$Top10perc, college$Grad.Rate)
# Colleges with the most students from top 10% perc don't necessarily have
# the highest graduation rate. Also, rate > 100 is erroneous!


############## AUTO ##############

data(Auto)
Auto = na.omit(Auto)
dim(Auto)
str(Auto)
# quantitative: mpg, cylinders, displacement, horsepower, weight,acceleration, year
# qualitative: name, origin

# apply the range function to the first 7 (quant) columns of Auto
sapply(Auto[1:7], range)
sapply(Auto[1:7], mean)
sapply(Auto[1:7], sd)

sapply(Auto[-c(10:85),1:7], range)
sapply(Auto[-c(10:85),1:7], mean)
sapply(Auto[-c(10:85),1:7], sd)


pairs(Auto)
plot(Auto$mpg, Auto$weight)
# Heavier weight correlates with lower mpg.
plot(Auto$mpg, Auto$cylinders)
# More cylinders, less mpg.
plot(Auto$mpg, Auto$year)
# Cars become more efficient over time.

# (f)
pairs(Auto)
# See descriptions of plots in (e).
# All of the predictors show some correlation with mpg. The name predictor has 
# too little observations per name though, so using this as a predictor is 
# likely to result in overfitting the data and will not generalize well.


########## BOSTON ############
data("Boston")
str(Boston)
# 506 obs. of  14 variables

# (b) Make some pairwise scatterplots of the predictors (columns) in
# this data set. Describe your findings.
pairs(Boston)
# X correlates with: a, b, c
# crim: age, dis, rad, tax, ptratio
# zn: indus, nox, age, lstat
# indus: age, dis
# nox: age, dis
# dis: lstat
# lstat: medv


# (c) Are any of the predictors associated with per capita crime rate?
# If so, explain the relationship.

plot(Boston$age, Boston$crim)
# Older homes, more crime
plot(Boston$dis, Boston$crim)
# Closer to work-area, more crime
plot(Boston$rad, Boston$crim)
# Higher index of accessibility to radial highways, more crime
plot(Boston$tax, Boston$crim)
# Higher tax rate, more crime
plot(Boston$ptratio, Boston$crim)
# Higher pupil:teacher ratio, more crime

# (d) Do any of the suburbs of Boston appear to have particularly
# high crime rates? Tax rates? Pupil-teacher ratios? Comment on
# the range of each predictor.

# (d)
par(mfrow=c(1,3))
hist(Boston$crim[Boston$crim>1], breaks=25)
# most cities have low crime rates, but there is a long tail: 18 suburbs appear
# to have a crime rate > 20, reaching to above 80
hist(Boston$tax, breaks=100)
# there is a large divide between suburbs with low tax rates and a peak at 660-680
hist(Boston$ptratio, breaks=25)
# a skew towards high ratios, but no particularly high ratios


# (e) How many of the suburbs in this data set bound the Charles
# river?
dim(subset(Boston, chas == 1))
# 35 suburbs

# (f) What is the median pupil-teacher ratio among the towns in this
# data set?
median(Boston$ptratio)

# (g) Which suburb of Boston has lowest median value of owner-
# occupied homes? What are the values of the other predictors
# for that suburb, and how do those values compare to the overall
# ranges for those predictors? Comment on your findings.
t(subset(Boston, medv == min(Boston$medv)))  #IMP

# (h) In this data set, how many of the suburbs average more than
# seven rooms per dwelling? More than eight rooms per dwelling?
dim(subset(Boston, rm > 7))
# 64
dim(subset(Boston, rm > 8))
# Comment on the suburbs that average more than eight rooms
# per dwelling.
summary(subset(Boston, rm > 8))
summary(Boston)



# Association Mining ------------------------------------------------------

# Referencez: https://datascienceplus.com/implementing-apriori-algorithm-in-r/


#Libraries
library(plyr)
library(arulesViz)
library(arules)

# Data Cleaning 
asndata <- read.csv("Z://FC SCM/OTIF_All_months_36SKUsdmat1month.csv")
str(asndata)

df_sorted <- asndata[order(asndata$Sales.document),] # Sorting materials in order of increasing Sales doc IDs 

df_sorted$Sales.document <- as.numeric(df_sorted$Sales.document) #Converting to numeric 


#Converting the data frame into transactions 'basket' format based on Sales doc ID 

df_itemlist <- ddply(asndata, c("Sales.document"),
                     function(df1)paste(df1$Material, collapse=",")) # This creates one row per 
# transaction, with each row containing all the materials purchased together, separated by comma. 
View(df_itemlist)

df_itemlist$Sales.document <- NULL #Remove sales docs since no longer needed. We now have raw transactions 

colnames(df_itemlist) <- c("itemList") #renaming 

write.csv(df_itemlist, file = "Z://FC SCM/ItemList.csv", quote = FALSE, row.names = TRUE) #Write out the file, so that can read it again as transactions data format as required by the apriori algorithm 



# Association Rules Creation  

txn <- read.transactions(file = "Z://FC SCM/ItemList.csv", rm.duplicates = TRUE, format="basket", sep=",", cols = 1)

View(txn)

txn@itemInfo$labels <- gsub("\"","",txn@itemInfo$labels) # Replacing some quotes "" in the strings 

basket_rules <- apriori(txn, parameter = list(sup=0.01, conf=0.5, target="rules"))

df_basket <- as(basket_rules, "data.frame")
View(df_basket)

write.csv(df_basket, file="Z://FC SCM/AssociationRules.csv")



# Plots 
#http://r-statistics.co/Association-Mining-With-R.html

plot(basket_rules)
plot(basket_rules, method="grouped", control = list(k=5))
plot(basket_rules, method = "graph", control = list(type="items"))
plot(basket_rules, method = "paracoord", control=list(alpha=0.5, reorder=TRUE))
plot(basket_rules, measure=c("support", "lift"), shading="confidence", interactive = T)

itemFrequencyPlot(txn, topN=5)

# SAMPLE EXAMPLE 
https://www.r-bloggers.com/association-rule-learning-and-the-apriori-algorithm/
  data("Groceries")
class(Groceries) #Data of type transactions 
inspect(head(Groceries))
items                     
# [1] {citrus fruit, semi-finished bread, margarine, ready soups}             
# [2] {tropical fruit, yogurt, coffee}                  
# [3] {whole milk}              
# [4] {pip fruit, yogurt, cream cheese , meat spreads}  

size(head(Groceries)) #Number of items in each observation
# [1] 4 3 1 4 4 5

#  eclat() function takes in a transactions object and gives the most frequent items in the data based on the support you provide in the supp argument. 
# maxlen defines the maximum number of items in each itemset of frequent items 
frequenItems <- eclat(Groceries, parameter = list(supp=0.07, maxlen=15))
# inspect(frequenItems)
# items                         support    count
# [1]  {other vegetables,whole milk} 0.07483477  736 
# [2]  {whole milk}                  0.25551601 2513 
# [3]  {other vegetables}            0.19349263 1903 
# [4]  {rolls/buns}                  0.18393493 1809 
# [5]  {yogurt}                      0.13950178 1372 
# [6]  {soda}                        0.17437722 171

itemFrequencyPlot(Groceries, topN=10, type="absolute", main="Item Frequency")


# Clustering --------------------------------------------------------------

setwd("/home/fractaluser/Downloads")
dat <- read.csv("/home/fractaluser/Downloads/Clustering data.csv")
dat$Norm.CFR[dat$Norm.CFR=="(Empty)"] <- NA
dat$Norm.COV[dat$Norm.COV=="(Empty)"] <- NA
colSums(is.na(dat))
str(dat)
dat$Norm.CFR <- as.numeric(dat$Norm.CFR)
dat$Norm.COV <- as.numeric(dat$Norm.COV)
cleandat <- dat[,c(2:3)] #Removing DFUID column 
# set.seed(2)
# x=matrix(rnorm(50*2), ncol=2)
# x[1:25,1]=x[1:25,1]+3 # First 25 obs are just a mean shift relative to next 25 
# x[1:25,2]=x[1:25]-4

# corMatrix <- cor(cleandat[,1:4], use="complete.obs")
# corMatrix

# cleandat2 <- rep(0,711)
# cleandat2$Norm.CFR <- cleandat$Norm.CFR[which(!is.na(cleandat$Norm.CFR))]
wss <- (nrow(cleandat)-1)*sum(apply(cleandat,2,var))
for (i in 1:25) wss[i] <- sum(kmeans(cleandat, centers = i)$withinss)
plot(1:25, wss, type="b",xlab="No. of clusters",ylab="Within gps SS")
# Decide on 5 clusters 

km.out = kmeans(na.omit(cleandat),5,nstart = 20) # K-Means Code 
km.out
#Note: nstart > 1 means that the clustering will be performed using multiple random assignments & the kmeans() algorithm will choose only the best results  
km.out$cluster
dat$cluster[which(!is.na(dat$Norm.COV))] <- km.out$cluster
table(dat$cluster)
km.out

plot(dat$DFU, dat$cluster, pch=21)

plot(cleandat, col=(km.out$cluster+1), main = "K-means clustering results with K=5", pch=20,cex=2) # Cluster plot 

#If didn't know that 2 clusters, and tried 3 
set.seed(4)
km.out = kmeans(x, 3, nstart=20)
km.out

#How does nstart=1 compare to nstart=20?
set.seed(3)
km.out = kmeans(x, 3, nstart=1)
km.out$tot.withinss # 64.81 #
# Note that km.out$tot.withinss is the total within-cluster sum of squares, which we seek to minimize by performing K-means clustering

km.out = kmeans(x, 3, nstart=20)
km.out$tot.withinss # 51.74

#Generally prefer large value of nstart, otherwise an undesirable local optimum might be obtained


# CLUSTERING 

# PCA ---------------------------------------------------------------------

train <- read.csv("/home/fractaluser/Documents/BigMart/Train_UWu5bXk.csv")
test <- read.csv("/home/fractaluser/Documents/BigMart/Test_u94Q5KV.csv")
str(train)
test$Item_Outlet_Sales <- 1 #Add target column to test data as well
combi <- rbind(train, test) #Combine train & test data

colSums(is.na(combi))
# Item_Identifier               Item_Weight 
#                        0                      2439 
#         Item_Fat_Content           Item_Visibility 
#                        0                         0 
#                Item_Type                  Item_MRP 
#                        0                         0 
#        Outlet_Identifier Outlet_Establishment_Year 
#                        0                         0 
#              Outlet_Size      Outlet_Location_Type 
#                        0                         0 
#              Outlet_Type         Item_Outlet_Sales 
#                        0                         0 

#Item_Weight has 2439 missing values, lets impute with median
combi$Item_Weight[is.na(combi$Item_Weight)] <- median(combi$Item_Weight, na.rm = TRUE)

combi$Item_Visibility[combi$Item_Visibility==0] <- median(combi$Item_Visibility) #0 item visibility is meaningless, so lets impute with median
levels(combi$Item_Fat_Content)
# [1] "LF"      "low fat" "Low Fat" "reg"     "Regular"
combi$Item_Fat_Content <- as.character(combi$Item_Fat_Content)
combi$Item_Fat_Content[combi$Item_Fat_Content %in% c("LF","low fat","Low Fat")] <- "Low Fat"

combi$Item_Fat_Content[combi$Item_Fat_Content %in% c("reg","Regular")] <- "Regular"
combi$Item_Fat_Content <- as.factor(combi$Item_Fat_Content)


# Linear Mixed Effects Model ----------------------------------------------

# http://www.bodowinter.com/tutorial/bw_LME_tutorial2.pdf

library(lme4)
politeness <- read.csv("http://www.bodowinter.com/tutorial/politeness_data.csv")
names(politeness)
# [1] "subject"   "gender"    "scenario"  "attitude"  "frequency"
nrow(politeness) #84 
which(is.na(politeness$frequency)) #row 39 has a missing value
boxplot(frequency~gender*attitude, col=c("darksalmon","darkseagreen3"), data=politeness)
# The median frequency for females is higher than that of males

politeness.model <- lmer(frequency~attitude+(1|subject)+(1|scenario), data=politeness)
summary(politeness.model)

# Linear mixed model fit by REML ['lmerMod']
# Formula: frequency ~ attitude + (1 | subject) + (1 | scenario)
# Data: politeness

# REML criterion at convergence: 793.5

# Scaled residuals: 
#   Min      1Q  Median      3Q     Max 
# -2.2006 -0.5817 -0.0639  0.5625  3.4385 

# Random effects:
#   Groups   Name        Variance Std.Dev.
# scenario (Intercept)  219     14.80   
# subject  (Intercept) 4015     63.36   Much more variability than scenario
# Residual              646     25.42   
# Number of obs: 83, groups:  scenario, 7; subject, 6

# Fixed effects:
#   Estimate Std. Error t value
# (Intercept)  202.588     26.754   7.572
# attitudepol  -19.695      5.585  -3.527   Slope for categorical effect of politeness. Have to lower pitch by 19.695 Hz to go down from informal to polite 

# But intercept here is 202, which is halfway through male and female pitch, so need to add that as a fixed effect? Why as fixed and not random? Because relationship between sex and pitch is systematic and predictable, as we expect females to have a higher pitch. Diff fm random effects subject & item where relation with pitch much more unpredictable 

summary(politeness.model)

politeness.model <- lmer(frequency~attitude+gender+(1|subject)+(1|scenario), data=politeness)
summary(politeness.model)
# Now the varation associated with subject dropped considerably. Earlier the variation due to gender was being confounded with variation due to subject 


# Correlation of Fixed Effects:
#   (Intr)
# attitudepol -0.103
# Logistic Regression -----------------------------------------------------

# ROCR curve
library(ROCR)
library(caTools)
Carseats$High <- ifelse(Carseats$Sales>=8,1,0)
set.seed(1)
split <- sample.split(Carseats$High, SplitRatio = 0.75)
Carseats.train <- subset(Carseats,split==TRUE)
Carseats.test <- subset(Carseats, split==FALSE)

#Logistic regression Model
model1 <- glm(High~.-Sales, data=Carseats.train, family = binomial)
summary(model1)
# 
# Null deviance: 406.12  on 299  degrees of freedom
# Residual deviance: 114.68  on 288  degrees of freedom
# AIC: 138.68
# 
# Number of Fisher Scoring iterations: 7

#Deviance 
#  Deviance is a measure of goodness of fit of a generalized linear model. The null deviance shows how well the response variable is predicted by a model that includes only the intercept (grand mean). The Residual Deviance has reduced by 291.44 with a loss of 11 degrees of freedom.

# Fisher Scoring
# # Fisher’s scoring algorithm is a derivative of Newton’s method for solving maximum likelihood problems numerically.Doesn’t really tell you a lot that you need to know, other than the fact that the model did indeed converge, and had no trouble doing it.


## Hosmer Lemeshow Goodness of Fit 
install.packages("ResourceSelection")
library(ResourceSelection)
hoslem.test(Carseats.train$High, fitted(model1))
# Hosmer and Lemeshow goodness of fit (GOF) test
# 
# data:  Carseats.train$High, fitted(model1)
# X-squared = 0.59757, df = 8, p-value = 0.9997
# Our model appears to fit well because we have no significant difference between the model and the observed data (i.e. the p-value is above 0.05).

preds <- predict(model1, type = 'response')

#Confusion matrix 
table(Carseats.train$High, preds>0.5)
(168+109)/(169+9+14+109)# Accuracy 92.03% 

ROCRpred <- prediction(preds, Carseats.train$High)
ROCRperf <- performance(ROCRpred, 'tpr','fpr')
plot(ROCRperf, colorize=TRUE, text.adj=c(-0.2,1.7))

#plot glm
library(ggplot2)
ggplot(Carseats.train, aes(x=Income, y=High)) + geom_point() + 
  stat_smooth(method="glm", family="binomial", se=FALSE)



# LDA ---------------------------------------------------------------------
library(ISLR)
library(MASS)
names(Smarket)
# [1] "Year"      "Lag1"      "Lag2"      "Lag3"      "Lag4"     
# [6] "Lag5"      "Volume"    "Today"     "Direction"
dim(Smarket)
summary(Smarket)
pairs(Smarket)

train <- (Smarket$Year<2006)
lda.fit <- lda(Direction ~ Lag1 + Lag2, data=Smarket, subset=train)
lda.fit


# Prior probabilities of groups:
#   Down     Up 
# 0.4816 0.5184 
# 48.16% of training obs correspond to days during which the market went down

# Group means:
#   Lag1        Lag2
# Down  0.05068605  0.03229734
# Up   -0.03969136 -0.02244444
# These are the averages of each predictor within each class, used as estimates of Mu_k
# Shows that there is a tendency for previous 2 days' returns to be negative on days when the market increases, and tendency for previous day's returns to be positive on days when the market declines 

# Coefficients of linear discriminants:
#   LD1
# Lag1 -0.7567605
# Lag2 -0.4707872
# These coeff.s provide the linear combi of Lag1 & Lag2 that are used to form the LDA decision rule 

plot(lda.fit)

Smarket.2005 <- Smarket[!train,]
lda.pred <- predict(lda.fit, Smarket.2005)
names(lda.pred)

# KNN ---------------------------------------------------------------------



# 5 Resampling Methods ------------------------------------------------------


# 5.1 Validation Set Approach -------------------------------------------------
library(ISLR)
set.seed(1)
#Using the Auto dataset. 392 rows, 9 variables
train <- sample(392,196)
Automodel <- lm(mpg~horsepower, data=Auto, subset=train)
mean((Auto$mpg-predict(Automodel, Auto))[-train]^2) # 26.14
Automodel2 <- lm(mpg~poly(horsepower,2), data=Auto, subset=train)
mean((Auto$mpg-predict(Automodel2,Auto))[-train]^2)  # 19.82
Automodel3 <- lm(mpg~poly(horsepower, 3), data=Auto, subset=train)
mean((Auto$mpg-predict(Automodel3, Auto))[-train]^2) # 19.78


# 5.2 LOOCV ---------------------------------------------------------------


glmModel <- glm(mpg~horsepower, data=Auto) # Fitting lm() using glm()
coef(glmModel)
#Using glm because we can use with cv.glm()
library(boot)
cvError <- cv.glm(Auto, glmModel) #K not specified, so its LOOCV by default
cvError$delta
#delta is a vector os length 2. 1st component is raw CV est of pred error. 2nd component is adjusted CV est to compensate for bias introduced by not using LOOCV
cvErr <- rep(0,5)
for(i in 1:5){
  glmModel <- glm(mpg~poly(horsepower, i), data=Auto)
  cvErr[i] <- cv.glm(Auto, glmModel)$delta[1]
}
#Here delta's values differ slightly. Not identical as in LOOCV 
cvErr #[1] 24.23151 19.24821 19.33498 19.42443 19.03321




# 5.3 K-fold CV -----------------------------------------------------------

set.seed(17)
kfcvErr <- rep(0,10)
for(i in 1:10){
  kfglmMod<- glm(mpg~poly(horsepower,i), data=Auto)
  kfcvErr[i] <- cv.glm(Auto, kfglmMod, K=10)$delta[1]
} #Shorter runtime than LOOCV
kfcvErr
plot(kfcvErr) #Quadratic is good fit 


# 5.4 Bootstrap -----------------------------------------------------------

x =c(10,20,30,40, 50)
d = c(3,2,2)

x[d]
samplemean <- function(x,d){
  return(mean(x[d]))
}

b= boot(x,samplemean, R=1000)
# b$t is a matrix containing 1000 rows which holds all the results of estimation.
# The 1st column in it is the only thing being estimated by samplemedian(), which is the sample median.

plot(b)

# ESTIMATING ACCURACY OF LINEAR REGRESSION MODEL FROM BOOTSTRAP
# Lets compare variability of lin reg coeffs obtained from bootstrap to SEs from lin reg model itself

boot.fn = function(data, index)
  return(coef(lm(mpg~horsepower, data=Auto, subset=index)))


boot.fn(Auto, 1:392)

set.seed(1)
boot.fn(Auto, sample(392, 392, replace = T)) #Sampling with replacement 

boot(Auto, boot.fn, 1000) #Computing s.e.s of 1000 bootdtrap estimates for intercept and slope terms 
# Bootstrap Statistics :
#   original      bias    std. error
# t1* 39.9358610  0.02972191 0.860007896
# t2* -0.1578447 -0.00030823 0.007404467

#NOte: These differ from lin reg model s.e. estimates 
# No assumptions underlying bootstrap (unlike lin reg) 


# 6. Missing Value imputation ---------------------------------------------

data <- iris
summary(iris)
library(missForest)
library(mice)
library(VIM)

#Creating 10% missing values at random in the data
iris.mis <- prodNA(data, noNA=0.1)
summary(iris.mis)

#Remove categorical variables
iris.mis <- subset(iris.mis, select = -c(Species))

# 6.1 MICE Package --------------------------------------------------------
#Multivariate Imputation via Chained Equations 
# Assumes that data is missing at random (MAR),  which means that the probability that a value is missing depends only on the observed values and can be predicted using them
# Imputes data on a variable-by-variable basis by specifying an imputation model per variable
# e.g.: If X1, X2….Xk variables. If X1 has missing values, then it will be regressed on other variables X2 to Xk. The missing values in X1 will be then replaced by predictive values obtained. 
# Similarly, if X2 has missing values, then X1, X3 to Xk variables will be used in prediction model as independent variables. Later, missing values will be replaced with predicted values.
#Methods used:
#   1.PMM (Predictive Mean Modelling) - For numeric variables 
#   2.logreg (Logistic regression) - For factor (binary) variables 
#   3. polyreg (Bayesian polytomous regression) - For factor variables (>=2 levels)
#   4. Proportional odds model - Ordered (>=2 levels) 

#Generate tabular form of missing value patterns in each variable in a data set 
md.pattern(iris.mis)
#         Petal.Length Sepal.Length Sepal.Width Petal.Width   
# 96            1            1           1           1  0
# 9            1            0           1           1  1
# 14            1            1           0           1  1
# There are 96 obs with no missing values
# There are 9 obs with missing values in Sepal length


#Visually represent missing values
mice_plot <- aggr(iris.mis,col=c('blue','yellow'),numbers=TRUE,sortVars=TRUE,labels=names(iris.mis), cex.axis=0.7,gap=3, ylab=c("Missing data","Pattern"))

imputed_data <- mice(iris.mis, m=5, maxit=50, method = 'pmm', seed=500) #m: No. of imputed datasets 

summary(imputed_data)
#Check imputed values 
imputed_data$imp$Sepal.Width

#There are 5 imputed data sets so can select any using complete() function 
completed_data <- complete(imputed_data,2)

#Can also pool the results from all 5 datasets & obtain consolidated results 

fit <- with(data=iris.mis, exp=lm(Sepal.Width~Sepal.Length+Petal.Width))
fit
combined <- pool(fit)


# 6.2 Amelia Package ------------------------------------------------------

# Assumes:
#   1. All variables in data have multivariate normal distribution. Uses means & covs to summarize the data
#   2. Data is missing at random (MAR)

# Methodology
#   1. Takes m bootstrap samples to get m estimates of mean and variance 
#   2. Each set of estimates are used to impute each set of missing values 

# Shortcomings (vs MICE):
#   1. Joing modelling approach based on multivariate normal dist. Not a variable by variable basis
#   2. Variables in MVN need to be normally distributed or transformed to approximate normality
#   3. Cannot manage imputations based on a subset of the data, while MICE can


install.packages("Amelia")
library("Amelia")
data("iris")

iris.mis <- prodNA(iris, noNA=0.1)
summary(iris.mis)

# The only thing that you need to be careful about is classifying variables. It has 3 parameters:
# 1. idvars – keep all ID variables and other variables which you don’t want to impute
# 2. noms – keep nominal variables here

amelia_fit <- amelia(iris.mis, m=5, parallel = "multicore", noms="Species")

#Access imputed outputs
amelia_fit$imputations[[1]]

#To check a particular column
amelia_fit$imputations[[5]]$Sepal.Length
# Export outputs to a csv file
write.amelia(amelia_fit, file.stem = "imputed_data_set")


# 6.3 Package Hmisc -------------------------------------------------------
# Multiprupose package
# 2 powerful functions for omputing missing values:
# 1. impute(): Imputes missing values using user defined stat methods (default is median)
# 2. aregimpute(): Imputes missing values using additive regression, bootstrapping and predictive mean matching 

#Assumptions:
#   1. Assumes linearity in variables being predicted
#   2. Fisher's optimum scoring method is used for predicting categorical variables 

install.packages("Hmisc")
library("Hmisc")
#impute with mean value
iris.mis$imputed_1 <- with(iris.mis, impute(Sepal.Length, mean))
#impute with random values 
iris.mis$imputed_2 <- with(iris.mis, impute(Sepal.Length, 'random'))
# Similarly can use min, max, median

impute_arg <- aregImpute(~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width+Species, data=iris.mis, n.impute = 5)

impute_arg

# The output shows R² values for predicted missing values. Higher the value, better are the values predicted. You can also check imputed values using the following command

#check imputed variable Sepal.Length
impute_arg$imputed$Sepal.Length

# 7. 1 Poly Reg & Step Fns ------------------------------------------------

fit <- lm(wage~poly(age,4), data=Wage) #Fits a linear model to predict wage using 4th degree polynomial in age
coef(summary(fit))
Estimate Std. Error    t value     Pr(>|t|)
# (Intercept)    111.70361  0.7287409 153.283015 0.000000e+00
# poly(age, 4)1  447.06785 39.9147851  11.200558 1.484604e-28
# poly(age, 4)2 -478.31581 39.9147851 -11.983424 2.355831e-32
# poly(age, 4)3  125.52169 39.9147851   3.144742 1.678622e-03
# poly(age, 4)4  -77.91118 39.9147851  -1.951938 5.103865e-02
# Columns of this matrix are a basis of orthogonal polynomials. i.e. each column is a linear combination of the variables age, age^2, age^3 and age^4 

# Create a grid of values of age for which we want predictions 
agelimits <- range(Wage$age)
age.grid <- seq(agelimits[1], agelimits[2])

preds <- predict(fit, newdata = list(age=age.grid), se=TRUE)
se.bands <- cbind(preds$fit+2*preds$se.fit, preds$fit-2*preds$se.fit)

par(mfrow=c(1,2), mar=c(4.5, 4.5, 1, 1), oma=c(0,0,4,0))
plot(Wage$age, Wage$wage, xlim=agelimits, cex=0.5, col="darkgrey")
title("Degree-4 polynomial", outer=T)
lines(age.grid, preds$fit, lwd=2, col="blue")
matlines(age.grid, se.bands, lwd=1, col="blue",lty=3)

fit.1= lm (wage~age , data=Wage)
fit.2= lm(wage~poly ( age ,2) , data = Wage)
fit.3= lm (wage~poly ( age ,3) , data = Wage )
fit.4= lm (wage~poly ( age ,4) , data = Wage )
fit.5= lm (wage~poly ( age ,5) , data = Wage)
anova(fit.1 , fit.2 , fit.3 , fit.4 , fit.5)

# Res.Df     RSS Df Sum of Sq        F    Pr(>F)    
# 1   2998 5022216                                    
# 2   2997 4793430  1    228786 143.5931 < 2.2e-16 ***
#   3   2996 4777674  1     15756   9.8888  0.001679 ** 
#   4   2995 4771604  1      6070   3.8098  0.051046 .  
# 5   2994 4770322  1      1283   0.8050  0.369682    
# ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# The p-value comparing the linear Model 1 to the quadratic Model 2 is essentially zero (<10−15 ), indicating that a linear fit is not sufficient. Similarly the p-value comparing the quadratic Model 2 to the cubic Model 3 is very low (0.0017), so the quadratic fit is also insufficient. The p-value comparing the cubic and degree-4 polynomials, Model 3 and Model 4, is approximately 5 % while the degree-5 polynomial Model 5 seems unnecessary because its p-value is 0.37. Hence, either a cubic or a quartic polynomial appear to provide a reasonable fit to the data, but lower- or higher-order models are not justified.


#Now how to decide on the degree of the polynomial to use in a polynomial regression?
# Can do hypothesis tests using anova() fn, which performs an analysis of variance using F test in order to test the null hypothesis of the M1 model's sufficiency to explain the data against alternate hypothesis that more complex model M2 is required. M1 and M2 must be nested models, i.e. predictors in M1 must be a subset of predictors in M2
# 8.1 Regression Trees --------------------------------------------------------

library(tree)

#Fitting a regression tree on the Boston dataset, where we try to predict median value of 
#homes based on predictors like crime, % in lower socioecon status, pupil teacher ratio etc

library(MASS)
set.seed(1)
#Total data size is 506 rows with 14 columns
#Training dataN
train = sample(1:nrow(Boston), nrow(Boston)/2) #253 training observations

#Build the tree on training data
# tree() 
tree.boston <- tree(Boston$medv~., data=Boston, subset=train)
# Regression tree:
#   tree(formula = Boston$medv ~ ., data = Boston, subset = train)
# Variables actually used in tree construction:
#   [1] "lstat"(% from lower socioecon status)  "rm"(avg no. of rooms per dwelling) 
# "dis"(weighted mean of distances from 5 employmt centers) "ptratio"(pupil teacher ratio)
# Number of terminal nodes:  8 
# Residual mean deviance:  12.65 = 3099 / 245 (Deviance divided by n-|To|, )
# Distribution of residuals:
#   Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
# -14.10000  -2.04200  -0.05357   0.00000   1.96000  12.60000 
summary(tree.boston)

#Plotting the tree
plot(tree.boston)
text(tree.boston, pretty=0, cex=0.75)
#Interpreting:
# When lstat is lower, i.e. lower ppl from low socioecon status, higher house values
# For suburbs where residents have high socioeco status (lstat<9.7)
# and where house are larger (rm>7.44), we have highest pred value, $ 46,400

cv.boston <- cv.tree(tree.boston) 
cv.boston
# $size
# [1] 8 7 6 5 4 3 2 1
# 
# $dev
# [1]  5226.322  5228.360  6462.626  6692.615  6397.438  7529.846 11958.691 21118.139
# 
# $k
# [1]      -Inf  255.6581  451.9272  768.5087  818.8885 1559.1264 4276.5803 9665.3582
# 
# $method
# [1] "deviance"
# 
# attr(,"class")
# [1] "prune"         "tree.sequence"

plot(cv.boston$size, cv.boston$dev, type = "b") #Type "p" is for pts, "l" for lines and "b" for both
# Clearly minizes at a tree of size 8
#Cross validation also selects the most complex tree, size=8

#Now lets predict on the test set based on our tree
yhat <- predict(tree.boston, newdata = Boston[-train,])
mean((yhat-Boston[-train,"medv"])^2) #MSE = 25.05
#So sqrt of MSE of 5.005
#So test predictions are within aroud $5,005 of true median home value for the suburb
plot(yhat, Boston[-train,"medv"])
abline(0,1)



#If we still want to prune the tree to say 5 terminal nodes
prune.boston = prune.tree(tree.boston,best = 5)
plot(prune.boston)
text(prune.boston, pretty=0)
summary(prune.boston) #Gives residual mean deviance of 18.45, which is higher than 12 obtained from the unpruned 8-node tree

#_____________________________
# ISLR APPLIED EXERCISES
#____________________________
# Q. 8. Will predict sales using regression trees. Carseats data
# (a) Split data into training and test set
set.seed(1)
train <- sample(1:nrow(Carseats), nrow(Carseats)/2) # 50-50 train test
Carseats.train <- Carseats[train,]
Carseats.test <- Carseats[-train,]

# (b)  Fit a regression tree to the training set. Plot the tree, and interpret the results. What test error rate do you obtain?
Carseats.tree <- tree(Sales~., data=Carseats.train)
Carseats.tree
plot(Carseats.tree)
text(Carseats.tree, pretty=0)


# Train error seems to minimize at a size of 2 leaves
yhat <- predict(Carseats.tree, newdata = Carseats.test)
mean((yhat-Carseats.test$Sales)^2) # 2.793 is test MSE 

# (c) Use cross-validation in order to determine the optimal level of tree complexity. Does pruning the tree improve the test error rate?
Carseats.cv.tree <- cv.tree(Carseats.tree)
plot(Carseats.cv.tree$size, Carseats.cv.tree$dev, type="b")
Carseats.cv.tree
tree.min <- which.min(min(Carseats.cv.tree$dev)) #1, i.e. 1st tree with 12 splits 
points(tree.min, Carseats.cv.tree$dev[tree.min],col="red", cex=2, pch=20)
Carseats.pruned <- prune.tree(Carseats.tree, best=3)
plot(Carseats.pruned)
text(Carseats.pruned, cex=0.75, pretty=0)
yhat <- predict(Carseats.pruned, newdata = Carseats.test)
mean((yhat-Carseats.test$Sales)^2) # 2.92

# (d) Use the bagging approach in order to analyze this data. What test error rate do you obtain? Use the importance() function to determine which variables are most important.

bag.carseats <- randomForest(Sales~., data=Carseats.train, mtry=10, ntree=500, importance=TRUE)

yhat.bag <- predict(bag.carseats, newdata = Carseats.test)
mean((yhat.bag-Carseats.test$Sales)^2) # Bagging reduces test MSE to 2.56 
importance(bag.carseats)
#Price and SelveLoc are the 2 most imp variables 

# (e) Use random forests to analyze this data. What test error rate do you obtain? Use the importance() function to determine which variables are most important. Describe the effect of the number of variables considered at each split, on the error rate obtained.
rf.carseats <- randomForest(Sales~., data=Carseats.train, mtry=3, ntree=500, importance=TRUE)
yhat.rf <- predict(rf.carseats, newdata = Carseats.test)
mean((yhat.rf-Carseats.test$Sales)^2) # 3.37 MSE with mtry=sqrt(10)=3)

# Q.9. 
#_______________________________
# Regression Tree from ADAfEPoV
#_______________________________
calif = read.table("http://www.stat.cmu.edu/~cshalizi/350/hw/06/cadata.dat",
                   header = TRUE)

treefit <- tree(log(MedianHouseValue)~Latitude+Longitude, data=calif)
summary(treefit2)
plot(treefit)
text(treefit, pretty=0, cex=0.75, digits=3)

price.deciles <- quantile(calif$MedianHouseValue, 1:10/10)
cut.prices <- cut(calif$MedianHouseValue,price.deciles, include.lowest = TRUE)
plot(calif$Longitude, calif$Latitude, col=grey(10:2/11)[cut.prices], pch=20, xlab = "Longitude", ylab = "Longitude")

partition.tree(treefit, ordvars = c("Longitude","Latitude"), add = TRUE)

# mindev (default=0.01) controls how much the error is reduced by adding a node.
treefit2 <- tree(log(MedianHouseValue)~Longitude+Latitude, data=calif, mindev=0.001)

#Trying all variables
train <- sample(nrow(calif),nrow(calif)/2)
calif.test <- calif[-train,]
treefit3 <- tree(log(MedianHouseValue)~., data=calif, subset=train)
plot(treefit3)
text(treefit3, cex=0.75, pretty=0)
summary(treefit3)
yhat <- predict(treefit3, newdata=calif.test)
mean((yhat-calif.test$MedianHouseValue)^2)
treefit3.cv <- cv.tree(treefit3)
plot(treefit3.cv$size, treefit3.cv$dev, type="b") #Min around 12 trees 
prune.tree(treefit3, best=12)
prune.tree(treefit3, best=12,newdata=calif.test)
mytreeseq <- prune.tree(treefit3)
plot(mytreeseq)
mytreeseq$dev
opt.trees <- which(mytreeseq$dev==min(mytreeseq$dev))
opt.trees
best.leaves <- min(treefit3.cv$size[opt.trees])
best.leaves #12
treefit3.pruned <- prune.tree(treefit3, best = best.leaves)
plot(treefit3.pruned)
text(treefit3.pruned, cex=0.75)

plot(calif) 

# The function prune.tree takes a tree you fit by tree , and evaluates error of the tree and various prunings of the tree, all the way down to the stump. The # evaluation can be done either on new data, if supplied, or on the training data (the
#default). If you ask it for a particular size of tree, it gives you the best pruning of that size 3 . If you don’t ask it for the best tree, it gives an object which shows the number of leaves in the pruned trees, and the error of each one. This object can be plotted.

# my.tree = tree(y ~ x1 + x2, data = my.data)
# prune.tree(my.tree, best = 5)
# prune.tree(my.tree, best = 5, newdata = test.set)
# my.tree.seq = prune.tree(my.tree)
# plot(my.tree.seq)
# my.tree.seq$dev
# opt.trees = which(my.tree.seq$dev == min(my.tree.seq$dev))
# min(my.tree.seq$size[opt.trees])

# 8.2 Classification Trees -----------------------------------------------------
#Missing values?
#Do we need to transform any of the variables?

library(ISLR)
library(MASS)
library(tree)


#Reassign sales as a categorical variable "High"
High <- ifelse(Carseats$Sales<=8, "No", "Yes")
Carseats <- data.frame(Carseats[,-c(1)], High)
tree.Carseats <- tree(Carseats$High~., data=Carseats) #Run tree on all cols except sales 
summary(tree.Carseats)
plot(tree.Carseats)
text(tree.Carseats, pretty=0)
tree.Carseats

#With train and test 
set.seed(2)
train <- sample(1:nrow(Carseats),200) #Training sample of 200 obs
Carseats.test <- Carseats[-train,] #Test group
High.test <- High[-train] #Response for test group

tree.Carseats <- tree(High~., data = Carseats, subset = train) #Tree on training data

tree.pred <- predict(tree.Carseats, newdata = Carseats.test, type="class")
table(tree.pred, High.test)
# High.test
# tree.pred No Yes
# No  86  27
# Yes 30  57

#Accuracy = (86+57)/200 = 0.715

#______________________
# ISLR APPLIED EXERCISES
#_______________________

# 3. Consider the Gini index, classification error, and cross-entropy in a simple classificatIon setting with two classes. Create a single plot # that displays each of these quantities as a function of p ˆ m1. The x- axis should display p ˆ m1 , ranging from 0 to 1, and the y-axis should display the value of the Gini index, classification error, and entropy. Hint: In a setting with two classes, p ˆ m1 = 1 − p ˆ m2 . You could make this plot by hand, but it will be much easier to make in R.
p = seq(from=0, to=1, by=0.01)
giniindex = 2*p*(1-p)
crossentropy = -(p*log(p)+(1-p)*log(1-p))
classificationerror = 1-pmax(p, 1-p)
matplot(p, cbind(giniindex, crossentropy, classificationerror), col=c("red","blue","green"))

# Q.9 9. This problem involves the OJ data set which is part of the ISLR package.
# (a) Create a training set containing a random sample of 800 observations, and a test set containing the remaining observations.
str(OJ)
train <- sample(nrow(OJ),800)
OJ.train <- OJ[train,]
OJ.test <- OJ[-train,]

# (b) Fit a tree to the training data, with Purchase as the response and the other variables except for Buy as predictors. Use the summary() function to prouce summary statistics about the tree, and describe the results obtained. What is the training error rate? How many terminal nodes does the tree have?
tree.oj <- tree(Purchase~., data=OJ.train)
summary(tree.oj) #Tree has 8 terminal nodes 
#Training error rate is 
130/800 #16.25% 

# (c) Type in the name of the tree object in order to get a detailed text output. Pick one of the terminal nodes, and interpret the information displayed.
tree.oj
# 7) LoyalCH > 0.764572 257   71.26 CH ( 0.96887 0.03113 ) *
#Picked node 7 which is terminal leaf (has asterisk) 
# Split criterion is LoyalCH>0.764, there are 257 obs in that leaf, the deviance is 10.07 and overall prediction for that branch is CH. Less than 3% of obs in that leaf have value MM, rest have CH


# (d) Create a plot of the tree, and interpret the results.
plot(tree.oj)
text(tree.oj, cex=0.75, pretty=0)
#Most imp predictor of purchase appears to be LoyalCH. In fact top 3 nodes contain LoyalCH


# (e) Predict the response on the test data, and produce a confusion matrix comparing the test labels to the predicted test labels. What is the test error rate?
yhat <- predict(tree.oj, newdata=OJ.test, type = "class")
table(yhat, OJ.test$Purchase)
# yhat  CH  MM
# CH 147  27
# MM  19  77
(27+19)/270 # Test error rate is 17.04% 

# (f) Apply the cv.tree() function to the training set in order to determine the optimal tree size.

oj.cv <- cv.tree(tree.oj, FUN = prune.misclass)
oj.cv

# (g) Produce a plot with tree size on the x-axis and cross-validated classification error rate on the y-axis.
plot(oj.cv$size, oj.cv$dev, xlab="Tree size", ylab="Deviance", type="b")

# (h) Which tree size corresponds to the lowest cross-validated classification error rate?
The 2-node tree seems to be the smallest tree with lowest classification error rate 

# (i) Produce a pruned tree corresponding to the optimal tree size obtained using cross-validation. If cross-validation does not lead to selection of a pruned tree, then create a pruned tree with five terminal nodes.
oj.prune <- prune.tree(tree.oj, best=2)
plot(oj.prune)
text(oj.prune, pretty=0, cex=0.75)

# (j) Compare the training error rates between the pruned and unpruned trees. Which is higher?
summary(tree.oj) # training err rate is 130/800 = 16.25%
summary(oj.prune) # training err rate is 130/800 = 18.62%
# Misclass error slightly higher for pruned tree

# (k) Compare the test error rates between the pruned and unpruned trees. Which is higher?
prune.yhat <- predict(oj.prune, newdata = OJ.test, type = "class")
table(yhat, OJ.test$Purchase) # 17.04%
table(prune.yhat, OJ.test$Purchase) #24.8% 
# In this case, the pruning process increased the test error rate to about 25%, but it produced a way more interpretable tree.


# 8.3 Bagging -------------------------------------------------------------

library(randomForest)
library(hmeasure)
library(StatMeasures)
set.seed(1)

#Same commane for randomForest & Bagging. But bagging is mtry=all variables
bag.Boston <- randomForest(medv~., data=Boston, subset=train, mtry=13, importance=TRUE) #Setting mtry=13 to include all predictors in making the split. Default number of trees is already 500.
bag.Boston

yhat.bag.Boston <- predict(bag.Boston, newdata = Boston[-train,])
mean((yhat.bag.Boston-Boston[-train,"medv"])^2)
importance(bag.Boston)
# %IncMSE IncNodePurity    
# crim    12.536631     664.55142
# zn       2.145881      24.02478
# indus    7.037060      90.65980
# chas    -1.741527      38.69733
# nox      5.527521     129.88161
# rm      35.994059    6047.15113
# age      8.728854     346.57692
# dis     18.360245    1517.04400
# rad      3.917899      94.46401
# tax      9.118393     215.52131
# ptratio  9.547187     289.53441
# black    3.166552     236.05967
# lstat   40.719293    7692.90761
# %IncMSE explains how much MSE increases (Acc decreases) wn tht variable excluded fm the model)
# IncNodePurity explains how much the node impurity decreases with a split on tht variable, avgd over all trees

varImpPlot(bag.Boston)


# 8.4 Random Forest -------------------------------------------------------
#Default mtry is sqrt(p) for r.f. of classification trees and p/3 for r.f.  of regression trees
rf.Boston <- randomForest(medv~., data=Boston, subset=train, mtry=6, importance=TRUE)

rf.Boston
yhat.rf.Boston <- predict(rf.Boston, newdata = Boston[-train,])
mean((yhat.rf.Boston-Boston[-train,"medv"])^2)
varImpPlot(rf.Boston)

#Carseats Data
Carseats$High <- ifelse(Carseats$Sales>=8,"Yes","No")
Carseats$High <- as.factor(Carseats$High)
train <- sample(nrow(Carseats),nrow(Carseats)/2)
Carseats.train <- Carseats[train,] 
Carseats.test <- Carseats[-train,]
rf.Carseats <- randomForest(High~.-Sales, data=Carseats.train, mtry=3, importance=TRUE)
rf.Carseats
yhat.rf.Carseats <- predict(rf.Carseats, newdata=Carseats.test)
yhatprobs.rf.Carseats <- predict(rf.Carseats, newdata=Carseats.test, type = "prob")

# KS stat
actvspred(as.numeric(Carseats.test$High), yhatprobs.rf.Carseats[,2], 10) #Takes in actual, predicted linear response and quantile value, and returns average actual and predicted response in each quantile
ks(as.numeric(Carseats.test$High), yhatprobs.rf.Carseats[,2])

# LIFT, chart also
# Classification performace
accuracy(Carseats.test$High, yhatprobs.rf.Carseats[,2],cutoff=0.5)

# VIFs

# 8.5 Boosting ------------------------------------------------------------

#Function gbm() with distribution="gaussian"for reg problm and "bernoulli" for classfn problm
# n.trees indicates how many trees we want
# interaction.depth limits depth of each tree
# shrinkage specifies the shrinkage parameter, default is 0.001

library(gbm)
set.seed(1)
boost.Boston <- gbm(medv~., data=Boston[train,], n.trees=5000, interaction.depth = 4, distribution = "gaussian", verbose=T) #Default shrinkage=0.001
boost.Boston
summary(boost.Boston) #produces relative influence plot and outputs rel infl statistics

#Partial dependence plots
#Illustrate marginal effect of selected variables on reponse aftr integrating out the other variables 
par(mfrow=c(1,2))
plot(boost.Boston,i="lstat")
plot(boost.Boston,i="rm")
yhat.boost.Boston <- predict(boost.Boston, newdata = Boston[-train,], n.trees = 5000)
mean((yhat.boost.Boston-Boston[-train,"medv"])^2) #15.33

#With shrinkage parameter also specified
boost.Boston2 <- gbm(medv~., data=Boston[train,], distribution="gaussian", n.trees=5000, interaction.depth = 4, shrinkage = 0.2, verbose=T)
yhat.boost.Boston2 <- predict(boost.Boston2, newdata = Boston[-train,], n.trees = 5000)
mean((yhat.boost.Boston2-Boston[-train,"medv"])^2) #14.47 

#____________________________________________
# ISLR APplied Exercises 
#___________________________________________
#Q  10. We now use boosting to predict Salary in the Hitters data set.
# (a) Remove the observations for whom the salary information is unknown, and then log-transform the salaries.
hitters <- na.omit(Hitters) #59 obs removed 
hitters$Salary <- log(hitters$Salary)

# (b) Create a training set consisting of the first 200 observations, and a test set consisting of the remaining observations.
train <- 1:200
hitters.train <- hitters[train,]
hitters.test <- hitters[-train,]

# (c) Perform boosting on the training set with 1,000 trees for a range of values of the shrinkage parameter λ. Produce a plot with different shrinkage values on the x-axis and the corresponding training set MSE on the y-axis.
library(gbm)
set.seed(1)
powers <- seq(-10,-0.2,by=0.1)
lambdas <- 10^powers
train.err <- rep(NA, length(lambdas))
for(i in 1:length(lambdas)){
  hitters.boost <- gbm(Salary~., data = hitters.train, distribution="gaussian", n.trees = 1000, shrinkage = lambdas[i])
  pred.train <- predict(hitters.boost, hitters.train, n.trees=1000)
  train.err[i] <- mean((pred.train-hitters.train$Salary)^2)
}

plot(lambdas, train.err, type="b", xlab="Shrinkage parameter", ylab="Train MSE")

# (d) Produce a plot with different shrinkage values on the x-axis and the corresponding test set MSE on the y-axis.
test.err <- rep(NA, length(lambdas))
for(i in 1:length(lambdas)){
  hitters.boost <- gbm(Salary~., data = hitters.test, distribution="gaussian", n.trees = 1000, shrinkage = lambdas[i])
  pred.test <- predict(hitters.boost, hitters.test, n.trees=1000)
  test.err[i] <- mean((pred.test-hitters.test$Salary)^2)
}

plot(lambdas, test.err, type="b", xlab="Shrinkage parameter", ylab="test MSE")
min(test.err)
lambdas[which.min(test.err)] # The minimum test MSE is 0.25, and is obtained for λ=0.079λ=0.079.

# (e) Compare the test MSE of boosting to the test MSE that results from applying two of the regression approaches seen in Chapters 3 and 6.
library(glmnet)
fit1 <- lm(Salary ~ ., data = hitters.train)
pred1 <- predict(fit1, hitters.test)
mean((pred1 - hitters.test$Salary)^2) ## [1] 0.4917959

x <- model.matrix(Salary ~ ., data = Hitters.train)
x.test <- model.matrix(Salary ~ ., data = Hitters.test)
y <- Hitters.train$Salary
fit2 <- glmnet(x, y, alpha = 0)
pred2 <- predict(fit2, s = 0.01, newx = x.test)
mean((pred2 - Hitters.test$Salary)^2) # [1] 0.4570283
# The test MSE for boosting is lower than for linear regression and ridge regression.

# (f) Which variables appear to be the most important predictors in the boosted model?
boost.hitters <- gbm(Salary~., data=hitters.train, distribution = "gaussian", n.trees = 1000, shrinkage = lambdas[which.min(test.err)])
summary(boost.hitters) #We may see that “CAtBat” is by far the most important variable.

# (g) Now apply bagging to the training set. What is the test set MSE for this approach?
bag.hitters <- randomForest(Salary~., data=hitters.train, mtry=19, ntree=500)
yhat.bag <- predict(bag.hitters,newdata = hitters.test)
mean((yhat.bag-hitters.test$Salary)^2) #The test MSE for bagging is 0.23, which is slightly lower than the test MSE for boosting.


# Q 11. This question uses the Caravan data set.
# (a) Create a training set consisting of the first 1,000 observations, and a test set consisting of the remaining observations.
train <- 1:1000
Caravan$Purchase <- ifelse(Caravan$Purchase=="Yes",1,0)
caravan.train <- Caravan[train,] 
caravan.test <- Caravan[-train,]

# (b) Fit a boosting model to the training set with Purchase as the response and the other variables as predictors. Use 1,000 trees, and a shrinkage value of 0.01. Which predictors appear to be the most important?
caravan.boost <- gbm(Purchase~., data=caravan.train, n.trees = 1000, shrinkage = 0.01,distribution="bernoulli")
summary(caravan.boost)
# The variables “PPERSAUT” and “MKOOPKLA” are the two most important variables.

# (c) Use the boosting model to predict the response on the test data. Predict that a person will make a purchase if the estimated probability of purchase is greater than 20 %. Form a confusion matrix. What fraction of the people predicted to make a purchase do in fact make on ? How does this compare with the results obtained from applying KNN or logistic regression to this data set?
probs.test <- predict(caravan.boost, newdata = caravan.test, n.trees = 1000, type="response")
preds.test <- ifelse(probs.test>0.2,1,0)
table(caravan.test$Purchase, preds.test)
# preds.test
#     0    1
# 0 4405  128
# 1  256   33

33/(33+128)# For boosting, the fraction of people predicted to make a purchase that in fact make one is 0.2049689


#Applying logistic regression
logit.caravan <- glm(Purchase~., data=caravan.train, family="binomial")
probs.test2 <- predict(logit.caravan, newdata = caravan.test, type="response")
pred.test2 <- ifelse(probs.test2 > 0.2, 1, 0)
table(caravan.test$Purchase, pred.test2)
# pred.test2
#     0    1
# 0 4183  350
# 1  231   58
58/(58+350) #For logistic regn, fraction of people predicted to make a purchase that in fact make one if 14.2% 

# GBM from "A working guide to Boosted Trees" (Elith, Leathwick & Hastie)
# Load custom commands from the BRT paper code provided:
source('~/Documents/WorkingGuidetoBoostedTrees/brt.functions.R', encoding = 'UTF-8')

library(gbm)
model.data <- read.csv("/home/fractaluser/Documents/WorkingGuidetoBoostedTrees/data/model.data.csv", as.is=TRUE)
View(model.data) #1000 rows of 14 variables (1000 sites with presence absence)
#column Angaus specifies presence/absence of Anguilla Australis
str(model.data)



# 9 Ensembling ------------------------------------------------------------


# 9.1 Ensembles -----------------------------------------------------------


library(caret)
set.seed(1)
data <- read.csv(url('https://datahack-prod.s3.ap-south-1.amazonaws.com/train_file/train_u6lujuX_CVtuZ9i.csv'))
str(data)
sum(is.na(data)) # 86 

#Impute missing values using median
preProcValues <- preProcess(data, method=c("medianImpute","center","scale"))
library(RANN)
data_processed <- predict(preProcValues, data)
sum(is.na(data_processed)) #0, so now no NAs 

# Split dataset into 2 parts based on outcome: 75% and 25% 
index <- createDataPartition(data_processed$Loan_Status, p=0.75, list=FALSE)
trainSet <- data_processed[index,]
testSet <- data_processed[-index,]

fitControl <- trainControl(method = "cv",number = 5, savePredictions = "final", classProbs = T)

predictors <- c('ApplicantIncome','CoapplicantIncome','LoanAmount','Loan_Amount_Term','Credit_History')
outcomeName <- 'Loan_Status'

#Random forest model
model_rf <- train(trainSet[,predictors], trainSet[,outcomeName], method='rf',trControl=fitControl, tuneLength=3)

testSet$pred_rf <- predict(object = model_rf, testSet[,predictors])

#Checking accuracy
confusionMatrix(testSet$Loan_Status, testSet$pred_rf)

# KNN Model
model_knn <- train(trainSet[,predictors], trainSet[,outcomeName], method='knn', trControl=fitControl, tuneLength=3)

testSet$pred_knn <- predict(object=model_knn, testSet[,predictors])

#Checking accuracy
confusionMatrix(testSet$Loan_Status, testSet$pred_knn)

#Logistic Regression Model
model_lr <- train(trainSet[,predictors], trainSet[,outcomeName], method='glm',trControl=fitControl, tuneLength=3)

testSet$pred_lr <- predict(object = model_lr, testSet[,predictors])

confusionMatrix(testSet$Loan_Status, testSet$pred_lr)

# Ensembling by Averaging predictions 
testSet$pred_rf_prob <- predict(object = model_rf, testSet[,predictors], type='prob')[,2]
testSet$pred_knn_prob <- predict(object = model_knn, testSet[,predictors], type='prob')[,2]
testSet$pred_lr_prob <- predict(object=model_lr, testSet[,predictors], type='prob')[,2]

testSet$pred_avg <- (testSet$pred_rf_prob+testSet$pred_knn_prob+testSet$pred_lr_prob)/3
testSet$pred_avg_YN <- ifelse(testSet$pred_avg>0.5,"Y","N")
testSet$pred_avg_YN <- as.factor(testSet$pred_avg_YN)

# Ensembling by Majority Voting 

testSet$pred_majority <- as.factor(
  ifelse(testSet$pred_rf=="Y" & testSet$pred_knn=="Y","Y",
         ifelse(testSet$pred_rf=="Y" & testSet$pred_lr=="Y","Y",
                ifelse(testSet$pred_knn=="Y" & testSet$pred_lr=="Y","Y","N"))))

# Weighted average
# Assign weight of 0.5 to LR predictions and 0.25 to RF and KNN

testSet$pred_weighted_avg <- (testSet$pred_rf_prob*0.25)+(testSet$pred_lr_prob*0.5)+(testSet$pred_knn_prob*0.25)

testSet$pred_weighted_avg <- as.factor(ifelse(testSet$pred_weighted_avg>0.5,'Y','N'))


# 9.2 Stacking ------------------------------------------------------------

# Using a ML model for training the preds of the bottom layer predictions 

# 1. Train indvl base layer models on training data 
fitControl <- trainControl(
  method='cv',
  number=10,
  savePredictions = 'final', #To save out of fold predictions for the best parm combos
  classProbs = T #To save class probabilities of the Out of Fold predictions 
)

predictors <- c("ApplicantIncome","CoapplicantIncome","LoanAmount","Loan_Amount_Term","Credit_History")

outcomeName <- 'Loan_Status'

model_rf <- train(trainSet[,predictors], trainSet[,outcomeName], method='rf', trControl=fitControl, tuneLength=3)

model_knn <- train(trainSet[,predictors], trainSet[,outcomeName], method='knn',trControl=fitControl, tuneLength=3)

model_lr <- train(trainSet[,predictors], trainSet[,outcomeName], method='glm', trControl=fitControl, tuneLength=3)

# Predicting out of fold pred probs for training data
trainSet$OOF_pred_rf <- model_rf$pred$Y[order(model_rf$pred$rowIndex)]
trainSet$OOF_pred_knn <- model_knn$pred$Y[order(model_knn$pred$rowIndex)]
trainSet$OOF_pred_lr <- model_lr$pred$Y[order(model_lr$pred$rowIndex)]

# Prediciting probs for test data
testSet$OOF_pred_rf <- predict(object = model_rf, testSet[,predictors], type='prob')

# 10 SVM ------------------------------------------------------------------

# SVR ---------------------------------------------------------------------

data <- read.csv("/home/fractaluser/Documents/svm.csv", header = TRUE)
head(data)
plot(data, main="Scatter Plot")
model <- lm(Y~X, data) #Fit model using OLS
abline(model)

predY <- predict(model, data)
plot(data, pch=16)
points(data$X, predY, col="blue", pch=16)

RMSE <- sqrt(mean((data$Y - predY)^2)) #0.9410077 
#Fit SVR model and visualize using scatter plot 
library(e1071)
modelsvm <- svm(Y~X, data)
predYsvm <- predict(modelsvm, data)
plot(data)
points(data$X, predYsvm, col="red", pch=16)
RMSEsvm <- sqrt(mean(((data$Y-predYsvm)^2))) # 0.4339366

### Tuning SVR model by varying values of maximum allowable error and cost parameter
OptModelsvm <- tune(svm, Y~X, data=data, ranges = list(elsilon=seq(0,1,0.1), cost=1:100))
print(OptModelsvm)
plot(OptModelsvm)

#Find the best model
BestModel <- OptModelsvm$best.model
BestModel
predYBest <- predict(BestModel, data)
RMSEBestModel <- sqrt(mean((data$Y - predYBest)^2))
RMSEBestModel # 0.2708242


# Time Series -------------------------------------------------------------

kings <- scan("https://robjhyndman.com/tsdldata/misc/kings.dat",skip=3)
kings
kingstimeseries <- ts(kings)
kingstimeseries

births <- scan("https://robjhyndman.com/tsdldata/data/nybirths.dat") #Births per month in NY fm Jan 1946 to Dec 1959
births
birthstimeseries <- ts(births, frequency = 12, start = c(1946,1))
birthstimeseries

souvenir <- scan("https://robjhyndman.com/tsdldata/data/fancy.dat") #monthly sales for a souvenir shop at a beach resort town in Queensland, Australia, for January 1987-December 1993

souvenirtimeseries <- ts(souvenir, frequency = 12, start=c(1987, 1))
souvenirtimeseries

# PLOTTING TIME SERIES 
plot.ts(kingstimeseries)
plot.ts(birthstimeseries)
plot.ts(souvenirtimeseries) #Size of seasonal fluctuations and random fluctuations seem to increase with the level of the time series. May need to transform the ts

logsouvenirtimeseries <- log(souvenirtimeseries)
plot.ts(logsouvenirtimeseries) #Now the size of seasonal fluctuations and random fluctuations in the log-transformed series seem roughly constant over time and don't depend on the level of the ts 

# DECOMPOSING A TIME SERIES 
# Into trend, seasonal, irregular components
# SMA() function in TTR package can be used to smooth ts using simple moving average 
library(TTR)
kingstimeseriesSMA3 <- SMA(kingstimeseries, n=3) #SMA of order 3
plot.ts(kingstimeseriesSMA3) # Still a lot of random fluctuations. Try higher order
kingstimeseriesSMA8 <- SMA(kingstimeseries, n=8)
plot.ts(kingstimeseriesSMA8) # Gives a clearer picture of the trend component. Age of death of the English kings seems to have decreased from about 55 years old to about 38 years old during the reign of the first 20 kings, and then increased after that to about 73 years old by the end of the reign of the 40th king in the time series


birthstimeseriescomponents <- decompose(birthstimeseries)
plot(birthstimeseriescomponents)

# To seasonally adjust the time series
birthstimeseriesseasonallyadjusted <- birthstimeseries - birthstimeseriescomponents$seasonal

plot(birthstimeseriesseasonallyadjusted)

# Forecasts using exponential smoothing 
# If a ts can be described using additive model wt constant level & no seasonality, can use simple exponential smoothing to make short-term f.c.s
# parameter alpha: if close to 0 then little weight on latest obs while making fc of future obs 

rain <- scan("https://robjhyndman.com/tsdldata/hurst/precip1.dat",skip=1) #total annual rainfall in inches London, from 1813-1912
raints <- ts(rain, start=c(1823))
plot.ts(raints) # Roughly constant level. Random also are roughly similar over time

# HOLT WINTERS
# Makes f.c.s using simple exponential smoothing 
raintsforecasts <- HoltWinters(raints, beta = FALSE, gamma = FALSE) # beta=1 for exponential smoothing. gamme=1 for fitting seasonal model
raintsforecasts
# Smoothing parameters:
#   alpha: 0.02412151   This is close to 0. F.c.s are based on both recent & less recent obs
# beta : FALSE
# gamma: FALSE
# 
# Coefficients:
#   [,1]
# a 24.67819

raintsforecasts$fitted
plot(raintsforecasts) # Fc is in red line 
raintsforecasts$SSE #[1] 1828.855

# First value in the ts is by default as initial value for level. Can separately specify diff value for initial level as below:
raintsforecasts2 <- HoltWinters(raints, beta = FALSE, gamma=FALSE, l.start = 23)

# To f.c. Holt Winter model preds, need forecast() fn fm library forecast
library(forecast)
raintsforecasts3 <- forecast(raintsforecasts, h=20) # h=How many further time pts you want to mk prediction fr
plot(raintsforecasts3) #Here the forecasts for 1913-1920 are plotted as a blue line, the 80% prediction interval as an dark gray shaded area,and the 95% prediction interval as a gray shaded area

#If the predictive model cannot be improved upon, there should be no correlations between forecast errors for successive predictions. Correlogram of the forecast errors using the “acf()” function in R.

acf(raintsforecasts3$residuals, na.action = na.pass, lag.max = 10) # Autocorrelation at lag 3 is just touching the significance bounds.

# LJUNG BOX TEST using Box.test()
# Test for significance of autocorrelations at lags 1-20 
Box.test(raintsforecasts3$residuals, lag=20, type = "Ljung-Box")
# data:  raintsforecasts3$residuals
# X-squared = 17.401, df = 20, p-value = 0.6268
# Null hyp: No autocorrel. Obs are independent 
# LB test stat is 17.401 and p-value is large at 0.63 so can't reject null of zero autocorrelations. There is no dependence between in-sampel residuals at lags 1-20 
#The Simple Exponential Smoothing method thus provides an adequate predictive model for London rainfall

plot.ts(raintsforecasts3$residuals)

# TO check whether f.c. errors normally distributed with mean zero, can plot hist of f.c. errors with overlaid normal curve 

plotForecastErrors <- function(forecasterrors){
  thebinsize <- IQR(forecasterrors, na.rm = TRUE)/4
  thesd <- sd(forecasterrors, na.rm = TRUE)
  themin <- min(forecasterrors, na.rm = TRUE)-thesd*5
  themax <- max(forecasterrors, na.rm = TRUE)+thesd*3
  #Generate normally distributed data with mean 0 and sd=thesd
  thenorm <- rnorm(10000, mean=0, sd=thesd)
  themin2 <- min(thenorm)
  themax2 <- max(thenorm)
  if (themin2 < themin) {themin <- themin2}
  if (themax2 > themax) {themax <- themax2}
  #Make a red hist of fc errors with norm dist overlaid
  thebins <- seq(themin, themax, thebinsize)
  hist(forecasterrors, col="red", freq=FALSE, breaks=thebins)
  #freq=FALSE ensures area under curve is 1 
  thehist <- hist(thenorm, plot=FALSE, breaks=thebins)
  points(thehist$mids, thehist$density, type="l", col="blue", lwd=2)
}

plotForecastErrors(raintsforecasts3$residuals) #Dist of fc errors roughly centred on 0, mostly normally distributed 

# ARIMA MODELS 
# Exponential smoothing methods make no assumptions about correlations between successive values of fc errors. But prediction intervals require the fc errors to be uncorrelated and normally dist with mean 0 and constant variance
# ARIMA models icnlude explicit statistical model for irregular component of ts tht allows for non-0 autocors
# diff() fn can be used to difference a ts 
skirts <- scan("https://robjhyndman.com/tsdldata/roberts/skirts.dat",skip=5) #TS with trend and no seasonality is the time series of the annual diameter of women’s skirts at the hem, from 1866 to 1911. T
skirtsts <- ts(skirts, start=c(1866))
plot.ts(skirtsts)
skirtstsdiff1 <- diff(skirtsts, differences = 1)
plot.ts(skirtstsdiff1) #Still doesn't appear stationary in mean
skirtstsdiff2 <- diff(skirtsts, differences = 2)
plot.ts(skirtstsdiff2) #This appears mean as well as variance stationary 


#Similarly, king's deaths ts are not appearing mean stationary
kingstimeseriesdiff1 <- diff(kingstimeseries, differences = 1)
plot.ts(kingstimeseriesdiff1) #Appears mean and variance stationary

# Selecting a candidate ARIMA Model through ACF & PACF 
# Use “acf()” and “pacf()” functions in R
#To get actual values of the acf and pacfs, we set “plot=FALSE” in the “acf()” and “pacf()” functions.

acf(kingstimeseriesdiff1, lag.max = 20)
acf(kingstimeseriesdiff1, lag.max = 20, plot = FALSE)
# Autocorrelations of series ‘kingstimeseriesdiff1’, by lag
# 
# 0      1      2      3      4      5      6      7      8 
# 1.000 -0.360 -0.162 -0.050  0.227 -0.042 -0.181  0.095  0.064 
# 9     10     11     12     13     14     15     16     17 
# -0.116 -0.071  0.206 -0.017 -0.212  0.130  0.114 -0.009 -0.192 
# 18     19     20 
# 0.072  0.113 -0.093 
# aCF AT LAG 1 EXCEEEds the bounds of significance

########## CROSS VALIDATION
library(fpp)
str(a10)
plot(a10, ylab="$ milion", xlab="Year", main="Antidiabetic drug sales")
plot(log(a10), ylab="", xlab="Year", main="Log antidiabetic drug sales")
k <- 60 #Min data length for fitting model
n <- length(a10)
mae1 <- mae2 <- mae3 <- matrix(NA, n-k, 12)
st <- tsp(a10)[1] + (k-2)/12

for (i in 1:(n-k)){
  xshort <- window(a10, end=st+ i/12)
  xnext <- window(a10, start=st+(i+1)/12, end=st+(i+12)/12)
  fit1 <- tslm(xshort~trend+season, lambda=0)
  fcast1 <- forecast(fit1,h=12)
  fit2 <- Arima(xshort, order=c(3,0,1), seasonal=list(order=c(0,1,1), period=12), include.drift=TRUE, lambda=0, method="ML")
  fcast2 <- forecast(fit2, h=12)
  fit3 <- ets(xshort,model="MMM",damped=TRUE)
  fcast3 <- forecast(fit3, h=12)
  mae1[i,1:length(xnext)] <- abs(fcast1[['mean']]-xnext)
  mae2[i,1:length(xnext)] <- abs(fcast2[['mean']]-xnext)
  mae3[i,1:length(xnext)] <- abs(fcast3[['mean']]-xnext)
}

plot(1:12, colMeans(mae1, na.rm=TRUE), type="l", col=2, xlab="horizon", ylab="MAE", ylim=c(0.65, 1.05))
lines(1:12, colMeans(mae2, na.rm=TRUE), type="l", col=3)
lines(1:12, colMeans(mae3, na.rm=TRUE), type="l", col=4)
legend("topleft", legend=c("LM", "ARIMA","ETS"), col=2:4, lty=1)

# EXERCISES
sales <- scan("https://www.r-exercises.com/wp-content/uploads/2017/04/sales.csv",skip=1)

sales_ts <- ts(sales, frequency = 12, start=c(1992,1))
print(sales_ts)
plot.ts(sales_ts, ylim=c(0,40000))
gghistogram(sales_ts, add.normal = TRUE, add.kde = TRUE)


## ICE CREAM
icecream <- read.csv("Icecream.csv")
fit <- auto.arima(icecream$cons)
fcast <- forecast(fit, h=8)
autoplot(fcast) + theme_classic()
>>>>>>> 615ccb8501bd75bc6881bd75bfb012baa284e6cb
