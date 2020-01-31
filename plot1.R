## plot 1

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(url, destfile = "./PM25_data")
unzip("./PM25_data")
SCC_class_code <- readRDS("~/Desktop/Coursera/Exploratory_Data_Analysis/assignment/Source_Classification_Code.rds")
pm25 <- readRDS("~/Desktop/Coursera/Exploratory_Data_Analysis/assignment/summarySCC_PM25.rds")

library(plyr)
library(dplyr)

total_by_year <- by(pm25$Emissions, pm25$year, sum)

df <- data.frame(c(1999, 2002, 2005, 2008), c(total_by_year[[1]], total_by_year[[2]], total_by_year[[3]], total_by_year[[4]]))
colnames(df) <- c("Year", "TotalPM2.5")

plot(df$Year, df$TotalPM2.5,
     xlab = "Year",
     ylab = "Total PM2.5",
     main = "Total Emissions in USA",
     pch = 17,
     col = "#00aaff")
