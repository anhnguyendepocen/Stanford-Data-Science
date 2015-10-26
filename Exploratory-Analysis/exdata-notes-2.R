#Exploratory Data Analysis Course 
#Johns Hopkins, Data Science Specialization
#Plotting systems, principles of graphics, etc etc. 

#Lecture 1 Principles of Analytic Graphics

#Principle 1: Evidence is always COMPARED TO WHAT? 
    #Especially in plots. Compare two hypotheses.
#Principle 2: Show CAUSALITY 
    #Not in the formal sense, but it implies a mechanism (theory).
    #Particulate matter in room with and without air cleaner. 
#Principle 3: Show multivariate data (as much on plot as possible)
    #Integrate data onto one plot to tell a rich story. 
    #Air pollution outdoor for NYC 87-00. 
    #Sometimes confounding variables exist, look at seasonal information.
    #Completely changes the relationship.
#Principle 4: Integrate the evidence
#Principle 5: Describe and document evidence w/ labels, scales, code. 
    #Sources, how made, etc. 
#Principle 6: Content is King
    #No graph can save a bad theory. 
    #Must present it well. 






#### EXPLORATORY GRAPHS LECTURE

#To figure out what you need to know, modeling stratgies, debug analysis
#communicate results and present them

#Exploratory graphs, understand properties, find patterns, debug, modeling results 

#Made on the fly, large number of them. Clean up later. 

#EPA Air Pollution, fine particle pollution 

pollution<-read.csv("data/avpm25csv",colClasses=c("numeric","character","factor","numeric","numeric"))
head(pollution)

#think about your question carefully
#use boxplots, histograms, density, bar plots, summary, quartiles, etc. 

boxplot(pollution$pm25,col="blue")

hist(pollution$pm25,col="green",breaks=100)
rug(pollution$pm25) #rug one dimensional density plot
barplot(table(pollution$region),col="wheat",main="No of Counties")

















