plot4 <- function (){
  unzip("exdata-data-household_power_consumption.zip")
  
  #prepare and filter data 
  data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
  cleanData <- data[as.Date(data$Date, format="%d/%m/%Y") %in% as.Date(c("2007-02-01", "2007-02-02")),]
  xAxis <- strptime(paste(cleanData$Date, cleanData$Time), "%d/%m/%Y %H:%M:%S")
  
  #prepare plot
  png(filename="plot4.png", width=480,height=480,units="px")
  par(mfrow=c(2,2))
  
  #Start plot 1
  plot(xAxis, as.numeric(as.character(cleanData$Global_active_power)), type = "l", ylab = "Global Active Power", xlab="")  
  
  #Start plot 2
  plot(xAxis, as.numeric(as.character(cleanData$Voltage)), type = "l", ylab = "Voltage", xlab="datetime")    
  
  #Start plot 3
  plot(xAxis, as.numeric(as.character(cleanData$Sub_metering_1)), type = "l", 
       ylab = "Energy Sub metering ", xlab="")  
  lines(xAxis,as.numeric(as.character(cleanData$Sub_metering_2)),col="red")
  lines(xAxis,as.numeric(as.character(cleanData$Sub_metering_3))/3,col="blue")
  legend( x="topright", 
          legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), 
          col=c("black","red","blue"), lwd=1, 
          merge=FALSE )
  
  #Start the plot 4
  plot(xAxis, as.numeric(as.character(cleanData$Global_reactive_power)), type = "l", ylab = "Global_reactive_power", xlab="datetime")    
  
  dev.off()
}
