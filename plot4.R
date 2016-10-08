
if(exists("energy")==FALSE){
  energy<-read.table("household_power_consumption.txt", header=TRUE, na.strings = "?",sep=";")
  energy$Date<-as.Date(energy$Date,format="%d/%m/%Y")
  energy<-subset(energy,Date=="2007-02-01"|Date=="2007-02-02")
  energy$Date_Time<-paste(energy$Date,energy$Time)
  energy$Date_Time<-strptime(energy$Date_Time,"%Y-%m-%d %H:%M:%S")
}
png("plot4.png",width=480,height=480)

par(mfrow=c(2,2))

plot(energy$Date_Time,energy$Global_active_power, type="n", xlab="", ylab="Global Active Power")
lines(energy$Date_Time,energy$Global_active_power)


plot(energy$Date_Time,energy$Voltage, type="n", xlab="datetime", ylab="Voltage")
lines(energy$Date_Time,energy$Voltage)

plot(energy$Date_Time, energy$Sub_metering_1, type="n", xlab="",ylab="Energy sub metering")
lines(energy$Date_Time,energy$Sub_metering_1,col="black")
lines(energy$Date_Time,energy$Sub_metering_2, col="red")
lines(energy$Date_Time,energy$Sub_metering_3, col="blue")
legend("topright",col=c("black", "red", "blue"), lty=c(1,1,1),lwd=2.5, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")


plot(energy$Date_Time,energy$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
lines(energy$Date_Time,energy$Global_reactive_power)

dev.off()
