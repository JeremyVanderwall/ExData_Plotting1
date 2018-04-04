
#read in the data
myData <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)

#correct data types in frame
myData$Date <- as.Date(myData$Date, "%d/%m/%Y")
myData$Global_active_power <- as.numeric(as.character(myData$Global_active_power))


# Subset the data
myData <- myData[myData$Date == "2007-02-01" | myData$Date =="2007-02-02", ]

#make the graph on screen, to make sure it looks right
hist(myData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (killowatts)",  freq = TRUE)

#make the graph in a file
png(filename="plot1.png")
hist(myData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (killowatts)",  freq = TRUE)
dev.off()
