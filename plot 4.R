# Explore Data Project 1
# plot 4

# Read data
data <- read.table('../household_power_consumption.txt', sep=';',
                    header=T, colClasses = c('character', 'character',
                    'numeric', 'numeric', 'numeric', 'numeric', 'numeric',
                    'numeric', 'numeric'), na.strings='?')

# Convert Date and Time variables to Date/Time classes
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Get subset on two days (February, 2007)
data <- subset(data, as.Date(DateTime) >= as.Date("2007-02-01") &
                as.Date(DateTime) <= as.Date("2007-02-02"))

# PNG file, size 480 x 480 px
png("plot4.png", height = 480, width = 480)

# Configure Multiplot
par(mfrow=c(2,2))

## Global Active Power Plot
plot(data$DateTime,
    data$Global_active_power,
    pch=NA,
    xlab="",
    ylab="Global Active Power (kilowatts)")

# Line
lines(data$DateTime, data$Global_active_power)


## Voltage Plot
plot(data$DateTime, data$Voltage, ylab="Voltage", xlab="datetime", pch=NA)

# Line
lines(data$DateTime, data$Voltage)

## Sub metering plot
plot(data$DateTime,
    data$Sub_metering_1,
    pch=NA,
    xlab="",
    ylab="Energy sub metering")

# Lines
lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col='red')
lines(data$DateTime, data$Sub_metering_3, col='blue')

# Legend
legend('topright',
        c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        lty = c(1,1,1),
        col = c('black', 'red', 'blue'),
        bty = 'n')

# Global reactive power plot
with(data, plot(DateTime, Global_reactive_power, xlab='datetime', pch=NA))
with(data, lines(DateTime, Global_reactive_power))

dev.off()