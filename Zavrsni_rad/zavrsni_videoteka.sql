use master;
drop database if exists videoteka;
go
create database videoteka;
go
use videoteka;

create table CLAN (
	Sifra int not null primary key identity(1,1),
	Ime varchar(30) not null,
	Prezime varchar(30) not null,
	Adresa varchar(50) not null,
	Mobitel varchar(30) not null,
	OIB char(11),
	Datum_uclanjenja datetime not null
	);
create table KAZETA (
	Sifra int not null primary key identity(1,1),
	Naslov varchar(50) not null,
	Godina_izdanja date not null,
	Zanr varchar(30) not null,
	Cijena_posudbe int not null,
	Cijena_zakasnine int not null
	);
Create table POSUDBA (
	Sifra int not null primary key identity (1,1),
	Datum_posudbe datetime not null,
	Datum_vracanja datetime,
	Zakasnina int not null,
	Clan int
	);
	Create table POSUDBAKAZETA (
	Kazeta int not null primary key identity (1,1),
	Posudba int not null,
	Cijena_posudbe int,
	Cijena_zakasnine int
	);

	alter table POSUDBA add foreign key (CLAN) references clan (sifra);
	alter table POSUDBAKAZETA add foreign key (KAZETA) references kazeta (sifra);
	alter table POSUDBAKAZETA add foreign key (POSUDBA) references posudba (sifra);
