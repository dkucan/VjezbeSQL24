use master;
drop database if exists KUD;
go
create database KUD collate Croatian_CI_AS;
go
use KUD;

create table ČLAN (
    ŠIFRA int primary key identity (1, 1) not null,
    IME varchar(20) not null,
    PREZIME varchar(20) not null
);

create table MJESTO (
    ŠIFRA int primary key identity (1, 1) not null,
    NAZIV varchar(50) not null, 
	DATUM datetime not null
	);

create table NASTUP (
    ŠIFRA int primary key identity (1, 1) not null,
	OPIS varchar(50),
	MJESTO int
	);


create table ČLAN_NASTUP (
    Član int not null,
    Nastup int not null
);

alter table ČLAN_NASTUP add foreign key (ČLAN) references član (šifra);
alter table ČLAN_NASTUP add foreign key (NASTUP) references nastup (šifra);
alter table NASTUP add foreign key (MJESTO) references mjesto(šifra);

insert into ČLAN (ime, prezime)
	values
		('Jozo', 'Petrić'),
		('Marko', 'Marković'),
		('Ante', 'Matić'),
		('Evica', 'Petrić'),
		('Ivana', 'Anić');

insert into MJESTO (Naziv, Datum)
	values
		('Osijek', '2023-06-13'),
		('Beč', '2023-12-02'),
		('Budimpešta', '2023-12-26');

insert into NASTUP (Opis, Mjesto)
	values
		('Sveti Ante', 3),
		('Dan Grada Osijeka', 1),
		('Božićni koncert', 2);



		select * from ČLAN;
		select * from MJESTO;
		select * from NASTUP;




