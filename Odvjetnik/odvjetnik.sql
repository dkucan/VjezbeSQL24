use master;
go
drop database if exists Odvjetnik8;
create database Odvjetnik8;
go
use Odvjetnik8;

create table KLIJENT (
    SIFRA int primary key identity (1, 1) not null,
    Ime varchar(20) not null,
    Prezime varchar(20) not null
	);
create table ODVJETNIK (
    SIFRA int primary key identity (1, 1) not null,
    Ime varchar(20) not null,
    Prezime varchar(20) not null
);

create table SURADNIK (
    SIFRA int primary key identity (1, 1) not null,
    Ime varchar(20) not null,
    Prezime varchar(20) not null
);

create table OBRANA (
    SIFRA int primary key identity (1, 1) not null,
    PREDMET varchar(100) not null,
    Datum datetime null,
    Odluka bit null,
	Odvjetnik int not null,
	klijent int not null
);

create table SURADNIK_OBRANA (
SURADNIK int not null,
OBRANA int not null
);

alter table SURADNIK_OBRANA add foreign key (OBRANA) references obrana (sifra);
alter table OBRANA add foreign key (ODVJETNIK) references odvjetnik (sifra);
alter table OBRANA add foreign key (KLIJENT) references klijent (sifra);
alter table SURADNIK_OBRANA add foreign key (SURADNIK) references suradnik(sifra);
