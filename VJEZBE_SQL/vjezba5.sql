use master;
drop database if exists VJEŽBE_sql_5;
go
create database VJEŽBE_sql_5 collate Croatian_CI_AS;
go
use VJEŽBE_sql_5;

create table MLADI? (
	Šifra inT primary key identity (1,1) not null,
	Kratka_majica varchar(48) not null,
	Haljina varchar(30) not null,
	Asocijalno bit,
	Zaru?nik int
	);

create table ZARU?NIK (
	Šifra int primary key identity (1,1) not null,
	JMBAG char(11),
	Lipa decimal (12,8),
	Indiferentno bit not null
	);

create table PUNAC (
	Šifra int primary key identity (1,1) not null,
	Dukserica varchar(33),
	Prviputa datetime not null,
	Majica	varchar(36),
	Svekar int not null
	);

create table SVEKAR (
	Šifra int primary key identity (1,1) not null,
	Boja_kose varchar(33),
	Majica varchar(31),
	?arape varchar(31) not null,
	Haljina varchar(43),
	Narukvica int,
	Eura decimal(14,5) not null
	);

create table SVEKAR_CURA (
	Šifra int primary key identity not null,
	Svekar int not null,
	Cura int not null
	);

create table CURA (
	Šifra int primary key identity not null,
	?arape varchar(41) not null,
	Maraka decimal(17,10) not null,
	Asocijalno bit,
	Vesta varchar(47) not null
	);

create table PUNICA (
	Šifra int primary key identity not null,
	Hla?e varchar(43) not null,
	Naušnica int not null,
	Ogrlica int,
	Vesta varchar(49) not null, 
	Model_nao?ala varchar(31) not null,
	Tre?i_puta datetime not null,
	Punac int not null
	);

create table OSTAVLJENA (
	Šifra int primary key identity not null,
	Majica varchar(33),
	Ogrlica int not null,
	?arape varchar(44),
	Stil_frizura varchar(42),
	Punica int
	);

	alter table MLADI? add foreign key (ZARU?NIK) references zaru?nik (šifra);
	alter table PUNAC add foreign key (SVEKAR) references svekar (šifra);
	alter table SVEKAR_CURA add foreign key (SVEKAR) references svekar (šifra);
	alter table SVEKAR_CURA add foreign key (CURA) references cura (šifra);
	alter table PUNICA add foreign key (PUNAC) references punac (šifra);
	alter table OSTAVLJENA add foreign key (PUNICA) references punica (šifra);


