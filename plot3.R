electrical_data <- read.table("household_power_consumption.txt",
                              sep = ";",header = TRUE,stringsAsFactors = FALSE, na.strings = "?")

sub_data<-electrical_data[electrical_data$Date== as.character("1/2/2007") 
                          | electrical_data$Date ==as.character("2/2/2007"),]

sub_data$Cumulated_Date <- paste(sub_data$Date,sub_data$Time)

sub_data$Cumulated_Date <- strptime(sub_data$Cumulated_Date, "%d/%m/%Y %H:%M:%S")

sub_data[,3:9] <- lapply(sub_data[,3:9],as.numeric)

png(file = "plot3.png", width = 480, height = 480)

plot(sub_data$Cumulated_Date,sub_data$Sub_metering_1 , type="n",xlab = "",ylab = "Energy sub metering")
points(sub_data$Cumulated_Date,sub_data$Sub_metering_1,type = "l")
points(sub_data$Cumulated_Date,sub_data$Sub_metering_2,type = "l",col = "RED")
points(sub_data$Cumulated_Date,sub_data$Sub_metering_3,type = "l",col = "BLUE")

legend("topright",lty = 1,col = c("black","red","blue"),
       legend = c("sub_metering_1","sub_metering_2","sub_metering_3"))

dev.off()
