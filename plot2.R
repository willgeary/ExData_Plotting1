setwd("C:/Users/Will/Dropbox (Personal)/Documents/Coursera/Data Science/4. Exploratory Data Analysis/assignment 1 plotting")

# Download the data
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./Dataset.zip")

# Unzip the data. This will yield a text document called household_power_consumption
unzip(zipfile = "./Dataset.zip", exdir = "./data")

# Read file into data table
filePath <- "C:/Users/Will/Dropbox (Personal)/Documents/Coursera/Data Science/4. Exploratory Data Analysis/assignment 1 plotting/data/household_power_consumption.txt"
data_full <- read.table(filePath, header = TRUE, sep = ";", na.strings = "?")

# Format dates
data_full$Date <- as.Date(data_full$Date, format = "%d/%m/%Y")

# Subsetting the data
data <- subset(data_full, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Remove data_full, because the following will focus on 2007-02-01 and 2007-02-02
rm(data_full)

# Converting dates and times into date times
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# Plot #2
setwd("C:/Users/Will/Dropbox (Personal)/Documents/Coursera/Data Science/4. Exploratory Data Analysis/assignment 1 plotting/ExData_Plotting1")
png("plot2.png", 490, 350)
plot(data$Global_active_power ~ data$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
