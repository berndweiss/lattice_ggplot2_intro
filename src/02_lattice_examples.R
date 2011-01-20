
## [[file:e:/projects/software/lattice_ggplot2_intro/report/p_lattice_ggplot2_intro.org::*Histogram][Histogram:1]]

pdf(file="../graphs/lattice_hist.pdf")
histogram(~ y, data = df, xlab = "My y variable", 
          col = "gray")

dev.off()

## Histogram:1 ends here

## [[file:e:/projects/software/lattice_ggplot2_intro/report/p_lattice_ggplot2_intro.org::*Histogram%20conditional%20on%20%3Dx2f%3D][Histogram-conditional-on-=x2f=:1]]

pdf(file="../graphs/lattice_hist_g.pdf")
histogram(~ y | x2f, data = df, 
          xlab = "My y variable", col = "gray")

dev.off()

## Histogram-conditional-on-=x2f=:1 ends here

## [[file:e:/projects/software/lattice_ggplot2_intro/report/p_lattice_ggplot2_intro.org::*Histogram%20with%20superimposed%20density%20plot][Histogram-with-superimposed-density-plot:1]]

pdf(file="../graphs/lattice_hist_dens.pdf")
histogram(~ y, data = df, xlab = "My y variable", 
          col = "gray", type = "density",
          panel = function(...){
              panel.histogram(...);
              panel.densityplot(..., col.line = "black")
          }
)

dev.off()

## Histogram-with-superimposed-density-plot:1 ends here

## [[file:e:/projects/software/lattice_ggplot2_intro/report/p_lattice_ggplot2_intro.org::*Histogram%20with%20superimposed%20density%20plot%20and%20conditional%20on%20%3Dx2f%3D][Histogram-with-superimposed-density-plot-and-conditional-on-=x2f=:1]]

pdf(file="../graphs/lattice_hist_dens_g.pdf")
histogram(~ y | x2f, data = df, xlab = "My y variable", 
          col = "gray", type = "density",
          panel = function(...){
              panel.histogram(...);
              panel.densityplot(..., 
                                col.line = "black")
          }
)

dev.off()

## Histogram-with-superimposed-density-plot-and-conditional-on-=x2f=:1 ends here

## [[file:e:/projects/software/lattice_ggplot2_intro/report/p_lattice_ggplot2_intro.org::*Scatter%20plot][Scatter-plot:1]]

pdf(file="../graphs/lattice_scatter.pdf")
xyplot(y ~ x1, data = df, 
       xlab = "My x1 variable", ylab = "My y variable")

dev.off()

## Scatter-plot:1 ends here

## [[file:e:/projects/software/lattice_ggplot2_intro/report/p_lattice_ggplot2_intro.org::*Multipanel%20scatter%20plot%20by%20%3Dx2f%3D][Multipanel-scatter-plot-by-=x2f=:1]]

pdf(file="../graphs/lattice_scatter_cond.pdf")
xyplot(y ~ x1 | x2f, data = df, 
       xlab = "My x1 variable", ylab = "My y variable")

dev.off()

## Multipanel-scatter-plot-by-=x2f=:1 ends here

## [[file:e:/projects/software/lattice_ggplot2_intro/report/p_lattice_ggplot2_intro.org::*Scatter%20plot%20by%20grouping%20variable%20x2][Scatter-plot-by-grouping-variable-x2:1]]

pdf(file="../graphs/lattice_scatter_g.pdf")
xyplot(y ~ x1, groups = x2f, data = df,
       key = simpleKey(text = levels(df$x2f), columns = 4))

dev.off()

## Scatter-plot-by-grouping-variable-x2:1 ends here

## [[file:e:/projects/software/lattice_ggplot2_intro/report/p_lattice_ggplot2_intro.org::*Scatter%20plot%20and%20linear%20regression%20line%20by%20grouping%20variable%20%3Dx2%3D][Scatter-plot-and-linear-regression-line-by-grouping-variable-=x2=:1]]

pdf(file="../graphs/lattice_scatter_reg.pdf")
xyplot(y ~ x1 | x2, data = df, 
       panel = function(y, x1, ...){
           panel.xyplot(x1, y);
           panel.lmline(x1, y)
       })

dev.off()

## Scatter-plot-and-linear-regression-line-by-grouping-variable-=x2=:1 ends here

## [[file:e:/projects/software/lattice_ggplot2_intro/report/p_lattice_ggplot2_intro.org::*Scatter%20plot%20and%20LOESS%20line%20by%20grouping%20variable%20%3Dx2%3D][Scatter-plot-and-LOESS-line-by-grouping-variable-=x2=:1]]

pdf(file="../graphs/lattice_scatter_loess.pdf")
xyplot(y ~ x1 | x2, 
       data = data.frame(df[, -2], x1 = df$x1^2), 
       panel = function(y, x1, ...){
           panel.xyplot(x1, y);
           panel.loess(x1, y)
       })

dev.off()

## Scatter-plot-and-LOESS-line-by-grouping-variable-=x2=:1 ends here

## [[file:e:/projects/software/lattice_ggplot2_intro/report/p_lattice_ggplot2_intro.org::*Bar%20chart%20(absolute%20frequencies)][Bar-chart-\(absolute-frequencies\):1]]

pdf(file="../graphs/lattice_barchart_n.pdf")
barchart(Freq ~ Var1, data = data.frame(table(df$x2f)), 
         xlab = "My x1 variable as a factor", ylab = "N",
         col = "gray")

dev.off()

## Bar-chart-\(absolute-frequencies\):1 ends here

## [[file:e:/projects/software/lattice_ggplot2_intro/report/p_lattice_ggplot2_intro.org::*Bar%20chart%20(percentages)][Bar-chart-\(percentages\):1]]

pdf(file="../graphs/lattice_barchart_p.pdf")
barchart(Freq ~ Var1, 
         data = data.frame(100 * prop.table(table(df$x2f))), 
         xlab = "My x1 variable as a factor", ylab = "%", 
         col = "gray")

dev.off()

## Bar-chart-\(percentages\):1 ends here

## [[file:e:/projects/software/lattice_ggplot2_intro/report/p_lattice_ggplot2_intro.org::*Bar%20chart%20with%20superimposed%20line%20plot][Bar-chart-with-superimposed-line-plot:1]]

pdf(file="../graphs/lattice_barchart_lines.pdf")
barchart(Freq ~ Var1, data = data.frame(table(df$x2f)), 
         xlab = "My x1 variable as a factor", ylab = "N",
         col = "gray",
         panel = function(...){
             panel.barchart(...);
             panel.xyplot(..., type = "b", col.symbol = "red", 
                          col.line = "red");
         })

dev.off()

## Bar-chart-with-superimposed-line-plot:1 ends here
