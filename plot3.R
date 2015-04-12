## Code for Plot 3

## Load data.table library
library(data.table)

## read data file, seperator is ';' and '?' repreasents Null values
DT <- suppressWarnings(fread("household_power_consumption.txt", sep=";", na.strings="?"))

## Filter for Data for 1/2/2007 & 2/2/2007 only
good <- (DT$Date == "1/2/2007") | (DT$Date == "2/2/2007")
DT <- DT[good]

##Open PNG file
png(file = "plot3.png")

##Plot graph
plot(DT$Sub_metering_1, type = "s", ylab = "Energy sub metering", xlab = "")
points(DT$Sub_metering_2, type = "s", col = "red")
points(DT$Sub_metering_3, type = "s", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2" ,"Sub_metering_2"), lty=c(1,1,1), lwd=c(2.5,2.5,2.5), col=c("black","red", "blue"))

##Close file
dev.off()