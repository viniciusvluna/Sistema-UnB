
library(pacman)
pacman::p_load(RMySQL, dplyr, stringr)

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

a <- dbReadTable(con, name = 'disciplinas')

































