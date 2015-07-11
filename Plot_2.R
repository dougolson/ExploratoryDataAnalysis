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
### Plot #2
png(filename = "plot_2.png",width = 480,height = 480,units = "px")
plot(1:length(data2$Time),
     data2$Global_active_power,
     type = "l",
     xaxt = "n",
     xlab = "",
     ylab="Global Active Power")
axis(1, at = c(1, length(data2$Time)/2,length(data2$Time)),
     labels = expression("Thu", "Fri", "Sat"))
dev.off()