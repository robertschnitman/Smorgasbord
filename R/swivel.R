if (!require(tidyverse)) {
  
  install.packages('tidyverse')
  library(tidyverse)
  
}

swivel <- function(agg) {
  
  tidyr::spread(agg, NCOL(agg) - 1, NCOL(agg))
  
}

agg_swivel <- function(...) {
  
  agg <- aggregate(...)
  
  out <- swivel(agg)
  
  out
  
}
  
# form <- as.formula('mpg ~ am + gear')
# aggregate(form, mtcars, mean) %>% swivel
# agg_swivel(form, mtcars, mean)
