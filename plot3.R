  if(exists("energy")==FALSE){
    energy<-read.table("household_power_consumption.txt", header=TRUE, na.strings = "?",sep=";")
    energy$Date<-as.Date(energy$Date,format="%d/%m/%Y")
    energy<-subset(energy,Date=="2007-02-01"|Date=="2007-02-02")
    energy$Date_Time<-paste(energy$Date,energy$Time)
    energy$Date_Time<-strptime(energy$Date_Time,"%Y-%m-%d %H:%M:%S")
  }
  png("plot3.png",width=480,height=480)
  plot(energy$Date_Time, energy$Sub_metering_1, type="n", xlab="",ylab="Energy sub metering")
  lines(energy$Date_Time,energy$Sub_metering_1,col="black")
  lines(energy$Date_Time,energy$Sub_metering_2, col="red")
  lines(energy$Date_Time,energy$Sub_metering_3, col="blue")
  legend("topright",col=c("black", "red", "blue"), lty=c(1,1,1),lwd=2.5, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  dev.off()