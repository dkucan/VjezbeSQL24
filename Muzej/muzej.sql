use master;
drop database if exists Muzej;
go
create database Muzej;
go
use Muzej;


create table SPONZOR (
    Sifra int primary key not null,
    Naziv varchar(100) not null,
    OIB char(11) null
);

create table IZLOZBA (
    Sifra int primary key not null,
    Naziv varchar(100) not null,
    Datum_od datetime,
    Datum_do datetime,
	kustos int,
	sponzor int,
	djelo int
);


create table KUSTOS (
    Sifra int primary key not null,
    Ime varchar(50) not null,
    Prezime varchar(50) not null,
    OIB char(11) null
);

create table DJELO (
    Sifra int primary key not null,
    Naziv varchar(100) not null,
    Procjenjena_vrijednost decimal (18,2)
);
alter table IZLOZBA add foreign key (KUSTOS) references kustos (sifra);
alter table IZLOZBA add foreign key (SPONZOR) references sponzor (sifra);
alter table IZLOZBA add foreign key (DJELO) references djelo (sifra);