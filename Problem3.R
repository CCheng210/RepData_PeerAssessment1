##Make a time series plot (i.e. type = "l" type = "l") 
##of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all days (y-axis)

plot(IntervalMean$interval, IntervalMean$steps, type = "l", main = "Average Number of Steps Taken Per 5-Minute Interval",
     col = "blue", xlab = "5-Minute Time Interval", ylab = "Average Steps")

##find max steps and corresponding time interval
maxsteps <- max(IntervalMean$steps)

rownum <- grep(maxsteps, IntervalMean$steps)

maxint <- IntervalMean$interval[rownum]

