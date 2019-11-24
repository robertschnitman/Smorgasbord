#' Graphically diagnose model residuals ("classic" version with ggplot2 graphics).
#'
#' @param model An lm or glm object.
#' @param se Boolean. For overlaying standard errors.
#' @return 2x2 charts similar to plot(model.lm).
#' @examples
#' model.lm <- lm(data = mtcars, formula = mpg ~ wt + gear)
#' cdiagnose(model.lm)
#' @seealso \url{https://github.com/robertschnitman/diagnoser} and
#' Raju Rimal (inspiration for Residuals vs. Leverage): \url{https://rpubs.com/therimalaya/43190}

######################################################################################
### Robert Schnitman
### 2017-11-14
###
### PURPOSE:
###    1. Generate 2x2 graphs that diagnose the residuals of a model.
###    2. Alternative for plot(lm()).
###
### LIBRARY DEPENDENCY: ggplot2 (>= 2.2.1), gridExtra (>= 2.3)
###
### INPUT: lm/glm object. E.g. model.lm <- lm(y ~ x).
### OUTPUT: 2x2 plot with base graphics.
###
### RECOMMENDED CITATION:
###  Schnitman, Robert (2017). diagnose.r. https://github.com/robertschnitman/diagnoser
###
### Idea for Residuals vs. Leverage inspired by
###  https://rpubs.com/therimalaya/43190.
######################################################################################


##### === BEGIN === #####

cdiagnose <- function(model, se = FALSE) {

  ### Set up data frame of fit and residuals ###
  fit <- predict(model)
  res <- resid(model)
  sr  <- (res - mean(res))/sd(res)            # Standardized Residuals.
  qsr <- qqnorm(sr, plot.it = FALSE)[[1]]     # Theoretical Quantiles; suppress plot.

  lev <- hat(model.matrix(model))             # Leverage.
  cd  <- cooks.distance(model)                # Cook's Distance.

  df  <- as.data.frame(cbind(fit, res, sr))

  ### Some ggplot2 graphs use the same functions/colors; need to minimize repeating code ###
  ggbase <- function(df, y, x, size = NULL, se = FALSE, smooth = 'lm', linetype = 'solid', sl = FALSE) {

    ## Need to save default values for ggplot2 functions to process correctly. ##
    sm <- smooth
    lt <- linetype
    sl <- sl
    sz <- size

    ggplot(df, aes(y = y, x = x, size = sz)) +
      geom_point(color = 'salmon') +
      geom_smooth(method      = sm,
                  se          = se,
                  linetype    = linetype,
                  color       = 'steelblue',
                  show.legend = sl) +
      theme_bw()
  }

  ### Create individual graphs ###
  ## Figure 1 - Residuals vs. Fitted ##
  f1 <- ggbase(df, y = res, x = fit, se = FALSE, smooth = 'loess') +
    geom_hline(yintercept = 0,
               col        = 'red',
               linetype   = 'dashed') +
    labs(x     = 'Fitted Values',
         y     = 'Residuals',
         title = 'Residuals vs. Fit')

  ## Figure 2 - Normal Q-Q Plot ##
  f2 <- ggbase(df, y = sr, x = qsr, se = FALSE, smooth = 'loess', linetype = 'dashed') +
    labs(x     = 'Theoretical Quantiles',
         y     = 'Standardized Residuals',
         title = 'Normal Q-Q')

  ## Figure 3 - Scale-Location ##
  f3 <- ggbase(df, y = sqrt(abs(sr)), x = fit, se = FALSE, smooth = 'loess', linetype = 'solid') +
    labs(x     = 'Fitted Values',
         y     = expression(sqrt('|Standardized residuals|')),
         title = 'Scale-Location')

  ## Figure 4 - Residuals vs. Leverage ##
  f4 <- ggbase(df, y = sr, x = lev, size = cd, se = FALSE, smooth = 'loess', linetype = 'solid', sl = TRUE) +
    labs(x     = 'Leverage',
         y     = 'Standardized Residuals',
         size  = 'Cook\'s Distance',
         title = 'Residuals vs. Leverage') +
    theme(legend.position = 'bottom')

  ### Arrange in 2x2 grid ###
  grid.arrange(f1, f2, f3, f4, ncol = 2)

}

##### === END === #####
