
#Project 1-Plot1
#Download the ???Individual household electric power consumption Data Set???

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="./Dataset.zip",method="curl")

#Unzip the downloaded file

unzip(zipfile="./Dataset.zip")

# Read the data from the household_power_consumption.txt.

data1<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings=c("?",""))

# Read the selected data from the dates 2007-02-01 and 2007-02-02 into data2 

data2 <- subset(data1,data1$Date == "2/1/2007" | data1$Date == "2/2/2007")

#Set the margins for the Histogram Plot

par(mar=c(4,5,2,3))

# Plot the histogram into a png file "plot1.png"
hist(data2$Global_active_power,col= "RED", main= paste("Global Active Power"), xlab="Global Active Power (Kilowatts)")

dev.copy(png,file="plot1.png", width=480,height=480)

dev.off()




