## plots from the ggplot2 documentation site: http://docs.ggplot2.org/

library(ggplot2)

## make basic plot object
p <- ggplot(data = mtcars, aes(x = wt, y = mpg))

## geom_point: cylinder colours
cylcol <- p + geom_point(aes(colour = factor(cyl)), size = 5) + theme_bw() + theme(text = element_text(size = 18))

## geom_point: cylinder shapes
cylshp <- p + geom_point(aes(shape = factor(cyl)), size = 5) + scale_shape(solid = FALSE) + theme_bw() + theme(text = element_text(size = 18))

## facet_wrap
facets <- p + geom_point(aes(colour = factor(cyl)), size = 5) + theme_bw() + theme(text = element_text(size = 18)) + facet_wrap(~ am)
