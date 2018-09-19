data<-read.table("household_power_consumption.txt",header=TRUE, sep=";")

xaxis <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data <- cbind(data, xaxis)

data$Global_active_power <- as.numeric(data$Global_active_power)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- format(data$Time, format="%H:%M:%S")

result<- subset(data, Date=="2007-02-01"|Date=="2007-02-02")

png("plot2.png", width=480, height=480)
with(result, plot(xaxis, Global_active_power, type="l"))
dev.off()
