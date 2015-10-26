## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

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
g+geom_point(aes(color=type),size=5,alpha=1/2)+geom_smooth(method="lm",linetype=4,se=FALSE)+labs(y="Total PM2.5 Emissions",title="Yearly PM2.5 Emissions by Source, Baltimore MD")
dev.off()
