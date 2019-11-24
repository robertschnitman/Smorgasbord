# For ggplot2
if (!require(ggplot2)) {
  
  install.packages('ggplot2')
  library(ggplot2)
  
}

if (!require(bbplot)) {
  
  install.packages('bbplot')
  library(bbplot)
  
}

# Bar charts and histograms

theme_bars <- function() {
  
  theme_minimal() + 
    theme(panel.grid.minor.y = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.x = element_blank())
  
}

theme_scatter <- function() {
  
  #geom_vline(xintercept = 0) +
   # geom_hline(yintercept = 0) + 
    theme_minimal() + 
    theme(panel.grid.minor.y = element_blank(),
        panel.grid.minor.x = element_blank())
  
}

p1 <- ggplot(mtcars, aes(mpg, wt)) + geom_point() + bbc_style()
p2 <- ggplot(mtcars, aes(mpg, wt, size = hp)) + 
  geom_point(colour = 'cyan4', fill = 'salmon', pch = 21, alpha = 0.8) + # https://stackoverflow.com/questions/10437442/place-a-border-around-points#10437545
  theme_scatter()

plotly::ggplotly(p2)
