# Assign variables and plot the data

baltcitymary.emissions<-summarise(group_by(filter(NEI, fips == "24510"), year), Emissions=sum(Emissions))
clrs <- c("blue", "red", "yellow", "purple")
plot2 <- barplot(height=baltcitymary.emissions$Emissions/1000, names.arg=baltcitymary.emissions$year,
                 xlab="years", ylab=expression('total PM'[2.5]*' emission in kilotons'),ylim=c(0,4),
                 main=expression('Total PM'[2.5]*' emissions in Baltimore City-MD in kilotons'),col=clrs)

## Add text at top of bars

text(x = x2, y = round(baltcitymary.emissions$Emissions/1000,2), label = round(baltcitymary.emissions$Emissions/1000,2), pos = 3, cex = 0.8, col = "black")

# Save the plot as a png file

plot2 <- function() {
  dev.copy(png, file="plot2.png", width=480, height=480)
  dev.off()
  cat("Plot2.png has been saved in", getwd())
}
plot2()