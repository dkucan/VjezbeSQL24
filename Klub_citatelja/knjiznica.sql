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
    Kontakt varchar(20) not null
);

create table KNJIGA (
    Šifra int primary key identity (1,1) not null,
    Naziv varchar(100),
    Zanr varchar(100),
	Posudba int
	);

create table POSUDBA (
    Šifra int primary key identity (1,1) not null,
	Knjiga int,
    Clan int,
    Razdoblje_od datetime not null,
    Razdoblje_do datetime
);

alter table KNJIGA add foreign key (POSUDBA) references posudba (šifra);
alter table POSUDBA add foreign key (CLAN) references član (šifra);

insert into ČLAN (Ime, Prezime, OIB, Adresa, Kontakt) 
	values 
		('Marija', 'Jelić', 12345678910, 'Jelićeva_5', '0911234678'),
		('Igor', 'Kovač', 12345678911, 'Masarykova_6', '0922345678'),
		('Robert', 'Petrić', 12345678912, 'Perkovićeva_7', '0972345578');


