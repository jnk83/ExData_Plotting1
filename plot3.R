## Read in data
data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

## Convert to date/time class
data$Date <- as.Date(data$Date, "%d/%m/%Y")
date$Time <- paste(data$Date, data$Time, sep = " ")
data$Time <- strptime(data$Time, "%Y-%m-%d %H:%M:%S", tz = "")

## Subset data into two day time period
subdata <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
remove(data)

## Plot three - sub metering plot with three lines
with(subdata, plot(Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(subdata, lines(Time, Sub_metering_2, col = "red"))
with(subdata, lines(Time, Sub_metering_3, col = "blue"))

## Add legend
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2",
                                                                        "Sub_metering_3"))
## Make png copy
dev.copy(png, file = "plot3.png")

## Close png device
dev.off()
