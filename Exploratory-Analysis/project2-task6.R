## Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?


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
