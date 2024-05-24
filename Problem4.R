##finding the total number of na values
sum(is.na(rawdata))

##separating the NA values
navalues <- rawdata[is.na(rawdata),]
NoNAdata <- na.omit(rawdata)

##replacing the NA values
navalues$steps <- IntervalMean$steps

##merging non-NA values with replaced NA values to recreate the original dataset
MergedData <- rbind(NoNAdata,navalues)

##calculate new daily totals
FullDailySteps <- aggregate(MergedData["steps"], by = MergedData["date"], sum)

##histogram of the data
hist(FullDailySteps$steps, col="red",xlab = "Total Steps", 
     main = "Histogram of the Total Number of Steps per Day", breaks = 20,xlim = c(0,25000))

##calculate new mean and medians
summary(FullDailySteps)
