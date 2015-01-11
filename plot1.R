library(dplyr)

### 
### Since the data file is large, it is not uploaded to github. The script expects that you extract the zip in it's working directory. 
###

power <- read.csv("household_power_consumption.txt", sep=";", header=TRUE,stringsAsFactors=FALSE,na.strings="?")
power_t <- tbl_df(power)

# POSIXlt not allowed in mutate
#mutate(power_t,Date2=strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"))


power_feb <- filter(power,Date %in% c("1/2/2007","2/2/2007")) 

png("plot1.png",width=480,height=480)
hist(power_feb$Global_active_power,xlab="Global Active Power (kilowatts)", main="Global Active Power",c="red")
dev.off()

