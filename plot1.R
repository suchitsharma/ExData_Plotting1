## Code for Plot 1

## Load data.table library
library(data.table)

## read data file, seperator is ';' and '?' repreasents Null values
DT <- suppressWarnings(fread("household_power_consumption.txt", sep=";", na.strings="?"))

## Filter for Data for 1/2/2007 & 2/2/2007 only
good <- (DT$Date == "1/2/2007") | (DT$Date == "2/2/2007")
DT <- DT[good]

##Open PNG file
png(file = "plot1.png")

##Plot graph
hist(as.numeric(DT$Global_active_power), col = "red", xlab = "Global Active Power (Kilowatts)", main = "Global Active Power")

##Close file
dev.off()