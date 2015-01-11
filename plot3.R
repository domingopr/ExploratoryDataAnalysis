##Reading Lines of a Text File
con <- file("household_power_consumption.txt", "r")
data2 <- read.table(con, sep = ";", header=TRUE,na.strings="?")
##Close conection
close(con)

## Filter data to obtain only date 1/2/2007 andDate == 2/2/2007
data3 <- filter(data2, Date == "1/2/2007" | Date == "2/2/2007")
## to combine date and time in one colummn
data3$DateTime <- as.POSIXct(paste(data3$Date, data3$Time), format="%d/%m/%Y %H:%M:%S") 

## PLot 3
par(mar = c(6,4,4,2))



with(data3, plot(DateTime,Sub_metering_1,type = "n",ylab="Energy Sub metering", xlab=""))   ## Draw  Plot 3
legend("topright",lty = c(1, 1, 1),col= c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) 
points(data3$DateTime, data3$Sub_metering_1,type="l", col="black")
points(data3$DateTime, data3$Sub_metering_2,type="l", col="red")
points(data3$DateTime, data3$Sub_metering_3,type="l", col="blue")

dev.copy(png, file = "plot3.png",width=480, height=480)
dev.off()



