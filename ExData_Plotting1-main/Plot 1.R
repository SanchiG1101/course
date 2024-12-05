memory_required <- 2075259 * 9 * 8 / (1024^2) # 8 bytes per value (numeric)
print(paste("Approximate memory required:", memory_required, "MB"))
library(data.table)
data <- fread("C:/Users/Dell/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt", na.strings = "?")
data <- data[Date %in% c("1/2/2007", "2/2/2007")]
data[, datetime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
par(mar = c(5, 5, 4, 2))
png("C:/Users/Dell/Downloads/exdata_data_household_power_consumption/ExDataCP1Plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
