setwd("/Users/dougolson/Google Drive/Coursera/Exploratory\ Data\ Analysis/")
dataUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url = dataUrl,destfile = "./data.zip",method = "curl")
unzip("./data.zip")
list.files()
data <- read.csv("~/Google Drive/Coursera/Exploratory Data Analysis/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
str(data)
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data$Time <- strptime(data$Time,format = "%H:%M:%S",)
### Subset the data
data2 <- data[data$Date=="2007-02-01" | data$Date== "2007-02-02",]
str(data)
### Plot #4
png(filename = "plot_4.png",width = 480,height = 480,units = "px")
par(mfrow = c(2,2), cex = .6)
plot(1:length(data2$Time),
     data2$Global_active_power,
     type = "l",
     xaxt = "n",
     xlab = "",
     ylab="Global Active Power")
axis(1, at = c(1, length(data2$Time)/2,length(data2$Time)),
     labels = expression("Thu", "Fri", "Sat"))
with(data2,plot(1:length(Voltage),
                Voltage, 
                type = "l",
                xaxt = "n",
                xlab = "datetime",
                ylab="Voltage"))
axis(1, at = c(1, length(data2$Time)/2,length(data2$Time)),
     labels = expression("Thu", "Fri", "Sat"))

with(data2,plot(1:length(Sub_metering_1),
                Sub_metering_1, 
                type = "l",
                xaxt = "n",
                xlab = "",
                ylab="Energy sub metering"))
with(data2,points(1:length(Sub_metering_2),
                  Sub_metering_2,
                  type = "l", 
                  col = "red"))
with(data2,points(1:length(Sub_metering_3),
                  Sub_metering_3, 
                  type = "l", 
                  col = "blue"))
axis(1, at = c(1, length(data2$Time)/2,length(data2$Time)),
     labels = expression("Thu", "Fri", "Sat"))
legend("topright", lty = 1, bty = "n", col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), cex = 1)
with(data2,plot(1:length(Global_reactive_power),
                Global_reactive_power, 
                type = "l",
                xaxt = "n",
                xlab = "datetime",
                ylab="Global_reactive_power"))
axis(1, at = c(1, length(data2$Time)/2,length(data2$Time)),
     labels = expression("Thu", "Fri", "Sat"))
dev.off()