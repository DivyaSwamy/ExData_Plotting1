# 15 MAY 2016 @ DS
# generated plot4.png
# Read the data
df<-read.table(file="household_power_consumption.txt",sep=";",header=TRUE)
# subset the data
df_ss<-df[df[,1]=='1/2/2007'| df[,1]=='2/2/2007',]
# use strptime to manipulate date and tim
datetime<-strptime(paste(df_ss$Date, df_ss$Time, sep=" "),
                   "%d/%m/%Y %H:%M:%S")
# Convert relavant columns into numeric data
GAP<-as.numeric(levels(df_ss$Global_active_power))[df_ss$Global_active_power]
SM1<-as.numeric(levels(df_ss$Sub_metering_1))[df_ss$Sub_metering_1]
SM2<-as.numeric(levels(df_ss$Sub_metering_2))[df_ss$Sub_metering_2]
Volt<-as.numeric(levels(df_ss$Voltage))[df_ss$Voltage]
GRP<-as.numeric(levels(df_ss$Global_reactive_power))[df_ss$Global_reactive_power]
#open png and plot/
png('plot4.png',width=480, height = 480)
par(mfrow=c(2,2))
# plot1
plot(datetime,GAP,type='l',xlab="",
     ylab="Global Active Power (kilowatts)")
# plot2
plot(datetime,Volt,type='l',xlab="datetime",
     ylab="Voltage")
#plot3
plot(datetime,SM1,type='l',xlab="",ylab="Energy submetering")
lines(datetime,SM2,type='l',col="red")
lines(datetime,df_ss$Sub_metering_3,type='l',col='blue')
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=c(1,1),col=c("black","red","blue"),bty="n")
#plot4
plot(datetime,GRP,type='l',xlab="datetime",
     ylab="Global_reactive_power")
#
dev.off()
