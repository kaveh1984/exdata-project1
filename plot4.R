library(data.table)                                                              # I assume the reviewers have the 'data.table' and 'lubridate' packages installed.
library(lubridate)
hhpc <- fread("household_power_consumption.txt", na.strings = "?")
hhpc_dt <- hhpc[, DateTime := dmy_hms(paste(Date, Time))]                        # Combine the Date and Time columns into a new one 'DateTime'
hhpc_filtrd <- hhpc_dt[DateTime >= ymd("2007-02-01") & DateTime < ymd("2007-02-03"),] # Extract the rows for 1st and 2nd of Feb only
par(mfcol = c(2,2), mar=c(4,4,1,1))
with(hhpc_filtrd, plot(DateTime, Global_active_power, type = 'l', xlab = "", ylab = "Global Active Power"))
with(hhpc_filtrd, plot(DateTime, Sub_metering_1, type = 'l', xlab = "", ylab = "Energy sub metering"))
with(hhpc_filtrd, lines(DateTime, Sub_metering_2, col = 'red'))
with(hhpc_filtrd, lines(DateTime, Sub_metering_3, col = 'blue'))
legend("topright", c("Sub metering 1", "Sub metering 2", "Sub metering 3"),
       col = c('black', 'red', 'blue'), lty = 1, bty = "n", cex=0.75, y.intersp = 0.75)
with(hhpc_filtrd, plot(DateTime, Voltage, type = 'l', xlab = "", ylab = "Voltage"))
with(hhpc_filtrd, plot(DateTime, Global_reactive_power, type = 'l', xlab = "",
                       ylab = "Global reactive power"))
dev.copy(png, file = "plot4.png")
dev.off()