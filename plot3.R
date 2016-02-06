# Set Locale to English to avoid problems with days names
Sys.setlocale("LC_ALL","English")

# Load data if not present in the working dir
# We use a common code for all plots that loads the data into a variable  
# called power_consumption
if (!exists("power_consumption"))
  source("loadData.R")

### Plot directly the data the png device
output <- "plot3.png"
if(!file.exists(output)){
  png(file=output, height=480, width=480)
  # initial plot
  with(power_consumption, 
       plot(Time, Sub_metering_1, xlab="", ylab = "Energy sub metering", type="l", col="black"))
  
  # add additional lines
  with(power_consumption,
       lines(Time, Sub_metering_2, type="l", col="red"))
  with(power_consumption,
       lines(Time, Sub_metering_3, type="l", col="blue"))
  
  # add legend
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         lwd=2, col=c("black", "red", "blue"))
  
  # close device
  dev.off()
}

# note that due to locale preferences in R, the day names are indicated in French in my file