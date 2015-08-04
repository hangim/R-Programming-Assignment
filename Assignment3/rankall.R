rankall <- function(outcome, num = "best") {
    x <- read.csv("./outcome-of-care-measures.csv",
                  colClasses = "character")

    if (outcome == "heart attack")
        index <- 11
    else if (outcome == "heart failure")
        index <- 17
    else if (outcome == "pneumonia")
        index <- 23
    else
        stop("invalid outcome")
    
    state <- sort(unique(x[, 7]))
    hospital <- character(length(s))
    for (i in seq_along(state)) {
        y <- subset(x, x[, 7] == state[i])
        y <- y[order(as.numeric(y[, index]), y[, 2], na.last = NA), ]
        if (num == "best")
            hospital[i] <- y[1, 2]
        else if (num == "worst")
            hospital[i] <- tail(y[, 2], 1)
        else if (as.integer(num) <= nrow(x))
            hospital[i] <- y[as.integer(num), 2]
        else
            hospital[i] <- NA
    }
    data.frame(hospital = hospital, state = state)
}
