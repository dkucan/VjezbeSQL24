use master;
drop database if exists Knjižnica;
go
create database Knjižnica collate Croatian_CI_AS;
go
use Knjižnica;


create table ČLAN (
    Šifra int primary key identity (1,1) not null,
    Ime varchar(50) not null,
    Prezime varchar(50) not null,
    OIB char(11) null,
	Adresa varchar (50) not null,
    Kontakt varchar(20) not null,
	Knjiga int
);

create table KNJIGA (
    Šifra int primary key identity (1,1) not null,
    Naziv varchar(100),
	Autor varchar(100),
    Žanr varchar(100),
	Posudba int
	);

create table POSUDBA (
    Šifra int primary key identity (1,1) not null,
    Clan int,
    Razdoblje_od datetime not null,
    Razdoblje_do datetime
);

create table ČLAN_POSUDBA (
	Član int,
	Knjiga int,
	Posudba int
	);


alter table ČLAN ADD foreign key (KNJIGA) references knjiga (šifra);
alter table KNJIGA add foreign key (POSUDBA) references posudba (šifra);
alter table ČLAN_POSUDBA add foreign key (POSUDBA) references posudba (šifra);

insert into ČLAN (Ime, Prezime, OIB, Adresa, Kontakt) 
	values 
		('Marija', 'Jelić', 12345678910, 'Jelićeva_5', '0911234678'),
		('Igor', 'Kovač', 12345678911, 'Masarykova_6', '0922345678'),
		('Robert', 'Petrić', 12345678912, 'Perkovićeva_7', '0972345578');

insert into KNJIGA (Naziv, Autor, Žanr) 
	values 
		('Zločin i kazna', 'Dostojevski', 'Krimić'),
		('Luna je okrutna ljubavnica', 'Petrović', 'ljubavni'),
		('Putevima Marka Pola', 'Saletto', 'putopis');



