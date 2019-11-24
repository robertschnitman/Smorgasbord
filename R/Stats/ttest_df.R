### Purpose: Simple formatting of t.test().

ttest_df <- function(x, ...) {
  
  tt <- t.test(x, ...)
  
  output <- with(tt, data.frame(form   = data.name,
                                t      = statistic, 
                                p      = p.value, 
                                ci_l   = conf.int[1], 
                                ci_u   = conf.int[2],
                                method = method))
  
  rownames(output) <- NULL
  
  output
  
}