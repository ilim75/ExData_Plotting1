## Plot 4 - 4 section plot
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

## Plot 4
## type = line
## mfrow = C(2,2)
## 	(1,1) line, x = datetime, y = Global Active Power
##	(1,2) line, x = datetime, y = Voltage
##	(2,1) line, x = datetime, y = Energy sub metering
## 	(2,2) line, x = datetime, y = Global_reactive_power

## set paramaters for plot positions
par(mfrow = c(2, 2), mar = c(4,4,2,2))

with(sub_data, {
	plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")	## Plot 1
	plot(datetime, Voltage, type = "l", ylab = "Voltage")						## Plot 2
	
        plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")		## Plot 3
	lines(datetime, Sub_metering_2, col = "red")
	lines(datetime, Sub_metering_3, col = "blue") 
	
	legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
		lty = 1, 
		bty = "n",   ## remove legend box outline 
		col = c("black", "red", "blue"), 
		cex = 0.8)   ## decrease legend size
	
	plot(datetime, Global_reactive_power, type = "l")						## Plot 4
	})

## print to file and close off device
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()




