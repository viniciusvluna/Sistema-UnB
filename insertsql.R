
library(pacman)
pacman::p_load(RMySQL, dplyr, stringr, tidyverse)

setwd('D:/1Folder/Estatistica/Banco de Dados/Trab/ofertas_sigaa/data/2023.1')
disciplinas <- read.csv('D:/1Folder/Estatistica/Banco de Dados/Trab/ofertas_sigaa/data/2023.1/disciplinas_2023-1.csv')
departamento <- read.csv('D:/1Folder/Estatistica/Banco de Dados/Trab/ofertas_sigaa/data/2023.1/departamentos_2023-1.csv')
turma <- read.csv('D:/1Folder/Estatistica/Banco de Dados/Trab/ofertas_sigaa/data/2023.1/turmas_2023-1.csv')
turma$professor <- str_sub(turma$professor, start = 1, end = -6)


con = dbConnect(RMySQL::MySQL(), user = 'root', password = '1234', dbname = 'banco_unb', host = 'localhost')

dbListTables(con)




### Inserindo dados csv

dbSendQuery(con, "SET GLOBAL local_infile = 1")

dbWriteTable(con, "disciplinas", disciplinas, overwrite=T)

dbWriteTable(con, "departamento", departamento, overwrite=T)

dbWriteTable(con, "turma", turma, overwrite=T)

rm(turma, disciplinas, departamento)



### Grafico das 10 disciplinas mais ofertadas


materias <- dbGetQuery(con, "select turma.cod_disciplina, disciplinas.nome
                                          from turma 
                                          left join disciplinas on turma.cod_disciplina=disciplinas.cod" )


materias <- dbGetQuery(con, 'select nome, count(*) as count 
                                    from(select turma.cod_disciplina, disciplinas.nome
                                          from turma 
                                          left join disciplinas on turma.cod_disciplina=disciplinas.cod) as t
                                    group by nome
                                    order by count DESC
                                    limit 10')


materias %>%
  ggplot(aes(x=fct_reorder(nome, count, .desc = F), y = count), )+
  geom_col(fill = 'dark blue')+
  labs(x = 'Materias', y = 'Ofertas')+
  theme_update(axis.text.x=element_text(size=10))+
  scale_y_continuous(breaks = seq(0, 100, by = 10))+
  coord_flip()


















