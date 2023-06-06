-- Restoran ima više kategorija na jelovniku. Jedna kategorija ima više jela.
-- Uz svako jelo može se ponuditi više pića. Jedno piće se može ponuditi uz više jela.

use master;
go
drop database if exists Restoran2;
create database Restoran2;
go
use Restoran2;


create table JELOVNIK (
    Sifra int primary key identity (1, 1) not null,
    KATEGORIJA varchar(30) not null
);

create table JELO (
    Sifra int primary key identity (1, 1) not null,
    Naziv varchar(30) not null,
    Opis varchar(100) not null,
    Cijena decimal(18,2) not null,
    Jelovnik int
);

create table PICE (
    Sifra int primary key identity (1, 1) not null,
    Naziv varchar(30) not null,
    Vrsta varchar(30) not null,
	Cijena decimal (18,2)
);

create table JELO_PICE (
	JELO int not null,
	PICE int not null
	);

	alter table JELO_PICE add foreign key (PICE) references pice (sifra);
	alter table JELO_PICE add foreign key (JELO) references jelo (sifra);
	alter table JELO add foreign key (JELOVNIK) references jelovnik (sifra);

	select * from JELOVNIK;

	insert into JELOVNIK (KATEGORIJA) values
		('predjelo'),
		('glavno_jelo'),
		('desert'),
		('pice');

	select * from JELO;

		insert into JELO (NAZIV, OPIS, CIJENA, JELOVNIK) values
			('povrtna_juha', 'juha_od_povrca', 5, 1),
			('punjene_lignje', 'lignje_sir_sunka', 10, 2),
			('sladoled', 'cokolada', 1.5, 3);

	select * from PICE;

		insert into PICE (NAZIV, VRSTA, CIJENA) values
			('turska_kava', 'topli_napitak', 1),
			('jack_daniels', 'alkohol', 2.5),
			('cedevita', 'sok', 1.5);

	select * from JELO_PICE;
		
	update pice set naziv='Ballentines'
	where sifra=2;

	delete from JELO where jelovnik=2;
	delete from PICE where sifra=2;













