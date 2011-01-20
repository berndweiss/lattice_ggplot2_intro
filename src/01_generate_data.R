
## [[file:e:/projects/software/lattice_ggplot2_intro/report/p_lattice_ggplot2_intro.org::*Loading%20packages%20and%20creating%20the%20data][Loading-packages-and-creating-the-data:1]]

library(lattice)
library(ggplot2)

## Regression model: y = 1.2 + 0.3*x1 + 0.4*x2 + 0.9*x1*x2 + e
set.seed(1)
x1 <- round(runif(1000, min = 1, max = 10), digits = 0)
x2 <- round(runif(1000, min = 1, max = 4), digits = 0)

y = 1.2 + 0.3*x1 + 0.4*x2 + 0.9*x1*x2 + rnorm(1000, 0, 1)
df <- data.frame(y = y, x1 = x1, x2 = x2, 
                 x2f = factor(x2, labels = c("a", "b", "c", "d")))

lm(y ~ x1 + x2 + x1*x2, data = df)

## Loading-packages-and-creating-the-data:1 ends here
