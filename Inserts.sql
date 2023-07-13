use banco_unb;

/* Inserts */

insert into estudante values (101, 'maria@unb.com.br', '1234', 'matematica', 518, 'maria', 'user');
insert into estudante values (102, 'heloisa@unb.com.br', '4321', 'estatistica', 514, 'heloisa', 'adm');
insert into estudante values (201, 'sophia@unb.com.br', '1324', 'ciencia da computacao', 508, 'sophia', 'adm');
insert into estudante values (202, 'laura@unb.com.br', '4231', 'matematica', 518, 'laura', 'user');


insert into professor values ('01', 'DANIELA AMORIM AMATO', 518, 'DEPARTAMENTO DE MATEMÁTICA - BRASÍLIA');
insert into professor values ('02', 'EDUARDO YOSHIO NAKANO', 514, 'DEPTO ESTATÍSTICA - BRASÍLIA');
insert into professor values ('03', 'PEDRO GARCIA FREITAS', 508, 'DEPTO CIÊNCIAS DA COMPUTAÇÃO - BRASÍLIA');


insert into avaliacoes values ('av_1', '01', 'MAT0025', '19', '2023.1', 102, 'boa');
insert into avaliacoes values ('av_2', '02', 'EST0017', '1', '2023.1', 201, 'ruim');
insert into avaliacoes values ('av_3', '03', null, null, null, 202, 'gente fina');


insert into denuncias values ('dn_1', 'av_2', 101, 'comentario negativo');
insert into denuncias values ('dn_2', 'av_1', 202, 'ofensivo');
insert into denuncias values ('dn_3', 'av_3', 102, 'discordo');


insert into matriculas values ('001',101, 01, 'DANIELA AMORIM AMATO', 'MAT0025', '19', '2023.1');
insert into matriculas values ('002',102, 01, 'DANIELA AMORIM AMATO', 'MAT0025', '19', '2023.1');
insert into matriculas values ('003',101, 02, 'EDUARDO YOSHIO NAKANO', 'EST0017', '1', '2023.1');
insert into matriculas values ('004',202, 03, 'PEDRO GARCIA FREITAS', 'CIC0097', '2', '2023.1');


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




