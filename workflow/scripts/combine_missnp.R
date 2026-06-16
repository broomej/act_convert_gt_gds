logcon <- file(snakemake@log[[1]], open = "wt")
sink(logcon)
sink(logcon, type = "message")
input <- snakemake@input
output <- snakemake@output
library(purrr)

missnp <- map(input$missnp, readLines) %>%
    reduce(c) %>%
    unique()

writeLines(missnp, snakemake@output$missnp)
