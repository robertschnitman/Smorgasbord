each2 <- function(data, ...) {
  
  output <- sapply(data, function(x) plyr::each(...)(x))
  
  #rownames(output) <- as.vector(list(...))
  
  output
  
}

### each2(mtcars, mean, median)
# mpg    cyl     disp       hp     drat      wt     qsec     vs      am   gear   carb
# ..1 20.09062 6.1875 230.7219 146.6875 3.596563 3.21725 17.84875 0.4375 0.40625 3.6875 2.8125
# ..2 19.20000 6.0000 196.3000 123.0000 3.695000 3.32500 17.71000 0.0000 0.00000 4.0000 2.0000
###