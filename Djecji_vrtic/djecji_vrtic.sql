use master;
drop database if exists Dječji_vrtić;
go
create database Dječji_vrtić collate Croatian_CI_AS;
go
use Dječji_vrtić;

create table STRUČNA_SPREMA (
    Šifra int primary key identity (1,1) not null,
    Naziv varchar(50) not null,
	Opis varchar(3) not null,
	Odgajatelj int,
	Dijete int,
	Odgojna_skupina int
);

create table ODGAJATELJ (
    Šifra int primary key identity (1,1) not null,
    Ime varchar(50) not null,
    Prezime varchar(50) not null,
    OIB char(11) not null,
	Stručna_sprema int
);

create table ODGOJNA_SKUPINA (
    Šifra int primary key identity (1,1) not null,
    Naziv varchar(50) not null,
    Dob int not null,
	Odgajatelj int not null,
	Dijete int not null
);

create table DIJETE(
    Šifra int primary key identity (1,1) not null,
    Ime varchar(50) not null,
    Prezime varchar(50) not null,
    Dob int not null,
    OIB char(11) not null,
	Odgojna_skupina int

	);
alter table STRUČNA_SPREMA add foreign key (ODGAJATELJ) references odgajatelj (šifra);
alter table ODGOJNA_SKUPINA add foreign key (ODGAJATELJ) references odgajatelj (šifra);
alter table DIJETE add foreign key (ODGOJNA_SKUPINA) references odgojna_skupina (šifra);

insert into ODGAJATELJ (Ime, Prezime, OIB, Stručna_sprema) 
	values 
		('Emilija', 'Milić', 12345678910, 1),
		('Ana', 'Jelić', 23456789101,2),
		('Kristina', 'Antolić', 34567891021, 3),
		('Jelena', 'Martinović', 4567891122, 4),
		('Tia', 'Šarić', 567891213, 5);

insert into STRUČNA_SPREMA (Naziv, Opis, Odgajatelj, Dijete, Odgojna_skupina)
	values
		('predškolski', 'VSS', 1, 2, 1),
		('predškolski', 'VSS', 2, 1, 2),
		('predškolski', 'VSS', 3, 3, 3),
		('predškolski', 'VSS', 4, 2, 4),
		('predškolski', 'VSS', 5, 3, 3);

insert into ODGOJNA_SKUPINA (Naziv, Dob, Odgajatelj, Dijete)
	values 
		('Zelena', 5, 5, 1),
		('Plava', 4, 4, 2),
		('Crvena', 6, 3, 3),
		('Ljubičasta', 3, 2, 4),
		('Žuta', 3, 1, 5);

		select * from ODGOJNA_SKUPINA;

insert into DIJETE (Ime, Prezime, Dob, OIB, Odgojna_skupina)
	values 
		('Maša', 'Jagatić', 5, 12345678910, 1),
		('Petra', 'Petrić', 4, 23456789110, 2),
		('Iva', 'Ivić', 6, 34567891211, 3),
		('Marta', 'Jelić', 3, 4567891312, 4),
		('Karlo', 'Jelić', 3, 567891413, 5);

		select * from DIJETE;

		-- izbriši šifre 1,2,3
		
