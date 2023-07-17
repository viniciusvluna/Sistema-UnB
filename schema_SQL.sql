create schema banco_unb;
use banco_unb;

/* Create */

create table turma(
 turma int not null,
 periodo char(15) not null,
 professor varchar(100) not null,
 horario char(15),
 vagas_ocupadas int,
 total_vagas int,
 local varchar(100),
 cod_disciplina char(15) not null,
 cod_depto char(10),
primary key(turma, professor, cod_disciplina, periodo));
 
 create table estudante(
 matricula char(9) primary key not null,
 email varchar(100) not null,
 senha varchar(100) not null,
 curso varchar(100) not null,
 cod_dpto char(10),
 nome varchar(100) not null,
 user_admin char(4) not null);
 
 create table professor(
 id_prof int primary key not null AUTO_INCREMENT,
 nome varchar(100),
 cod_dpto char(10) not null,
 dpto varchar(50));
 
create table departamento(
cod char(10) primary key not null,
nome varchar(100));

create table disciplinas(
cod char(10) primary key,
nome varchar(100),
cod_depto char(10));

create table matriculas(
id_mat int not null primary key AUTO_INCREMENT,
matricula char(9) not null,
id_prof int not null,
nome_prof varchar(100),
cod_discip char(10) not null,
turma int not null,
periodo char(6) not null);

create table avaliacoes(
id_av int primary key not null AUTO_INCREMENT,
id_prof int not null,
cod_discip char(10),
turma int,
periodo char(6),
matricula char(9) not null,
comentario varchar(300) not null);

create table denuncias(
id_denuncia int primary key not null AUTO_INCREMENT,
id_av int not null,
matricula char(9) not null,
denuncia varchar(300) not null);


/* Rodar insert.sql e insert.R */


/* Read */

select * from avaliacoes;

select * from denuncias;

select * from estudante where curso = 'matematica';

/* Update */

select * from disciplinas;
update disciplinas set nome = lower(nome);
select * from disciplinas;

select * from turma;
update turma set total_vagas = 60 where total_vagas = 50; 
select * from turma;

select * from estudante;
update estudante set curso = 'biologia';
select * from estudante;
 
 
/* Delete */

select * from matriculas;
DELETE FROM matriculas WHERE matricula = 101;
select * from matriculas;

select * from turma;
DELETE FROM turma WHERE turma = '01';
select * from turma;

select * from estudante;
DELETE FROM estudante WHERE nome = 'heloisa';
select * from estudante;

