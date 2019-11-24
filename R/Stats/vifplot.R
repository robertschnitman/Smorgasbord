######################################################################################
### Robert Schnitman
### 2017-12-15
###
### PURPOSE: VIF plots of independent variables.
###
### OUTPUT: bar chart
###
### IMPORTS: car
###
######################################################################################

##### === BEGIN === #####
vifplot <- function(model,
                    fill = with(model, rainbow(length(coefficients[!grepl('Intercept', names(coefficients))]))),
                    ylab = 'VIF', xlab = '', main = 'Variance Inflation Factors',
                    horiz = FALSE) {

  stopifnot(class(model) %in% c('glm', 'lm'),
            with(model, length(coefficients[!grepl('Intercept', names(coefficients))]) >= 2))

  v <- car::vif(model)

  par(las = 1)

  if (horiz == FALSE) {

    barplot(v,
            ylab = ylab, xlab = xlab, main = main,
            horiz = horiz, col = fill)

  } else {

    barplot(v,
            ylab = xlab, xlab = ylab, main = main,
            horiz = horiz, col = fill)

  }

  par(las = 0) # reset

}

##### === END === #####
