## Code for Plot 4

## Load data.table library
library(data.table)

## read data file, seperator is ';' and '?' repreasents Null values
DT <- suppressWarnings(fread("household_power_consumption.txt", sep=";", na.strings="?"))

## Filter for Data for 1/2/2007 & 2/2/2007 only
good <- (DT$Date == "1/2/2007") | (DT$Date == "2/2/2007")
DT <- DT[good]

##Open PNG file
png(file = "plot4.png")

##Plot graph
par(mfrow = c(2, 2))
plot(DT$Global_active_power, type = "l", ylab = "Global Active Power", xaxt="n", xlab = "")
axis(1, at=c(1,1500,2800), labels=c("Thu", "Fri", "Sat"))

plot(DT$Voltage, type = "l", ylab = "Voltage", xaxt="n", xlab = "datetime")
axis(1, at=c(1,1500,2800), labels=c("Thu", "Fri", "Sat"))

plot(DT$Sub_metering_1, type = "l", ylab = "Energy sub metering", xaxt="n", xlab = "")
points(DT$Sub_metering_2, type = "l", col = "red")
points(DT$Sub_metering_3, type = "l", col = "blue")
axis(1, at=c(1,1500,2800), labels=c("Thu", "Fri", "Sat"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2" ,"Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5,2.5,2.5), col=c("black","red", "blue"))
plot(DT$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xaxt="n", xlab = "datetime")
axis(1, at=c(1,1500,2800), labels=c("Thu", "Fri", "Sat"))

##Close file
dev.off()