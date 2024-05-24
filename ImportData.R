##read in the data from the csv file
rawdata <- read.csv("activity.csv")

##get rid of NA
NumNA <- sum(is.na(rawdata))
NoNAdata <- na.omit(rawdata)

##find total steps per day
DailySteps <- aggregate(NoNAdata["steps"],by = NoNAdata["date"],sum)

##find mean steps per day
MeanSteps <- aggregate(NoNAdata["steps"], by = NoNAdata["date"],mean)

##find median steps per day
MedSteps <- aggregate(NoNAdata["steps"],by = NoNAdata["date"], median)

##find mean steps by five minute interval
IntervalMean <- aggregate(NoNAdata["steps"], by = NoNAdata["interval"], mean)
