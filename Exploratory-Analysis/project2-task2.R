## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

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
