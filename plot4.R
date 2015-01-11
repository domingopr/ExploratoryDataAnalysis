##Reading Lines of a Text File
con <- file("household_power_consumption.txt", "r")
data2 <- read.table(con, sep = ";", header=TRUE,na.strings="?")
##Close conection
close(con)

## Filter data to obtain only date 1/2/2007 andDate == 2/2/2007
data3 <- filter(data2, Date == "1/2/2007" | Date == "2/2/2007")
## to combine date and time in one colummn
data3$DateTime <- as.POSIXct(paste(data3$Date, data3$Time), format="%d/%m/%Y %H:%M:%S") 



par(mar = c(4,4,2,2))

## To plot the in the col order the next plot appear on the lower left and the lower right ##
par(mfcol=c(2,2))

##To plot the first upper right

with(data3, plot(DateTime,Global_active_power,type="l",ylab = "Global Active Power",xlab = " "))   ## Draw  Plot 2


## To plot the next in  lower left 
with(data3, plot(DateTime,Sub_metering_1,type = "n",ylab="Energy Sub metering", xlab=""))   ## Draw  Plot 3
legend("topright",lty = c(1, 1, 1),col= c("black","red","blue"),cex=0.5,text.width =strwidth("Sub_metering_1"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) 


points(data3$DateTime, data3$Sub_metering_1,type="l", col="black")
points(data3$DateTime, data3$Sub_metering_2,type="l", col="red")
points(data3$DateTime, data3$Sub_metering_3,type="l", col="blue")

## To plot the next  upper right
with(data3, plot(DateTime,Voltage,type="l",ylab = "Voltage",xlab = "dateTime"))   ## Draw  Plot 4a
## To plot the last in  lower  right
with(data3, plot(DateTime,Global_reactive_power,type="l",ylab = "Global_reactive_power",xlab = "dateTime"))   ## Draw  Plot 4b


dev.copy(png, file = "plot4.png",width=480, height=480)
dev.off()