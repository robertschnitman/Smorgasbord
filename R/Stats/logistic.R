logistic <- function(...) glm(..., family = binomial(link = 'logit'))

#logistic(am ~ mpg + hp + gear, mtcars)
