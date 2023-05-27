use master;
drop database if exists Srednja_skola;
go
create database Srednja_skola collate Croatian_CI_AS;
go
use Srednja_skola;


create table UCENIK (
    Sifra int primary key identity (1, 1) not null,
    Ime varchar(20) not null,
    Prezime varchar(20) not null,
    OIB char(11) null,
	Razred int
	);
 create table PROFESOR (
    Sifra int primary key identity (1, 1) not null,
    Ime varchar(20) not null,
    Prezime varchar(20) not null,
    OIB char(11) null
	);

create table RAZRED (
	Sifra int primary key identity (1,1) not null,
    Oznaka varchar(5) not null
);

create table RAZRED_PROFESOR (
    Razred int,
	Profesor int 
);
alter table UCENIK add foreign key (RAZRED) references razred (sifra);
alter table RAZRED_PROFESOR add foreign key (RAZRED) references razred (sifra);
alter table RAZRED_PROFESOR add foreign key (PROFESOR) references profesor (sifra);