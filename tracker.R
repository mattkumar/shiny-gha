library(dplyr)
library(readr)

inp <- readr::read_csv("time.csv")  

tmp <- inp %>%
  add_row(time = Sys.time(), seq = nrow(inp) + 1)

readr::write_csv(tmp, file = "time.csv")
