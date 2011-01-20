
## [[file:e:/projects/software/lattice_ggplot2_intro/report/p_lattice_ggplot2_intro.org::*Histogram][Histogram:1]]

pdf(file="../graphs/ggplot2_hist.pdf")
ggplot(aes(x = y), data = df) + geom_histogram() + 
    xlab("My y variable") + ylab("N")

dev.off()

## Histogram:1 ends here

## [[file:e:/projects/software/lattice_ggplot2_intro/report/p_lattice_ggplot2_intro.org::*Histogram%20conditional%20on%20%3Dx2f%3D][Histogram-conditional-on-=x2f=:1]]

pdf(file="../graphs/ggplot2_hist_g.pdf")
ggplot(aes(x = y), data = df) + geom_histogram() + 
    xlab("My y variable") + ylab("N") + facet_wrap(~x2f)

dev.off()

## Histogram-conditional-on-=x2f=:1 ends here

## [[file:e:/projects/software/lattice_ggplot2_intro/report/p_lattice_ggplot2_intro.org::*Histogram%20with%20superimposed%20density%20plot%20and%20conditional%20on%20%3Dx2f%3D][Histogram-with-superimposed-density-plot-and-conditional-on-=x2f=:1]]

pdf(file="../graphs/ggplot2_hist_dens.pdf")
ggplot(aes(x = y), data = df) + 
    geom_histogram(aes(y = ..density..)) + 
    geom_density(colour = "grey", size = 1.2) + 
    xlab("My y variable") + ylab("N") + 
    facet_wrap(~x2f)

dev.off()

## Histogram-with-superimposed-density-plot-and-conditional-on-=x2f=:1 ends here

## [[file:e:/projects/software/lattice_ggplot2_intro/report/p_lattice_ggplot2_intro.org::*Scatter%20plot][Scatter-plot:1]]

pdf(file="../graphs/ggplot2_scatter.pdf")
ggplot(aes(x = x1, y = y), data = df) + geom_point() + 
    xlab("My x1 variable") + ylab("My y variable")

dev.off()

## Scatter-plot:1 ends here

## [[file:e:/projects/software/lattice_ggplot2_intro/report/p_lattice_ggplot2_intro.org::*Multipanel%20scatter%20plot%20by%20%3Dx2f%3D][Multipanel-scatter-plot-by-=x2f=:1]]

pdf(file="../graphs/ggplot2_scatter_cond.pdf")
ggplot(aes(x = x1, y = y), data = df) + geom_point() + 
    xlab("My x1 variable") + ylab("My y variable") +
    facet_wrap(~ x2f)

dev.off()

## Multipanel-scatter-plot-by-=x2f=:1 ends here

## [[file:e:/projects/software/lattice_ggplot2_intro/report/p_lattice_ggplot2_intro.org::*Scatter%20plot%20by%20grouping%20variable%20x2][Scatter-plot-by-grouping-variable-x2:1]]

pdf(file="../graphs/ggplot2_scatter_g.pdf")
ggplot(aes(x = x1, y = y, colour = x2f), data = df) + 
    geom_point() + xlab("My x1 variable") + 
    ylab("My y variable")

dev.off()

## Scatter-plot-by-grouping-variable-x2:1 ends here

## [[file:e:/projects/software/lattice_ggplot2_intro/report/p_lattice_ggplot2_intro.org::*Scatter%20plot%20and%20linear%20regression%20line%20by%20%3Dx2%3D][Scatter-plot-and-linear-regression-line-by-=x2=:1]]

pdf(file="../graphs/ggplot2_scatter_reg.pdf")
ggplot(aes(x = x1, y = y, colour = x2f), data = df) + 
    geom_point() + xlab("My x1 variable") + 
    ylab("My y variable") + facet_wrap(~x2f) +
    geom_smooth(method = "lm")

dev.off()

## Scatter-plot-and-linear-regression-line-by-=x2=:1 ends here

## [[file:e:/projects/software/lattice_ggplot2_intro/report/p_lattice_ggplot2_intro.org::*Scatter%20plot%20and%20LOESS%20line%20by%20%3Dx2%3D][Scatter-plot-and-LOESS-line-by-=x2=:1]]

pdf(file="../graphs/ggplot2_scatter_loess.pdf")
ggplot(aes(x = x1, y = y, colour = x2f), 
       data = data.frame(df[, -2], x1 = df$x1^2)) + 
    geom_point() + xlab("My x1 variable") + 
    ylab("My y variable") + facet_wrap(~x2f) +
    geom_smooth(method = "loess")

dev.off()

## Scatter-plot-and-LOESS-line-by-=x2=:1 ends here

## [[file:e:/projects/software/lattice_ggplot2_intro/report/p_lattice_ggplot2_intro.org::*Bar%20chart%20(absolute%20frequencies)][Bar-chart-\(absolute-frequencies\):1]]

pdf(file="../graphs/ggplot2_barchart_n.pdf")
ggplot(aes(x = x2f), data = df) + geom_bar(fill = "red") 

dev.off()

## Bar-chart-\(absolute-frequencies\):1 ends here

## [[file:e:/projects/software/lattice_ggplot2_intro/report/p_lattice_ggplot2_intro.org::*Bar%20chart%20(percentages)][Bar-chart-\(percentages\):1]]

pdf(file="../graphs/ggplot2_barchart_p.pdf")
tmp <- data.frame(prop.table(table(df$x2f)))
ggplot(aes(x = Var1, y = Freq), data = tmp) + 
    geom_bar(fill = "red") 

dev.off()

## Bar-chart-\(percentages\):1 ends here

## [[file:e:/projects/software/lattice_ggplot2_intro/report/p_lattice_ggplot2_intro.org::*Box%20plot,%20jittered%20scatterplot,%20LOESS%20line%20(slightly%20useless\ldots)][Box-plot\,-jittered-scatterplot\,-LOESS-line-\(slightly-useless\\ldots\):1]]

pdf(file="../graphs/ggplot2_boxplot.pdf")
ggplot(aes(x = x2f, y = y), data = df) +
    geom_jitter() + geom_boxplot(alpha = 0.8) + 
    stat_smooth(aes(x = as.numeric(x2f, y = y)), 
                data = df, method = "loess", 
                level = 0.90) + 
    geom_hline(yintercept = mean(df$y), 
               col = "green", size = 1.2)

dev.off()

## Box-plot\,-jittered-scatterplot\,-LOESS-line-\(slightly-useless\\ldots\):1 ends here
