## Plot 3 - line plot of datetime vs Energy sub metering
## Data ("household_power_consumption.txt") saved to working directory
## Date range: 2007-02-01 and 2007-02-02
## Convert dates with strptime() or as.Date()
## missing values coded as "?" (na.strings)
## graphics device = print to png

## read data table, and subset relevant dates only
power_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
sub_data <- subset(power_data, power_data$Date == "2/2/2007" | power_data$Date == "1/2/2007")

## change Date and Time to datetime in "POSIXlt" "POSIXt" 
sub_data$Date <- as.Date(sub_data$Date, format = "%d/%m/%Y")
sub_data$datetime <- strptime(paste(sub_data$Date, sub_data$Time), "%Y-%m-%d %H:%M:%S")

## Plot graph
with(sub_data, {
        plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
	lines(datetime, Sub_metering_2, col = "red")
	lines(datetime, Sub_metering_3, col = "blue") 
	})
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))


## print to file and close off device
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()




