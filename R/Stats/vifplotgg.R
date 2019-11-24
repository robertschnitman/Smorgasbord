######################################################################################
### Robert Schnitman
### 2017-12-15
###
### PURPOSE: VIF ggplots of independent variables.
###
### OUTPUT: bar chart
###
### IMPORTS: car, ggplot2
###
######################################################################################

##### === BEGIN === #####
vifplotgg <- function(model,
                    ylab = 'VIF', xlab = '', main = 'Variance Inflation Factors',
                    horiz = FALSE) {

  stopifnot(class(model) %in% c('glm', 'lm'),
            with(model, length(coefficients[!grepl('Intercept', names(coefficients))]) >= 2))

  if (require(ggplot2)) {

    suppressMessages(require(ggplot2))

  } else {

    stop('Please install ggplot2.')

  }

  v <- car::vif(model)

  vdf <- as.data.frame(t(t(v)))

  vdf$iv <- rownames(vdf)

  colnames(vdf)[1] <- 'vif'

  if (horiz == FALSE) {

    ggplot2::ggplot(vdf, ggplot2::aes(y = vif, x = iv, fill = iv, color = iv)) +
      ggplot2::stat_summary(fun.y = 'mean', geom = 'bar', show.legend = FALSE) +
      ggplot2::labs(y = ylab, x = xlab, title = main) +
      ggplot2::theme_bw() +
      ggplot2::theme(panel.grid.major.x = ggplot2::element_blank(),
                     panel.grid.minor.x = ggplot2::element_blank())

  } else {

    ggplot2::ggplot(vdf, ggplot2::aes(y = vif, x = iv, fill = iv, color = iv)) +
      ggplot2::stat_summary(fun.y = 'mean', geom = 'bar', show.legend = FALSE) +
      ggplot2::labs(y = ylab, x = xlab, title = main) +
      ggplot2::theme_bw() +
      ggplot2::theme(panel.grid.major.y = ggplot2::element_blank(),
                     panel.grid.minor.y = ggplot2::element_blank()) +
      ggplot2::coord_flip()

  }

}

##### === END === #####
