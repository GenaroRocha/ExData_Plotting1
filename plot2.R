fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, "./Data/Power.zip", method="curl")
unzip("./Data/Power.zip")
data <- read.table("household_power_consumption.txt", skip=1, sep=";")
names(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering3")
subdata <- subset(data, data$Date == "1/2/2007" |  data$Date == "2/2/2007")
remove(data)
data <- subdata
remove(subdata)
data$time <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480, units="px")
plot(data$time, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()