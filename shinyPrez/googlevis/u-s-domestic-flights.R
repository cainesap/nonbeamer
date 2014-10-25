## make a googleVis motion chart from time series data
## US domestic flights data from the 2009 ASA Challenge
## http://stat-computing.org/dataexpo/2009/the-data.html

# set working dir
setwd('~/Dropbox/workspace/gitHub/')


## for all available years, by day of week, count flights and calculate average flight delay
years <- 1987:2008
days <- 1:7
results <- data.frame()
for (year in years){
	filein <- paste('~/data/airlines/', year, '.csv.bz2', sep="")  # pre-downloaded to local dir
	data <- read.csv(filein)
	for (day in days){
		subs <- subset(data, DayOfWeek == day)
		flights <- length(na.omit(subs$DepDelay))  # number of flights for which we have delay info
		delays <- sum(na.omit(subs$DepDelay))  # sum of those delays for those flights
		delayRate <- delays / flights  # ave delay in mins per flight
		line <- data.frame(year, day, flights, delayRate)
		results <- rbind(results, line)
		print(line)
	}
}
colnames(results) <- c("year", "day-of-week", "total-flights", "delay-per-flight")


## create googleVis motion chart
library(googleVis)

motion <- gvisMotionChart(results, idvar = "day-of-week", timevar = "year")
plot(motion)  # view in browser

write(motion$html$chart, file = 'nonbeamer/shinyPrez/html/usdomesticflights.html')  # save html to file
## n.b. set options in browser, then copy from Settings>Advanced to html file as options["state"] and save; for futher info see https://developers.google.com/chart/interactive/docs/gallery/motionchart#Motion_Chart_initial_state; will open with these settings on next launch
