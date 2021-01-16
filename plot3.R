##same steps as the previous codes
url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "Week1.zip")
dataset<- read.csv(unz("Week1.zip", "household_power_consumption.txt"), sep = ';')
dataset$Date<- as.POSIXct(strptime(dataset$Date, format = "%d/%m/%Y"))
r<- dataset$Date =="2007-02-01" | dataset$Date == "2007-02-02"
set<- dataset[r,]
rm(dataset)
datetime<- paste(set$Date, set$Time, sep = " ")
datetime <- as.POSIXct(datetime, format= "%Y-%m-%d %H:%M:%S" )

##data type conversion from character to numeric for sub_metering_1,2 and 3.
set$Sub_metering_1<- as.numeric(set$Sub_metering_1)
set$Sub_metering_2<- as.numeric(set$Sub_metering_2)
set$Sub_metering_3<- as.numeric(set$Sub_metering_3)

#plotting the three sets in one plot
plot(datetime, set$Sub_metering_1, type="n", ylab="Energy Sub metering", xlab="")
lines(datetime, set$Sub_metering_1)
lines(datetime, set$Sub_metering_2, col="red")
lines(datetime, set$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "sub_metering_3"), lty = 1, col = c("black", "red", "blue"))

##copying the plot to png file device
dev.copy(png, file = "plot3.png", height =480, width = 480)
dev.off()
dev.off()
