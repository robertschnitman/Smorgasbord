# Shorthands, I guess.
# Prefer a single function that allows option to change dimension;
# but the shorthands are cute.

rowf <- function(x, f) apply(x, 1, f)

colf <- function(x, f) apply(x, 2, f)

# == #

rowmiss <- function(x) {
  
  numna <- function(y) length(is.na(y)[is.na(y) == TRUE])
  
  # apply(x, 1, numna)
  
  rowf(x, numna)
  
}