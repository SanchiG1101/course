memory_required <- 2075259 * 9 * 8 / (1024^2) # 8 bytes per value (numeric)
print(paste("Approximate memory required:", memory_required, "MB"))
library(data.table)
data <- fread("C:/Users/Dell/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt", na.strings = "?")
data <- data[Date %in% c("1/2/2007", "2/2/2007")]
data[, datetime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
par(mar = c(5, 5, 4, 2))
png("C:/Users/Dell/Downloads/exdata_data_household_power_consumption/ExDataCP1Plot3.png", width = 480, height = 480)
plot(data$datetime, data$Sub_metering_1, type = "l", xlab = "",
     ylab = "Energy sub metering")
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)
dev.off()
