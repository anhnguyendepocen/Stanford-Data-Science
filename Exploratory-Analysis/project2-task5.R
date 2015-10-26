## How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

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
