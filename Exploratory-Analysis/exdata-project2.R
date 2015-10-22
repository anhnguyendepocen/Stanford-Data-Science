#Introduction

#Fine particulate matter (PM2.5) is an ambient air pollutant for which there is strong evidence that it is harmful to human health. In the United States, the Environmental Protection Agency (EPA) is tasked with setting national ambient air quality standards for fine PM and for tracking the emissions of this pollutant into the atmosphere. Approximatly every 3 years, the EPA releases its database on emissions of PM2.5. This database is known as the National Emissions Inventory (NEI). You can read more information about the NEI at the EPA National Emissions Inventory web site.

#For each year and for each type of PM source, the NEI records how many tons of PM2.5 were emitted from that source over the course of the entire year. The data that you will use for this assignment are for 1999, 2002, 2005, and 2008.

#Data

#The data for this assignment are available from the course web site as a single zip file:

#Data for Peer Assessment [29Mb]
#The zip file contains two files:

#PM2.5 Emissions Data (summarySCC_PM25.rds): This file contains a data frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. For each year, the table contains number of tons of PM2.5 emitted from a specific type of source for the entire year. Here are the first few rows.

##     fips      SCC Pollutant Emissions  type year
## 4  09001 10100401  PM25-PRI    15.714 POINT 1999
## 8  09001 10100404  PM25-PRI   234.178 POINT 1999
## 12 09001 10100501  PM25-PRI     0.128 POINT 1999
## 16 09001 10200401  PM25-PRI     2.036 POINT 1999
## 20 09001 10200504  PM25-PRI     0.388 POINT 1999
## 24 09001 10200602  PM25-PRI     1.490 POINT 1999
#fips: A five-digit number (represented as a string) indicating the U.S. county

#SCC: The name of the source as indicated by a digit string (see source code classification table)

#Pollutant: A string indicating the pollutant

#Emissions: Amount of PM2.5 emitted, in tons

#type: The type of source (point, non-point, on-road, or non-road)

#year: The year of emissions recorded

#Source Classification Code Table (Source_Classification_Code.rds): This table provides a mapping from the SCC digit strings in the Emissions table to the actual name of the PM2.5 source. The sources are categorized in a few different ways from more general to more specific and you may choose to explore whatever categories you think are most useful. For example, source “10100101” is known as “Ext Comb /Electric Gen /Anthracite Coal /Pulverized Coal”.

#You can read each of the two files using the readRDS() function in R. For example, reading in each file can be done with the following code:

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#as long as each of those files is in your current working directory (check by calling dir() and see if those files are in the listing).

#Assignment

#The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999–2008. You may use any R package you want to support your analysis.

#Questions

#You must address the following questions and tasks in your exploratory analysis. For each question/task you will need to make a single plot. Unless specified, you can use any plotting system in R to make your plot.

#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

#Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

#How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

#Making and Submitting Plots

#For each plot you should

#Construct the plot and save it to a PNG file.

#Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. Your code file should include code for reading the data so that the plot can be fully reproduced. You must also include the code that creates the PNG file. Only include the code for a single plot (i.e. plot1.R should only include code for producing plot1.png)

#Upload the PNG file on the Assignment submission page

#Copy and paste the R code from the corresponding R file into the text box at the appropriate point in the peer assessment.
## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ##


getwd()
setwd("C:/Users/Paul/Desktop/R")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",destfile="courseproject.zip")
unzip("courseproject.zip")
#Still had to manually extract files for some reason
setwd("C:/Users/Paul/Desktop/R/courseproject2")
NEI <- readRDS("summarySCC_PM25.rds") 
SCC <- readRDS("Source_Classification_Code.rds")
head(NEI)
head(SCC)
str(NEI)
str(SCC)
names(NEI)
names(SCC)


## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.


getwd()
setwd("C:/Users/Paul/Desktop/R")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",destfile="courseproject.zip")
unzip("courseproject.zip")
#Still had to manually extract files for some reason
setwd("C:/Users/Paul/Desktop/R/courseproject2")
setwd("C:/Users/Paul/Desktop/R/courseproject2")
NEI <- readRDS("summarySCC_PM25.rds") 
SCC <- readRDS("Source_Classification_Code.rds")

library(plyr)

byYear <- aggregate(Emissions ~ year,NEI,sum)
barplot(height=byYear$Emissions, names.arg=byYear$year, xlab="years",ylab=expression('Total Particulate Matter'[2.5]*' Emissions'), main='Total PM Emissions by Year')

pm25 <- ddply(NEI, .(year), summarise, totalEmissions=sum(Emissions))
png("plot1.png", width=480, height=480)
plot(pm25$totalEmissions~pm25$year,xlab="Year",ylab="Total PM2.5 Emissions", pch=19, col="red",type="l")
title(main="Total Particular Matter 2.5 Emissions Per Year")
dev.off()




## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

getwd()
setwd("C:/Users/Paul/Desktop/R")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",destfile="courseproject.zip")
unzip("courseproject.zip")
#Still had to manually extract files for some reason
setwd("C:/Users/Paul/Desktop/R/courseproject2")
setwd("C:/Users/Paul/Desktop/R/courseproject2")
NEI <- readRDS("summarySCC_PM25.rds") 
SCC <- readRDS("Source_Classification_Code.rds")

library(plyr)

#Subset the data 
baltimore <- subset(NEI, NEI$fips=='24510')

#Compile total emissions in Baltmore by Year 

pm25<-ddply(baltimore,.(year),summarise,totalEmissions=sum(Emissions))

#Test plot 

plot(pm25$totalEmissions~pm25$year,xlab="Year",ylab="Total PM2.5 Emissions in Baltimore",col="red",type="l",main="Yearly PM2.5 Emissions in Baltimore MD")

#Create and save plot to png file 

png("plot2.png",width=480,height=480)
plot(pm25$totalEmissions~pm25$year,
    xlab="Year",
    ylab="Total PM2.5 Emissions in Baltimore",
    col="blue",
    type="l",
    main="Yearly PM2.5 Emissions in Baltimore MD")
dev.off()



## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

setwd("C:/Users/Paul/Desktop/R")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",destfile="courseproject.zip")
unzip("courseproject.zip")
#Still had to manually extract files for some reason
setwd("C:/Users/Paul/Desktop/R/courseproject2")

NEI <- readRDS("summarySCC_PM25.rds") 
SCC <- readRDS("Source_Classification_Code.rds")

library(plyr)
library(ggplot2)

#Subset the data 
baltimore <- subset(NEI, NEI$fips=='24510')

pm25<-ddply(baltimore,.(year,type),summarise,totalEmissions=sum(Emissions))

png("plot3.png",width=800,height=300)
g<-qplot(year,totalEmissions,data=pm25,facets=.~type)
g+geom_point(aes(color=type),size=5,alpha=1/2)+geom_smooth(method="lm",linetype=4)+labs(y="Total PM2.5 Emissions",title="Yearly PM2.5 Emissions by Source, Baltimore MD")
dev.off()


## Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

setwd("C:/Users/Paul/Desktop/R/courseproject2")
NEI <- readRDS("summarySCC_PM25.rds") 
SCC <- readRDS("Source_Classification_Code.rds")

library(plyr)
library(ggplot2)

#Identify SCC observations that represent coal sources
coal<-grep("Coal",unique(SCC$EI.Sector),value=TRUE)
split<-SCC$EI.Sector %in% coal
sccCoal<-subset(SCC,split==TRUE)$SCC 

#Subset the NEI dataset, filter all but coal 
split<-NEI$SCC %in% sccCoal 
coalOnly<-subset(NEI,split==TRUE)

#Sum pm2.5 emissions by year 
pm25<-ddply(coalOnly,.(year),summarise,totalEmissions=sum(Emissions))

#Check plot 
g<-qplot(year,totalEmissions,data=pm25)
g+geom_point(color="red",size=5,alpha=1/2)+geom_smooth(method="lm",linetype=7)+labs(y="Total PM2.5 Emissions",x="Year",title="Total PM2.5 Emissions from Coal Related Sources")

#Plot 
png("plot4.png",width=480,height=480)
g<-qplot(year,totalEmissions,data=pm25)
g+geom_point(color="red",size=5,alpha=1/2)+geom_smooth(method="lm",linetype=7)+labs(y="Total PM2.5 Emissions",x="Year",title="Total PM2.5 Emissions from Coal Related Sources")
dev.off()



## How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

getwd()
setwd("C:/Users/Paul/Desktop/R")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",destfile="courseproject.zip")
unzip("courseproject.zip")
#Still had to manually extract files for some reason

setwd("C:/Users/Paul/Desktop/R/courseproject2")
NEI <- readRDS("summarySCC_PM25.rds") 
SCC <- readRDS("Source_Classification_Code.rds")

library(plyr)
library(ggplot2)

#Separate motor vehicle sources 
motor<-grep("On-Road",unique(SCC$EI.Sector),value=TRUE)
split<-SCC$EI.Sector %in% motor
sccMotor<-subset(SCC,split==TRUE)$SCC 

#Subset Baltimore motor dataset 

baltimore<-subset(NEI,NEI$fips=="24510")
split<-baltimore$SCC %in% sccMotor 
motorBaltimore <-subset(baltimore,split==TRUE)

pm25<-ddply(motorBaltimore, .(year),summarise,totalEmissions=sum(Emissions))

#Check plot 



g<-qplot(year,totalEmissions,data=pm25)
g+geom_point(color="green",size=5,alpha=1/2)+geom_smooth(method="lm",linetype=1)+labs(y="Total PM2.5 Emissions",x="Year",title="Baltimore PM2.5 Emissions from Motor Sources")

png("plot5.png",width=480,height=480)
g<-qplot(year,totalEmissions,data=pm25)
g+geom_point(color="green",size=5,alpha=1/2)+geom_smooth(method="lm",linetype=1)+labs(y="Total PM2.5 Emissions",x="Year",title="Baltimore PM2.5 Emissions from Motor Sources")
dev.off()




## Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

setwd("C:/Users/Paul/Desktop/R")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",destfile="courseproject.zip")
unzip("courseproject.zip")

setwd("C:/Users/Paul/Desktop/R/courseproject2")
NEI <- readRDS("summarySCC_PM25.rds") 
SCC <- readRDS("Source_Classification_Code.rds")

library(plyr)
library(ggplot2)

#Motor vehicle sources for both, get LA Baltimore 

motor<-grep("On-Road",unique(SCC$EI.Sector),value=TRUE)
split<-SCC$EI.Sector %in% motor 
sccMotor<-subset(SCC,split==TRUE)$SCC 
losangeles<-subset(NEI,NEI$fips=="06037")
baltimore<-subset(NEI,NEI$fips=="24510")

#Subsets of NEI for both cities for motor veh sources only 

split<-baltimore$SCC %in% sccMotor 
motorBaltimore<-subset(baltimore,split==TRUE)
split<-losangeles$SCC %in% sccMotor 
motorLosangeles<-subset(losangeles,split==TRUE)


#Calculate pm2.5 emissions per year for both cities

pm25MotorBaltimore<-ddply(motorBaltimore,.(year),summarise,totalEmissions=sum(Emissions))
pm25MotorLosangeles<-ddply(motorLosangeles,.(year),summarise,totalEmissions=sum(Emissions))



#Join data together 

pm25MotorBaltimore$location<-"Baltimore"
pm25MotorLosangeles$location<-"Los Angeles"
combined<-rbind(pm25MotorBaltimore,pm25MotorLosangeles)


#Check plot 
g<-qplot(year,totalEmissions,data=combined,color=location,geom=c("point","line"))
g+geom_point(size=4)+geom_smooth(method="lm",linetype=5)+labs(y="PM2.5 Emissions",x="Year",title="Motor Vehicle PM2.5 Emissions in Los Angeles and Baltimore")


#Save PNG file 
png("plot6.png",width=480,height=480)
g<-qplot(year,totalEmissions,data=combined,color=location,geom=c("point","line"))
g+geom_point(size=4)+geom_smooth(method="lm",linetype=5)+labs(y="PM2.5 Emissions",x="Year",title="Motor Vehicle PM2.5 Emissions in Los Angeles and Baltimore")
dev.off()
















