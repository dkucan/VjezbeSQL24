-- ovo je komentar i neæe se izvesti
use master;
drop database if exists ISVU1;
go
create database ISVU1 collate Croatian_CI_AS;
go
use ISVU1;
create table STUDENT(
	Šifra int not null primary key identity(1,1),
	Ime varchar(50) not null,
	Prezime varchar(50) not null,
	JMBAG char(10)
);
create table KOLEGIJ(
	Šifra int not null primary key identity(1,1),
	Naziv varchar(50) not null,
	ECTS int not null,
	Opis varchar(50)
);
create table STUDENTKOLEGIJ(
	Šifra int not null primary key identity(1,1),
	Student int not null,
	Kolegij int not null,
	Datum_upisa datetime not null,
	Akademskagodina int not null,
);
create table AKADEMSKAGODINA(
	Šifra int not null primary key identity(1,1),
	Naziv int not null,
	Datum_početka datetime not null,
	Datum_završetka datetime not null
);
alter table STUDENTKOLEGIJ add foreign key (Student) references STUDENT(šifra); 
alter table STUDENTKOLEGIJ add foreign key (Kolegij) references KOLEGIJ (šifra);
alter table STUDENTKOLEGIJ add foreign key (Akademskagodina) references AKADEMSKAGODINA(šifra);

insert into STUDENT (Ime, Prezime, JMBAG) 
	values 
		('Pero', 'Perić', '1234567891'),
		('Đuro', 'Perić', '1234567892'),
		('Marko', 'Marković', '1234567893'),
		('Ivana', 'Marković', '1234567894');

insert into KOLEGIJ (Naziv, ECTS, Opis) 
	values 
		('Rimsko_pravo', 6, 'rimsko_pravo'),
		('Teorija_prava_i_drzave', 5, 'tpd'),
		('Sociologija', 3, 'sociologija'),
		('Engleski_jezik', 4, 'engleski');

		update STUDENT set ime='Ana' where šifra=2;
		update KOLEGIJ set naziv='Njemački_jezik' where šifra=4;
		delete STUDENT where šifra=2;

		select * from STUDENT;
		SELECT * from KOLEGIJ;





