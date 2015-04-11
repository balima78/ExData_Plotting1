data <- read.table("household_power_consumption.txt", 
                   header=TRUE, 
                   sep=";", 
                   colClasses=c("character", "character", 
                                rep("numeric",7)), na="?")

data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
data <- subset(data, Date %in% dates)

## plot 3
png("plot3.png", width=480, height=480, units="px")

plot(data$Time, data$Sub_metering_1, 
     type="l", 
     col="black",
     xlab="", 
     ylab="Energy sub metering")

points(data$Time, data$Sub_metering_2, 
       type = "l", 
       xlab = "", 
       col = "red")

points(data$Time, data$Sub_metering_3, 
       type = "l", 
       xlab = "", 
       col = "blue")

legend("topright", 
       lty = 1, 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()