# Data frame version of apply.
# INPUT: matrix/data frame, margin (1, 2), function.
# OUTPUT: data frame.

makedf <- function(f) {
 
  function(x, ...) {
    
    # 1. Convert apply() output to data frame--have the function name(s) be on the rows.
    output <- as.data.frame(t(f(x, ...))) # row name(s) is (are) the function.
    
    # 2. Transform output as necessary, depending on the number of rows.
    if (NROW(output) == 1) {
      
      rownames(output) <- deparse(substitute(FUN)) # deparse/sub to avoid having the literal apply() as a row name.
      
    } else if (NROW(output) > 1) { # by default, apply() will have the variables as row names.
      
      output <- t(output) # Maintain the consistency of having the function name(s) on the rows.
      
    }
    
  }
  
}

# test1a <- applydf(mtcars, 1, mean)
# test1b <- applydf(mtcars, 2, mean)
# test2a <- applydf(mtcars, 1, mm) # from testf.R
# test2b <- applydf(mtcars, 2, mm) # from testf.R
