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
