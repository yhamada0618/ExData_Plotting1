  if(exists("energy")==FALSE){
  energy<-read.table("household_power_consumption.txt", header=TRUE, na.strings = "?",sep=";")
  energy$Date<-as.Date(energy$Date,format="%d/%m/%Y")
  energy<-subset(energy,Date=="2007-02-01"|Date=="2007-02-02")
  energy$Date_Time<-paste(energy$Date,energy$Time)
  energy$Date_Time<-strptime(energy$Date_Time,"%Y-%m-%d %H:%M:%S")
  }

  png("plot1.png",width=480,height=480)
  hist(energy$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
  dev.off()