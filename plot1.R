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




hist(power1$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")





dev.copy(png, file = "plot1.png") ## Copy plot from screen to a PNG file
dev.off() ## Close the PNG device!
