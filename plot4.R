
#################################################
#   Plot4 Code for Coursera Mod 4 Wk 1 Project  #
#################################################

##STEP1: Set WD and Read Data

setwd("./Coursera/R Files/Module 4/Week 1")
data<-read.table("household_power_consumption.txt", header= TRUE, sep=";", na.strings="?")

##STEP2: Subset first two days of Feb 2007

subData <- data[(data$Date =="1/2/2007") | (data$Date =="2/2/2007"),]

##STEP3: DateTime creation and format

subData$dateTime <- strptime(paste(subData$Date, subData$Time,sep = " "), "%d/%m/%Y %H:%M:%S")

##STEP4: PLOT 4
par(mfrow = c(2, 2)) 

#1st
plot(subData$dateTime,as.numeric(subData$Global_active_power), type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

#2nd
plot(subData$dateTime,as.numeric(as.character(subData$Voltage)), type="l",xlab="datetime",ylab="Voltage")

#3rd
plot(subData$dateTime, as.numeric(subData$Sub_metering_1), type="l", xlab = "", ylab = "Energy Submetering")
lines(subData$dateTime, as.numeric(subData$Sub_metering_2), type="l", col = "Red")
lines(subData$dateTime, as.numeric(subData$Sub_metering_3), type="l", col = "Blue")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)

#4th
plot(subData$dateTime,as.numeric(as.character(subData$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")

##STEP5: Create PNG file
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()