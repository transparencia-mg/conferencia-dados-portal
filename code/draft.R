library("rvest")

# https://stackoverflow.com/questions/37240448/use-rvest-to-extract-html-table

URL <- "http://www.transparencia.mg.gov.br/estado-pessoal/despesa-com-pessoal/despesapessoal-orgaosLink/1/12/2019/1/0"

pg <- read_html(URL)
tab <- html_table(pg, fill=TRUE)[[1]]

str(tab)
