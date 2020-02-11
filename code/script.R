library("rvest"); library("janitor"); library("stringr"); library("dplyr")

source("code/helper.R")

URL <- "http://www.transparencia.mg.gov.br/estado-pessoal/despesa-com-pessoal/despesapessoal-orgaosLink/1/12/2019/1/0"

pg <- read_html(URL)
tab <- html_table(pg, fill=TRUE)[[1]]

tab_names <- names(tab)
names(tab) <- make_clean_names(tab_names)

tab <- mutate(tab, total = num_converte(total))