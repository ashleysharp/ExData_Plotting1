library(dplyr)

raw <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

clean <- raw %>% mutate(date_time = dmy_hms(paste(raw$Date,raw$Time))) %>%
        mutate(Global_active_power = as.numeric(raw$Global_active_power)) %>%
        mutate(Global_reactive_power = as.numeric(raw$Global_reactive_power)) %>%
        mutate(Voltage = as.numeric(raw$Voltage)) %>%
        mutate(Global_intensity = as.numeric(raw$Global_intensity)) %>%
        mutate(Sub_metering_1 = as.numeric(raw$Sub_metering_1)) %>%
        mutate(Sub_metering_2 = as.numeric(raw$Sub_metering_2)) %>%
        mutate(Sub_metering_3 = as.numeric(raw$Sub_metering_3)) %>%
        select(date_time, c(3:9))

subset <- clean %>% filter(date_time >= "2007-02-01 00:00:00" & date_time <= "2007-02-02 23:59:59")

png("plot1.png")
hist(subset$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()