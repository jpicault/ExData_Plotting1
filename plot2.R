# Set Locale to English to avoid problems with days names
Sys.setlocale("LC_ALL","English")

# Load data if not present in the working dir
# We use a common code for all plots that loads the data into a variable  
# called power_consumption
if (!exists("power_consumption"))
  source("loadData.R")

### Plot directly the data the png device
output <- "plot2.png"
if(!file.exists(output)){
  png(file=output, height=480, width=480)
  with(power_consumption, 
       plot(Time, Global_active_power, xlab="", 
            ylab = "Global Active Power (kilowatts)", type="l"))
  dev.off()
}

# note that due to locale preferences in R, the day names are indicated in French in my file