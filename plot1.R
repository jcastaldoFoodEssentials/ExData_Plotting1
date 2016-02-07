library(dplyr)

plotPowerData <- function() {
  powerData <- getData()
  globalData <- as.numeric(as.character(powerData$Global_active_power))
  png("plot1.png" , width = 480, height = 480)
  hist(
    globalData, xlab = "Global Active Power (kilowatts)", 
    ylab = "Frequency", 
    main = "Global Active Power", 
    col = "red"
    )
  dev.off()
}

getData <- function() {
  powerData <- read.table("household_power_consumption.txt", header = T, sep = ";")
  powerData <- filter(powerData, Date == "2/2/2007" | Date == "1/2/2007")
}