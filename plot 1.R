# Explore Data Project 1
# plot 1

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
png("plot1.png", height = 480, width = 480)

# Histogram
hist(data$Global_active_power,
        col='red',
        xlab = 'Global Active Power (kilowatts)',
        main = 'Global Active Power')

dev.off()