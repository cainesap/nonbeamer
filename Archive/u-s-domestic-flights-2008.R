## make a googleVis motion chart from time series data
## US domestic flights data from the 2009 ASA Challenge
## http://stat-computing.org/dataexpo/2009/the-data.html


## only working with the data for 2008
data <- read.csv('~/Downloads/2008.csv.bz2')

## hour of day is expressed from 1 to 2400; make vectors of time window beginning/ends; must be hugely inefficient data manipulation! would like to know dplyr etc.
hourstart <- seq(1, 2301, by = 100)
hourend <- seq(100, 2400, by = 100)

## loop thru data and for each hour window, for each airline, count flights and calculate delay (mins) per flight in that hour
totalflights <- 0
results <- data.frame()
airlines <- unique(data$UniqueCarrier)
for (h in 1:24) {
	for (a in airlines){
		subs <- subset(data, DepTime >= hourstart[h] & DepTime <= hourend[h] & UniqueCarrier == a)
		flights <- nrow(subs)
		delays <- sum(subs$DepDelay)
		delayRate <- delays / flights
		line <- data.frame(h, a, flights, delayRate)
		results <- rbind(results, line)
		totalflights <- totalflights + flights
	}
}
colnames(results) <- c("hour-of-day", "airline", "total-flights", "delay-per-flight")
print(results)
print(paste("total number of flights =", totalflights))


## make motion chart with googleVis package
library(googleVis)

motion <- gvisMotionChart(results, idvar = "airline", timevar = "hour-of-day")
