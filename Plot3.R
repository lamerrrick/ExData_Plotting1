setwd("~/Coursera/Exploratory Data Analysis")

## reading, subsetting and formatting the datafile 
dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")

pow <- subset(dat, Date >= "2007-02-01" & Date <= "2007-02-02")
pow$DT <- paste(pow$Date, pow$Time)
pow$DT <- strptime(pow$DT, "%Y-%m-%d %H:%M:%S")

##set up to save as a .png
png("plot3.png", width = 480, height = 480)
# generate plot
plot(pow$DT, pow$Sub_metering_1, xlab = "", ylab = "Energy sub metering", ylim = c(0,38), type = "n")
lines(pow$DT, pow$Sub_metering_1)
lines(pow$DT, pow$Sub_metering_2, col= "red")
lines(pow$DT, pow$Sub_metering_3, col= "blue")
legend("topright", lty = c(1,1,1), col = c("black", "red", "Blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

# return to default to be able to view plots
dev.off()
