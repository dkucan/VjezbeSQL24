-- ovo je komentar i neæe se izvesti
use master;
drop database if exists CEZIH;
drop database if exists CEZIH1;
drop database if exists CEZIH2;
drop database if exists CEZIH3;
drop database if exists CEZIH4;
drop database if exists CEZIH5;
drop database if exists CEZIH6;
go
create database CEZIH collate Croatian_CI_AS;
go
use CEZIH;
create table PACIJENT(
	Šifra int not null primary key identity(1,1),
	Ime varchar(50) not null,
	Prezime varchar(50) not null,
	MBO char(10),
	Dijagnoza varchar(50) not null,
	Liječnik varchar(50) not null
);
create table LIJEČNIK(
	Šifra int not null primary key identity(1,1),
	Ime varchar(50) not null,
	Prezime varchar(50) not null,
	Šifra_liječnika char(7)
	);
create table LIJEK(
	Šifra int not null primary key identity(1,1),
	Naziv varchar(50) not null,
	Cijena int not null,
	Šifra_liječnika int
);
create table RECEPT(
	Šifra int not null primary key identity (1,1),
	Liječnik int not null,
	Pacijent int not null,
	Lijek int not null,
	Datum_izdavanja datetime
);
alter table RECEPT add foreign key (LIJEČNIK) references liječnik(šifra);
alter table RECEPT add foreign key (PACIJENT) references pacijent(šifra);
alter table RECEPT add foreign key (LIJEK) references lijek(šifra);


insert into PACIJENT (Ime, Prezime, MBO, Dijagnoza, Liječnik) 
	values 
	('Pero', 'Perić', 1234567890, 'prehlada', 1),
	('Ana', 'Jelić', 2345678901, 'korona', 2),
	('Iva', 'Ivić', 3456789012, 'konjunktivitis', 3),
	('Jure', 'Jurić', 456789013, 'gastritis', 4),
	('Ante', 'Antić', 567890123, 'hipertenzija', 5);


insert into LIJEČNIK (Ime, Prezime, Šifra_Liječnika)
	values
	('Ivana', 'Ivanić', 5678901),
	('Kristina', 'Đurić', 6780203),
	('Petar', 'Petrović', 8702203),
	('Davor', 'Marković', 9034506),
	('Jelena', 'Jelenić', 2034782);

	

insert into LIJEK (Naziv, Cijena, Šifra_liječnika) 
	values
		('Zipantol', '20', 4),
		('Sumamed', '15', 1),
		('Concor', '25', 5),
		('Kapi_za_oči', '10', 3),
		('Pfizer', '25', 2);

		update LIJEK set naziv='Controloc' where šifra=4;
		update PACIJENT set dijagnoza='upala_uha' where šifra=2;
		update LIJEK set naziv='kapi_za_uši' where šifra=5;
		update LIJEK set naziv='Sumamed' where šifra=2;
		delete PACIJENT where šifra=5;

		select * from LIJEČNIK;
	    select * from PACIJENT;
		select * from LIJEK;

	


