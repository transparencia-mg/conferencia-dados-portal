library("stringr")

num_converte <- function(x) {
  x <- str_remove_all(x, "\\.")
  x <- str_replace_all(x, "\\,", ".")
  as.numeric(x)
}
