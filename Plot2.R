plot2 <- function (){
  unzip("exdata-data-household_power_consumption.zip")
  
  #prepare and filter data 
  data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
  cleanData <- data[as.Date(data$Date, format="%d/%m/%Y") %in% as.Date(c("2007-02-01", "2007-02-02")),]
  
  #Start the plot
  png(filename="plot2.png", width=480,height=480,units="px")
  plot(strptime(paste(cleanData$Date, cleanData$Time), "%d/%m/%Y %H:%M:%S"), as.numeric(as.character(cleanData$Global_active_power)), type = "l", ylab = "Global Active Power (kilowatts)", xlab="")  
  dev.off()
}
