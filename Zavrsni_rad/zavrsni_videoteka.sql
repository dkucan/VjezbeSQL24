use master;
drop database if exists videoteka;
go
create database videoteka;
go
use videoteka;

create table CLAN (
	Sifra int not null primary key identity(1,1),
	Ime varchar(30) not null,
	Prezime varchar(30) not null,
	Adresa varchar(50) not null,
	Mobitel varchar(30) not null,
	OIB char(11),
	Datum_uclanjenja datetime not null
	);
create table KAZETA (
	Sifra int not null primary key identity(1,1),
	Naslov varchar(50) not null,
	Godina_izdanja date not null,
	Zanr varchar(30) not null,
	Cijena_posudbe int not null,
	Cijena_zakasnine int not null
	);
Create table POSUDBA (
	Sifra int not null primary key identity (1,1),
	Datum_posudbe datetime not null,
	Datum_vracanja datetime,
	Zakasnina int not null,
	Clan int
	);
	Create table POSUDBAKAZETA (
	Kazeta int not null primary key identity (1,1),
	Posudba int not null,
	Cijena_posudbe int,
	Cijena_zakasnine int
	);

	alter table POSUDBA add foreign key (CLAN) references clan (sifra);
	alter table POSUDBAKAZETA add foreign key (KAZETA) references kazeta (sifra);
	alter table POSUDBAKAZETA add foreign key (POSUDBA) references posudba (sifra);

	insert into CLAN (Ime, Prezime, Adresa, Mobitel, OIB, Datum_uclanjenja) values ('Pero', 'Djetlic', 'Djetliceva_5', '09112345678', '20751953568', '2022-12-10');
	insert into CLAN (Ime, Prezime, Adresa, Mobitel, OIB, Datum_uclanjenja) values ('Patak', 'Dodo', 'Dodina_16', '09212345678', '20751953568', '2022-10-10');
	insert into CLAN (Ime, Prezime, Adresa, Mobitel, OIB, Datum_uclanjenja) values ('Zekoslav', 'Mrkva', 'Mrkvina_22', '09512345678', '20751953568', '2022-08-23');
	insert into CLAN (Ime, Prezime, Adresa, Mobitel, OIB, Datum_uclanjenja) values ('Marko', 'Markovic', 'Markoviceva_35', '09712345678', '20751953568', '2022-11-17');
	Insert into CLAN (Ime, Prezime, Adresa, Mobitel, OIB, Datum_uclanjenja) values ('Pero', 'Peric', 'Periceva_9', '09812345678', '20751953568', '2022-04-11');
	Insert into CLAN (Ime, Prezime, Adresa, Mobitel, OIB, Datum_uclanjenja) values ('Ana', 'Anic', 'Anina_15', '09912345678', '20751953568', '2022-04-23');
	Insert into CLAN (Ime, Prezime, Adresa, Mobitel, OIB, Datum_uclanjenja) values ('Katarina', 'Peric', 'Periceva_12', '09923456789', '20751953568', '2022-04-16');
	Insert into CLAN (Ime, Prezime, Adresa, Mobitel, OIB, Datum_uclanjenja) values ('Ana', 'Markovic', 'Markoviceva_35', '09712345678', '20751953568', '2022-11-17');
