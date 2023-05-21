use master;
drop database if exists Knjiznica;
go
create database Knjiznica;
go
use Knjiznica;


create table CLAN (
    Sifra int primary key identity (1,1) not null,
    Ime varchar(50) not null,
    Prezime varchar(50) not null,
    OIB char(11) null,
	Adresa varchar (50) not null,
    Kontakt varchar(20) not null
);

create table KNJIGA (
    Sifra int primary key identity (1,1) not null,
    Naziv varchar(100),
    Zanr varchar(100),
	Posudba int
	);

create table POSUDBA (
    Sifra int primary key identity (1,1) not null,
	Knjiga int,
    Clan int,
    Razdoblje_od datetime not null,
    Razdoblje_do datetime
);

alter table KNJIGA add foreign key (POSUDBA) references posudba (sifra);
ALTER TABLE POSUDBA add foreign key (CLAN) references clan (sifra);
