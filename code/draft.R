library("rvest"); library("janitor"); library("stringr"); library("dplyr")

source("code/helper.R")

# https://stackoverflow.com/questions/37240448/use-rvest-to-extract-html-table

URL <- "http://www.transparencia.mg.gov.br/estado-pessoal/despesa-com-pessoal/despesapessoal-orgaosLink/1/12/2019/1/0"

pg <- read_html(URL)
tab <- html_table(pg, fill=TRUE)[[1]]

# tab <- URL %>% 
#         read_html() %>% 
#         html_table(fill = TRUE) %>% 
#         extract2(1)

#===========================================================================
# os três modos abaixo são equivalentes

# modo 1
# names(tab) <- make_clean_names(names(tab))

# modo 2
tab_names <- names(tab)
names(tab) <- make_clean_names(tab_names)

# modo 3
# names(tab) <- names(tab) %>%       # operador %>% veio do pacote magrittr
#                 make_clean_names()


# o que acontece com essa linha
# tab_names <- names(tab)
# tab_names <- names(tab) <- make_clean_names(tab_names)

names(tab)
str(tab)

tab <- mutate(tab, total = num_converte(total))
filter(tab, total > 1154727600)

