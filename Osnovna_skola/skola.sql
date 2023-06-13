use master;
drop database if exists Osnovna_škola;
go
create database Osnovna_škola collate Croatian_CI_AS;
go
use Osnovna_škola;


create table UČITELJICA (
    Šifra int primary key identity (1, 1) not null,
    Ime varchar(20) not null,
    Prezime varchar(20) not null,
	Radionica int
);

create table DIJETE (
    Šifra int primary key identity (1, 1) not null,
    Ime varchar(20) not null,
    Prezime varchar(20) not null,
	Radionica int
);

create table RADIONICA (
    Šifra int primary key identity (1, 1) not null,
    Naziv varchar(20) not null,
    Učiteljica int not null
);

create table DIJETE_RADIONICA (
    Dijete int not null,
	Radionica int not null
);

alter table RADIONICA add foreign key (UČITELJICA) references učiteljica (šifra);
alter table DIJETE_RADIONICA add foreign key (RADIONICA) references radionica (šifra); 
alter table DIJETE_RADIONICA add foreign key (DIJETE) references dijete (šifra);
