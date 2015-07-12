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

# Create a 4 way graph sequence (plot 4)
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,0,0))
with(data, {
        plot(Global_Active_Power ~ dt, 
             ylab = "Global Active Power", xlab = "Date & Time",type = "l", main = "Global Active Power vs Day of Week")
        plot(Voltage ~ dt, type = "l", ylab = "Voltage", xlab = "Date & Time",main="Voltage vs Date & Time")
        plot(Sub_Metering_1 ~ dt, type = "l", ylab = "Energy Sub Metering",
             xlab = "Date & Time",col = "Purple",main="Energy Sub Metering vs Date & Time")
        lines(Sub_Metering_2 ~ dt, col = 'Red')
        lines(Sub_Metering_3 ~ dt, col = 'Blue')
        legend("topright", col = c("red", "green", "purple"), lty = 1, lwd = 2, 
               bty = "n",
               legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"))
        plot(Global_Reactive_Power ~ dt, type = "l", 
             ylab = "Global Rective Power", xlab = "Date & Time",main = "Gbl. Reactive Power vs Date & Time")
})

