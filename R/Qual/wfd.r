### PURPOSE: Generate a word-frequency data frame of two fields:
###   The word and the number of times it occurs.
### INPUT: raw text file.
### OUTPUT: data frame.

##### === BEGIN === #####
wfd <- function(file, keep_case = TRUE) {
  
  x           <- readLines(file)               # 1. Each line is a row.
  x           <- gsub('[[:punct:]]',  '', x)   # 2. Punctuation throws off frequencies.
  x.list      <- strsplit(x, ' ')              # 3. We need to get each word on their own line
  x.v         <- unlist(x.list)                #    so that we can use table().
  
  if (keep_case == FALSE) {                    # 4. Frequencies are case-sensitive. 
                                               #    Provide flexibility with keep_case.
    x.v       <- sapply(x.v, tolower)            
    
  }
  
  x.df        <- as.data.frame(table(x.v))     # 5. table() is not a tidy dataset.
  names(x.df) <- c('word', 'freq')             # 6. Rename for simplicity.
  x.df                                         # 7. Output should be the data frame.
  
}

##### === END === #####

# test1 <- wfd('Letter from Birmingham Jail.txt')
# test2 <- wfd('Letter from Birmingham Jail.txt', keep_case = FALSE)
# View(test1); View(test2)