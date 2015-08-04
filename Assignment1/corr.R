corr <- function(directory, threshold = 0) {
    file_list <- list.files(directory, full.name = TRUE)
    result <- rep(NA, length(file_list))
    for (i in seq_along(file_list)) {
        d <- read.csv(file_list[i])
        d <- d[complete.cases(d), ]
        if (nrow(d) >= threshold) {
            result[i] <- cor(d$sulfate, d$nitrate)
        }
    }
    result[!is.na(result)]
}
