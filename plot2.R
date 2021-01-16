url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "Week1.zip")
dataset<- read.csv(unz("Week1.zip", "household_power_consumption.txt"), sep = ';')
dataset$Date<- as.POSIXct(strptime(dataset$Date, format = "%d/%m/%Y"))
r<- dataset$Date =="2007-02-01" | dataset$Date == "2007-02-02"
set<- dataset[r,]
rm(dataset)
set$Global_active_power<- as.numeric(set$Global_active_power)
datetime<- paste(set$Date, set$Time, sep = " ")
datetime <- as.POSIXct(datetime, format= "%Y-%m-%d %H:%M:%S" )
plot(datetime, set$Global_active_power, xlab="", ylab="Global Active Power (killowatts)", type = "n")
lines(datetime, set$Global_active_power)
dev.copy(png, file = "plot2.png", width=480, height =480)
dev.off()
dev.off()