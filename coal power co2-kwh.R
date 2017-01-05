getwd()
setwd('C:/udacity/R')

df.co2_kwh <- read.csv("coal power co2 & kwh.csv")
str(df.co2_kwh)

library(dplyr)
df.co2_kwh <- rename(df.co2_kwh, Year = Annual.Total,
                     CO2 = Coal.Electric.Power.CO2.Emissions..Million.Metric.Tons.,
                     power = Coal.Electricity.Net.Generation..Million.kWh.)


library(ggplot2)
ggplot(aes(x=power,y=CO2),data=df.co2_kwh) + geom_point() + 
  geom_smooth(method = 'lm') +
  xlab('Coal Electricity Net Generation (Million kWh)') +
  ylab('Coal Electric Power CO2 Emissions (Million Metric Tons)')
  # + ggtitle('Coal Power CO2 Emission by Electricity Net Generation')

fit <- lm(CO2 ~ power, data = df.co2_kwh)
summary(fit)
  