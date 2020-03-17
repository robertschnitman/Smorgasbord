plot_text <- function(y, x, labels, color = 'cyan4', ...) {
  
  # Blank out points
  plot(y ~ x, pch = 1, col = 'white', ...)
  
  # Plot the labels on the graph.
  text(x, y, labels, pos = 3, cex=0.0, col = color)
  
  
}

# with(mtcars, plot_text(mpg, wt, row.names(mtcars)))