setwd('/Users/katringrunert/Projects/Uni/sso/exercises/01_assignment')

weather = read.table("weather.txt",header=TRUE)


# Exercise 1.3.a

summary(weather$humidity)
summary(weather$temperature)

par(mfrow=c(3,2))
hist(weather$humidity)
hist(weather$temperature)
qqnorm(weather$humidity)
qqline(weather$humidity, col = "red")
qqnorm(weather$temperature)
qqline(weather$temperature, col = "red")
boxplot(weather$humidity, main='Boxplot of Humidity')
boxplot(weather$temperature, main='Boxplot of Temperature')

# Exercise 1.3.b
x = seq(min(weather$temperature), max(weather$temperature), by=1)
par(mfrow=c(1,1))
hist(weather$temperature, main = 'Histogram of Temperature', prob=T)
curve(dnorm(x, mean=mean(weather$temperature), sd=sd(weather$temperature)), lwd=2, col="red", add=TRUE, yaxt="n")
qqnorm(weather$temperature, main = 'QQPlot of Temperature')
qqline(weather$temperature, col = "red")
boxplot(weather$temperature, main='Boxplot of Temperature')
# Exercise 1.3.c
# 90% CI of the mean temperature
n = nrow(weather); mu = mean(weather$temperature); s = sd(weather$temperature)
error_margin = qt((1-0.90)/2,df=n-1)*s/sqrt(n)

low = mu - error_margin 
up = mu + error_margin
# We can say with 90% confidence that the population mean lays between {low} and {up}
# Exercise 1.3.d

# CI of 95% for mean humidity, CI length of at most 2%

z = 1.96 # (1 - 0.95)/2 # get z-score for this value
E = 0.02 /2  # margin of error (two sided)
p = mean(weather.temperature) # mean????
q = 1 - p # ???
pq = p*q
s = sd(weather$temperature) # if population is not known, you can use standard deviation

sample_size = ((z*s)/ E)**2
sample_size
