-- ovo je komentar i neæe se izvesti
use master;
drop database if exists ZOO;
go
create database ZOO;
go
use ZOO;

create table ZIVOTINJA (
	Sifra int primary key identity (1,1) not null,
	Vrsta varchar(50) not null,
	Ime varchar(50) not null,
	Djelatnik int not null,
	Prostorija int not null,
	Datum int not null
);

Create table Djelatnik (
	Sifra Int primary key identity (1,1) not null,
	Ime varchar (50) not null,
	Prezime varchar (50) not null,
	IBAN varchar(50)
	);

create table PROSTORIJA (
	Sifra int primary key identity (1,1) not null,
	Dimenzije varchar (30),
	Maks_broj int,
	Mjesto varchar (30)
	);

create table DATUM (
	Sifra int primary key identity (1,1) not null,
	Datum_rodjenja datetime,
	Datum_dolaska datetime,
	Datum_smrti datetime
	);

	alter table ZIVOTINJA add foreign key (DJELATNIK) references djelatnik (sifra);
	alter table ZIVOTINJA add foreign key (PROSTORIJA) references prostorija (sifra);
	alter table ZIVOTINJA add foreign key (DATUM) references datum (sifra);

	insert into DJELATNIK (Ime, Prezime, IBAN) values 
		('Igor', 'Petrovic', '3219567808'),
		('Pero', 'Peric', '3218567808'),
		('Marko', 'Markovic', '3218566808'),
		('Jelena', 'Jankovic', '3219566808');

	insert into PROSTORIJA (Dimenzije, Maks_broj, Mjesto) values
		('10', '3', 'box10'),
		('15', '2', 'box11'),
		('20', '2', 'box12'),
		('25', '3', 'box13');

	insert into  DATUM (Datum_rodjenja,Datum_dolaska, Datum_smrti) values 
 ('2006-05-23 10:53:07','2006-12-05 09:05:06','2022-01-31 19:32:50'),
 ('2007-09-03 15:16:28','2008-03-05 08:30:15','2023-03-05 21:59:53'),
 ('2010-12-15 05:03:01','2011-03-01', '2022-01-31 19:32:50'),
 ('2022-01-01 02:03:56','2022-02-03', '2022-01-31 19:32:50');

  insert into ZIVOTINJA (Vrsta,Ime,Djelatnik,Prostorija,Datum)values
 ('Žirafa', 'Maks','1','1','1'),
 ('Krokodil','Stevo','2','2','2'),
 ('Vuk','Mirko','3','3','3'),
 ('Deva','Jagoda','4','4','4');
​