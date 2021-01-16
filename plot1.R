url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "Week1.zip")
dataset<- read.csv(unz("Week1.zip", "household_power_consumption.txt"), sep = ';')
dataset$Date<- as.POSIXct(strptime(dataset$Date, format = "%d/%m/%Y"))
r<- dataset$Date =="2007-02-01" | dataset$Date == "2007-02-02"
set<- dataset[r,]
rm(dataset)
set$Global_active_power<- as.numeric(set$Global_active_power)
hist(set$Global_active_power, col="red", xlab= "Global Active Power (killowatts)", main = "Global Active Power")
dev.copy(png, width = 480, height = 480, file ="plot1.png")
dev.off()
dev.off()