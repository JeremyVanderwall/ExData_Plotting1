library(chron)

myData <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
myData$Date <- as.Date(myData$Date, format = "%d/%m/%Y")
myData$Time <- chron(times. = myData$Time)                  
myData$Global_active_power <- as.numeric(as.character(myData$Global_active_power))
myData$Global_reactive_power <- as.numeric(as.character(myData$Global_reactive_power))
myData$Voltage <- as.numeric(as.character(myData$Voltage))
myData$Global_intensity <- as.numeric(as.character(myData$Global_intensity))
myData$Sub_metering_1 <- as.numeric(as.character(myData$Sub_metering_1))
myData$Sub_metering_2 <- as.numeric(as.character(myData$Sub_metering_2))

# Subset the data
myData <- myData[myData$Date >="2007-02-01" , ]
myData <- myData[myData$Date <"2007-02-02" , ]

myData <- myData[with(myData, order(Time)), ]
par(mfrow = c(2,2))
with (myData, plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
with (myData, plot(Time, Voltage, type="l", xlab="", ylab="Voltage"))

plot(myData$Time, myData$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub Meetering")
points(myData$Time, myData$Sub_metering_2, type = "l", col = "red", lwd=1)
points(myData$Time, myData$Sub_metering_3, type = "l", col = "blue", lwd = 1)
legend('topright', c("meet 1", "meet 2", "meet 3"), text.col = c("black", "red", "blue"))

with (myData, plot(Time, Global_reactive_power, type="l", xlab="", ylab="Global Reactive Power (kilowatts)"))

png(filename="plot4.png")
par(mfrow = c(2,2))
with (myData, plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
with (myData, plot(Time, Voltage, type="l", xlab="", ylab="Voltage"))

plot(myData$Time, myData$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub Meetering")
points(myData$Time, myData$Sub_metering_2, type = "l", col = "red", lwd=1)
points(myData$Time, myData$Sub_metering_3, type = "l", col = "blue", lwd = 1)
legend('topright', c("meet 1", "meet 2", "meet 3"), text.col = c("black", "red", "blue"))

with (myData, plot(Time, Global_reactive_power, type="l", xlab="", ylab="Global Reactive Power (kilowatts)"))
dev.off()