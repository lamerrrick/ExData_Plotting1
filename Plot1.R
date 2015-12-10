setwd("~/Coursera/Exploratory Data Analysis")

## reading, subsetting and formatting the datafile 
dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")

pow <- subset(dat, Date >= "2007-02-01" & Date <= "2007-02-02")
pow$DT <- paste(pow$Date, pow$Time)
pow$DT <- strptime(pow$DT, "%Y-%m-%d %H:%M:%S")

##set up to save as a .png
png("Plot1.png" ,width = 480, height = 480)
# generate plot
hist(pow$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
# return to default to be able to view plots
dev.off()
