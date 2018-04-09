## Loading the already downloaded dataset using read.table
raw<- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

## Subsetting the rows corresponding to 2007-02-01 and 2007-02-02
data<- subset(x = raw, subset = Date == "1/2/2007" | Date == "2/2/2007")

## Changing the column classes of the variables
data$Date<-as.Date(x = data$Date, format = "%d/%m/%Y")
data$Global_active_power<- as.numeric(x = data$Global_active_power)
data$Global_reactive_power<- as.numeric(x = data$Global_reactive_power)
data$Voltage<- as.numeric(x = data$Voltage)
data$Global_intensity<- as.numeric(x = data$Global_intensity)
data$Sub_metering_1<- as.numeric(x = data$Sub_metering_1)
data$Sub_metering_2<- as.numeric(x = data$Sub_metering_2)

## Ploting the Global Active Power plot using hist
with(data = data, expr = hist(x = Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red"))
dev.copy(device = png, file = "Plot1.png")
dev.off()

