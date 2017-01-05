getwd()
setwd('C:/') # set the folder to right place

wbd <- read.csv("GDP CO2 - Worldbank data.csv")
str(wbd)
str(wbd$ï..Country.Name)
names(wbd)

co2 <- subset(wbd, wbd$ï..Country.Name=="China" &
               wbd$Series.Name=='CO2 emissions (metric tons per capita)')
GDP <- subset(wbd, wbd$ï..Country.Name=="China" &
                wbd$Series.Name=='GDP (current US$)')
### transpose data ####
co2x <- c(t(co2[,5:16]))
GDPx <- c(t(GDP[,5:16]))

### trasforming data from character to numeric ####
df = data.frame(CO2 = as.numeric(co2x), 
                GDP=as.numeric(GDPx))

### scatter plot ####
library(ggplot2)
ggplot(aes(x=CO2, y=GDP), data= df) + 
  geom_point() 


### Regression Analysis ####
fit <- lm(GDP ~ CO2, data = df)
summary(fit)

ggplot(aes(x=CO2, y=GDP), data= df) + 
  geom_point() +
  geom_smooth(method = lm)

