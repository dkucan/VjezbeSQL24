use master;
drop database if exists SQL_Vježbe_4;
go
create database SQL_Vježbe_4 collate Croatian_CI_AS;
go
use SQL_Vježbe_4;

create table PUNAC (
	Šifra int primary key identity (1,1) not null,
	Treći_puta datetime,
	Majica varchar(46),
	JMBAG char(11) not null,
	NOVČIĆA decimal(18,7) not null,
	MARAKA decimal(12,6) not null,
	OSTAVLJEN int not null
	);
create table OSTAVLJEN (
	Šifra int primary key identity (1,1) not null,
	Model_naočala varchar(43),
	Introvertno bit,
	Kuna decimal(14,10)
	);
create table SNAŠA (
	Šifra int primary key identity (1,1) not null,
	Intvorertno bit,
	Treći_puta datetime, 
	Haljina varchar(44) not null,
	Žena int not null
	);
create table BEĆAR (
	Šifra int primary key identity (1,1) not null,
	Novčića decimal(14,8),
	Kratka_majica varchar(48) not null,
	Boja_očiju varchar(36) not null,
	Snaša int not null
	);
create table PRIJATELJ (
	Šifra int primary key identity (1,1) not null,
	Eura decimal(16,9),
	Prstena int not null,
	Gustoća decimal(16,5),
	JMBAG char(11) not null,
	Suknja varchar(47) not null,
	Bećar int not null
	);
create table ŽENA (
	Šifra int primary key identity (1,1) not null,
	Suknja varchar(39) not null,
	Lipa decimal(18,7),
	Prstena int not null
	);
create table ŽENA_MLADIĆ (
	Šifra int primary key identity (1,1) not null,
	Žena int not null,
	Mladić int not null
	);
create table MLADIĆ (
	Šifra int primary key identity (1,1) not null,
	Kuna decimal(15,9),
	Lipa decimal(18,5),
	Naušnica int,
	Stil_frizura varchar(49),
	Vesta varchar(34) not null
	);

	alter table ŽENA_MLADIĆ add foreign key (MLADIĆ) references mladić (šifra);
	alter table ŽENA_MLADIĆ add foreign key (ŽENA) references žena (šifra);
	alter table SNAŠA add foreign key (ŽENA) references žena (šifra);
	alter table BEĆAR add foreign key (SNAŠA) references snaša (šifra);
	alter table PRIJATELJ add foreign key (BEĆAR) references bećar (šifra);
	alter table PUNAC add foreign key (OSTAVLJEN) references ostavljen (šifra);




