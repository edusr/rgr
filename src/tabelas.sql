CREATE TABLE  cinemadb.cidade(
	codigo integer NOT NULL AUTO_INCREMENT,
	nome varchar(255) not NULL,
	PRIMARY KEY (codigo)
);

CREATE TABLE  cinemadb.cinema(
	codigo integer NOT NULL AUTO_INCREMENT,
	nome varchar(255) not NULL,
	cod_cidade integer,
	PRIMARY KEY (codigo),
	FOREIGN KEY (cod_cidade) REFERENCES cidade(codigo)
);

CREATE TABLE  cinemadb.filme(
	codigo integer NOT NULL AUTO_INCREMENT,
	nome varchar(255) not NULL,
	cod_cinema integer,
	PRIMARY KEY (codigo)
);

CREATE TABLE  cinemadb.filme_cinema(
	cod_filme integer NOT NULL ,
	cod_cinema integer NOT NULL ,
	PRIMARY KEY (cod_filme,cod_cinema),
	FOREIGN KEY (cod_cinema) REFERENCES cinema(codigo),
	FOREIGN KEY (cod_filme) REFERENCES filme(codigo),
);

CREATE TABLE cinemadb.horarios(
	codigo integer NOT NULL AUTO_INCREMENT,
	data_inicio datetime not NULL,
	data_fim datetime not null,
	cod_filme integer,
	cod_cinema integer,
	PRIMARY KEY (codigo),
	FOREIGN KEY (cod_cinema) REFERENCES cinema(codigo),
	FOREIGN KEY (cod_filme) REFERENCES filme(codigo)
);

CREATE TABLE  cinemadb.assentos(
	codigo integer NOT NULL AUTO_INCREMENT,
	fila varchar(5) not NULL,
	numero integer not null,
	valor float not null,
	cod_horario integer,
	ind_ocupado integer,
	PRIMARY KEY (codigo),
	FOREIGN KEY (cod_horario) REFERENCES horarios(codigo)
);

insert into cinemadb.cidade(nome) values('Sao Paulo');
insert into cinemadb.cinema(nome,cod_cidade) values('Cinemark',1);
insert into cinemadb.filme(nome,cod_cinema) values('Senhor dos Aneis',1);

--retorna a lista de cidades
select codigo,nome from cidade;

-- retorna os filmes em determinada cidade
select distinct fil.codigo,fil.nome
from
    cinemadb.cidade cid,
    cinemadb.cinema cma,
    cinemadb.filme_cinema cf,
    cinemadb.filme fil
where
    cid.codigo = cma.cod_cidade
    and cma.codigo = cf.cod_cinema
    and fil.codigo = cf.cod_filme
    and cma.codigo = cf.cod_cinema
    and cid.codigo = 1;

-- retorna os cinemas de determinado filme
select cma.codigo,cma.nome
from
    cinemadb.cinema cma,
    cinemadb.filme_cinema fil
where cma.codigo = fil.cod_cinema
      and fil.cod_filme = 1

-- retorna os horarios pra determinado filme e cinema
select hra.codigo,hra.data_inicio
from cinemadb.horarios hra,
      cinemadb.filme_cinema fil
where hra.cod_cinema = fil.cod_cinema
    and hra.cod_filme  = fil.cod_filme
    and fil.cod_filme = ?
    and fil.cod_cinema = ?
   ;

--Retorna os assentos livres para determinado horario
select a.codigo,a.fila,a.numero,a.valor
from cinemadb.horarios hra,
     cinemadb.assentos a
where a.cod_horario = hra.codigo
and (a.ind_ocupado is null or a.ind_ocupado = 0)
and hra.codigo = 1;

--Retorna o valor dos assentos selecionados
select sum(a.valor)
from cinemadb.assentos a
where a.codigo in (1,3)
