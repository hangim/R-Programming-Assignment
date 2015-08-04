rankhospital <- function(state, outcome, num = "best") {
    x <- read.csv("./outcome-of-care-measures.csv",
                  colClasses = "character")

    x <- subset(x, State == state)
    if (nrow(x) == 0)
        stop("invalid state")

    if (outcome == "heart attack")
        index <- 11
    else if (outcome == "heart failure")
        index <- 17
    else if (outcome == "pneumonia")
        index <- 23
    else
        stop("invalid outcome")
        
    x <- x[order(as.numeric(x[, index]), x[, 2], na.last = NA), ]
    if (num == "best")
        x[1, 2]
    else if (num == "worst")
        tail(x[, 2], 1)
    else if (as.integer(num) <= nrow(x))
        return(x[as.integer(num), 2])
    else
        NA
}
