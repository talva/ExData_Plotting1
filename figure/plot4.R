plot4 <- function(){
  x<-read.table("household_power_consumption.txt", skip = 66637, sep=";", nrows= 2880)
  
  x_header<-read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows= 1)
  colnames(x)<-colnames(x_header)
  
  strptime(paste(x$Date,x$Time), "%d/%m/%Y %H:%M:%S")
  x$FormattedDate <- strptime(paste(x$Date,x$Time), "%d/%m/%Y %H:%M:%S")
  
  png(file = "plot4.png", width = 480, height = 480)
  par(mfrow=c(2,2))
  plot(x$FormattedDate,x$Global_active_power, type="l",xlab = "", ylab = "Global Active Power (kilowatts)")

  plot(x$FormattedDate,x$Voltage, type="l",xlab = "datetime", ylab = "Voltage")
  
  plot(x$FormattedDate, x$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")
  points(x$FormattedDate, x$Sub_metering_3, type="l", col="blue")
  points(x$FormattedDate, x$Sub_metering_2, type="l", col="red")
  legend("topright",lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(x$FormattedDate,x$Global_reactive_power, type="l",xlab = "datetime", ylab = "Global_reactive_power")
  dev.off()
}