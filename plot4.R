#Read in the data
hpc <- read.csv2("household_power_consumption.txt",stringsAsFactors = FALSE)
# Subset for dates 01-02-2007 and 02-02-2007, 2880 rows remaining
hpc <- hpc[hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007",]
# Combine Date & Time into DateTime  column
hpc <- cbind(DateTime = strptime(paste(hpc$Date,hpc$Time),"%d/%m/%Y %H:%M:%S"),hpc[,3:ncol(hpc)])

# Turn measurments into numeric coilumns
hpc[,2:ncol(hpc)] <- sapply(hpc[,2:ncol(hpc)],as.numeric)


# Create the fourth plot: lineplots of submetering (3) per timestamp
png(filename = "plot4.png",width = 480,height = 480)
par(mfrow=c(2,2))
plot(hpc$DateTime, hpc$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
plot(hpc$DateTime, hpc$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
plot(hpc$DateTime, hpc$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
points(hpc$DateTime, hpc$Sub_metering_2, type = "l", col="red")
points(hpc$DateTime, hpc$Sub_metering_3, type = "l", col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
plot(hpc$DateTime, hpc$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power",type = "l")
dev.off()
