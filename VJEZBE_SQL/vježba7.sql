use master;
drop database if exists VJEŽBE_SQL_7;
go
create database VJEŽBE_SQL_7 collate Croatian_CI_AS;
go
use VJEŽBE_SQL_7;

create table SESTRA (
	Šifra int primary key identity (1,1) not null,
	Boja_kose varchar(34) not null,
	Hlače varchar(36) not null,
	Lipa decimal(15,6),
	Stil_frizura varchar(40) not null,
	Maraka decimal not null,
	Prijateljica int
	);

create table PRIJATELJICA (
	Šifra int primary key identity (1,1) not null,
	Haljina varchar(45),
	Gustoća decimal(15,10) not null,
	Ogrlica int,
	Novčića decimal (12,5),
	Ostavljen int 
	);

create table PUNICA (
	Šifra int primary key identity (1,1) not null,
	Majica varchar(40),
	Eura decimal (12,6) not null,
	Prstena int,
	Cura int not null,
	);

create table CURA (
	Šifra int primary key identity (1,1) not null,
	Lipa decimal (12,8) not null,
	Introvertno bit,
	Model_naočala varchar(40),
	Narukvica int,
	Treći_puta datetime,
	Kuna decimal(14,9),
	);

create table OSTAVLJEN (
	Šifra int primary key identity (1,1) not null,
	Lipa decimal (14,6),
	Introvertno bit not null,
	Kratka_majica varchar(38) not null,
	Prstena int not null,
	Zaručnik int
	);

create table ZARUČNIK (
	Šifra int primary key identity (1,1) not null,
	Vesta varchar(34),
	Asocijalno bit not null,
	Model_naočala varchar(43),
	Narukvica int not null,
	Novčića decimal(15,6) not null
	);

create table ZARUČNIK_MLADIĆ (
	Šifra int primary key identity (1,1) not null,
	Zaručnik int not null,
	Mladić int not null
	);

create table MLADIĆ (
	Šifra int primary key identity (1,1) not null,
	Prstena int,
	Lipa decimal (14,5) not null,
	Narukvica int not null,
	Drugi_puta datetime
	);

	alter table ZARUČNIK_MLADIĆ add foreign key (MLADIĆ) references mladić (šifra);
	alter table ZARUČNIK_MLADIĆ add foreign key (ZARUČNIK) references zaručnik (šifra);
	alter table OSTAVLJEN add foreign key (ZARUČNIK) references zaručnik (šifra);
	alter table PRIJATELJICA add foreign key (OSTAVLJEN) references ostavljen (šifra);
	alter table SESTRA add foreign key (PRIJATELJICA) references prijateljica (šifra);
	alter table PUNICA add foreign key (CURA) references cura (šifra);
