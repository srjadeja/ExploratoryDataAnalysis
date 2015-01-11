#Project 1-Plot2

# Read the data from the household_power_consumption.txt.

data1<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings=c("?",""))

# Read the selected data from the dates 2007-02-01 and 2007-02-02 into data2 

data2 <- subset(data1,data1$Date == "2/1/2007" | data1$Date == "2/2/2007")

# Change from Character to Date Format
data2$Date <- as.Date(data2$Date, format="%m/%d/%Y")

# Combine the Date and Time Field
data2$DateTime <- paste(data2$Date, data2$Time)

#  convert the combine Date and Time variables to Date Time classes 
data2$DateTime <- strptime(data2$DateTime, format="%Y-%m-%d %H:%M:%S")

# Plotting the combined DateTime field to Global Active power field
plot(data2$DateTime,data2$Global_active_power,xlab="",ylab="Global Active Power(Kilowatts)",type="l")

#Storing the plot as a png file
dev.copy(png,file="plot2.png", width=480,height=480)

dev.off()




