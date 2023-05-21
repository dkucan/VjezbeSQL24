use master;
drop database if exists TrgovackiCentar;
go
create database TrgovackiCentar collate Croatian_CI_AS;
go
use TrgovackiCentar;


create table TRGOVINA (
    Sifra int primary key identity (1, 1) not null,
    Naziv varchar(50) not null,
    Radno_vrijeme varchar(20)
);

create table OSOBA (
    Sifra int primary key identity (1, 1) not null,
    Ime varchar(20) not null,
    Prezime varchar(20) not null,
    OIB char(11) null,
    Kontakt varchar(30) not null
);

create table SEF (
    Sifra int primary key identity (1, 1) not null,
    Osoba int,
    Trgovina int 
);

create table TRGOVINA_OSOBA (
	sef int,
	trgovina int,
	osoba int
);

alter table SEF add foreign key (TRGOVINA) references trgovina (sifra);
alter table TRGOVINA_OSOBA add foreign key (OSOBA) references osoba (sifra);
alter table TRGOVINA_OSOBA add foreign key (trgovina) references trgovina (sifra);
alter table SEF add foreign key (OSOBA) references osoba (sifra);