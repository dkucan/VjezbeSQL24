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
create database CEZIH;
go
use CEZIH;
create table PACIJENT(
	sifra int not null primary key identity(1,1),
	Ime varchar(50) not null,
	Prezime varchar(50) not null,
	MBO char(10),
	Dijagnoza varchar(50) not null,
	Lijecnik varchar(50) not null
);
create table LIJECNIK(
	sifra int not null primary key identity(1,1),
	Ime varchar(50) not null,
	Prezime varchar(50) not null,
	sifralijecnika char(10)
	);
create table LIJEK(
	sifra int not null primary key identity(1,1),
	naziv varchar(50) not null,
	cijena int not null
);
create table RECEPT(
	sifra int not null primary key identity (1,1),
	lijecnik int not null,
	Pacijent int not null,
	lijek int not null,
	datumizdavanja datetime
);
alter table RECEPT add foreign key (LIJECNIK) references lijecnik(sifra);
alter table RECEPT add foreign key (PACIJENT) references pacijent(sifra);
alter table RECEPT add foreign key (LIJEK) references lijek(sifra);




