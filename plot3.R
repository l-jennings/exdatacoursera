## plot 3
library(ggplot2)

pm25 <- readRDS("~/Desktop/Coursera/Exploratory_Data_Analysis/assignment/summarySCC_PM25.rds")

# create separate dataframes for baltimore city data by emission type
balt <- filter(pm25, fips == "24510")

balt_by_type <- split(balt, balt$type)

point <- balt_by_type$POINT
nonpoint <- balt_by_type$NONPOINT
onroad <- balt_by_type$`ON-ROAD`
nonroad <- balt_by_type$`NON-ROAD`

# sum the total emissions by year for each emission type and put together into one df
sum_pm25 <- function(type) {
        name <- deparse(substitute(type))
        a <- by(type$Emissions, type$year, sum)
        typedf <- data.frame(as.factor(c(1999, 2002, 2005, 2008)), c(a[[1]], a[[2]], a[[3]], a[[4]]))
        typedf$type <- as.factor(name)
        colnames(typedf) <- c("year", "PM2.5", "Type")
        typedf

}

output <- rbind(sum_pm25(point), sum_pm25(nonpoint), sum_pm25(onroad), sum_pm25(nonroad))

#plot results

g <- ggplot(data = output, aes(year, PM2.5, group = Type))

g + geom_point(aes(color = Type)) + geom_line(aes(color = Type))



