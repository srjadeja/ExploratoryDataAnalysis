#Project 1-Plot4

# Read the data from the household_power_consumption.txt.

data1<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings=c("?",""))

# Read the selected data from the dates 2007-02-01 and 2007-02-02 into data2 

data2 <- subset(data1,data1$Date == "1/2/2007" | data1$Date == "2/2/2007")

# Change from Character to Date Format
data2$Date <- as.Date(data2$Date, format="%m/%d/%Y")

# Combine the Date and Time Field
data2$DateTime <- paste(data2$Date, data2$Time)

#  convert the combine Date and Time variables to Date Time classes 
data2$DateTime <- strptime(data2$DateTime, format="%Y-%d-%m %H:%M:%S")

# Creating a 2x2 plot matrix

par(mfrow= c(2,2))

# Plotting the subplot 1
# Plotting the combined DateTime field to Global Active power field
plot(data2$DateTime,data2$Global_active_power,xlab="",ylab="Global Active Power",type="l")

# Plotting the subplot 2
# Plotting the combined DateTime field to Voltage field
plot(data2$DateTime,data2$Voltage,xlab="datetime",ylab="Voltage",type="l")

# Plotting the subplot 3
# Plotting the combined DateTime field to 3 Sub Meter
plot(data2$DateTime,data2$Sub_metering_1,type="l",xlab="",ylab="Energy sub Metering",col="black")
lines(data2$DateTime,data2$Sub_metering_2, col="red")
lines(data2$DateTime,data2$Sub_metering_3, col="blue")


legend("topright",c("Sub_metering 1","Sub_metering 2","Sub_metering 3"),lty=c(1,1,1),lwd=c(1,1,1),col=c("black","red","blue"),cex=.6,text.width = strwidth("Sub_metering_1"))

# Plotting the subplot 4
# Plotting the combined DateTime field to Global Reactive Power
plot(data2$DateTime,data2$Global_reactive_power,xlab="datetime",ylab="Global_Reactive_Power",type="l")

#Storing the plot as a png file
dev.copy(png,file="plot4.png", width=480,height=480)

dev.off()




