use master;
drop database if exists DoktorskaOrdinacija;
go
create database DoktorskaOrdinacija collate Croatian_CI_AS;
go
use DoktorskaOrdinacija;


create table DOKTOR (
    Sifra int primary key identity (1, 1) not null,
    Ime varchar(20) not null,
    Prezime varchar(20) not null
);

create table PACIJENT (
    Sifra int primary key identity (1, 1) not null,
    Ime varchar(20) not null,
    Prezime varchar(20) not null
);

create table MEDICINSKA_SESTRA (
    Sifra int primary key identity (1, 1) not null,
    Ime varchar(20) not null,
    Prezime varchar(20) not null
);

create table LIJECENJE (
    Sifra int primary key identity (1, 1) not null,
    Doktor int,
    Pacijent int,
    Medicinska_sestra int
	);

	alter table LIJECENJE add foreign key (DOKTOR) references doktor (sifra);
	alter table LIJECENJE add foreign key (PACIJENT) references pacijent (sifra);
	alter table LIJECENJE add foreign key (MEDICINSKA_SESTRA) references medicinska_sestra (sifra);