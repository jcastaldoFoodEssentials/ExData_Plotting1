library(dplyr)
library(lubridate)

generatePlot <- function() {
  powerData <- generateDateTimeData()
  globalData <- as.numeric(as.character(powerData$Global_active_power))
  png("plot2.png" , width = 480, height = 480)
  plot(
    powerData$DateTime, 
    globalData, 
    type = "l",
    xlab = "",
    ylab = "Global Active Power (kilowatts)"
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