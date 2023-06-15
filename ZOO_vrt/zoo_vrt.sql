-- ovo je komentar i neæe se izvesti
use master;
drop database if exists ZOO;
go
create database ZOO collate Croatian_CI_AS;
go
use ZOO;

create table ŽIVOTINJA (
	Šifra int primary key identity (1,1) not null,
	Vrsta varchar(50) not null,
	Ime varchar(50) not null,
	Djelatnik int not null,
	Prostorija int not null,
	Datum int not null
);

Create table Djelatnik (
	Šifra Int primary key identity (1,1) not null,
	Ime varchar (50) not null,
	Prezime varchar (50) not null,
	IBAN varchar(50)
	);

create table PROSTORIJA (
	Šifra int primary key identity (1,1) not null,
	Dimenzije varchar (30),
	Maks_broj int,
	Mjesto varchar (30)
	);

create table DATUM (
	Šifra int primary key identity (1,1) not null,
	Datum_rođenja datetime,
	Datum_dolaska datetime,
	Datum_smrti datetime
	);

	alter table ŽIVOTINJA add foreign key (DJELATNIK) references djelatnik (šifra);
	alter table ŽIVOTINJA add foreign key (PROSTORIJA) references prostorija (šifra);
	alter table ŽIVOTINJA add foreign key (DATUM) references datum (šifra);

	insert into DJELATNIK (Ime, Prezime, IBAN) values 
		('Igor', 'Petrovic', '3219567808'),
		('Pero', 'Peric', '3218567808'),
		('Marko', 'Markovic', '3218566808'),
		('Jelena', 'Jankovic', '3219566808');

	insert into PROSTORIJA (Dimenzije, Maks_broj, Mjesto) values
		('10', 3, 'box10'),
		('15', 2, 'box11'),
		('20', 2, 'box12'),
		('25', 3, 'box13');

	insert into  DATUM (Datum_rođenja,Datum_dolaska, Datum_smrti) 
	values 
	(2006-05-23, 2006-12-05, 2022-01-31),
	(2007-09-03, 2008-03-05, 2023-03-05),
	(2010-12-15, 2011-03-01, 2022-01-31),
	(2022-01-01, 2022-02-03, 2022-01-31);

  insert into ŽIVOTINJA (Vrsta,Ime,Djelatnik,Prostorija,Datum)values
 ('Žirafa', 'Maks',1,1,1),
 ('Krokodil','Stevo', 2,2,2),
 ('Vuk','Mirko',3,3,3),
 ('Deva','Jagoda',4,4,4);

 select * from DJELATNIK;
 select * from ŽIVOTINJA;
 select * from DATUM;
​