setwd('/Users/katringrunert/Projects/Uni/sso/exercises/01_assignment')

# Exercise 1.1.a
birthweight = read.table("birthweight.txt",header=TRUE)

birthweight_mean = mean(birthweight$birthweight)
print(birthweight_mean)

test_result = shapiro.test(birthweight$birthweight)
if(test_result$p.value > 0.05) {
  print('According to the Shapiro Wilk Test, the hypothesis that the data is normally distributed is not rejected.')
}

par(mfrow=c(1,2))
qqnorm(birthweight$birthweight, main="QQPlot of Birthweight")
qqline(birthweight$birthweight, col = "red")
hist(birthweight$birthweight, main="Histogram of Birthweight")

# Exercise 1.1.b
n = nrow(birthweight); mu = mean(birthweight$birthweight); s = sd(birthweight$birthweight)
error_margin = qt(p=(1-0.9)/2,df=n-1, lower.tail = FALSE)*s/sqrt(n)

low = mu - error_margin 
up = mu + error_margin
# Confidence Interval of [2812.939, 3013.646] # CI 0.975
# Confidence Interval of [2847.868, 2978.717] # CI 0.90

# Exercise 1.1.c
t.test(birthweight$birthweight, mu = 2800, alternative = "greater")

# Exercise 1.1.d
# it is one-sided, because we were only interested whether 
# the birthweight mean is bigger than 2800 or not