
#read in the data
myData <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)

#correct data types
myData$Time <- strptime(paste(myData$Date, myData$Time), "%d/%m/%Y%H:%M:%S")
myData$Date <- as.Date(myData$Date, format = "%d/%m/%Y")
myData$Sub_metering_1 <- as.numeric(as.character(myData$Sub_metering_1))
myData$Sub_metering_2 <- as.numeric(as.character(myData$Sub_metering_2))

# Subset the data
myData <- myData[myData$Date == "2007-02-01" | myData$Date =="2007-02-02", ]


#plot to screen to verify it looks right
plot(myData$Time, myData$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub Meetering")
points(myData$Time, myData$Sub_metering_2, type = "l", col = "red", lwd=1)
points(myData$Time, myData$Sub_metering_3, type = "l", col = "blue", lwd = 1)
legend('topright', c("sub metering 1", "sub metering 2", "sub metering 3"), text.col = c("black", "red", "blue"))

#plot to file
png(filename="plot3.png")
plot(myData$Time, myData$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub Meetering")
points(myData$Time, myData$Sub_metering_2, type = "l", col = "red", lwd=1)
points(myData$Time, myData$Sub_metering_3, type = "l", col = "blue", lwd = 1)
legend('topright', c("sub metering 1", "sub metering 2", "sub metering 3"), text.col = c("black", "red", "blue"))

dev.off()

