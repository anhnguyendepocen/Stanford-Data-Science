getwd()
setwd("C:/Users/Paul/Desktop/R")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",destfile="courseproject.zip")
unzip("courseproject.zip")
#Still had to manually extract files for some reason
setwd("C:/Users/Paul/Desktop/R/courseproject2")
NEI <- readRDS("summarySCC_PM25.rds") #takes a few seconds 
SCC <- readRDS("Source_Classification_Code.rds")
head(NEI)
head(SCC)
str(NEI)
str(SCC)
names(NEI)
names(SCC)

library(plyr)

pm25 <- ddply(NEI, .(year), summarise, totalEmissions=sum(Emissions))
png("plot1.png", width=480, height=480)
plot(pm25$totalEmissions~pm25$year,xlab="Year",ylab="Total PM2.5 Emissions", pch=19, col="red",type="l")
title(main="Total Particular Matter 2.5 Emissions Per Year")
dev.off()
