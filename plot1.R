data<-read.table("household_power_consumption.txt",header=TRUE, sep=";")

data$Global_active_power <- as.numeric(data$Global_active_power)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")


result<- subset(data, Date=="2007-02-01"|Date=="2007-02-02")

png("plot1.png", width=480, height=480)
hist(result$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
