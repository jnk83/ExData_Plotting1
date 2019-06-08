## Read in data
data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

## Convert to date/time class
data$Date <- as.Date(data$Date, "%d/%m/%Y")
date$Time <- paste(data$Date, data$Time, sep = " ")
data$Time <- strptime(data$Time, "%Y-%m-%d %H:%M:%S", tz = "")

## Subset data into two day time period
subdata <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
remove(data)

## Plot one - histogram
hist(subdata$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

## Make png copy
dev.copy(png, file = "plot1.png")

## Close png device
dev.off()
