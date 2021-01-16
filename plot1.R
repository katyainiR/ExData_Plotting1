##reading data into R
url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "Week1.zip")
dataset<- read.csv(unz("Week1.zip", "household_power_consumption.txt"), sep = ';')


##converting character to dates. (column1)
dataset$Date<- as.POSIXct(strptime(dataset$Date, format = "%d/%m/%Y"))

##subsetting as per given criterion of dates
r<- dataset$Date =="2007-02-01" | dataset$Date == "2007-02-02"
set<- dataset[r,]

#removing the big dataset as it's no longer needed
rm(dataset)

#converting character to numeric, Global active power
set$Global_active_power<- as.numeric(set$Global_active_power)

##making the histogram
hist(set$Global_active_power, col="red", xlab= "Global Active Power (killowatts)", main = "Global Active Power")

##copying the plot to png file device 
dev.copy(png, width = 480, height = 480, file ="plot1.png")
dev.off()
dev.off()
