## Read in data
data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

## Convert to date/time class
data$Date <- as.Date(data$Date, "%d/%m/%Y")
date$Time <- paste(data$Date, data$Time, sep = " ")
data$Time <- strptime(data$Time, "%Y-%m-%d %H:%M:%S", tz = "")

## Subset data into two day time period
subdata <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
remove(data)

## change margins and mfrow
par(mar = c(2, 4, 2, 2), mfrow = c(2,2))

## Plot four(a) - global active power plot with line
with(subdata, plot(Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

## Plot four(b) - voltage plot with line
with(subdata, plot(Time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

## Plot four(c) - sub metering plot with three lines and legend
with(subdata, plot(Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(subdata, lines(Time, Sub_metering_2, col = "red"))
with(subdata, lines(Time, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2",
                "Sub_metering_3"), bty = "n", cex = .75)

## Plot four(d) - global reactive power plot
with(subdata, plot(Time, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))

## Make png copy
dev.copy(png, file = "plot4.png")

## Close png device
dev.off()