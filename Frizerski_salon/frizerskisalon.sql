use master;
drop database if exists FrizerskiSalon;
go
create database FrizerskiSalon;
go
use FrizerskiSalon;


create table DJELATNIK (
    Sifra int primary key identity (1,1) not null,
    Ime varchar(50) not null,
    Prezime varchar(50) not null,
    OIB char(11) not null,
    Kontakt varchar(20) not null
);

create table KORISNIK (
    Sifra int primary key identity (1,1) not null,
    Ime varchar(50) not null,
    Prezime varchar(50) not null,
    Spol bit not null
);

create table USLUGA (
    Sifra int primary key identity (1,1) not null,
    Naziv varchar(100) not null,
    Cijena decimal(18,2) not null,
    Trajanje int not null
);

create table POSJETA (
    Sifra int primary key identity (1,1) not null,
    Datum datetime not null,
	Djelatnik int not null,
	Korisnik int not null,
	Usluga int not null
	);

	alter table POSJETA add foreign key (KORISNIK) references korisnik (sifra);
	alter table POSJETA add foreign key (USLUGA) references usluga (sifra);
	alter table POSJETA add foreign key (DJELATNIK) references djelatnik(sifra);

	insert into DJELATNIK (Ime, Prezime, OIB, Kontakt) values ('Pero', 'Perić', '20751953568', '0989746781');
	Insert into DJELATNIK (Ime, Prezime, OIB, Kontakt) values ('Marko', 'Marković', '12345678901', '0999746781');

	Insert into KORISNIK (Ime,Prezime, Spol) values ('Martina', 'Martinović','1');
	Insert into KORISNIK (Ime, Prezime, Spol) values ('Ivana', 'Ivanić', '1');
	Insert into KORISNIK (Ime, Prezime, Spol) values ('Petra', 'Petrić', '1');

	Insert into USLUGA (Naziv, Cijena, Trajanje) values ('Pramenovi', '50', '3');
	Insert into USLUGA (Naziv, Cijena, Trajanje) values ('Zenskosisanje', '30', '1');
	Insert into USLUGA (Naziv, Cijena, Trajanje) values ('Sisanje', '20', '1');

	insert into POSJETA (Datum, Djelatnik, Korisnik, Usluga) values
                    ('2023-04-24 17:00:00', 1, 1, 3),
                    ('2023-04-24 17:30:00', 2, 2, 1),
                    ('2023-04-24 18:00:00', 1, 3, 1);


	select * from POSJETA;

			
		




