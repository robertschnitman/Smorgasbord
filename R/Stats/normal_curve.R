normal_curve <- function(x, col = 'salmon', ...) {
  
  curve_seq <- seq(min(x), max(x), 0.001)
  
  dist <- dnorm(curve_seq, mean(x), sd(x))
  
  lines(curve_seq, dist, col = col)
  
}

histcurve <- function(x, ..., freq = FALSE, col_hist = 'cyan3', col_curve = 'salmon', alpha = 0.6) {
  
  # 1. Set up colors
  colors <- sapply(c(col_hist, col_curve), function(x) col2rgb(x)/255)
  
  col_alpha <- apply(colors, 2, function(x) rgb(x[1], x[2], x[3], alpha = alpha))
  
  # 2. Plot histogram.
  hist(x, freq = freq, col = col_alpha[1], ...)
  
  # 3. Overlay normal distribution.
  normal_curve(x, col = col_alpha[2])
  
}

histcurve(mtcars$mpg, ylim = c(0,0.08), main = 'Distribution of MPG')