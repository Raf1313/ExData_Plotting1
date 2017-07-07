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

# Créating a new variable "datetime"

data$datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#plot3

png(filename = "Plot3.png")
plot(data$datetime,data$Sub_metering_1, type ="l", ylab = "Energy sub metering", xlab = "")
lines(data$datetime,data$Sub_metering_2, col="red")
lines(data$datetime,data$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red", "blue"), lty=1)
dev.off()