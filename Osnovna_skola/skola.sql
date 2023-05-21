use master;
drop database if exists Osnovna_Skola;
go
create database Osnovna_Skola collate Croatian_CI_AS;
go
use Osnovna_Skola;


create table UCITELJICA (
    Sifra int primary key identity (1, 1) not null,
    Ime varchar(20) not null,
    Prezime varchar(20) not null
);

create table DIJETE (
    Dijete int primary key identity (1, 1) not null,
    Ime varchar(20) not null,
    Prezime varchar(20) not null,
	Radionica int
);

create table RADIONICA (
    Sifra int primary key identity (1, 1) not null,
    Naziv varchar(20) not null,
	Dijete int,
	Uciteljica int
);

create table DIJETE_RADIONICA (
    Dijete  int not null,
    Radionica int not null,
	Uciteljica int not null
	);

	alter table DIJETE_RADIONICA add foreign key (RADIONICA) references radionica (sifra);
	alter table RADIONICA add foreign key (UCITELJICA) references uciteljica (sifra);
	alter table DIJETE add foreign key (RADIONICA) references dijete (dijete);

