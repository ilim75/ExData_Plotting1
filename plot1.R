## Plot 1 - histogram of Global Active Power vs Frequency
## Data ("household_power_consumption.txt") saved to working directory
## Date range: 2007-02-01 and 2007-02-02
## Convert dates with strptime() or as.Date()
## missing values coded as "?" (na.strings)
## graphics device = print to png

## read data table, and subset relevant dates only
power_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
sub_data <- subset(power_data, power_data$Date == "2/2/2007" | power_data$Date == "1/2/2007")

## plot histogram
hist(sub_data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

## Print to file then close off graphics device
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()