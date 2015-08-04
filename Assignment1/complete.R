complete <- function(directory, id = 1:332) {
    file_list <- list.files(directory, full.name = TRUE)
    nobs <- integer(332)
    for (i in seq_along(file_list))
        nobs[i] <- sum(complete.cases(read.csv(file_list[i])))
    result <- as.data.frame(cbind(id = 1:332, nobs = nobs))
    result[id, ]
}
