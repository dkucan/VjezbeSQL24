use master;
drop database if exists DoktorskaOrdinacija;
go
create database DoktorskaOrdinacija collate Croatian_CI_AS;
go
use DoktorskaOrdinacija;


create table DOKTOR (
    Sifra int primary key identity (1, 1) not null,
    Ime varchar(20) not null,
    Prezime varchar(20) not null
);

create table PACIJENT (
    Sifra int primary key identity (1, 1) not null,
    Ime varchar(20) not null,
    Prezime varchar(20) not null,
	Doktor int
);

create table MEDICINSKA_SESTRA (
    Sifra int primary key identity (1, 1) not null,
    Ime varchar(20) not null,
    Prezime varchar(20) not null,
	doktor int
);

create table LIJECENJE (
    Sifra int primary key identity (1, 1) not null,
	Vrsta varchar(50) not null, 
    Doktor int,
    Pacijent int,
    Medicinska_sestra int
	);

	alter table PACIJENT add foreign key (DOKTOR) references doktor (sifra);
	alter table LIJECENJE add foreign key (PACIJENT) references pacijent (sifra);
	alter table MEDICINSKA_SESTRA add foreign key (DOKTOR) references doktor (sifra);


	insert into DOKTOR (ime, prezime)
	values
		('Ivana', 'Ivic'),
		('Ana', 'Peric'),
		('Marko', 'Markovic');

		SELECT * FROM DOKTOR;

	insert into PACIJENT (Ime, Prezime, Doktor)
	values

		('Jure', 'Jurić', 1),
		('Ante', 'Anić', 2),
		('Tina', 'Marković', 3);

	select * from PACIJENT;

	insert into MEDICINSKA_SESTRA (Ime, Prezime, Doktor)
	values
		('Ana', 'Masic', 1),
		('Kristina', 'Curkovic', 2),
		('Marina', 'Damjanovic', 3);

		select * from MEDICINSKA_SESTRA;

	insert into LIJECENJE (vrsta, doktor, pacijent, Medicinska_sestra)
	values 
		('transplantacija_srca', 2, 1, 3),
		('promjena_kuka', 1, 2, 1),
		('operacija_zuci', 3, 3, 2);

		select * from LIJECENJE;

		update LIJECENJE set vrsta='ugradnja_bypassa'
		where sifra=1;

		select * from LIJECENJE;

		delete from LIJECENJE where sifra=2;

