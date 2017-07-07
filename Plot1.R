# Downloading file
URL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URL, "/home/raf/R/Data Science Spécialization/ProjectExplDatafile.zip", method = "curl")
zipath<-"/home/raf/R/Data Science Spécialization/ProjectExplDatafile.zip"
outpath<-"~/R/Data Science Spécialization/ExploratoryDataAnalysis/data"
unzip(zipath, exdir = outpath)

# Reading the file
file<-list.files("~/R/Data Science Spécialization/ExploratoryDataAnalysis/data", full.names = TRUE)
data<-read.table(file, header = TRUE, stringsAsFactors = FALSE, sep = ";")

 # keeping only the date of interest
data<-data[data$Date=="1/2/2007" |data$Date =="2/2/2007" ,]
data[,3:9]<-apply(data[,3:9], 2, as.numeric)


# Changing format
data$Date<-strptime(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(data$Time, format = "%H:%M:%S")

#Plot 1

png(filename = "Plot1.png")
hist(data$Global_active_power, main = "Global active power", col ="red", breaks = 15, xlab = "Global active power (kilowatts)",
     ylab = "Frequency")
dev.off()