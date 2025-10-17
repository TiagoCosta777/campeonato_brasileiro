CREATE DATABASE Campeonato_Brasileiro;

USE Campeonato_Brasileiro;

CREATE TABLE Arena(
arena_id int primary key auto_increment,
nome varchar(100) not null,
cidade varchar(100) not null,
estado varchar(50) not null
);

CREATE TABLE Time(
time_id int primary key auto_increment,
nome varchar(100) not null,
estado varchar(50) not null,
sigla char(3) not null
);

CREATE TABLE Jogador(
jogador_id int primary key auto_increment,
nome varchar(100) not null,
posicao varchar(50) not null,
time_id int not null,
foreign key(time_id) references Time(time_id)
)