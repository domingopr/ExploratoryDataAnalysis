##Reading Lines of a Text File
con <- file("household_power_consumption.txt", "r")
data2 <- read.table(con, sep = ";", header=TRUE,na.strings="?")
##Close conection
close(con)

## Filter data to obtain only date 1/2/2007 andDate == 2/2/2007
data3 <- filter(data2, Date == "1/2/2007" | Date == "2/2/2007")
## to combine date and time in one colummn
data3$DateTime <- as.POSIXct(paste(data3$Date, data3$Time), format="%d/%m/%Y %H:%M:%S") 

## PLot 2

par(mar = c(6,4,4,2))

with(data3, plot(DateTime,Global_active_power,type="l",ylab = "Global Active Power (kilowatt)",xlab = " "))   ## Draw  Plot 2

dev.copy(png, file = "plot2.png",width=480, height=480)
dev.off()

