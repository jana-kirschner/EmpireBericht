## ---- demographics
total.participants = function() {
    round(rnorm(1, 90, 30))
}

total.countries = function() {
    round(rnorm(1, 20, 5))
}

## ---- simple-plot
library("ggplot2")
df = data.frame(x=1:50, y=rnorm(50))
plt = ggplot(df) + geom_point(aes(x, y), color='blue', size=2) +
    xlab("Obversations") + ylab("Values") + ylim(-3,3)
suppressWarnings(print(plt))

## ---- simple-table
x <- round(rnorm(5, 10, 3))
y <- round(rnorm(5, 10, 3))
matr = data.frame(x, y, sum=x+y, ratio=x/y, diff=abs(x-y))
matr$sum_big = ifelse(matr$sum>20, "yes", "no")
matr$same = ifelse(matr$diff==0, "yes", "no")
library(knitr)
kable(matr, digits=2, booktabs=TRUE)
