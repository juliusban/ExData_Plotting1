URL <-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destFile <-"data_data_household_power_consumption.zip"
if (!file.exists(destFile)){                                                                     ##If it is not
  download.file(URL, destfile = destFile, mode='wb')                                             ## yet downloaded
}

if (!file.exists("./household_power_consumption.txt")){             
  unzip(destFile)                                   
}
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()