uuse banco_unb;

/* Inserts */

insert into estudante values (101, 'maria@unb.com.br', '1234', 'DEPARTAMENTO DE MATEMÁTICA - BRASÍLIA', 518, 'maria', 'user');
insert into estudante values (102, 'heloisa@unb.com.br', '4321', 'DEPTO ESTATÍSTICA - BRASÍLIA', 514, 'heloisa', 'adm');
insert into estudante values (201, 'sophia@unb.com.br', '1324', 'DEPTO CIÊNCIAS DA COMPUTAÇÃO - BRASÍLIA', 508, 'sophia', 'adm');
insert into estudante values (202, 'laura@unb.com.br', '4231', 'DEPARTAMENTO DE MATEMÁTICA - BRASÍLIA', 518, 'laura', 'user');
select * from estudante;


insert into professor values (null, 'DANIELA AMORIM AMATO', '518', 'DEPARTAMENTO DE MATEMÁTICA - BRASÍLIA');
insert into professor values (null, 'EDUARDO YOSHIO NAKANO', '514', 'DEPTO ESTATÍSTICA - BRASÍLIA');
insert into professor values (null, 'PEDRO GARCIA FREITAS', '508', 'DEPTO CIÊNCIAS DA COMPUTAÇÃO - BRASÍLIA');
select * from professor;


insert into avaliacoes values (null, 1, 'MAT0025', '19', '2023.1', 102, 'boa');
insert into avaliacoes values (null, 2, 'EST0017', '1', '2023.1', 201, 'ruim');
insert into avaliacoes values (null, 3, null, null, null, 202, 'gente fina');
select * from avaliacoes;


insert into denuncias values (null, 2, 101, 'comentario negativo');
insert into denuncias values (null, 1, 202, 'ofensivo');
insert into denuncias values (null, 3, 102, 'discordo');
select * from denuncias;


insert into matriculas values (null, 101, 01, 'DANIELA AMORIM AMATO', 'MAT0025', '19', '2023.1');
insert into matriculas values (null, 102, 01, 'DANIELA AMORIM AMATO', 'MAT0025', '19', '2023.1');
insert into matriculas values (null, 101, 02, 'EDUARDO YOSHIO NAKANO', 'EST0017', '1', '2023.1');
insert into matriculas values (null, 202, 03, 'PEDRO GARCIA FREITAS', 'CIC0097', '2', '2023.1');
select * from matriculas;

select * from disciplinas;
select * from departamento;
select * from turma;

/* View */

create view estudante_curso as
select nome, curso 
from estudante;

select * from estudante_curso;

drop view estudante_curso;


/* Procedure */

delimiter $$
create procedure turma_discip()
begin
 select turma.professor, turma.turma, turma.cod_disciplina, disciplinas.nome
 from turma
 left join disciplinas on turma.cod_disciplina=disciplinas.cod; 
 end $$
delimiter ;

call turma_discip();

drop procedure turma_discip;


/* Drop */

drop database banco_unb;



