##Histogram of the total number of steps taken each day

hist(DailySteps$steps, col="red",xlab = "Total Steps", main = "Histogram of the Total Number of Steps per Day",
     breaks = 20,xlim = c(0,25000))

##summary of DailySteps
summary(DailySteps)