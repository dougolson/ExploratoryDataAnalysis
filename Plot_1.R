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
### Plot #1
par(mfrow=c(1,1),cex=.75)
png(filename = "plot_1.png",width = 480,height = 480,units = "px")
hist(x = data2$Global_active_power,
     main = "Global Active Power",
     col = "red", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")
dev.off()

