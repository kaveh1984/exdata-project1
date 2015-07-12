library(data.table)                                                              # I assume the reviewers have the 'data.table' and 'lubridate' packages installed.
library(lubridate)
hhpc <- fread("household_power_consumption.txt", na.strings = "?")
hhpc_dt <- hhpc[, DateTime := dmy_hms(paste(Date, Time))]                        # Combine the Date and Time columns into a new one 'DateTime'
hhpc_filtrd <- hhpc_dt[DateTime >= ymd("2007-02-01") & DateTime < ymd("2007-02-03"),] # Extract the rows for 1st and 2nd of Feb only
with(hhpc_filtrd, hist(as.numeric(Global_active_power), main = "Global Active Power",
                       xlab = "Global Active Power (kilowatts)", col ='red'))   
dev.copy(png, file = "plot1.png")
dev.off()