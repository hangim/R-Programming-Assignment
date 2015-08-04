pollutantmean <- function(directory, pollutant, id = 1:332) {
    datasets <- vector("list")
    for (i in id) {
        datasets <- append(datasets, list(read.csv(file.path(directory, sprintf("%03d.csv", i)))))
    }
    d <- do.call(rbind, datasets)
    mean(d[, pollutant], na.rm = TRUE)
}
