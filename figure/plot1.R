plot1 <- function(){
x<-read.table("household_power_consumption.txt", skip = 66637, sep=";", nrows= 2880)
x_header<-read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows= 1)
colnames(x)<-colnames(x_header)


png(file= "plot1.png", width =480, height = 480)
hist(x$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
}