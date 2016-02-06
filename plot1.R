# Load data if not present in the working dir
# We use a common code for all plots that loads the data into a variable  
# called power_consumption
if (!exists("power_consumption"))
  source("loadData.R")

### Plot the data to the default device
hist(power_consumption$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency")

### Since the output on the screen is satisfactory, export it to the image device
output <- "plot1.png"
if(!file.exists(output)){
  dev.copy(png, file=output, height=480, width=480)
  dev.off()
}

