
#################################################
#   Plot2 Code for Coursera Mod 4 Wk 1 Project  #
#################################################

##STEP1: Set WD and Read Data

setwd("./Coursera/R Files/Module 4/Week 1")
data<-read.table("household_power_consumption.txt", header= TRUE, sep=";", na.strings="?")

##STEP2: Subset first two days of Feb 2007

subData <- data[(data$Date =="1/2/2007") | (data$Date =="2/2/2007"),]

##STEP3: DateTime creation and format

subData$dateTime <- strptime(paste(subData$Date, subData$Time,sep = " "), "%d/%m/%Y %H:%M:%S")

##STEP4: PLOT 2

plot(subData$dateTime,as.numeric(subData$Global_active_power), type="l", main ="Global Active Power vs Time", xlab = "",
     ylab = "Global Active Power (kilowatts)")

##STEP5: Create PNG file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()