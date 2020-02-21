library("rvest"); library("janitor"); library("stringr"); library("dplyr")

source("code/helper.R")

URL <- "http://www.transparencia.mg.gov.br/estado-pessoal/despesa-com-pessoal/despesapessoal-orgaosLink/1/12/2019/1/0"

pg <- read_html(URL)
tab <- html_table(pg, fill=TRUE)[[1]]

tab_names <- names(tab)
names(tab) <- make_clean_names(tab_names)

tab <- mutate(tab, ano = 2019,
              valor_pessoal_ativo = num_converte(valor_pessoal_ativo),
              valor_pessoal_inativo = num_converte(valor_pessoal_inativo),
              valor_pensionistas = num_converte(valor_pensionistas),
              valor_contratados = num_converte(valor_contratados),
              total = num_converte(total))


tab_sem_total <- filter(tab, orgao != "TOTAL GERAL:")
tab_sem_total_total <- select(tab_sem_total, total)
summarize(tab_sem_total_total, n = sum(total))

tab %>% 
  filter(orgao != "TOTAL GERAL:") %>% 
  select(total) %>% 
  summarize(n = sum(total))


filter(tab, orgao == "TOTAL GERAL:")



# testar se soma das colunas é igual ao total