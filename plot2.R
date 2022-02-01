## Plot 2 - line plot of datetime vs Global Active Power
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


## plot graph
with(sub_data, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

## Print to file then close off graphics device
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()




