# 15 MAY 2016 @ DS
# genrated plot2.png
# Read the data
df<-read.table(file="household_power_consumption.txt",sep=";",header=TRUE)
# subset the data
df_ss<-df[df[,1]=='1/2/2007'| df[,1]=='2/2/2007',] # logic is day month year.
# convert variable global active power to numeric values 
GAP<-as.numeric(levels(df_ss$Global_active_power))[df_ss$Global_active_power]
# use strptime to manipulate date and time
datetime<-strptime(paste(df_ss$Date, df_ss$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
# open PNG device and plot graph
png('plot2.png',width=480, height = 480)
plot(datetime,GAP,type='l',xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
#
#
