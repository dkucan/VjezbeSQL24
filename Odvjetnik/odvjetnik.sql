use master;
go
drop database if exists Odvjetnik8;
create database Odvjetnik8 collate Croatian_CI_AS;
go
use Odvjetnik8;

create table KLIJENT (
    ŠIFRA int primary key identity (1, 1) not null,
    Ime varchar(20) not null,
    Prezime varchar(20) not null
	);
create table ODVJETNIK (
    ŠIFRA int primary key identity (1, 1) not null,
    Ime varchar(20) not null,
    Prezime varchar(20) not null
);

create table SURADNIK (
    ŠIFRA int primary key identity (1, 1) not null,
    Ime varchar(20) not null,
    Prezime varchar(20) not null
);

create table OBRANA (
    ŠIFRA int primary key identity (1, 1) not null,
    PREDMET varchar(100) not null,
    Datum datetime null,
    Odluka bit null,
	Odvjetnik int not null,
	klijent int not null
);

create table SURADNIK_OBRANA (
SURADNIK int not null,
OBRANA int not null
);

alter table SURADNIK_OBRANA add foreign key (OBRANA) references obrana (šifra);
alter table OBRANA add foreign key (ODVJETNIK) references odvjetnik (šifra);
alter table OBRANA add foreign key (KLIJENT) references klijent (šifra);
alter table SURADNIK_OBRANA add foreign key (SURADNIK) references suradnik(šifra);

insert into KLIJENT (Ime, Prezime) 
	values
	  ('Pero', 'Perić'),
	  ('Đuro', 'Đurić'),
	  ('Marko', 'Marković'),
	  ('Ante', 'Antić'),
	  ('Jure', 'Jurić');

insert into ODVJETNIK (Ime, Prezime) 
	values 
		('Igor', 'Ivković'),
		('Ivan', 'Ivković'),
		('Mario', 'Marić'),
		('Filip', 'Jurić'),
		('Zdravko', 'Perić');

update ODVJETNIK set prezime='Stanković' where šifra=4;
delete ODVJETNIK where šifra= 5;
