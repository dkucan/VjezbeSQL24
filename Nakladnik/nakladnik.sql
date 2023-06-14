use master;
drop database if exists Nakladnik;
go
create database Nakladnik collate Croatian_CI_AS;
go
use Nakladnik;


create table MJESTO (
    Šifra int primary key identity (1, 1) not null,
    Naziv varchar(50) not null

);

create table NAKLADNIK (
    Šifra int primary key identity (1, 1) not null,
    Naziv varchar(50) not null,  
	Mjesto int
);

create table DJELO (
    Šifra int primary key identity (1, 1) not null,
    Naziv varchar(50) not null,
    Vrstadjela varchar(50) not null
);

create table NAKLADNIKDJELO (
    Nakladnik int,
	Djelo int, 
	Mjesto int
	);
	
	alter table NAKLADNIK add foreign key (MJESTO) references mjesto (šifra);
	alter table NAKLADNIKDJELO add foreign key (NAKLADNIK) references nakladnik (šifra);
	alter table NAKLADNIKDJELO add foreign key (DJELO) references djelo (šifra);


	insert into MJESTO (NAZIV) 
		values
		('Zagreb'),
		('Split'),
		('Jastrebarsko'),
		('Rijeka'),
		('Osijek');

	insert into NAKLADNIK (NAZIV, MJESTO) 
		values 
			('Školska Knjiga', 1),
			('Slobodna Dalmacija', 2),
			('Profil Klett', 3),
			('Alfa', 4),
			('Glas Slavonije', 5);

	insert into DJELO (Naziv, Vrstadjela)
		values 
			('Biologija_2', 'udžbenik_za_drugi_razred_srednje_škole'),
			('Vatreni_98', 'monografija_sa_Svjetskog_prvenstva_1998'),
			('Matematika_4', 'udžbenik_za_četvrti_razred_osnovne_škole'),
			('Hrvatsko_Primorje', 'monografija'),
			('Povijest osječkog sporta', 'sportska monografija');

			select * from NAKLADNIK;
			select * from DJELO;
			select * from MJESTO;

	insert into NAKLADNIKDJELO (Nakladnik, Djelo, Mjesto)
		values
			(1, 1, 1),
			(5, 5, 5),
			(4, 4, 4),
			(3, 3, 3),
			(2, 2, 2);

			select * from NAKLADNIKDJELO;





