# Question 4

combustion.coal <- grepl("Fuel Comb.*Coal", SCC$EI.Sector)
combustion.coal.sources <- SCC[combustion.coal,]

# Find emissions from coal combustion-related sources
emissions.coal.combustion <- NEI[(NEI$SCC %in% combustion.coal.sources$SCC), ]
require(dplyr)
emissions.coal.related <- summarise(group_by(emissions.coal.combustion, year), Emissions=sum(Emissions))
require(ggplot2)
ggplot(emissions.coal.related, aes(x=factor(year), y=Emissions/1000,fill=year, label = round(Emissions/1000,2))) +
  geom_bar(stat="identity") +
  #geom_bar(position = 'dodge')+
  # facet_grid(. ~ year) +
  xlab("year") +
  ylab(expression("total PM"[2.5]*" emissions in kilotons")) +
  ggtitle("Emissions from coal combustion-related sources in kilotons")+
  geom_label(aes(fill = year),colour = "white", fontface = "bold")



# Save the plot as a png file

plot4 <- function() {
  dev.copy(png, file="plot4.png", width=480, height=480)
  dev.off()
  cat("Plot4.png has been saved in", getwd())
}
plot4()
