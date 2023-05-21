use master;
drop database if exists Nakladnik;
go
create database Nakladnik collate Croatian_CI_AS;
go
use Nakladnik;


create table MJESTO (
    Sifra int primary key identity (1, 1) not null,
    Naziv varchar(50) not null

);

create table NAKLADNIK (
    Sifra int primary key identity (1, 1) not null,
    Naziv varchar(50) not null,  
	Mjesto int
);

create table DJELO (
    Sifra int primary key identity (1, 1) not null,
    Naziv varchar(50) not null,
    Vrstadjela varchar(50) not null
);

create table NAKLADNIKDJELO (
    Nakladnik int,
	Djelo int, 
	Mjesto int
	);
	
	alter table NAKLADNIK add foreign key (MJESTO) references mjesto (sifra);
	alter table NAKLADNIKDJELO add foreign key (NAKLADNIK) references nakladnik (sifra);
	alter table NAKLADNIKDJELO add foreign key (DJELO) references djelo (sifra);

