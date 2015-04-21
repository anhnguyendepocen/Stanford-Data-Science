pollutantmean <- function(directory, polutant, id = 1:332) {
    mean(directory$pollutant, na.rm=TRUE)
} #may or may not be good, did not work 3/16
#Functions are the most powerful part of R
#three parts. writing them, lexical scoping and scoping rules for R
#lastly an example
# f<-function(<argument>) {
        #do something interesting
#named arguments. Useful when designing functions used by others
#formal arguments (fn definition)
#formals function returns a list of all formal arguments of a function

formals(pollutantmean)

mydata <- rnorm(100)
sd(mydata)
sd(x = mydata)
sd(x = mydata, na.rm = FALSE)
sd(na.rm = FALSE, x = mydata)
sd(na.rm = FALSE, mydata)

#not recommended changing the order of the arguments 

args(lm)
#not recommended -- lm(data = mydata, y - x, model=FALSE, 1:100)
#recommended lm(y - x, mydata, 1:100, model = FALSE)
#first three are usually specified calling LM
#function arguments are partially matched ... checks for exact match, 
#if not exact match look for partial, or positional
 
f <- function(a, b = 1, c = 2, d = NULL) {
    a ^ c 
    } 
    
f <- function(a, b) {
    print(a)
    print(b)
    b * a
    }
f(500, 300)

myplot <- function(x, y, ...) {
    plot(x, y, ...)
    }
    
mean
args(paste)
args(cat)
x <- rnorm(1:500)
y <- rnorm(1:500)

myplot(x,y)
#arguments after the ... must be named explicitly and in full

paste("a","b",se=":")

#scoping ules... 
#when a fn sees a symbol how does it assign a value to that symbol

lm <- function(x) {x * x}
lm
rm(lm)
lm

#how does R know what value to assing to lm?
#R needs to bind a value to symbol... it searches through series of
#environments to find appropriate value
#symbols and values are environments
#global environemnt is  work space

search()

#no match in global, R searches name spaces of all packages loaded 
#in R currently
#global env is always first, second is stats, etc to the base packages

#name space of package is in second position in search list
#scoping rules in R differ from S language
#determine how a value is bound to a free variable in a fn
#fn arguments, then other vars or symbols found in function that
#are not in fn
#lexical is static (NOT DYNAMIC SCOPING)

x <- 50

#lexical scoping --> scoping rules determine how free variables are assigned
#values of free var are sesarched for in teh environment in which the function was DEFINED
#an evnironment is a collection of symbol value pairs
#all env have parent environment that it inherits from
#one env can have multiple children
#only one without a parent and that is the empty environment
#global env is the WORKSPACE (set of symbol value pairs)
#objects assoc with them. Each package has a namespace 
#function closures are key to interesting ops in R
#if in afn and encounter a free var, first look for environment in which fn was defined
#if def in global env, then it is the one wher eit was defined
#global _. parent _. etc _. etc _.
#outside global environemnt

f <- function(x,y) {
    x ^2 + y / z
    }

#fn defined in global env so values of free var found in users workspace
#what ppl expect. 

f(4, 6)

#a FN can contain another function. so that is the environment 
#it is NOT the global env... it is the insides of this function. 
#scoping rules have a big impact here

make.power <- function(n) {
    pow <- function(x) {
        x^n
    }
    pow
}

cube <- make.power(3)
square <- make.power(2)
cube(3)
square(3)
tothefourth <- make.power(4)
tothefourth(5)

ls(environment(cube))
get("n",environment(cube))
ls(environment(square))
get("n", environment(square))

y <- 10 
f <- function(x) {
    y <- 2
    y ^ 2 + g(x)
}
g <- function(x) {
    x * y
}
f(3)
g(3)

#all languages converge to LISP!!
#ALL objects are stored in memory

#OPTIMIZING scoping rules
#optimization routines in R called optim nlm and optimize
#min or max a func over a range of parameters, take that 
#objective function and find min or max

make.NegLogLik <- function(data, fixed = c(FALSE,FALSE)) {
    params <- fixed
    function(p) {
        params[!fixed] <- p
        mu <- params[1]
        sigma <- params[2]
        a <- -0.5*length(data)*log(2*pi*sigma^2)
        b <- -0.5*sum((data-my)^2) / (sigma^2)
        -(a + b)
    }
}

set.seed(1); normals <- rnorm(100,1,2)
nLL <- make.NegLogLik(normals)
nLL
ls(environment(nLL))

optim(c(mu = 0, sigma = 1), nLL)$par 

nLL <- make.NegLogLik(normals, c(FALSE, 2))
optimize(nLL, c(-1, 3))$minimum
optimize(nLL, c(1e-6, 10))$minimum

nLL <- make.NegLogLik(normals, c(1, FALSE))


#directory <- "C:/Users.Paul.Desktop.R.specdata"

pollutantmean <- function(directory, pollutant, id = 1:332) {
    mean(directory$pollutant, na.rm=TRUE)
    
}
pollutantmean(directory, directory$sulfate, 1:332)
####################################################################
m <- matrix(nrow = 2, ncol = 3)
m
dim(m) #shows dimensions
attributes(m)
attributes(m)
m <- matrix(1:6, nrow = 2, ncol = 3)
m
#create dim attributes
m
x <- 1:3
y <- 10:12
cbind(x, y)
rbind(x, y)
#other ways of making matrices
#factors rep categorical var, unordered or ordered
#ordered factors represent rankings
x <- factor(c("yes","yes","no","yes","no","yes"))
x
unclass(x)
x <- factor(c("yes","yes","no","yes","no"))
    levels = c("yes", "no")
x 
#missing values in R NA or NaN
#is.na() used to test objects if htey are NA
#is.nan() tests for NaN 
#NA values have a class also, so there are integer NA and char NA etc
#a NaN value is also NA but the converse is not true
x <- c(1, 2, NA, 10, 3)
is.na(x)
x <- c(1, 2, NaN, NA, 4)
is.na(x)
is.nan(x)
#SWIRL statistics with winteractive 

##########################################################
directory <- setwd("C:/Users/Paul/Desktop/R/specdata")

files_list <- list.files("C:/Users/Paul/Desktop/R/specdata", pattern="*.csv", full.names=TRUE)
head(files_list)

pollutantmean <- function(directory, pollutant, id = 1:332) {
    mean(pollutant, na.rm=TRUE)
}

#the practice hw to help with hw 1 
dataset_url <- "http://s3.amazonaws.com/practice_assignment/diet_data.zip"
download.file(dataset_url, "diet_data.zip")
unzip("diet_data.zip", exdir = "diet_data")
list.files("diet_data")
andy <- read.csv("diet_data.zip/andy.csv")
head(andy)
dim(andy)
names(andy)
summary(andy)
andy[1, "Weight"]
andy[30, "Weight"]




specdata <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
download.file(hw1data, "specdata.zip")
head(list.files("specdata"))
one <- read.csv("specdata/001.csv")
head(one)
length(one$sulfate)
dim(one)
names(one)
str(one)
summary(one)
one[1, "sulfate"]
one[which(one$sulfate > 0), "sulfate"]
subset(one$sulfate, one$nitrate < 0.5)
#various approaches to subsetting data
one_start <- one[1, "sulfate"]
dim(one)
one_end <- one[1461, "sulfate"]
startend <- one_end - one_start
hw1files <- list.files("specdata")
hw1files
hw1files[1:20]
hw1filesfull <- list.files("specdata", full.names = TRUE)
hw1filesfull #prepended the directory to the file
head(read.csv(hw1filesfull[300]))
onetwo <- rbind(one, read.csv(hw1filesfull[2]))
head(onetwo)
tail(onetwo)
#rbind needs an existing data frame as the first argument. you can create an empty data frame to accomplish this, or fill one up
#now create subset of data frame that shows specific row
#now we can use a loop to append all the new rows on to this one
for (i in 1:5) {print(i)}
dat <- data.frame()
for (i in 1:5) {
    dat <- rbind(dat, read.csv(hw1filesfull[i]))
}
str(dat)
for (i in 1:5) {
    dat2 <- data.frame()
    dat2 <- rbind(dat2, read.csv(hw1filesfull[i]))
}
str(dat2)
head(dat2)
median(dat$sulfate)
#we need to get rid of NA values
median(dat$sulfate, na.rm = TRUE)
dat30 <- dat[which(dat[, "sulfate"] < 50),]
head(dat30)
tail(dat30)
median(dat30$nitrate)
#below is wrong
weightmedian <- function(directory, date) {
    files_list <- list.files(hw1filesfull, full.names = TRUE) #list of files created
    dat <- data.frame() #creates empty data frame
    for (i in 1:332) {
    #loops through the files rbinding them together
    dat <- rbind(dat, read.csv(files_list[i]))
    }
    dat_subset <- dat[which(dat[,"Date"] == Date), ] #subsets rows that match the date
    #while stripping out NA's
    median(dat_subset[, "sulfate"], na.rm = TRUE) #identifies median
}
weightmedian(directory = "hw1filesfull",)
#above is wrong
pollutantmean <- function(directory, pollutant, id = 1:332) {
    files_list <- list.files(hw1filesfull, full.names = TRUE)
    dat <- data.frame()
    for (i in 1:332) {
    dat <- rbind(dat, read.csv(files_list[i]))
    }
    mean(dat[, pollutant], na.rm = TRUE)
}

pollutantmean(hw1filesfull, "sulfate", )

#loop functions a lot of work in small amount of space
#for while loops are less compact in a certain ways
#lapply, sapply, apply, tapply, mapply
#lapply is a list of objects which you loop over and apply a function to every element of the list
#general concept but very powerful sapply
#sapply simplifies results
#apply function over margins of an array
#tapply function over subsets of bector
#mapply multivariate version of lapply
lapply
#if x not list, it will be coerced to a list
x <- list(a = 1:5, b=rnorm(10))
lapply(x, mean)
#applies the mean function 
x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
lapply(x, mean)
x <- 1:4
lapply(x, runif)
#uniform variables no = 1:4
x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
x 
lapply(x, runif, min=0, max=10)
#extract first column from matrix 
lapply(x, function(elt) elt[,1])
#anonymous functions are used heavily. 
#sapply is a variant of lapply, simplifies results if possible
sapply(x, mean)
#this won't work on matrices etc mean(x)
#apply is uesd to evaluate a function often anonymous one
#applies to rows or col of matrix
#used on general arrays (avg of array of matrices) 
str(apply)
#x is an array. Margin is an integer vector that indicates which margin to be retained.
#FUN is the f unction to be applied
x <- matrix(rnorm(200), 20, 10)
apply(x, 2, mean) #preserve col collapse rows
apply(x, 1, sum) #preserve rows collapse col 
#rowSums = apply(x, 1, sum)
#rowMeans = apply(x, 1, mean)
#colSums = apply(x, 2, sum)
#colMeans = apply(x, 2, mean)
x <- matrix(rnorm(200), 20, 10) #20 row ten col
apply(x, 1, quantile, probs = c(0.25, 0.75))
a <- array(rnorm(2 * 2 * 10), c(2, 2, 10))
apply(a, c(1,2), mean)
rowMeans(a, dims = 2)
#you can apply row means to an array

#mapply is loop function that is a multivariate version.
#applies fun in parallel 
str(mapply)
#fun is a function to apply, contains args to apply over, MoreArgs is a list of other arguments to function, SIMPLIFY indicates whether the result should be simplified
#numbe rof args is similar to number of lists in mapply
mapply(rep, 1:4, 4:1)
#rep is repeat function (what how many x)
noise <- function(n, mean, sd) {
    rnorm(n, mean, sd)
}
noise(5, 1, 2)
noise(1:5, 1:5, 2)
mapply(noise, 1:5, 1:5, 2) #sd = 2, change n and mean
#vectorize function that doesn't apply to vector arguments
#instant vectorization
str(tapply)
#x is a vector, index is a factor or list of factors (or coerced to factors), FUN is a function to apply, ... contains other args to be passed to FUN, simplify should we simplify result 
x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
f 
tapply(x, f, mean)
tapply(x, f, range)
str(split)
#x is a vector or list or data frame, f is a factor or coerced to one, or a list of factors, drop indicates whether empty factors levels should be dropped
split
x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
split(x, f)
#split return sa list back
lapply(split(x, f), mean)
#cn use t apply does same thing
library(datasets)
head(airquality)
#calc mean in each month, split data frame into monthly pieces, then once done calc the col means using eithe rapply or col means
s <- split(airquality, airquality$Month)
lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))
x <- rnorm(10)
f1 <- gl(2, 5)
f2 <- gl(5, 2)
f1
f2
interaction(f1, f2)
str(split(x, list(f1, f2)))
str(split(x, list(f1, f2), drop = TRUE))
#drop will drop empty levels 

















#hw1 another attempt 
#this one below took a while to run, unsure if it works 
pollutantmean <- function(directory, pollutant, id = 1:332) {
    files_list <- list.files("specdata", full.names = TRUE)
    dat <- data.frame()
    for (i in 1:332) {
        dat <- rbind(dat, read.csv(files_list[i]))
    }
    mean(dat[, pollutant], na.rm = TRUE)
}
#check working directory FIRST!! make sure it is in the R folder
#this one worked better than below
specdata <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
download.file(hw1data, "specdata.zip")
head(list.files("specdata"))
one <- read.csv("specdata/001.csv")

#######possibly get rid of below
getwd()
setwd()
dataset_url <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
download.file(dataset_url, "specdata.zip")
unzip("specdata.zip", exdir = "specdata")
list.files("specdata")
#don't repeat the above it makes more directories
one <- read.csv("specdata/001.csv")
head(one)
#########End

specdata <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
download.file(specdata, "specdata.zip")
head(list.files("specdata"))
one <- read.csv("specdata/001.csv")


files <- list.files("specdata")
filesfull <- list.files("specdata", full.names = TRUE)
head(read.csv(filesfull[1]))
wholetable <- rbind(read.csv(filesfull[i]))
head(wholetable)
tail(wholetable)
for (i in 1:5) {print(i)} #proof of concept 
dat <- data.frame()
for (i in 1:332) {
    dat <- rbind(dat, read.csv(filesfull[i]))
}
str(dat)
median(dat$sulfate, na.rm=TRUE)
head(dat)
tail(dat)
summary(dat)
###
#now they want to build the function similary to pollutantmean()
#this ran for a while but maybe I am not putting in the arguments correctly... try again below
###
pollutantmean <- function(directory, pollutant, id = 1:332) {
    files_list <- list.files(directory, full.names = TRUE)
    pat <- data.frame()
    for (i in 1:332) {
        pat <- rbind(pat, read.csv(files_list[i]))
    }
    mean(pat[,"sulfate","nitrate"], na.rm = TRUE)
}
#third try at getting pollutantmea() to work
#did not work.
pollutantmean <- function(directory = "", pollutant, id = 1:332) {
    id <- boundIDs(id)
    pollutant <- pollutantToCode(pollutant)
    numberOfIds <- length(id)
    filesList <- character(numberOfIds)
    for (i in 1:numberOfIds){
        if (id[i] > 332){
            next
        }
        fileList[i] <- fullFilePath(directory, id[i])
    }
    data <- lapply(filesList, read.csv)
    print(data[[1]][[pollutant]])
}
#after googling here is another try
pollutantmean <- function(directory, pollutant, id = 1:332) {
    wd <- getwd()
    newWd <- paste(wd, directory, sep = "/")
    setwd(newWd) #{ may need to be here
    filenames <- paste(sprintf("%03d", id), ".csv", sep="")
    nm <- c("Date", "sulfate", "nitrate", "ID")
    df <- as.data.frame(matrix(nrow = 0, ncol = 4, dimnames = list(NULL, nm)))
    for (file in filenames) {
        temp_dataset <- read.table(file, header=TRUE, sep=",")
        df <- rbind(df, temp_dataset)
        rm(temp_dataset)
    }
    if (pollutant == "nitrate") {
        mean(df$nitrate, na.rm = TRUE)
    }else{
        mean(df$sulfate, na.rm = TRUE)
    }
}
####
#### FINALLY !!! ^^^^^ WORKS !!! ^^^^^
#### below is to make changes

pollutantmean <- function(directory, pollutant, id = 1:332) {
    filenames <- paste(sprintf("%03d", id), ".csv", sep="")
    nm <- c("Date", "sulfate", "nitrate", "ID")
    df <- as.data.frame(matrix(nrow = 0, ncol = 4, dimnames = list(NULL, nm)))
    for (file in filenames) {
        temp_dataset <- read.table(file, header=TRUE, sep=",")
        df <- rbind(df, temp_dataset)
        rm(temp_dataset)
    }
    if (pollutant == "nitrate") {
        mean(df$nitrate, na.rm = TRUE)
    }else{
        mean(df$sulfate, na.rm = TRUE)
    }
}
#submission below part 1 
pollutantmean(directory = "specdata", pollutant = "sulfate", id = 1:5)
pollutantmean <- function(directory, pollutant, id = 1:332) {
    filez <- paste(sprintf("%03d", id), ".csv", sep="")
    namez <- c("Date", "sulfate", "nitrate", "ID") #columns
    framez <- as.data.frame(matrix(nrow = 0, ncol = 4, dimnames = list(NULL, namez)))
    for (file in filez) {
        numberz <- read.table(file, header=TRUE, sep=",")
        framez <- rbind(framez, numberz)
        rm(numberz)
    }
    if (pollutant == "nitrate") {
        mean(framez$nitrate, na.rm = TRUE)
    }else{
        mean(framez$sulfate, na.rm = TRUE)
    }
}
source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript1.R")
#this is the submit script
#now type in email and password provided on webpage
submit()
######################################
#EXAMPLE FROM ONLINE NOTE ~/ ddd/ Ddd//


pollutantmean <- function(directory = "C:\Users\Paul\Desktop\R\specdata.zip\specdata", pollutant, id = 1:332) {
  id <- boundID(id)
  if(length(id) < 1) {
    stop("No valid IDs remain.")
  }
  pollutant <- tolower(pollutant)
  if(pollutantIsNotValid(pollutant)){
    stop("Invalid pollutant provided. Valid pollutants are sulfate and nitrate.")
  }
  if(directoryIsNotValid(directory)){
    stop("Invalid data directory provided. Please supply the correct path to the data.")
  }
}

head(read.csv(files_list[1]))
for (i in 1:332) {
    frame <- data.frame()
    frame <- rbind(frame, read.csv(files_list[i], header = TRUE))
}
head(frame)
tail(frame)


#WHOLE THING FROM THIS INPUT
####below is someone elses's code

boundID <- function(idList){
  use <- idList < 333 & idList > 0
  if (length(idList[use]) != length(idList)){
    cat("Some IDs have been removed from this list as they are out of range.\nCurrent range is 1-332.\n\n")
  } 
  idList[use]
}
 
pollutantIsNotValid <- function(pollutantToCheck){
  possiblePollutants <- c("sulfate", "nitrate")
  !(match(pollutantToCheck, possiblePollutants) > 0 & !is.na(match(pollutantToCheck, possiblePollutants)))
}
 
directoryIsNotValid <- function(directory){
  fileList <- list.files(path = directory)
  !(fileList[1] == "001.csv")
}
 
pollutantmean <- function(directory = "C:/Users/Paul/Desktop/R/specdata/specdata", pollutant, id = 1:332) {
  id <- boundID(id)
  if(length(id) < 1) {
    stop("No valid IDs remain.")
  }
 
  pollutant <- tolower(pollutant)
  if(pollutantIsNotValid(pollutant)){
    stop("Invalid pollutant provided. Valid pollutants are sulfate and nitrate.")
  }
 
  if(directoryIsNotValid(directory)){
    stop("Invalid data directory provided. Please supply the correct path to the data.")
  }
}
###############end elsee's code
#BREAK IN ATEMPT AT HW1





##########################################

#debugging tools lecture of week 3 

#R will indicate that something is going on
#message, warning, error, and condition
#message is tame diagnostic message or nothing and will not stop fn from executing
#warning next level up -- not necessarily fatal
#error is an indication of fatal problem, stops execution of fn, produced by the stop function
#condition is a higher level concept (all three of these are conditions)... you can create new conditions if you want to flag or trigger when something special happens
log(-1)
#produces NaN which occurred after execution of production
printmessage <- function(x) {
    if(x>0)
        print("x is greater than 0")
    else
        print("x is less than or equal to zero")
    invisible(x)
}
printmessage(1)

printmessage2<- function(x) {
    if(is.na(x))
        print("x is a missing value")
    else if(x > 0)
        print("x is greater than zero")
    else
        print("x is less than or equal to zero")
    invisible(x)
}
x <- log(-1)
printmessage2(x)
#what was your input actually??
#how did you call the fn?
#what were you expecting?
#what did you get?
#how does what you get differ from what you were expecting?
#were your expectations in teh first place?
#can you reproduce the problem exactly?





#GOING BACK. MATRICES LECTURE WK 10
m <- matrix(nrow = 2, ncol = 3)
m 
dim(m)
attributes(m)
m <- matrix(1:6, nrow = 2, ncol = 3)
m
#two rows 3 columns
m <- 1:10
#add dim attributes
dim(m) <- c(2,5)
m 
#two rows and five columns
x <- 1:3 
y <- 10:12 
cbind(x,y)
rbind(x,y)



#R Debugging tools Lecture

#doable without, but helpful
#traceback print sout the function call stack after an error occurs, does nothing if there's no error
#debut flags a function for debug mode which allows you to step through execution of a function one line at a time HANDIEST function 
#browser suspends the execution ofa function whereever it is called an dputs the fn in debug mode
#trace allows you to INSERT debugging code into a fn at specific places WITHOUT EDITING THE FN ITSELF 
#recover allows you to odify the error behavior so that you can brows the fn call stack, related to traceback 


#Using debugging tools
mean(t)
traceback()
#goes back and tells you what the traceback was
lm(y ~ x)
#error is 7 levels deep
traceback()
debug(lm) #type in n for next for line by line debugging
lm(y ~ x)
#can debug functions within the debugger
options(error = recover)
#will only work until you close R
#all these tools are interactive 


#####

#STR function Lecture
#alternative to summary, compactly display the internal structure of an R objective
#diagnostic function, especially suited to compctly display the abbrev contents of possibly nested lists, 
#rouhgly one line per basic object


str(str) #takes any R object
str(lm)
#gives function environment, quick summary of lm
str(ls)
x <- rnorm(100, 2, 4)
summary(x)
str(x) #numeric 100 elements and give the first five #s
f <- gl(40, 10) #40 levels repeated 10x
str(f)
summary(f)
library(datasets)
head(airquality)
str(airquality)
#quick rundown of structure and data
m <- matrix(rnorm(100), 10, 10)
str(m)
m[, 1]
s <- split(airquality, airquality$Month)
str(s)
#list containing five diff data frames, each shows a month 







#week 2 lecture CONTROL STRUCTURES



#if else to test logical
#for to execute loop fixed times
#while, loop while something true
#repeat infinite loop
#break 
#next skip an iteration of a loop
#return exit a function 


#if else 
#else is optional, keep indents and curly brackets
#else if is ok to use but else has to be at end
x <- 44 

if(x > 3) {
    y <- 10
} else {
    y <- 0
}

y <- if(x > 3) {
        10 
    } else {
        0 
    }
    
    
#FOR LOOPS Lecture WK 2 

#MOST COMMON! loop index called i (j k l etc for many loops)
#covers a seq of integers or numbers
for(i in 1:10) {
    print(i)
}

x <- c("a","b","c","d")

for(i in 1:4) {
    print(x[i]) #ith element of x 
}

for(i in seq_along(x)) {
    print(x[i])
}

for(letter in x) {
    print(letter)
}

for(i in 1:4) print(x[i]) 
#don't need curlies but they elp see code

#nested for loops
x <- matrix(1:6, 2, 3)

for(i in seq_len(nrow(x))) {
    for(j in seq_len(ncol(x)))) {
        print(x[i, j])
    }
}

## in order to make all of the variables etc disappear

setwd("C:/Users/Paul/Desktop/R")
rm(list=ls())
dir(include.dirs=TRUE)

#quiz week 3/ 

meantime <- function() {
    if (Species == "virginica") {
        mean(iris$Sepal.Width)
    }
}
meantime <- function() {
    mean(iris$virginica) 
    if (Species = "virginica")
}
###adapting pollutantmean for meantime 
meantime <- function(Species) {
    m <- data.frame(matrix(iris, ncol = 5))
    names(m) <- c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width","Species")
    for (i in seq_along(Species)) {
        if (Species[i] == 'virginica')
    return(mean(as.matrix(m[pollutant]),na.rm = TRUE))
    }
}
###IRIS quiz 3 
library(datasets)
data(iris)
?iris
str(iris)
s <- split(iris, iris$Species)
names(x)
x <- s$virginica
colMeans(x[,1:4])
#to get means of col' 
apply(iris[, 1:4], 2, mean)
colMeans(iris[,1:4]) #works but not an optional

library(datasets)
data(mtcars)
sapply(split(mtcars$mpg, mtcars$cyl), mean) #correct 
with(mtcars, tapply(mpg, cyl, mean))
#this retrieves the avg mpg for each type of car (by # of cylinders)
#debug(ls) 


#6.588 is answer to Sepal.Length q 

#6.588 
#apply iris...
#with(mtcars, tapply(mpg, cyl, mean))




 n <- 1000
> set.seed(1)
> rtf <- function(a1, a2) {
+     sin(a1+a2)/(a1+a2) 
+ }
> 
> df <- data.frame(x1=(runif(n,min=1,max=6)),
+                  x2=(runif(n,min=1,max=6)))
> df$m <- rtf(df$x1, df$x2)
> df$y <- df$m+rnorm(n,sd=.1)
> model_cste <- lm(y~1,data=df)
> p_cste <- function(x1,x2)
+     predict(model_cste,newdata=data.frame(x1=x1,x2=x2))












###### Generating Random Numbers lecture 
#rnorm function simulates a normal random variables 
#dnorm evaluate teh normal prob density at a point or a vector fo points
#pnorm evaluate cum dens function for normal dist
#rpois generate random poisson variates with a given rate
#d for desnity
#r for random number generation
#p for cumulative dist 
#q for quantile function
dnorm(x, mean=0, sd=1, log=FALSE)
pnorm(q, mean=0, sd=1, lower.tail = TRUE, log.p = FALSE)
qnorm(p,0,1,lower.tail=TRUE,log.p=FALSE)
rnorm(n,0,1)
x <- rnorm(10)
#10 integers produced mean 0 sd 1
x <- rnorm(10, 20, 2)
#when simulating random numbers it is important to set the random nu generator seed with set.seed...
#when gen numbers they are not random, but they appear random. so if you wanted to set the same set of random numbers you can. 
#seed can be any integer 
set.seed(1)
rnorm(5)
rnorm(5)
set.seed(1)
rnorm(5)
#note they are the same
#ALWAYS SET THE RANDOM NUMBER SEED WHEN CONDUCTING A SIMULATION
rpois(10,1) #10 with rate of 1 
rpois(10,2)
rpois(10,20) #10 rv with rate of 20 
#pois mean = rate specified 
#eval cum dist with this
ppois(2, 2) ##cum dist pr(x<=2)
ppois(4,2)
ppois(6,2)
#simulating a linear model 
set.seed(20)
x<-rnorm(100)
e<-rnorm(100,0,2)
y<-0.5 + 2 * x + e 
summary(y) 
plot(x,y)

set.seed(10)
x<-rbinom(10,1,0.5)
e<-rnorm(100,0,2)
y<-0.5 + 2 * x +e 
summary(y)
plot(x,y)

set.seed(1)
#non normal error, it is poisson 
x<-rnorm(100)
log.mu<-0.5 +0.3*x 
y <- rpois(100,exp(log.mu))
summary(y)
plot(x,y)

#simulator random sampling 
set.seed(1) 
#draw randomly froms pecific set of objects you specify 
sample(1:10, 4)
sample(letters, 5) #no replacement
sample(1:10) ## permutation
sample(1:10) #if no specify, gives permutation of them 
sample(1:10)
sample(1:10, replace = TRUE)


#PROFILING R CODE FOR LARGER PROGRAMS
#helps figure out why program takes a long time, suggest fixes 
#profiling is better than guessing, shows how long for what parts of program 
#design code, then optimize when working well
#premature optimization is bad 
#measure(collect data) don't 


#using system.time() ... takes R expression and evaluates it and the amt of time it took to evaluation. Complex or simple. RETURNS an object of the class PROC_TIME
#user time charged to the CPU for this expression, elapsed time is "wall clock" time 

## elapsed time > user time 
systemtime(readLines("http://www.jhsph.edu"))
#opposite 
hilbert <- functio(n) {
    i <- 1:n 
    1 / outer(i - 1, i, "+") #hilbert matrix 
}
#elapsed time for a given fn 
system.time({
    n <- 1000 
    r <- numeric(n)
    for (i in 1:n) {
        x <- rnorm(n)
        r[i] <- mean(x)
    }
})
  #USING R PROFILER rprof()

  
Rprof()
summaryRprof()
#do not use system.time() and Rprof() together or you will be SAD! 
#always use one or the other
#Rprof() keeps track of call stack at regular intervals, queries fn call stack, how many fns, and prints out the function call stack in a quick interval every .02 seconds 
#if fn takes less than that then the profiler will be useless
#if it runs quickly the profiler is not useful
#lm(y ~ x)
sample.interval=10000
summaryRprof() 
#summaryRprof tabulates the output
#once you see fn calls tack you know that each line is .02 seconds apart.... so calculate how many sec in each function 
#by.total divides the time spent in each function by total run time 
#by.self does the same but first subtracts out time spent in functions above the call stack 
$sample.interval #.02 seconds 
$sample.time #amt time expression took to run 
#C and Fortran code is not profiled, black box 


























