setwd("~/Coursera/Exploratory Data Analysis")

## reading, subsetting and formatting the datafile 
dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")

pow <- subset(dat, Date >= "2007-02-01" & Date <= "2007-02-02")
pow$DT <- paste(pow$Date, pow$Time)
pow$DT <- strptime(pow$DT, "%Y-%m-%d %H:%M:%S")

##set up to save as a .png
png("plot4.png", width = 480, height = 480)
# generate 4 panel graph 
par(mfrow=c(2,2))
#1
with(pow, plot(DT, Global_active_power, type="l", xlab = "", ylab = "Global Active Power"))
#2
with(pow, plot(DT, Voltage, type="l", xlab = "datetime", ylab = "Voltage"))
#3
plot(pow$DT, pow$Sub_metering_1, xlab = "", ylab = "Energy sub metering", ylim = c(0,38), type = "n")
lines(pow$DT, pow$Sub_metering_1)
lines(pow$DT, pow$Sub_metering_2, col= "red")
lines(pow$DT, pow$Sub_metering_3, col= "blue")
legend("topright", lty = c(1,1,1), col = c("black", "red", "Blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3")
       ,bty = "n")
#4
with(pow, plot(DT, Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power"))

# return to default to be able to view plots
dev.off()
