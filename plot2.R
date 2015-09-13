electrical_data <- read.table("household_power_consumption.txt",
                              sep = ";",header = TRUE,stringsAsFactors = FALSE, na.strings = "?")

sub_data<-electrical_data[electrical_data$Date== as.character("1/2/2007") 
                          | electrical_data$Date ==as.character("2/2/2007"),]

sub_data$Cumulated_Date <- paste(sub_data$Date,sub_data$Time)

sub_data$Cumulated_Date <- strptime(sub_data$Cumulated_Date, "%d/%m/%Y %H:%M:%S")

sub_data[,3:9] <- lapply(sub_data[,3:9],as.numeric)

png(file = "plot2.png", width = 480, height = 480)

plot(sub_data$Cumulated_Date,sub_data$Global_active_power,type = "l",xlab = "",ylab = "Global_active_power(Killowatts)")

dev.off()