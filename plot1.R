
# Download and unzip the data

require(downloader)
dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download(dataset_url, dest = "data.zip", mode = "wb")
unzip("data.zip", exdir = ".")


# Assign variables to the unzipped data files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
findata <- with(NEI, aggregate(Emissions, by = list(year), sum))



# Question 1

# load extension

require(dplyr)

# Assign variables and plot the data
total.emissions <- summarise(group_by(NEI, year), Emissions=sum(Emissions))
clrs <- c("blue", "red", "yellow", "purple")
plot1 <- barplot(height=total.emissions$Emissions/1000, names.arg=total.emissions$year,
                 xlab="years", ylab=expression('total PM'[2.5]*' emission in kilotons'),ylim=c(0,8000),
                 main=expression('Total PM'[2.5]*' emissions at various years in kilotons'),col=clrs)
## Add text at top of bars
text(x = plot1, y = round(total.emissions$Emissions/1000,2), label = round(total.emissions$Emissions/1000,2), pos = 3, cex = 0.8, col = "black")

# Save the plot as a png file
plot1 <- function() {
  dev.copy(png, file="plot1.png", width=480, height=480)
  dev.off()
  cat("Plot1.png has been saved in", getwd())
}
plot1()
