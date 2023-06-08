use master;
go
drop database if exists Samostan;
create database Samostan collate Croatian_CI_AS;
go
use Samostan;


create table SVECENIK (
    Sifra int primary key identity (1, 1) not null,
    Ime varchar(20) not null,
    Prezime varchar(20) not null,
    Titula varchar(20) null,
	Nadredjeni_svecenik int null
	);

create table POSAO (
    Sifra int primary key identity (1, 1) not null,
    Naziv varchar(30) not null,
    Opis varchar(100) null
);

create table SVECENIKPOSAO (
	svecenik int,
	posao int,   
	Nadredjeni_svecenik int
	);

alter table SVECENIKPOSAO add foreign key (POSAO) references posao (sifra);
alter table SVECENIKPOSAO add foreign key (SVECENIK) references svecenik (sifra);
alter table SVECENIK add foreign key (Nadredjeni_svecenik) references svecenik(sifra);