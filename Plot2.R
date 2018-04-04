
#read in the data
myData <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)

#correct data types
myData$Time <- strptime(paste(myData$Date, myData$Time), "%d/%m/%Y%H:%M:%S")
myData$Date <- as.Date(myData$Date, format = "%d/%m/%Y")

myData$Global_active_power <- as.numeric(as.character(myData$Global_active_power))


# Subset the data
myData <- myData[myData$Date == "2007-02-01" | myData$Date =="2007-02-02", ]


#plot to screen to verify it looks right
with (myData, plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))


#plot to file
png(filename="plot2.png")
with (myData, plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()

