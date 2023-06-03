use master;
drop database if exists POSTOLAR;
go
create database POSTOLAR collate Croatian_CI_AS;
GO
use POSTOLAR;

create table ZAPOSLENIK (
SIFRA int primary key identity (1,1) not null,
IME varchar (50) not null,
PREZIME varchar (50) not null,
OIB char(11) not null,
KONTAKT varchar(30) not null,
STRUCNA_SPREMA int
);

create table  STRUCNA_SPREMA (
SIFRA int primary key identity (1,1) not null,
NAZIV varchar (50) not null,
ZAPOSLENIK int
);

create table KORISNIK (
SIFRA int primary key identity (1,1) not null,
IME varchar (50) not null,
PREZIME varchar(50) not null,
KONTAKT varchar(30) not null
);

create table OBUCA (
SIFRA int primary key identity (1,1) not null,
VRSTA varchar(50) not null,
KORISNIK int not null,
BROJ_POPRAVAKA int not null
);

create table POPRAVAK (
SIFRA int primary key identity (1,1) not null,
ZAPOSLENIK int not null,
DATUM datetime not null
);

create table OBUCA_POPRAVAK (
	OBUCA int not null,
	POPRAVAK int not null
	);

	alter table OBUCA_POPRAVAK add foreign key (POPRAVAK) references popravak (sifra);
	alter table OBUCA_POPRAVAK add foreign key (OBUCA) references obuca (sifra);
	alter table OBUCA add foreign key (KORISNIK) references korisnik (sifra);
	alter table POPRAVAK add foreign key (ZAPOSLENIK) references zaposlenik (sifra);
	alter table ZAPOSLENIK add foreign key (STRUCNA_SPREMA) references strucna_sprema (sifra);