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
);

CREATE TABLE Tecnico(
tecnico_id int primary key auto_increment,
nome varchar(100) not null,
nacionalidade varchar(50) not null,
time_id int not null,
foreign key(time_id) references Time(time_id)
);

CREATE TABLE Partida(
partida_id int primary key auto_increment,
rodada int not null,
data date,
horario time,
mandante_id int,
visitante_id int,
arena_id int,
placar_mandante int not null,
placar_visitante int not null,
foreign key(mandante_id) references Time(time_id),
foreign key(visitante_id) references Time(time_id),
foreign key(arena_id) references Arena(arena_id)
);

CREATE TABLE Gol(
gol_id int primary key auto_increment,
partida_id int,
jogador_id int,
time_id int,
minuto int,
tipo varchar(50),
foreign key(partida_id) references Partida(partida_id),
foreign key(jogador_id) references Jogador(jogador_id),
foreign key(time_id) references Time(time_id)
);


CREATE TABLE Cartão(
cartao_id int primary key auto_increment,
partida_id int,
jogador_id int,
time_id int,
cor varchar(10),
minuto int,
foreign key(partida_id) references Partida(partida_id),
foreign key(jogador_id) references Jogador(jogador_id),
foreign key(time_id) references Time(time_id)
);


CREATE TABLE Estatitica(
estatitica_id int primary key auto_increment,
partida_id int,
time_id int,
chutes int,
chutes_a_gol int,
posse_de_bola dec(5, 2),
passes int,
precisao_passes dec(5, 2),
foreign key(partida_id) references Partida(partida_id),
foreign key(time_id) references Time(time_id)
);