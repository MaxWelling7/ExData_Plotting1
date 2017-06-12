#Read in the data
hpc <- read.csv2("household_power_consumption.txt",stringsAsFactors = FALSE)
# Subset for dates 01-02-2007 and 02-02-2007, 2880 rows remaining
hpc <- hpc[hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007",]
# Combine Date & Time into DateTime  column
hpc <- cbind(DateTime = strptime(paste(hpc$Date,hpc$Time),"%d/%m/%Y %H:%M:%S"),hpc[,3:ncol(hpc)])

# Turn measurments into numeric coilumns
hpc[,2:ncol(hpc)] <- sapply(hpc[,2:ncol(hpc)],as.numeric)


# Create the first plot: frequency of global power consumption
png(filename = "plot1.png",width = 480,height = 480)
hist(hpc$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red", main="Global Active Power")
dev.off()

# Create the first plot: frequency of global power consumption
png(filename = "plot2.png",width = 480,height = 480)
plot(hpc$DateTime, hpc$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()

