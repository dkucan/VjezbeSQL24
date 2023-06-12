use master;
drop database if exists VJEŽBA_SQL3;
go
create database VJEŽBA_SQL3 collate Croatian_CI_AS;
go
use VJEŽBA_SQL3;

create table CURA(
	Šifra int primary key identity(1,1) not null,
	Dukserica varchar(49),
	Maraka decimal(13,7),
	Drugi_puta datetime,
	Majica varchar(49),
	Novčića decimal(15,8),
	Ogrlica int not null
);

create table OSTAVLJENA (
	Šifra int primary key identity(1,1) not null,
	Kuna decimal(17,5),
	Lipa decimal(15,6),
	Majica varchar(36),
	Model_naočala varchar(31) not null,
	Prijatelj int
	);

	create table PUNICA (
	Šifra int primary key identity(1,1) not null,
	Asocijalno bit,
	Kratka_majica varchar(44),
	Kuna decimal(13,8) not null,
	Vesta varchar(32) not null,
	Snaša int
	);

create table SVEKAR(
	Šifra int primary key identity(1,1) not null,
	Novčića decimal(16,8) not null,
	Suknja varchar(44) not null,
	Boja_kose varchar(36),
	Prstena int,
	Narukvica int not null,
	Cura int not null
);

create table BRAT (
	Šifra int primary key identity(1,1) not null,
	Jmbag char(11),
	Ogrlica int not null,
	Ekstrovertno bit not null
);

create table PRIJATELJ(
	Šifra int primary key identity(1,1) not null,
	Kuna decimal(16,10),
	Haljina varchar(37),
	Lipa decimal(13,10),
	Dukserica varchar(31),
	Indiferentno bit not null
);

create table PRIJATELJ_BRAT(
	Šifra int primary key identity(1,1) not null,
	Prijatelj int not null,
	Brat int not null
);

create table SNAŠA(
	Šifra int primary key identity(1,1) not null,
	Introvertno bit,
	Kuna decimal(15,6) not null,
	Eura decimal(12,9) not null,
	Treći_puta datetime,
	Ostavljena int not null
);

alter table SVEKAR add foreign key (CURA) references cura (šifra);
alter table SNAŠA add foreign key (OSTAVLJENA) references ostavljena (šifra);
alter table OSTAVLJENA add foreign key (PRIJATELJ) references prijatelj (šifra);
alter table PUNICA add foreign key (SNAŠA) references snaša (šifra);
alter table PRIJATELJ_BRAT add foreign key (PRIJATELJ) references prijatelj (šifra);
alter table PRIJATELJ_BRAT add foreign key (BRAT) references brat (šifra);
