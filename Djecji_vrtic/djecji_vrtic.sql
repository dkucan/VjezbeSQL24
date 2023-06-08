use master;
drop database if exists DjecjiVrtic;
go
create database DjecjiVrtic collate Croatian_CI_AS;
go
use DjecjiVrtic;

create table STRUCNASPREMA (
    Sifra int primary key not null,
    Naziv varchar(50) not null,
	Odgajatelj int,
	Dijete int,
	ODGOJNA_SKUPINA int
);

create table ODGAJATELJ (
    Sifra int primary key not null,
    Ime varchar(50) not null,
    Prezime varchar(50) not null,
    OIB char(11) not null,
	Strucnasprema int
);

create table ODGOJNASKUPINA (
    Sifra int primary key not null,
    Naziv varchar(50) not null,
    Dob int not null,
	Odgajatelj int,
	Dijete int
);

create table DIJETE(
    Sifra int primary key not null,
    Ime varchar(50) not null,
    Prezime varchar(50) not null,
    Dob int not null,
    OIB char(11) not null,
	);
alter table STRUCNASPREMA add foreign key (ODGAJATELJ) references odgajatelj (sifra);
alter table ODGOJNASKUPINA add foreign key (ODGAJATELJ) references odgajatelj (sifra);
alter table ODGOJNASKUPINA add foreign key (DIJETE) references dijete (sifra);