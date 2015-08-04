best <- function(state, outcome) {
    x <- read.csv("./outcome-of-care-measures.csv", colClasses = "character")

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
        
    x <- x[order(x[, 2]), ] # order by Name
    x[which.min(as.numeric(x[, index])), 2]
}
