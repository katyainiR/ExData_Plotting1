
##Same steps as the previous plots
url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "Week1.zip")
dataset<- read.csv(unz("Week1.zip", "household_power_consumption.txt"), sep = ';')
dataset$Date<- as.POSIXct(strptime(dataset$Date, format = "%d/%m/%Y"))
r<- dataset$Date =="2007-02-01" | dataset$Date == "2007-02-02"
set<- dataset[r,]
rm(dataset)
datetime<- paste(set$Date, set$Time, sep = " ")
datetime <- as.POSIXct(datetime, format= "%Y-%m-%d %H:%M:%S" )

##converting the required variables to desired data types
set$Global_active_power<- as.numeric(set$Global_active_power)
set$Voltage<- as.numeric(set$Voltage)
set$Global_reactive_power <- as.numeric(set$Global_reactive_power)
set$Sub_metering_1<- as.numeric(set$Sub_metering_1)
set$Sub_metering_2<- as.numeric(set$Sub_metering_2)
set$Sub_metering_3<- as.numeric(set$Sub_metering_3)

##to view the plots in a separate pane as my screen is pretty small.
windows()

##partitioning the graphic device
par(mfrow=c(2,2), bg = "white")

##plot1 
plot(datetime, set$Global_active_power, xlab="", ylab="Global Active Power", type = "n")
lines(datetime, set$Global_active_power)

#plot2
plot(datetime, set$Voltage, type ="n", ylab="Voltage", xlab="datetime" )
lines(datetime, set$Voltage)

##plot3
plot(datetime, set$Sub_metering_1, type="n", ylab="Energy Sub metering", xlab="")
lines(datetime, set$Sub_metering_1, col="black")
lines(datetime, set$Sub_metering_2, col="red")
lines(datetime, set$Sub_metering_3, col="blue")
##defining the legend with required characteristics
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "sub_metering_3"), lty = 1, col = c("black", "red", "blue"), bty ="n")
plot(datetime, set$Global_reactive_power, type ="n", ylab="Global_reactive_power", xlab="datetime" )
lines(datetime, set$Global_reactive_power)

##copying the plot from screen device to png file device
dev.copy(png, file="plot4.png", width = 480, height =480)
dev.off()
dev.off()
