# Load data if not present in the working dir
# We use a common code for all plots that loads the data into a variable  
# called power_consumption
if (!exists("power_consumption"))
  source("loadData.R")

### Plot directly the data the png device
output <- "plot4.png"
if(!file.exists(output)){
  png(file=output, height=480, width=480)
  
  ## prepare layout
  par(mfrow=c(2,2))
  
  ## draw plots
  # plot 1
  plot(power_consumption$Time, power_consumption$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  # plot 2
  plot(power_consumption$Time, power_consumption$Voltage, type = "l", xlab = "datetime", ylab = "Global Active Power")
  # plot 3
  plot(power_consumption$Time, power_consumption$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
  lines(power_consumption$Time, power_consumption$Sub_metering_2, type="l", col="red")
  lines(power_consumption$Time, power_consumption$Sub_metering_3, type="l", col="blue")
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue"), bty="n")
  # plot 4
  plot(power_consumption$Time, power_consumption$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Active Power")

  # close device
  dev.off()
}

# note that due to locale preferences in R, the day names are indicated in French in my file