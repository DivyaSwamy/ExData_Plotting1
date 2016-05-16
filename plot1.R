# 15 MAY 2016 @ DS
# Generated plo1.png
# Read the data
  df<-read.table(file="household_power_consumption.txt",sep=";",header=TRUE)
# subset the data
  df_ss<-df[df[,1]=='1/2/2007'| df[,1]=='2/2/2007',] # logic is day month year.
# convert variable global active power to numeric values 
  GAP<-as.numeric(levels(df_ss$Global_active_power))[df_ss$Global_active_power]
# open PNG device and plot histogram
  png('plot1.png',width=480, height = 480)
  hist(GAP,col='red',breaks=20,main="Global Active Power", xlab="Global Active Power (kilowatts)")
  dev.off()
  #
  #
