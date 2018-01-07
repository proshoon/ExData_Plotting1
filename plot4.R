
#original downloaded file is quite big; taking lots of time to load
#hence, pre-processed using MS Excel
#all data -- except for two days -- removed
#data was saved in CSV format in a file "power.csv"

####power1 <- read.csv("power.csv")


#code below is for loading data from UNZIPPED downloaded file
#this code was not executed because of performance reasons
#instead, the code PROVIDED ABOVE was used

power1 <- read.delim2("household_power_consumption.txt", sep = ";")


#do date-time processing
power1$Date <- paste(power1$Date, power1$Time)
####power1$Date <- strptime(power1$Date, "%m/%d/%Y %H:%M:%S")  #was used ACTUALLY with power.csv
power1$Date <- strptime(power1$Date, "%d/%m/%Y %H:%M:%S")  #for use with UNPROCESSED file
power1 <- subset(power1, Date < "2007-02-03" && Date >= "2007-02-01") #only for two days






par(mfrow = c(2, 2), mar = c(4, 4, 1, 1))
with(power1, {
  plot (Date, Global_active_power, type = "l", xlab="",ylab = "Global Active Power (kilowatts)")
  plot (Date, Voltage, type = "l", xlab="datetime", ylab = "Voltage")
  
  plot (c(Date,Date, Date), c(Sub_metering_1,Sub_metering_2, Sub_metering_3),  type = "n", xlab = "", ylab = "Energy sub metering")
  points (Date, Sub_metering_1, type = "l")
  points (Date, Sub_metering_2, type = "l", col="red")
  points (Date, Sub_metering_3, type = "l", col="blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot (Date, Global_reactive_power, type = "l", xlab="datetime",ylab = "Global_reactive_power")
})







dev.copy(png, file = "plot4.png") ## Copy plot from screen to a PNG file
dev.off() ## Close the PNG device!
