generatePlot <- function() {
  powerData <- generateDateTimeData()
  globalData <- as.numeric(as.character(powerData$Global_active_power))
  voltage <- as.numeric(as.character(powerData$Voltage))
  subMeter1 <- as.numeric(as.character(powerData$Sub_metering_1))
  subMeter2 <- as.numeric(as.character(powerData$Sub_metering_2))
  subMeter3 <- as.numeric(as.character(powerData$Sub_metering_3))
  reactivePower <- as.numeric(as.character(powerData$Global_reactive_power))
  
  png("plot4.png" , width = 480, height = 480)
  
  par(mfrow=c(2,2), mar=c(5.1,4.1,4.1,2.1), oma=c(0,0,0,0))
  
  plot(
    powerData$DateTime,
    globalData,
    type="l", 
    main="",
    ylab="Global Active Power (kiloWatts)",
    xlab=""
    )
  
  plot(
    powerData$DateTime,
    voltage,
    type="l", 
    main="",
    ylab="Voltage",
    xlab="datetime"
    )
  
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
    legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
    bty="n"
  )
  
  plot(
    powerData$DateTime,
    reactivePower,
    type="l",
    main="",
    ylab="Global_reactive_power",
    xlab="datetime"
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