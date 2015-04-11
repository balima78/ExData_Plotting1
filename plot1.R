data <- read.table("household_power_consumption.txt", 
                   header=TRUE, 
                   sep=";", 
                   colClasses=c("character", "character", 
                                rep("numeric",7)), na="?")

data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
data <- subset(data, Date %in% dates)

## plot 1
png("plot1.png", width=480, height=480, units="px")

hist(data$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     col = "red", 
     breaks = 13, 
     ylim = c(0,1200), 
     xlim = c(0, 6), 
     xaxp = c(0, 6, 3))

dev.off()