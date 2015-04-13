## Code for Plot 2

## Load data.table library
library(data.table)

## read data file, seperator is ';' and '?' repreasents Null values
DT <- suppressWarnings(fread("household_power_consumption.txt", sep=";", na.strings="?"))

## Filter for Data for 1/2/2007 & 2/2/2007 only
good <- (DT$Date == "1/2/2007") | (DT$Date == "2/2/2007")
DT <- DT[good]

##Open PNG file
png(file = "plot2.png")

##Plot graph
plot(DT$Global_active_power, type = "l", ylab = "Global Active Power (Kilowatts)", xaxt="n", xlab = "")
axis(1, at=c(1,1500,2800), labels=c("Thu", "Fri", "Sat"))

##Close file
dev.off()