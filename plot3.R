ddata<-read.table("household_power_consumption.txt",header=TRUE, sep=";")

xaxis <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data <- cbind(data, xaxis)

data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- format(data$Time, format="%H:%M:%S")

result<- subset(data, Date=="2007-02-01"|Date=="2007-02-02")

png("plot3.png", width=480, height=480)
with(result, plot(xaxis, Sub_metering_1, type="l", col="black", xlab="Day", ylab="Energy sub metering"))
lines(result$xaxis, result$Sub_metering_2, type="l", col="red")
lines(result$xaxis, result$Sub_metering_3, type="l", col="blue")
legend(c("topright"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, col = c("black","red","blue"))
dev.off()
