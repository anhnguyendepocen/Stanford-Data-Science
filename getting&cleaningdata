###
### This file is meant to document/archive code examples from the getting & cleaning data cours from Johns Hopkins.
### Some of it is original, some of it is from their notes. 
###


if(!file.exists("data")){dir.create("data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/cameras.xlsx",method="curl") #agnostic to the file type
dateDownloaded <- date() #when it was performed
install.packages(xlsx)
library("xlsx")#handle the excel file 
cameraData<-read.xlsx("./data/cameras.xlsx",sheetIndex=1,header=TRUE)
head(cameraData)


#XML extraction
install.packages("XML")
library(XML)
fileURL <- "http://www.w3schools.com/xml/simple.xml")
doc <- xmlTreeParse(fileURL,useInternal=TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)

#mySQL databases 

#install mySQL
#can be complicated
#http://dev.mysql.com/doc/refman/5.7/en/installing.html

#then set up RMySQL
#go to http://biostat.mc.vanderbilt.edu/wiki/Main/RMySQL 
#good useful guide http://www.ahschulz.de/2013/07/23/installing-rmysql-under-windows/

#web facing version of mySQL database is UCSC database of genome bioinformatics 

#likely role is collecting data from a database... basic collection is performed before arriving



## Tidy data sets for downstream analysis

#four things: raw data, a tidy data set, a code book desc each variable and its values in the tidy data set. often called meta data. surrounds data and explains what it is trying to say. Units described. 
#explicit and exact recipe or steps for raw to processed data. R scripts will be put together. 
#raw data is rawest form of data we had access to. binary file, unformatted excel with ten worksheets think client, json, api, hand counts in lab. 
#ran no software on the data. 
#did not manipulate numbers or remove any data from data set, did not summarize in any way. 
#TIDY data is end goal. one variable per column, rows are observations. one file per table not multiple spreadsheets. better to save diff file. 
#the code book is often missing. you have tidy data set and you got it by doing a lot of stuff to a raw data set. how you picked variables, etc. 
#instruction list is good. raw to tidy instructions. it's hard to script every step. version of software, parameters. 
#if can't write script, go overboard on detail. 


## Downloading files from the internet

#using R to download files, no point and click. dl process is in script so you get complete pic of generation 
#directory needs to be known. getwd() setwd(). setwd(".\data"). windows are backslashes not mac though. 

if(!file.exists("data")) {
    dir.create("data")
}

file.exists("directoryName") #will check to see if directory exists
dir.create("diretoryName") #will create a directory if it doesn't exists


download.file() #important, dl's files from internet. you could do by hand but that's gehh. improves reproducibility.
#need URL, destfile (destination file) where data will go, and method 
#useful for tab, csv, excel, pretty agnostic to file type
#Baltimore camera data. 

fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accesType=DOWNLOAD"
download.file(fileUrl,destfile = "./data/cameras.csv", method = "curl")#curl is in https for seure websites. important for mac. listing the files in teh directory 
list.files(".data")
dateDownloaded <- date()




## Reading local flat files lecture
#they say we can skip 

if(!file.exists("data")) {
    dir.create("data")
}
fileUrl<-"https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accesType=DOWNLOAD"
download.file(fileUrl, destfile = "cameras.csv")
dateDownloaded <- date()
dateDownloaded

cameras<-read.csv("cameras.csv",header=TRUE)

head(cameras)

#read.table bad for large data sets, loads it into Ram. file, header, sep, row.names, nrows. 

cameraData <- read.table(".data/cameras.csv",sep=",", header=TRUE)

#quote, na.strings, nrows, skip... what's na, number of rows to read, and how many rows to skip at beginning. 


## Reading Excel data. 

#people are used to spreadsheets. easy etc. 


if(!file.exists("data")) {dir.create("data")}
fileUrl<-"https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accesType=DOWNLOAD"
download.file(fileUrl,destfile="./data/cameras.xlsx")
dateDownloaded<-date()
dateDownloaded

install.packages("xlsx")
library(xlsx)
cameraData<-read.xlsx("./data/cameras.xlsx",sheetIndex=1,header=TRUE)
head(cameraData)
tail(cameraData)

#can read specific rows and columns
colIndex<-2:3
rowIndex<-1:4
cameraDataSubset<-read.xlsx("./data/cameras.xlsx",sheetIndex=1,colIndex=colIndex,rowIndex=rowIndex)

write.xlsx() #writes files 
read.xlsx2() #quite a bit faster, but unstable with subsets of rows
install.packages("XLConnect")
library(XLConnect)

#text files are best not excel files!





## Reading XML extensible markup language.

#internet. web scraping. API. open data websites. 
#markup is labels that give text structure. the way you add labels so file is structured. content is actual text typed in. tags elements and attributes
#start tags <section></section> start and end tags
#empty tags <line-break /> 
#<Greeting> Hello, world </Greeting>
#<img src="jeff.jpg" alt="instructor" />
#<step number="3"> Connect A to B. </step>

#see wikipedia XML. 


#go to http://www.w3schools.com/xml/simple.xml


#read into R with XML pacakge

install.packages("XML")
library(XML)
fileUrl<- "http://www.w3schools.com/xml/simple.xml"
doc<-xmlTreeParse(fileUrl,useInternal=TRUE)
rootNode<-xmlRoot(doc)
xmlName(rootNode)
dateDownloaded<-date()
dateDownloaded
names(rootNode)
#returns food food food... 
#xml tree parse loads doc into memory so you can parse it and get access to it. still structured object within R. 
#Root node is the highest part. wrapper element for entire document. 

rootNode[[1]] #returns first food element. to keep drilling down you an do more subsetting like lists
rootNode[[1]][[1]]

xmlSApply(rootNode,xmlValue) #loops through all elements of root node, does recursively, gets every value of every single tagged element in document, text strung together, all text in doc. 
#can be more specific. 


#the XPath language is pretty handy. Go to 
# http://stat.berkeley.edu/~statcur/Workshop2/Presentations/XML.pdf

#learning a few components goes a very long way. 
#/node top level node, //node at any level

xpathSApply(rootNode,"//name",xmlValue)
xpathSApply(rootNode,"//price",xmlValue)
#set root node to price. xmlValue will return their actual values. 

#Ravens website on ESPN

# http://espn.go.com/nfl/team/_/name/baltimore-ravens

#see source code by right clicking. 

fileUrl <- " http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens"
doc <- htmlTreeParse(fileUrl,useInternal=TRUE)
scores<-xpathSApply(doc,"//li[@class='score']",xmlValue)
teams<-xpathSApply(doc,"//li[@class='team-name']",xmlValue)
scores
teams
#html instead of xml becaues it's diff enough
install.packages("html")
library(html)
#INSTALLING 2.7.1 win32 R for windows



## JSON reading

#javascript object notation. lightweight for data storage
#comon format for data of API's 
#different syntax from XML
#no strings boolean array and objects. 
#see wikipedia page. 
#example JSON file
#overall [ 
# {
#}]

install.packages("jsonlite")
library(jsonlite)

jsonData<- fromJSON("https://api.github.com/users/jtleek/repos")

names(jsonData)

names(jsonData$owner)#will give all the names of the table stored within that column ... storing data frame within a data frame 
#bc owner corresponds to array of values 

#take data frame and transform

myjson <- toJSON(iris, pretty=TRUE)
#good for API that requires JSON
cat(myjson)
#now a text variable. 

iris2<-fromJSON(myjson)
head(iris2) #send it back to data frame. usually we'd pass a URL here but 

#see http://www.r-bloggers.com/new-package-jsonlite-a-smarter-json-encoderdecoder/



## Data . table package 

#more efficient than data frame
#inherits from data.frame. all functions that accept data.frame work on data . table written in C so it is MUCH faster
#faster at subsetting, grouping, updating, than data.frame is ... new syntax though. 

install.packages("data.table")
library(data.table)
DF = data.frame(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DF,3)


DT = data.table(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DT,3)

#to see all tables in memory 

tables() #note the S at end

DT[2,] #subset rows using first spot

DT[DT$y=='a']

DT[c(2,3)] #gets only rows 
#column subsetting is different!!!!!
#uses expressions to summarize the data in diff ways. 
DT[,list(mean(x),sum(z))] 
#passes a list of functions, x and z are variables in teh data table. no quotes. 
DT[,table(y)]

DT[,w:=z^2]
DT #to make sure 

#adds a new column

DT2 <- DT #since no copy is made, we can end up making a mistake 
#must EXPLICITLY create a copy to not mutate it

DT[,m:={tmp <- (x+z);log2(tmp+5)}]
#m assigned to log base two of x + z plus five

DT[,a:=x>0] #binary variable now 
DT

DT[,b:=mean(x+w),by=a] #group by a 
DT

#special variables... .N

set.seed(123);
DT <- data.table(x=sample(letters[1:3],1E5,TRUE))
DT[, .N, by=x] #counts .N number of times grouped by x variable ... very fast compared to 

#unique aspect is keys. 
#sort and subset rapidly with keys. 

DT <- data.table(x=rep(c("a","b","c"),each=100), y=rnorm(300))
setkey(DT, x) #var x is key now 
DT['a'] #subset on basis fo x, quote 'a' quickly subsets based on key. 


DT1 <- data.table(x=c('a','a','b','dt1'),y=1:4)
DT2 <- data.table(x=c('a','b','dt2'),z=5:7)
setkey(DT1,x);setkey(DT2, x)
merge(DT1, DT2)
#merges the data tables. 
#key in both cses is equal to x after set key... much faster as long as same key for both operations. 

#fast reading of info

big_df <- data.frame(x=rnorm(1E6),y=rnorm(1E6))
file <- tempfile() #temporary file, write it to big file 
#then time with fread() command 
write.table(big_df, file=file, row.names=FALSE, col.names=TRUE, sep="\t", quote=FALSE)
system.time(fread(file))
#this is much slower below
system.time(read.table(file,header=TRUE,sep="\t"))




###################################################################################################################################################################################


#### QUIZ 1 4/13 

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",destfile="quiz1.csv")

q1data<-read.csv("quiz1.csv",header=TRUE)

#how many properties are worth $1MM or more 

hist(q1data$VAL)


download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx",destfile="NaturalGas.xlsx")

#Question 5
#attempt 1 tapply(DT$pwgtp15,DT$SEX,mean)


#The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here: 

# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv 

#using the fread() command load the data into an R object

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv",destfile=Communities.csv)

DT<-read.csv("Communities.csv",header=TRUE)

tapply(DT$pwgtp15,DT$SEX,mean)


#Question 4
#Read the XML data on Baltimore #restaurants from here: 

#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml 

#How many restaurants have zipcode 21231?
#156
#28
#17
#127

install.packages("XML") #in R 2.7 
library(XML)


#quiz again

install.packages("readxl")
library(readxl)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx",destfile="NaturalGas.xlsx")


fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
download.file (fileUrl, destfile = "./cameras.xlsx", mode='wb') 
dateDownloaded <- date() # set date of the download
install.packages("rJava")
install.packages("xlsxjars")
install.packages("xlsx")
Sys.setenv(JAVA_HOME='C:/Program Files/Java/jre1.8.0_40')
library(rJava)
library(xlsxjars)
library(xlsx)
cameraData <- read.xlsx("./cameras.xlsx", sheetIndex = 1)
head(cameraData)

#Question 1
#The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here: 

#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv 

#and load the data into R. The code book, describing the variable names is here: 

#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf 

#How many properties are worth $1,000,000 or more?
#Your Answer		Score	Explanation
#53	Correct	3.00	
#159			
#47			
#24			
#Total		3.00 / 3.00	
#Question 2
#Use the data you loaded from Question 1. Consider the variable FES in the code book. Which of the "tidy data" principles does this variable violate?
#Your Answer		Score	Explanation
#Tidy data has no missing values.			
#Each tidy data table contains information about only one type of observation.	Inorrect	0.00	
#Each variable in a tidy data set has been transformed to be interpretable.			
#Tidy data has one variable per column.			
#Total		0.00 / 3.00	
#Question 3
#Download the Excel spreadsheet on Natural Gas Aquisition Program here: 

#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx 

#Read rows 18-23 and columns 7-15 into R and assign the result to a variable called:
# dat 
#What is the value of:
# sum(dat$Zip*dat$Ext,na.rm=T) 
#(original data source: http://catalog.data.gov/dataset/natural-gas-acquisition-program)
#Your Answer		Score	Explanation
#33544718			
#0			
#184585			
#36534720	Correct	3.00	
#Total		3.00 / 3.00	
#Question 4
#Read the XML data on Baltimore restaurants from here: 

#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml 

#How many restaurants have zipcode 21231?
#Your Answer		Score	Explanation
#181			
#17			
#28			
#127	Correct	3.00	
#Total		3.00 / 3.00	
#Question 5
#The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here: 

#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv 

#using the fread() command load the data into an R object
# DT 
#Which of the following is the fastest way to calculate the average value of the variable
#pwgtp15 
#broken down by sex using the data.table package?
#Your Answer		Score	Explanation
#tapply(DT$pwgtp15,DT$SEX,mean)			
#DT[,mean(pwgtp15),by=SEX]			
#mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)			
#mean(DT$pwgtp15,by=DT$SEX)			
#sapply(split(DT$pwgtp15,DT$SEX),mean)	Correct	3.00	
#rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]			
#Total		3.00 / 3.00

# END QUIZ

########################################################################################################################################################################




# mySQL lecture lecture 1 of week 2 
# http://dev.mysql.com/doc/refman/5.7/en/installing.html 
#install mySQL. A web facing mySql server is what we'll do here 

#install RMySQL 
install.packages("RMySQL")
# see http://biostat.mc.vanderbilt.edu/wiki/Main/RMySQL 
library(RMySQL)

#for windows it is more difficult!!! see the above 

# http://www.ahschulz.de/d013/07/23/installing-rmysql-under-windows/

# http://genome.ucsc.edu/ for genome bioinformatics

ucscDb <- dbConnect(MySQL(),user="genome",host="genome-mysql.cse.ucsc.edu")

result <- dbGetQuery(ucscDb,"show databases;")dbDisconnect(ucscDb):#ALWAYS DISCONNECT!
#True is returned to show you disconnected from database
#always assign connection a handle name 
#result in quotes is actually a MySQL command 
result 
#shows all DB for the MySQL server located at the host address. 

hg19 <- dbConnect(MySQL(),user="genome",db="hg19",host="genome-mysql.cse.ucsc.edu")
allTables<-dbListTables(hg19)#human genome 19th edition
length(allTables)
allTables[1:5]
dbListFields(hg19,"affyU133Plus2") )
#look into this database, what fields are in that table. 
dbGetQuery(hg19, "select count(*) from affyU133Plus2")
#returns count(*) ... shows number of rows 

affyData<-dbReadTable(hg19, "affyU133Plus2")
head(affyData)
#extract data one table at a time 


#often a huge amount of data stored. 
#select only a subset

query <- dbSendQuery(hg19,"select * from affyU133Plus2 where misMatches between 1 and 3")
affyMis<-fetch(query); quantile(affyMis$misMatches)

affyMisSmall<- fetch(query, n=10); dbClearResult(query);
#returns TRUE
dim(affyMisSmall)
#first ten rows of that table
#NEED TO CLEAR THE QUERY. dbClearResult(query) clears it from teh remote server. 

dbDisconnect(hg19)
#CLOSE YOUR CONNECTION!!!!!

#as soon as you don't need, CLOSE YOUR CONNECTION!!!!!

# http://cran.r-project.org/web/packages/RMySQL/RMySQL.pdf 
#http://www.r-bloggers.com/mysql-and-r/ 



#WEEK 2 LECTURE 2 

#HDF5 
#Hierarchical Data Format 5
#Stores large data sets. Supports storing a range of data types. Groups containing zero or more data sets and meta data. 
    #have a group header with group name and list of attributes 
    #have group symbol table with a list of objects in group
#datasets multidimensional array of data elements with metadata.
    #have header with name, data type, data space, and storage layout
    #have a data array with teh data. 
# http://www.hdfgroup.org/ 

#data stored in groups. 




#Install it 

source("http://bioconductor.org/biocLite.R")
biocLite("rhdf5")

library(rhdf5)
created = h5createFile("example.h5")
created 
#returns TRUE 
#see rhdf5 tutorial 

created = h5createGroup("example.h5","foo")
created = h5createGroup("example.h5","baa")
created = h5createGroup("example.h5","foo/foobaa")#subgroup of foo called foobaa 
h5ls("example.h5") 
A = matrix(1:10,nr=5,nc=2)
h5write(A,"example.h5","foo/A")#write matrix to a particular group. file, group within file. 
B=array(seq(0.12.0,by=0.1),dim=c(5,2,2))#don't just need to do matrices. 
attr(B,"scale") <- "liter"#add attributes 
h5write(B, "example.h5","foo/foobaa/B")#h5write() will write this array to a particular sub group. 
#what did we do? print it 
h5ls("example.h5")

df = data.frame(1L:5L,seq(0,1,length.out=5),
    c("ab","cde","fghi","a","s"),stringsAsFactors=FALSE)
    #created data frame, h5write writes it directly to teh top level group df 
h5write(df, "example.h5","df")
h5ls("example.h5")
#writing and reading chunks...

h5write(c(12,13,14),"example.h5","foo/A",index=list(1:3,1))
h5read("example.h5","foo/A")






#Lecture 3 Week 2 reading data from the web

#streaming, api's, authentication

#webscraping is extracting from teh html code of sites
#many sites have info you may want to read programatically 
#some websites say they don' twant to be scraped 
#IP address can get blocked. be craeful with proprietary data 

#google scholar page about Leek's papers 

#readlines command is important

con = url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en") #open a connection with url() 
htmlCode = readLines(con) #can set no of lines 
close(con)#make sure to close the connection after using it 
htmlCode

library(XML)
url <- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"
html <- htmlTreeParse(url, useInternalNodes=TRUE)
xpathSApply(html,"//title",xmlValue)
#this one did not work ...   xpathSApply(html,"//td[@id='col-citedby']",xmlValue)

library(httr); html2 = GET(url)
content2 = content(html2, as="text")#extract content as text string 
parsedHtml = htmlParse(content2,asText=TRUE) #same as xml package 
xpathSApply(parsedHtml,"//title",xmlValue)#extract out title 

pg1 = GET("http://httpbin.org/basic-auth/user/passwd",authenticate("user","passwd")) #won't allow you without password
names(pg2)

google = handle("http://google.com")
pg1 = GET(handle=google,path="/")
pg2 = GET(handle=google,path="search") 
#cookies stay with handle so re-authentication is not necessary 

#http://www.r-bloggers.com/?s=Web+Scraping




## Week 2 lecture 4 API's 

#application programming interfaces
#get requests with specific URLs as arguments
#use httr package to get data from these websites 

#usually have to create an account with the development team of each organization. 

# https://dev.twitter.com/apps 
# create new application 
# info OAuth settings will have keys 
# copy them to use later 

### from Twitter:
#Access level	Read and write (modify app permissions)
#Consumer Key (API Key)	TAkCDRwLoRMsEJq9LrDCj0Vwf (manage keys and access tokens)
#Callback URL	None
#Sign in with Twitter	Yes
#App-only authentication	https://api.twitter.com/oauth2/token
#Request token URL	https://api.twitter.com/oauth/request_token
#Authorize URL	https://api.twitter.com/oauth/authorize
#Access token URL	https://api.twitter.com/oauth/access_token

#Consumer Key (API Key)	TAkCDRwLoRMsEJq9LrDCj0Vwf
#Consumer Secret (API Secret)	kWUctBll7gxx05EDIJkCuJoRULj0RBd17UkuR6ZwC61bMlyAxK
#Access Level	Read and write (modify app permissions)
#Owner	paulmattheww
#Owner ID	2402491467

#Access Token	2402491467-ozL71fsXKtZykFjRyW7ZwpFyqQoqo9nijRX3l1x
#Access Token Secret	aDTEaRb9Cls2AGdhSAuaPaJWIRIhTi4EXdVeyAQYnDYaT
#Access Level	Read and write
#Owner	paulmattheww
#Owner ID	2402491467

myapp = oauth_app("twitter",key="TAkCDRwLoRMsEJq9LrDCj0Vwf",secret="kWUctBll7gxx05EDIJkCuJoRULj0RBd17UkuR6ZwC61bMlyAxK")

sig = sign_oauth1.0(myapp,token="2402491467-ozL71fsXKtZykFjRyW7ZwpFyqQoqo9nijRX3l1x",token_secret="aDTEaRb9Cls2AGdhSAuaPaJWIRIhTi4EXdVeyAQYnDYaT") #starts authorization process, you name it for convenience "twitter". 
#your credentials are established here 

library(jsonlite)

homeTL = GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig) #twitter's api URL 

json1 = content(homeTL) #extracts data, recognizes JSON 
json2 = jsonlite::fromJSON(toJSON(json1))#reformat to data frame from json using json lite 
json2[1,1:4] #actually create data frame. each row corresponds to a tweet. first four col is times, ids, text of tweet


#how did we know which URL to use?
# https://dev.twitter.com/docs/api/1.1/get/search/tweets

#resource url is in middle of page, which you pass to teh get command 

#httr allows get, post, put, delete requests if authorized. 

#authenticate with un pw .. most modern api use oauth 
#httr works well with facebook, gogle, twitter, github, etc 






## Reading data from other sources Lecture 5 Week 2 

#many R packages to acces data. 

#file function that is on computer. gz file and bz file for zipped files 

?connections 

#foreign package for other programming languages

read.arff(Weka)
read.dta(Stat)
read.mtp(Minitab)
read.octave(Octave)
read.spss(SPSS)
read.xport(SAS)

#many database packages postgresql, RODBC multiple interface db, SQLite, RMongo 

#each is dependent on syntax of the database it is stored in 

#jpeg, readbitmap, png, EBImage ... 

#GIS data rdgal, rgeos, raster

#music data DIRECTLY FROM MP3 !!! tuneR and seewave
# http://cran.r-project.org/web/packages/tuneR/
# http://rug.mnhn.fr/seewave/ 





#################################################################################################################
## Quiz 2 

#Github API 
#Client ID
#7d056219eeaed12cfa70
#Client Secret
#ac39418021b00ad0088c825fdac452029c37b627

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/

library(httr)
oauth_endpoints("github")

# 2. Register an application at https://github.com/settings/applications;
#    Use any URL you would like for the homepage URL (http://github.com is fine)
#    and http://localhost:1410 as the callback url
#
#    Insert your client ID and secret below - if secret is omitted, it will
#    look it up in the GITHUB_CONSUMER_SECRET environmental variable.
myapp <- oauth_app("github","7d056219eeaed12cfa70","ac39418021b00ad0088c825fdac452029c37b627")

library(httpuv)
# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/rate_limit", gtoken)
stop_for_status(req)
content(req)

# OR:
req <- with_config(gtoken, GET("https://api.github.com/rate_limit"))
stop_for_status(req)
content(req)

github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
req <- GET("https://api.github.com/rate_limit", config(token = github_token))
stop_for_status(req)
content(req)
# curl -u Access Token:x-oauth-basic "https://api.github.com/users/jtleek/repos"
BROWSE("https://api.github.com/users/jtleek/repos",authenticate("Access Token","x-oauth-basic","basic"))
# 2013-11-07T13:25:07Z

#   Q2

install.packages("sqldf")
library(sqldf)
#Loading required package: gsubfn
#Loading required package: proto
#Loading required package: RSQLite
#Loading required package: DBI

> download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv",destfile="quiz2.csv")

acs <- read.csv("quiz2.csv", header=T, sep=",")
head(acs)
sqldf("select pwgtp1 from acs where AGEP < 50")

#   Q3

unique(acs$AGEP) #need to be same as this 

sqldf("select distinct AGEP from acs")
#these two are equal 

#Question 3
#Using the same data frame you created in the previous problem, what is the equivalent function to unique(acs$AGEP)

sqldf("select distinct AGEP from acs")
length(unique(acs$AGEP))
#91

#Question 4
#How many characters are in the 10th, 20th, 30th and 100th lines of HTML from this page:
#http://biostat.jhsph.edu/~jleek/contact.html
#(Hint: the nchar() function in R may be helpful)

hurl <- "http://biostat.jhsph.edu/~jleek/contact.html"
con <- url(hurl)
htmlCode <- readLines(con)
close(con)
sapply(htmlCode[c(10, 20, 30, 100)], nchar)
#45 31 7 25

#Question 5
#Read this data set into R and report the sum of the numbers in the fourth column.
#https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for
#Original source of the data: http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for
#(Hint this is a fixed width file format)

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for",destfile="quiz2q5.csv")
data<-read.csv("quiz2q5.csv",header=T)
head(data)
dim(data)
file_name <- "quiz2q5.csv"
df<-read.fwf(file=file_name,widths=c(-1,9,-5,4,4,-5,4,4,-5,4,4,-5,4,4), skip=4)
head(df)
sum(df[, 4])

##########################################################################################################################End quiz 2 week 2 

#week 3 lecture 1 Subsetting and Sorting

#once loaded, set it up to be a tidy data set (get rid of a lot of data)

set.seed(13435)
X<-data.frame("var1"=sample(1:5),"var2"=sample(6:10),"var3"=sample(11:15))
X<-X[sample(1:5),]; X$var2[c(1,3)]=NA 
X 

X[,1] #returns first column 
X[,"var1"]
X[1:2,"var2"]

X[(X$var1<=3 & X$var3 >11),] 
X[(X$var1<=3 | X$var3>15),]

#dealing with missing values
X[which(X$var2>8),] #which returns indices where var2>8. doesn't return NAs 

sort(X$var1)
sort(X$var1,decreasing=TRUE)
sort(X$var3,na.last=TRUE) #missing values at end of sort

X[order(X$var1),] #sort the data frame by variable 1 

X[order(X$var1,X$var3),] #first variable sorted first 

library(plyr) #great package

arrange(X,var1)

arrange(X,desc(var1))

X$var4<-rnorm(5) #add column
X 
#now X has new column 
Y<-cbind(X,rnorm(5))
Y

#rbind() works too
#much more notes on subsetting 

# http://www.biostat.jhsph.edu/~ajaffe/lec_winterR/Lecture%202.pdf 





## Summarizing data lecture 2 week 3 

# restaurant data
# http://data.baltimorecity.gov/Community/Restaurants/k5ry-ef3g


fileUrl<-"https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD" #corresponds to csv version. see if you can go to the file above and get same 
download.file(fileUrl,destfile="restaurants.csv")
restData<-read.csv("restaurants.csv")

head(restData,n=3)#shows number of rows
#   name zipCode neighborhood councilDistrict #policeDistrict
#1   410   21206    Frankford               2   NORTHEASTERN
#2  1919   21231  Fells Point               1   SOUTHEASTERN
#3 SAUTE   21224       Canton               1   SOUTHEASTERN
  #                       Location.1
#1 4509 BELAIR ROAD\nBaltimore, MD\n
#2    1919 FLEET ST\nBaltimore, MD\n
#3   2844 HUDSON ST\nBaltimore, MD\n


tail(restData, n=3) #bottom 3 rows

summary(restData)
str(restData) #tells extra info about types of variables etc 

quantile(restData$councilDistrict,na.rm=TRUE)
quantile(restData$councilDistrict,probs=c(0.5,0.75,0.9)) #different percentiles

#make tables 

table(restData$zipCode, useNA="ifany") #shows no of restaurants in zip codes 
#by default the table function does not say no of missing values. 

table(restData$councilDistrict, restData$zipCode) #2 d table by district and zip 

sum(is.na(restData$councilDistrict)) #if sum = 0 there are no missing values

any(is.na(restData$councilDistrict)) #says if there is any NA's 

all(restData$zipCode>0)#checks to see if all values satisfy a condition. There is one that is not greater than zero

colSums(is.na(restData)) #is.na applied to whole data set for each column, no NA for all variables is shown 

all(colSums(is.na(restData))==0) #shows that all are equal to zero, no missing values in data set

table(restData$zipCode %in% c("21212"))

table(restData$zipCode %in% c("21212","21213"))

restData[restData$zipCode %in% c("21212","21213")] #restaurants in these two zip codes 

data(UCBAdmissions)
DF = as.data.frame(UCBAdmissions)
summary(DF)

xt <- xtabs(Freq ~ Gender + Admit, data=DF) #crosstabs 
xt
#berkeley admissions


data(warpbreaks)
warpbreaks$replicate <- rep(1:9, len=54)
xt = xtabs(breaks ~.,data=warpbreaks)
xt

ftable(xt) #flat table smaller and compact easier to see 

fakeData=rnorm(1e5)
object.size(fakeData)
print(object.size(fakeData,units="Mb"))


# WK 3 lecture 3 Creating New variables 

#creating new variables... why?
#raw data wont have value you are looking for
#usually will add thos values to the frames you are working with 
#baltimore restaurant data set 

fileUrl<-"https://data.baltimorecity.gov/Community/Restaurants/k5ry-ef3g/rows.csv?accesType=DOWNLOAD"

download.file(fileUrl,destfile="restaurants.csv")

restData<-read.csv("restaurants.csv")

head(restData)
names(restData)

#creating sequences, sometimes you need an index for your data set!!

s2 <- seq(1,10,length=3); s2 

x <- c(1,3,8,25,100);seq(along=x)

#subsetting variables 

restData$nearMe = restData$neighborhood %in% c("Roland Park","Homeland")
table(restData$nearMe)

#creating binary variables

restData$zipWrong = ifelse(restData$zipCode < 0, TRUE, FALSE)
table(restData$zipWrong,restData$zipCode < 0)


# creating categorical variables 
restData$zipGroups= cut(restData$zipCode,breaks=quantile(restData$zipCode))
 #cut command breaks up zip code by quantiles.
#returns a factor variable  0-25, 25-50 etc percentiles 
table(restData$zipGroups)

table(restData$zipGroups,restData$zipCode)

#easier cutting

library(Hmisc)
restData$zipGroups=cut2(restData$zipCode,g=4)
table(restData$zipGroups)

#creating factor variables

restData$zcf<-factor(restData$zipCode)
restData$zcf[1:10]

class(restData$zcf)

#levels of factor variables
yesno<-sample(c("yes","no"),size=10,replace=TRUE)
yesnofac = factor(yesno,levels=c("yes","no"))
as.numeric(yesnofac)

library(Hmisc)
restData$zipGroups=cut2(restData$zipCode,g=4)
table(restData$zipGroups)


library(plyr)
restData2 = mutate(restData,zipGroups=cut2(zipCode,g=4))
table(restData2$zipGroups)


#common transformations
abs() #absolute value
sqrt() #square root 
ceiling() #ceiling(3.47) is 4 
floor() #floor(3.47 is 3)
round(x,digits=n) #round(3.475,digits=2) is 3.48
signif(x,digits=n) #signif(3.475,digits=2) is 3.5 
cos() sin() 
log() #natural log 
log2() log10() 
exp() #exponentiation 

# see http://www.biostat.jhsph.edu/~ajaffe/lec_winterR/Lecture%202.pdf 
# http://statmethods.net/management/functions.html 






### RESHAPING DATA LECTURE 
#goal is tidy data, every var has a col, every obs has a row, each table file stores data baout one kind of obs (people, hospitals)

library(reshape2)
head(mtcars)
names(mtcars)
mtcars$carname<-rownames(mtcars)
carMelt<-melt(mtcars,id=c("carname","gear","cyl",measure.vars=c("mpg","hp")))
head(carMelt,n=3)
#reshaped so it is tall ans kinny, one row for mpg and hp values 

cylData<-dcast(carMelt,cyl ~ variable)
cylData 

cylData<-dcast(carMelt,cyl~variable,mean)
cylData #puts cylinders in rows and varaible in columns, and takes mean for each value 

head(InsectSprays)
tapply(InsectSpray$count,InsectSpray$spray,sum) #t apply, apply along an index,o apply to count along the index spray it will sum for a b c d e f etc 

spIns = slit(InsectSpray$count,InsectSpray$spray)
spIns #split counts by each different spray. 
#a list of values for A B C etc 

sprCount = lapply(spIns,sum)
sprCount #list, but may want to go to vector 

unlist(sprCount)

sapply(spIns,sum) #does apply and combine components 

#plyr package is great for this

ddply(InsectSprays,.(spray),summarize,sum=sum(count))

spraySums <- ddply(InsectSprays,.(spray),summarize, sum=ave(count,FUN=sum))
dim(spraySums) 
head(spraySums) 

#acast() turns into array multi dim arrange() you can reorder without order() command and mutate can add new variables bro. 

######## 

## Lecture 5 of Week 3 dplyr 
# Managing data frames with dplyr introduction

#arrange, filter, select, mutate, rename are important

#optimized and distilled version of plyr package 

#simplifies, coded in c++ 

#verbs are select filter arrange rename mutate and summarize or summarise 

#select columns, filter rows, arrange rows, rename variables in frame, mutate add new cols, summarize to generate summary stats 

#first argument is always a data frame 

library(dplyr)

chicago<-readRDS("chicago.rds") #daily data 
str(chicago)
dim(chicago)
names(chicago)
head(select(chicago,city:dptp))
head(select(chicago,-(city:dptp))) #leave out columns 

#above is much easier than doing the following
i <- match("city",names(chicago))
j<-match("dptp",names(chicago))
head(chicago[,-(i:j)])
# note how this is a lot of code compared to the above code. 

head(chic.f,10) 
chic.f<-filter(chicago,pm25mean2 > 30 & tmpd > 80)
head(chic.f)
#filter function subsets the rows based on teh sequence above. use variable names not subsetting with subset operators

#arrange 
chicago<-arrange(chicago,date)
head(chicago)
tail(chicago)

chicago<-arrange(chicago,desc(date))
head(chicago)
tail(chicago) #reversed order of rows by date 

#rename will rename variables 

chicago<-rename(chicago, pm25 = pm25tmean2, dewpoint = dptp) #new = old 
head(chicago) #should be properly named 

#mutate transforms existing or creates new variables. 

chicago(mutate(chicago, pm25detrend = pm25-mean(pm25, na.rm=TRUE)))
head(select(chicago, pm25, pm25detrend))
chicago
chicago<-mutate(chicago, tempcat = factor(1 * (tmpd>80),labels=c("cold","hot")))

hotcold<-group_by(chicago, tempcat)
hotcold 

summarize(hotcold, pm25 = mean(pm25), o3 = max(o3tmean2),no2=median(no2tmean2))

summarize(hotcold,pm25=mean(pm25,na.rm=TRUE),o3=max(o3mean2),no2=median(no2tmean2))

#also categorize data set on other variables (each year?)

chicago<-mutate(chicago,year=as.POSIXlt(date)$year +1900)
years<-group_by(chicago,year)
summarize(years,pm25=mean(pm25,na.rm=TRUE),o3=max(o3mean2),no2=median(no2tmean2))

#dplyr implements a special operator that chains diferent ops together very readable 

# %>% pipeline operator 

chicago %>% 
    mutate(month = as.POSIXlt(date)$mon+1) %>% 
    summarize(pm25=mean(pm25,na.rm=T),o3=max(o3tmean2),no2=median(no2tmean2))
    
    
#dplyr grammar there are few additional benefits 
#data.table for large fast tables 
#sql interface for rdb via dbi package is keww too 






################
## Merging data lecture last of week 3 

# peer review experiment 

#if(!file.exists("./data")){dir.create("./data")}
fileUrl1 <- "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileUrl2<-"https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
download.file(fileUrl1,destfile="reviews.csv")
download.file(fileUrl2,destfile="solutions.csv")
reviews<-read.csv("reviews.csv"); solutions<-read.csv("solutions.csv")
head(reviews,2)
head(solutions,2)

#merging data 

names(reviews)
names(solutions)
#iportant parameters, x, y, by, by.x, by.y, all 
#only if same variables 

mergedData=merge(reviews,solutions,by.x="solution_id",by.y="id",all=TRUE)    
head(mergedData)

intersect(names(solutions),names(reviews))
#it will merge onthes same variabl es by default 

mergedData2 = merge(reviews,solutions,all=TRUE)
head(mergedData2)

#using join() in plyr faster than merge 

df1 = data.frame(id=sample(1:10),x=rnorm(10))
df2 = data.frame(id=sample(1:10),y=rnorm(10))
arrange(join(df1,df2),id) #increasing order by id 
df3 = data.frame(id=sample(1:10),z=rnorm(10))
dfList=list(df1,df2,df3)
join_all(dfList)
#plyr page and R data join 
# http://en.wikipedia.org/wiki/Join_(SQL)) 




############################## 
#QUIZ 3 week 3 end 

#Question 1
#The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here: 

#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv 

#and load the data into R. The code book, describing the variable names is here: 

#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf 

#Create a logical vector that identifies the households on greater than 10 acres who sold more than $10,000 worth of agriculture products. Assign that logical vector to the variable agricultureLogical. Apply the which() function like this to identify the rows of the data frame where the logical vector is TRUE. which(agricultureLogical) What are the first 3 values that result?

#125, 238,262

library(httr)
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl,destfile="ss06hid.csv")
communities<-read.csv("ss06hid.csv")
logicalvector<-data$ACR==3 & data$AGS==6 
top3<-which(logicalvector)[1:3]
top3 


#Question 2
#Using the jpeg package read in the following picture of your instructor into R 

#https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg 

#Use the parameter native=TRUE. What are the 30th and 80th quantiles of the resulting data? (some Linux systems may produce an answer 638 different for the 30th quantile)

#GOT THIS WRONG>>>UNSURE WHY!

library(jpeg)
jpegUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
jpegFile<-"jeff.jpg"
download.file(jpegUrl,jpegFile)
jpegJeff<-readJPEG(jpegFile,native=TRUE)
quantile(jpegJeff,probs=c(0.3,0.8))




#Question 3
#Load the Gross Domestic Product data for the 190 ranked countries in this data set: 

#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv 

#Load the educational data from this data set: 

#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv 

#Match the data based on the country shortcode. How many of the IDs match? Sort the data frame in descending order by GDP rank (so United States is last). What is the 13th country in the resulting data frame? 

#Original data sources: 
#http://data.worldbank.org/data-catalog/GDP-ranking-table 
#http://data.worldbank.org/data-catalog/ed-stats


library(data.table)
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
fileName<-"GDP.csv"
download.file(fileUrl,fileName)
gdp<-data.table(read.csv("GDP.csv",skip=4,nrows=191))
gdp<-gdp[X != ""]
gdp<-gdp[,list(X,X.1,X.3,X.4)]
setnames(gdp,c("X","X.1","X.3","X.4"),c("CountryCode","rankingGDP","Long.Name","GDP"))

fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
fileName<-"FEDSTATS_Country.csv"
download.file(fileUrl,fileName)
stats<-data.table(read.csv(fileName))

mergedData<-merge(gdp,stats,all=TRUE,by=c("CountryCode"))

sum(!is.na(unique(mergedData$rankingGDP)))

mergedData[order(rankingGDP,decreasing=TRUE),list(CountryCode,Long.Name.x,Long.Name.y,rankingGDP,GDP)][13]



#Question 4
#What is the average GDP ranking for the "High income: OECD" and "High income: nonOECD" group?

mergedData[,mean(rankingGDP,na.rm=TRUE),by=Income.Group]

#Question 5
#Cut the GDP ranking into 5 separate quantile groups. Make a table versus Income.Group. How many countries are Lower middle income but among the 38 nations with highest GDP?

breaks<-quantile(mergedData$rankingGDP,probs=seq(0,1,0.2),na.rm=TRUE)
mergedData$quantileGDP<-cut(mergedData$rankingGDP,breaks=breaks)
mergedData[Income.Group=="Lower middle income",.N,by=c("Income.Group","quantileGDP")]


######

######

##GO THROUGH THE FOLLOWING FOR ACCURACY.

## Quiz 4.
# Problem 1.
data <- read.csv("./data/microdata.csv")
names(data)[123]
strsplit(names(data)[123], "wgtp")
# [[1]]
# [1] ""   "15"
# Problem 2.
gdpData <- read.csv("./data/gdp.csv")
cleanedData <- gsub(",", "", gdpData[5:194, 5])
numData <- as.numeric(cleanedData)
mean(numData) 
# [1] 377652.4
# Problem 3.
countryNames <- gdpData[5:194,4]
regexec("^United", countryNames)
# 3
# Problem 4. 
newGdpData <- gdpData[6:194, c(1, 2, 4, 5)]
colnames(newGdpData) <- c("CountryCode", "Ranking", "Economy", "GDP")
rownames(newGdpData) <- NULL # renumbering
educationData <- read.csv("./data/education.csv")
names(educationData)
mergedData <- merge(newGdpData, educationData, by.x="CountryCode", by.y="CountryCode", all=TRUE)
head(mergedData) 



##########################################################
###################################################


#WEEK 4 

#EDITING TEXT VARIABLES LECTURE 

fileUrl<-"https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="cameras.csv",method="curl")
cameraData<-read.csv("cameras.csv")
names(cameraData)
tolower(names(cameraData))
#toupper() exists too dawg.
#can also separate out variables with values separated by periods
splitNames=strsplit(names(cameraData),"\\.") #\\ is an escape character bc periods are a character 
splitNames[[5]]
splitNames[[6]]
mylist<-list(letters=c("A","b","c"),numbers=1:3,matrix(1:25,ncol=5))
head(mylist)
mylist[1] #select first component of listing
mylist$letters
mylist[[1]]
#remove all periods and only get first part of variable name 
splitNames[[6]][1]#took sixth element of list, first element of the sixth element
firstElement<-function(x){x[1]}#takes first value of that list. 
sapply(splitNames,firstElement)#apply first element function, removed period from the location 

#LOOKING at peer review data again 
fileUrl1<-"https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileUrl2<-"https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
download.file(fileUrl1,destfile="reviews.csv",method="curl")
download.file(fileUrl2,destfile="solutions.csv",method="curl")
reviews<-read.csv("reviews.csv")
solutions<-read.csv("solutions.csv")
head(reviews,2)
head(solutions,2)
names(reviews)
sub("_","",names(reviews),)#sub command will find THE FIRST underscore, replace with nothing, in names of reviews 
testName<-"this_is_a_test"
sub"_","",testName)
gsub("_","",testName)#gsub does all underscores bro! 

#SEARCHING for specific values in variables
grep("Alameda",cameraData$intersection) #grep will find all intersections with alameda as one of the roads. shows the number of instances, fourth fifth and 36th element 
table(grepl("Alameda",cameraData$intersection))#grepl looks for alameda in int varaible, returns vector of true when it appears. 
cameraData2<-cameraData[!grepl("Alameda",cameraData$intersection),] #subsetting. this shows all cases where it doesn't appear 
#MORE on grep()
grep("Alameda",cameraData$intersection,value=TRUE) #value = true says teh actual value instead of which row it appears. 
grep("JeffStreet",cameraData$intersection) #find values that do not appear. 
length(grep("JeffStreet",cameraData$intersection))
library(stringr)
nchar("Jeffrey Leek")
substr("Jeffrey Leek",1,7)
paste("Jeffrey","Leek")
paste0("Jeffrey","Leek")#NO spaces 
str_trim("Pablo     ")#trims spaces
#want all lower cases. be descriptive, no duplicates, make character values into factor variables, not T F, use 0 1 , Male Female helps more. 



###########

### REGULAR EXPRESSIONS LECTURE WK 4 

#combo of literals and metacharacters 
#patterns of interest. 
#literals are words that match exactly 
#regular expressions are simplest with ONLY literals ... sometimes you only want something more nuanced
#need to express whitespace word boundaries, sets of literals, beg and end of line, alternatives "war" or "peace".... METACHARACTERS!

#^i think ... matches start of a line 
#morning$ ... matches end of the line only
#[Bb][Uu][Ss][Hh] ... matches all versions of the word Bush
#[Ii] am ... matches cap and lower i I at beginning of line 
#specify a range of letters by using...
#^[0-9][a-zA-Z] ... matches all lines with numbers at start of line and letters caps and lower to follow 
#[^?.]$ ... matches end of line that ends in anything other than a period or question mark .... 




## Lecture 3 Week 4, Regular Expressions II
#Metacharacters

#"." is used to refer to any character, so 

9.11 

#will match lines with anything in between nine and eleven

#the OR metacharacter is |
flood | fire #is either fire or flood, as many as you'd like to put

^[Gg]ood | [Bb]ad 

#matches beginning of line, OR ANYWHERE IN LINE a "bad"... unless you do...

([Gg]ood | [Bb]ad) 

[Gg]eorge( [Ww]\.)? [Bb]ush #? is optional, doesn't need W to find it. 

#\ is an escape character, consider "." to be a litera dot. 

(.*) #means to repeat any character repeated any number of times. Find all in parentheses

[0-9]+ (.*)[0-9]+ #the * and + signs are metcharacters used to indicate repetetion. 
#here we looked for at least one number, followed by any number of characters, followed by at least one number 
#* means any number including none of the item
#+means at least one of the item 

#{ and } are referred to as interval quantifiers, let us specify the min and max number of matches of an expressions

[Bb]ush( +[^ ]+ +){1,5} debate #looking for bush eithe r cap or lower case. in between that and debate, at least one space, something not sa psace, and a space between one and five times. 
#between one and five word like objects in between Bush and debate
#m,n means at least m bu not more than n matches
#m means exactly m matches
#m, means at least m matches

#parentheses 
 +([a-zA-Z]+) +\1 + 
#space followed by at least one char, followed by a space, folowed by what we have in parentheses indicated by \1 

#* is greedy so it always matches the longest possible string that satisfies the regular expression
^s(.*)s #matches anything that starts and ends with "s"
#start at beg of string, for s, by any number of characters, then ends in s. 
^s(.*?)s$ #makes it less greedy. 





#Working with Dates lecture 

d1 = date() 
d1 
class(d1) #character class 

d2 = Sys.Date()
class(d2) #Date variable 
#nicer for analyzing date data... 

#We can reformat that into a new type of date format 
#%d = day as number 
#%a = abbrev weekday 
#%A = unabbreviated weekday 
#%m = month (00 - 12) 
#%b = abbrev month 
#%B = unabbreviated month 
#%y = 2 digit year 
#%Y = 4 digit year 

format(d2,"%a %b %d") #bbrev for day, month, and actual date returns Sun Jan 12 format (with correct date)

#take character vectors and turn them into dates 

x = c("1jan1960","2jan1960","31mar1960","30jul1960")
z = as.Date(x,"%d%b%Y")

z[1] - z[2]
as.numeric(z[1]-z[2])

#convert to Julian

weekdays(d2)
months(d2)
julian(d2) #no of days since origin which is 1/1/70

#Lubridate package is great

library(lubridate); ymd("20140108")
mdy("08/04/2013")
dmy("03-04-2013")
ymd_hms("2011-08-03 10:15:03")
ymd_hms("2011-08-03 10:15:03",tz="Pacific/Auckland")
?Sys.timezone

x=dmy(c("1jan2013","2jan2013","31mar2013","30jul2013"))
wday(x[1])
wday(x[1],label=TRUE) #gets the actual weekday label with levels 

?POSIXlt
?POSIXct 



#Last lecture, Data Resources to use data 

#http://data.un.org/ UN datasets 
#http://data.gov/ US datasets -- many cities have open data 
#http://data.gov.uk/
#http://data.gouv.fr/ 
#http://data.gov.au/
#https://www.govdata.de/ 
#http://gov.hk/en/theme/psi/datasets/ 
#http://data.go.jp/
#for more ... http://www.data.gov/opendatasites 

#gapminder has a lot of development and human ealth data 
#survey data from us 
#info chimps dataplace 
#kaggle has interesting datasets good for practice data science competitions 

#Famous data scientists 
#http://bitly.com/bundles/hmason/1 Hilary Mason 
#https://delicious.com/pskomoroch/dataset 
#http://www.quora.com/Jeff-Hammerbacher/Introduction-to-Data-Science-Sets 
#http://www.kdnuggets.com/gps.html 
#http://blog.mortardata.com/post/67652898761/6-dataset-lists-curated-by-data-scientists  research quality curation 

#stanford large network data 
#UCI machine learning 
#kdd nugets datsets 
#CMU statlib 
#ArXiv data 
#public datasets on amazon web services 
#quite a few api's too 

#twitteR package 
#figshare and rfigshare 
#PLoS and rplos 
#RFacebook
#rOpenSci 
#RGoogleMaps 


















