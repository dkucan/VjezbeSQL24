use master;
drop database if exists DoktorskaOrdinacija;
go
create database DoktorskaOrdinacija collate Croatian_CI_AS;
go
use DoktorskaOrdinacija;


create table DOKTOR (
    Šifra int primary key identity (1, 1) not null,
    Ime varchar(20) not null,
    Prezime varchar(20) not null
);

create table PACIJENT (
    Šifra int primary key identity (1, 1) not null,
    Ime varchar(20) not null,
    Prezime varchar(20) not null,
	Doktor int
);

create table MEDICINSKA_SESTRA (
    Šifra int primary key identity (1, 1) not null,
    Ime varchar(20) not null,
    Prezime varchar(20) not null,
	Doktor int
);

create table LIJEČENJE (
    Šifra int primary key identity (1, 1) not null,
	Vrsta varchar(50) not null, 
    Doktor int,
    Pacijent int,
    Medicinska_sestra int
	);

	alter table PACIJENT add foreign key (DOKTOR) references doktor (šifra);
	alter table LIJEČENJE add foreign key (PACIJENT) references pacijent (šifra);
	alter table MEDICINSKA_SESTRA add foreign key (DOKTOR) references doktor (šifra);


	insert into DOKTOR (ime, prezime)
	values
		('Ivana', 'Ivić'),
		('Ana', 'Perić'),
		('Marko', 'Marković');

		SELECT * FROM DOKTOR;

	insert into PACIJENT (Ime, Prezime, Doktor)
	values

		('Jure', 'Jurić', 1),
		('Ante', 'Anić', 2),
		('Tina', 'Marković', 3);

	select * from PACIJENT;

	insert into MEDICINSKA_SESTRA (Ime, Prezime, Doktor)
	values
		('Ana', 'Masić', 1),
		('Kristina', 'Ćurković', 2),
		('Marina', 'Damjanović', 3);

		select * from MEDICINSKA_SESTRA;

	insert into LIJEČENJE (vrsta, doktor, pacijent, Medicinska_sestra)
	values 
		('transplantacija_srca', 2, 1, 3),
		('promjena_kuka', 1, 2, 1),
		('operacija_zuci', 3, 3, 2);

		select * from LIJEČENJE;

		update LIJEČENJE set vrsta='ugradnja_bypassa'
		where šifra=1;

		select * from LIJEČENJE;

		delete from LIJEČENJE where šifra=2;

