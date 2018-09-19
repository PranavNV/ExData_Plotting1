ddata<-read.table("household_power_consumption.txt",header=TRUE, sep=";")

xaxis <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data <- cbind(data, xaxis)

data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- format(data$Time, format="%H:%M:%S")

result<- subset(data, Date=="2007-02-01"|Date=="2007-02-02")

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

with(result, plot(xaxis, Global_active_power, type="l"))

with(result, plot(xaxis, Voltage, type="l"))

with(result, plot(xaxis, Sub_metering_1, type="l", col="black", xlab="Day", ylab="Energy sub metering"))
lines(result$xaxis, result$Sub_metering_2, type="l", col="red")
lines(result$xaxis, result$Sub_metering_3, type="l", col="blue")
legend(c("topright"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, col = c("black","red","blue"))

with(result, plot(xaxis, Global_reactive_power, type="l"))

dev.off()


