use master;
drop database if exists FACEBOOK;
go
create database FACEBOOK collate Croatian_CI_AS;
go
use FACEBOOK;

create table OSOBA (
	Sifra int primary key identity (1,1) not null,
	Ime varchar(25) not null,
	Prezime varchar(25) not null,
	Datum_rodjenja datetime null,
	email varchar(50) not null,
	lozinka varchar(60) not null,
	Kontakt_telefon int null,
	Slika varchar(100) null,
	Administrator bit not null,
	Stanje bit not null,
	Aktivan bit not null,
	Oznaka varchar(25) null 
	);

create table OBJAVA (
	Sifra int primary key identity (1,1) not null,
	Naslov varchar(50) not null,
	Upis varchar(250) not null,
	Vrijeme_izrade datetime not null,
	IP_adresa varchar(20) null,
	Osoba int
	);

create table SVIDJAMISE (
	Sifra int primary key identity (1,1) not null,
	Vrijeme_svidjanja datetime not null,
	Objava int null,
	Osoba int null
	);

create table KOMENTAR (
	Sifra int primary key identity (1,1) not null,
	Vrijeme_komentiranja datetime not null,
	Opis varchar(250) null, 
	Objava int null,
	Osoba int null
	);

create table SVIDJAMISE_KOMENTAR (
	Sifra int primary key identity (1,1) not null,
	Osoba int null,
	Komentar int null
	);

	alter table OBJAVA add foreign key (OSOBA) references osoba (sifra);
	alter table SVIDJAMISE add foreign key (OBJAVA) references objava (sifra);
	alter table SVIDJAMISE_KOMENTAR add foreign key (KOMENTAR) references komentar (sifra);
	alter table KOMENTAR add foreign key (OBJAVA) references objava (sifra);
	alter table SVIDJAMISE_KOMENTAR add foreign key (OSOBA) references osoba (sifra);
	alter table KOMENTAR add foreign key (OSOBA) references osoba (sifra);
	alter table SVIDJAMISE add foreign key (OSOBA) references osoba (sifra);

