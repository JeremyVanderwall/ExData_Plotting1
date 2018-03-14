library(chron)

myData <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
myData$Date <- as.Date(myData$Date)
myData$Time <- times(myData$Time)                 
myData$Global_active_power <- as.numeric(as.character(myData$Global_active_power))
myData$Global_reactive_power <- as.numeric(as.character(myData$Global_reactive_power))
myData$Voltage <- as.numeric(as.character(myData$Voltage))
myData$Global_intensity <- as.numeric(as.character(myData$Global_intensity))
myData$Sub_metering_1 <- as.numeric(as.character(myData$Sub_metering_1))
myData$Sub_metering_2 <- as.numeric(as.character(myData$Sub_metering_2))

hist(myData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (killowatts)", ylim=c(0,1200000), freq = TRUE)

png(filename="plot1.png")
hist(myData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (killowatts)", ylim=c(0,1200000), freq = TRUE)
dev.off()