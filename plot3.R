generatePlot <- function() {
  powerData <- generateDateTimeData()
  
  subMeter1 <- as.numeric(as.character(powerData$Sub_metering_1))
  subMeter2 <- as.numeric(as.character(powerData$Sub_metering_2))
  subMeter3 <- as.numeric(as.character(powerData$Sub_metering_3))
  
  png("plot3.png" , width = 480, height = 480)
  
  plot(
    powerData$DateTime,
    subMeter1,
    type="l",
    xlab="",
    ylab="Energy sub metering"
    )
  
  lines(
    powerData$DateTime,
    subMeter2,
    type="l",
    col="red"
    )
  lines(
    powerData$DateTime,
    subMeter3,
    type="l",
    col="blue"
    )
  
  legend(
    "topright",
     lty=1,
     col=c("black","red","blue"),
     cex=1,
     legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
    )
  dev.off()
}

generateDateTimeData <- function() {
  powerData <- getData() 
  powerData$DateTime <- strptime(paste(powerData$Date, powerData$Time), format="%d/%m/%Y %H:%M:%S")
  powerData
}

getData <- function() {
  powerData <- read.table("household_power_consumption.txt", header = T, sep = ";")
  powerData <- filter(powerData, Date == "2/2/2007" | Date == "1/2/2007")
}