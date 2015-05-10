#Course Project 1 
#Exploratory Data Analysis

#Introduction

#This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository for machine learning datasets. In particular, we will be using the “Individual household electric power consumption Data Set” which I have made available on the course web site:

#Dataset: Electric power consumption [20Mb]

#Description: Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.

#The following descriptions of the 9 variables in the dataset are taken from the UCI web site:

#Date: Date in format dd/mm/yyyy
#Time: time in format hh:mm:ss
#Global_active_power: household global minute-averaged active power (in kilowatt)
#Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
#Voltage: minute-averaged voltage (in volt)
#Global_intensity: household global minute-averaged current intensity (in ampere)
#Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
#Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
#Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
#Loading the data

#When loading the dataset into R, please consider the following:

#The dataset has 2,075,259 rows and 9 columns. First calculate a rough estimate of how much memory the dataset will require in memory before reading into R. Make sure your computer has enough memory (most modern computers should be fine).

#We will only be using data from the dates 2007-02-01 and 2007-02-02. One alternative is to read the data from just those dates rather than reading in the entire dataset and subsetting to those dates.

#You may find it useful to convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions.

#Note that in this dataset missing values are coded as ?.

#Making Plots

#Our overall goal here is simply to examine how household energy usage varies over a 2-day period in February, 2007. Your task is to reconstruct the following plots below, all of which were constructed using the base plotting system.

#First you will need to fork and clone the following GitHub repository: https://github.com/rdpeng/ExData_Plotting1

#For each plot you should

#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.

#Name each of the plot files as plot1.png, plot2.png, etc.

#Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. Your code file should include code for reading the data so that the plot can be fully reproduced. You must also include the code that creates the PNG file.
#Add the PNG file and R code file to the top-level folder of your git repository (no need for separate sub-folders)
#When you are finished with the assignment, push your git repository to GitHub so that the GitHub version of your repository is up to date. There should be four PNG files and four R code files, a total of eight files in the top-level folder of the repo.

#The four plots that you will need to construct are shown below.





#data_full <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

#rm(data_full)



setwd("C:/Users/Paul/Desktop/R")
list.files()
dataFile<-"household_power_consumption.txt"
data<-read.table(dataFile,header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")
subData<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
str(subData)
head(subData)

#graph 1 
globalActivePower<-as.numeric(subData$Global_active_power)
with(subData,
    globalActivePower<-as.numeric(subData$Global_active_power)
     png("plot1.png",width=480,height=480)
     hist(globalActivePower,col="red",main="Global Active Power",xlab="Global Active Power")
     dev.off()
     )
hist(globalActivePower,col="red",main="Global Active Power",xlab="Global Active Power")

#graph 2 
with(subData, {
    png("plot2.png",width=480,height=480)
    dateTime<-strptime(paste(subData$Date,subData$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
    dateTime<-as.POSIXct(dateTime)
    globalActivePower<-as.numeric(subData$Global_active_power)
    plot(globalActivePower~dateTime,type="line",xlab="",ylab="Global Active Power (kW)")
    dev.off()
})

#graph 3
with(subData, {
    dateTime<-strptime(paste(Date,Time,sep=" "), "%d/%m/%Y %H:%M:%S")
    dateTime<-as.POSIXct(dateTime)
    subMeter1<-as.numeric(Sub_metering_1)
    subMeter2<-as.numeric(Sub_metering_2)
    subMeter3<-as.numeric(Sub_metering_3)
    png("plot3.png",width=480,height=480)
    plot(dateTime,subMeter1,type="l",ylab="Energy Submetering",xlab="")
    lines(dateTime,subMeter2,type="l",col="red")
    lines(dateTime,subMeter3,type="l",col="blue")
    legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2.5,col=c("black","red","blue"))
    dev.off()
})


#graph 4
with(subData, {
    png("plot4.png",height=480,width=480)
    globalActivePower<-as.numeric(Global_active_power)
    globalReactivePower<-as.numeric(Global_reactive_power)
    dateTime<-strptime(paste(Date,Time,sep=" "),
                      "%d/%m/%Y %H:%M:%S")
    dateTime<-as.POSIXct(dateTime)
    voltage<-as.numeric(Voltage)
    subMeter1<-as.numeric(Sub_metering_1)
    subMeter2<-as.numeric(Sub_metering_2)
    subMeter3<-as.numeric(Sub_metering_3)
    par(mfrow=c(2,2))
    plot(globalActivePower~dateTime,type="l",xlab="",ylab="Global Active Power",cex=0.2)
    plot(voltage~dateTime,type="l",ylab="Voltage",xlab="")
    plot(subMeter1~dateTime,type="l",ylab="Energy Submetering",xlab="")
    lines(dateTime,subMeter2,type="l",col="red")
    lines(dateTime,subMeter3,type="l",col="blue")
    legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=2.5,col=c("black","red","blue"))
    plot(globalReactivePower~dateTime,type="l",xlab="datetime",ylab="Global_reactive_power")
    dev.off()
})












