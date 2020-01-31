##  plot 2

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(url, destfile = "./PM25_data")
unzip("./PM25_data")
SCC_class_code <- readRDS("~/Desktop/Coursera/Exploratory_Data_Analysis/assignment/Source_Classification_Code.rds")
pm25 <- readRDS("~/Desktop/Coursera/Exploratory_Data_Analysis/assignment/summarySCC_PM25.rds")

library(dplyr)

balt <- filter(pm25, fips == "24510")

balt_by_year <- by(balt$Emissions, balt$year, sum)

balt_df <- data.frame(c(1999, 2002, 2005, 2008), c(balt_by_year[[1]], balt_by_year[[2]], balt_by_year[[3]], balt_by_year[[4]]))
colnames(balt_df) <- c("Year", "baltPM2.5")

plot(balt_df$Year, balt_df$baltPM2.5,
     xlab = "Year",
     ylab = "Total PM2.5",
     main = "Total Emissions in Baltimore City",
     pch = 17,
     col = "#cc5000")
