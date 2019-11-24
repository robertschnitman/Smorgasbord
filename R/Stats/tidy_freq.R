tidy_freq <- function(...) {
  
  if (!require(tidyverse)) {
    
    install.packages('tidyverse')
    library(tidyverse)
    
  }
  
  if (!require(magrittr)) {
    
    install.packages('magrittr')
    library(magrittr)
    
  }
  
  ### Check if the number of variables is not 2.
  ##  For now, cross-tabs between two variables is only possible at this point.
  dots <- list(...)
  
  if (length(dots) != 2) {
    
    stop(paste0('This function assumes two variables. Number of variables detected is ', 
                length(dots), 
                '.')) 
    
  }
  
  ### Generate the counts.
  freq <- table(...)
  
  freq_df <- as.data.frame(freq) %>%
    spread(NCOL(.) - 1, NCOL(.)) %>%
    mutate(Total = apply(.[, 2:NCOL(.)], 1, sum))
  
  ### Generate the ROWWISE percentages.
  prop_df <- freq_df
  prop_df[, 2:NCOL(prop_df)] <- prop_df[, 2:NCOL(prop_df)]/prop_df$Total
  
  ### Convert freq_df and prop_df into characters so that 
  ##  we can combine them into the same data frame.
  freq_df %<>% # Format the counts so that they are of the NNN,NNN format.
    format(., big.mark = ',', scientific = FALSE) %>%
    map_df(as.character)
  
  prop_df[, 2:(NCOL(prop_df))] %<>% 
    map_df(~ paste0(round(.x*100), '%'))
  
  prop_df %<>% 
    map_df(as.character)
  
  ### Combine freq_df and prop_df
  combine <- map_df(1:NROW(freq_df), ~ rbind(freq_df[.x, ], prop_df[.x, ]))
  
  combine
  
}