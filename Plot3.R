# Set Working Directory
# Windows setwd("C:/Users/cchianco/Desktop")
setwd("~/Desktop/ExData_Plotting1")

# Grab the data, format nulls,create column names
cond.data <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                      na.strings = "?", nrows = 2075259, check.names = F, 
                      stringsAsFactors = F, comment.char = "", quote = '\"',col.names = c("Date", "Time", "Global_Active_Power", "Global_Reactive_Power", "Voltage", "Global_Intensity", "Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))

#Format the date as %d/%m/%Y
cond.data$Date <- as.Date(cond.data$Date, format = "%d/%m/%Y")

# Limit date to the date range
data <- subset(cond.data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#Remove old data
rm(cond.data)

# Create a plot with legend (plot 3)

with(data, {
        plot(Sub_Metering_1 ~ dt, type = "l", lwd = 2,
             ylab = "Global Active Power (kilowatts)", xlab = "Date & Time",col="Red")
        lines(Sub_Metering_2 ~ dt, col = 'Green')
        lines(Sub_Metering_3 ~ dt, col = 'Purple')
})
legend("topright", col = c("red", "green", "purple"), lty = 1, lwd = 2, 
       legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"))


