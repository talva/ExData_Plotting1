plot2 <- function(){
  x<-read.table("household_power_consumption.txt", skip = 66637, sep=";", nrows= 2880)
  
  x_header<-read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows= 1)
  colnames(x)<-colnames(x_header)
  
  strptime(paste(x$Date,x$Time), "%d/%m/%Y %H:%M:%S")
  x$FormattedDate <- strptime(paste(x$Date,x$Time), "%d/%m/%Y %H:%M:%S")
  
  png(file = "plot2.png", width = 480, height = 480)
  plot(x$FormattedDate,x$Global_active_power, type="l",xlab = "", ylab = "Global Active Power (kilowatts)",)
  dev.off()
}