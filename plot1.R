
#################################################
#   Plot1 Code for Coursera Mod 4 Wk 1 Project  #
#################################################

##STEP1: Set WD and Read Data

setwd("./Coursera/R Files/Module 4/Week 1")
data<-read.table("household_power_consumption.txt", header= TRUE, sep=";", na.strings="?")

##STEP2: Subset first two days of Feb 2007

subData <- data[(data$Date =="1/2/2007") | (data$Date =="2/2/2007"),]

##STEP3: PLOT 1

hist(as.numeric(subData$Global_active_power), main ="Global Active Power", xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", col="red")

##STEP4: Create PNG file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
