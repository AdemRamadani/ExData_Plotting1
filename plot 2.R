# Explore Data Analysis Project 1
# plot 2

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
png("plot2.png", height = 480, width = 480)

# Build graph global active power vs time
plot(data$DateTime,
    data$Global_active_power,
    pch=NA,
    xlab="",
    ylab="Global Active Power (kilowatts)")

# Lines
lines(data$DateTime, data$Global_active_power)

dev.off()
