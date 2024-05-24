##find the days of the week for the dates
MergedData$weekday <- weekdays(as.Date(MergedData$date))

##function to categorize as weekday or weekend
isweekday <- function(i){
      if(i  == "Saturday" | i == "Sunday"){
            i <- "Weekend"
      }
      else{
            i <- "Weekday"
      }
}

##Replace the actual weekday values with "Weekend" or "Weekday"
MergedData$weekday <- tapply(MergedData$weekday,INDEX = 1:17568 ,FUN = isweekday)

##separate Weekday and Weekend
StepsWeekdays <- MergedData[MergedData$weekday == "Weekday",]
StepsWeekends <- MergedData[MergedData$weekday == "Weekend", ]

##average both data sets by individual time intervals
AggregatedWeekdays <- round(aggregate(StepsWeekdays["steps"],by = StepsWeekdays["interval"], mean), digits = 4)
AggregatedWeekends <-  round(aggregate(StepsWeekends["steps"], by = StepsWeekends["interval"], mean), digits = 4)

##create a panel plot  comparing weekend and weekday average steps over the time intervals
par(mfrow = c(2,1))
plot(AggregatedWeekdays, type = "l",main = "Weekdays", ylab = "Number of Steps", xlab = NA, col = "green")
plot(AggregatedWeekends, type = "l",main = "Weekends", ylab = "Number of Steps", xlab = "5-Minute Interval", col = "purple")

