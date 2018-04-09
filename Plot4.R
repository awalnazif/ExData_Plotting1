## Loading the already downloaded dataset using read.table
raw<- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

## Subsetting the rows corresponding to 2007-02-01 and 2007-02-02
data<- subset(x = raw, subset = Date == "1/2/2007" | Date == "2/2/2007")

## Changing the classes of the Date and Time variables
data<- transform("_data" = data, DateTime = strptime(x = paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"), 
                 Date = as.Date(x = Date, format = "%d/%m/%Y"))

## Changing the column classes of the other variables
data<- transform("_data" = data, Global_active_power = as.numeric(Global_active_power),
                 Global_reactive_power = as.numeric(Global_reactive_power),
                 Voltage = as.numeric(Voltage),
                 Global_intensity = as.numeric(Global_intensity),
                 Sub_metering_1 = as.numeric(Sub_metering_1),
                 Sub_metering_2 = as.numeric(Sub_metering_2),
                 Sub_metering_3 = as.numeric(Sub_metering_3))

## Ploting the Graphs
png(filename = "Plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
with(data = data, expr = plot(x = DateTime, y = Global_active_power, type = "l", ylab = "Global Active Power"))
with(data = data, expr = plot(x = DateTime, y = Voltage, type = "l", ylab = "Voltage"))
with(data = data, expr = plot(x = DateTime, y = Sub_metering_1, type = "l", ylab = "Energy Sub Metering"))
with(data = data, expr = points(x = DateTime, y = Sub_metering_2, col ="red", type = "l"))
with(data = data, expr = points(x = DateTime, y = Sub_metering_3, col ="blue", type = "l"))
legend("topright", pch = 1, legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))
with(data = data, expr = plot(x = DateTime, y = Global_reactive_power, type = "l", ylab = "Global Reactive Power"))
dev.off()
