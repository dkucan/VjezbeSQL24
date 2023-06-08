-- ovo je komentar i neæe se izvesti
use master;
drop database if exists ISVU1;
go
create database ISVU1 collate Croatian_CI_AS;
go
use ISVU1;
create table STUDENT(
	sifra int not null primary key identity(1,1),
	Ime varchar(50) not null,
	Prezime varchar(50) not null,
	JMBAG char(10)
);
create table KOLEGIJ(
	sifra int not null primary key identity(1,1),
	Naziv varchar(50) not null,
	ECTS int not null,
	Opis varchar(50)
);
create table STUDENTKOLEGIJ(
	sifra int not null primary key identity(1,1),
	Student int not null,
	Kolegij int not null,
	Datumupisa datetime not null,
	Akademskagodina int not null,
);
create table AKADEMSKAGODINA(
	sifra int not null primary key identity(1,1),
	Naziv int not null,
	Datumpocetka datetime not null,
	Datumzavrsetka datetime not null
);
alter table STUDENTKOLEGIJ add foreign key (Student) references STUDENT(sifra); 
alter table STUDENTKOLEGIJ add foreign key (Kolegij) references KOLEGIJ (sifra);
alter table STUDENTKOLEGIJ add foreign key (Akademskagodina) references AKADEMSKAGODINA(sifra);

insert into STUDENT (Ime, Prezime, JMBAG) values ('Pero', 'Perić', '1234567891');
insert into STUDENT (Ime, Prezime, JMBAG) values ('Đuro', 'Perić', '1234567892');
insert into STUDENT (Ime, Prezime, JMBAG) values ('Marko', 'Marković', '1234567893');
insert into STUDENT (Ime, Prezime, JMBAG) values ('Ivana', 'Marković', '1234567894');

insert into KOLEGIJ (Naziv, ECTS, Opis) values ('Rimsko_pravo', '6', 'rimsko_pravo');
insert into KOLEGIJ (Naziv, ECTS, Opis) values ('Teorija_prava_i_drzave', '5', 'tpd');
insert into KOLEGIJ (Naziv, ECTS, Opis) values ('Sociologija', '3', 'sociologija');
Insert into KOLEGIJ (Naziv, ECTS, Opis) values ('Engleski_jezik', '4', 'engleski');





