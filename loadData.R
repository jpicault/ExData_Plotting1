#### Loads all data and filter the content with what is of interest to us

# Load data if not present in the working dir
sourcefile <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"  
destfile <- "household_power_consumption.zip"
if(!file.exists(destfile)) { 
  download.file(sourcefile, destfile=destfile, quiet=TRUE) }
unzip(destfile)

datafile <- "household_power_consumption.txt"
if (!file.exists(datafile))
  stop("data not found, check settings")

# read the data into a data frame
power_consumption <- read.csv(datafile, sep = ";", na.strings = "?",
                              colClasses=c("character","character",rep("numeric",7)))

power_consumption$Time <- strptime(paste(power_consumption$Date, power_consumption$Time),
                                   format="%d/%m/%Y %H:%M:%S")
power_consumption$Date <- as.Date(power_consumption$Date,format="%d/%m/%Y")

# keep from the original dataset only the lines that match dates of interest
dates <- as.Date(c("2007-02-01","2007-02-02"), "%Y-%m-%d")
power_consumption <- subset(power_consumption, Date %in% dates)
