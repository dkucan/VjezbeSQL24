use master;
drop database if exists KozmetickiSalon;
go
create database KozmetickiSalon collate Croatian_CI_AS;
go
use KozmetickiSalon;


create table DJELATNIK (
    Šifra int primary key identity (1, 1) not null,
    Ime varchar(50) not null,
    Prezime varchar(50) not null,
	OIB char(11) not null,
    Kontakt varchar(20) not null
);

create table KORISNIK (
    Šifra int primary key identity (1, 1) not null,
    Ime varchar(50) not null,
	Prezime varchar(50) not null,
	Spol bit not null,
    Kontakt varchar (20) not null
);

create table USLUGA (
    Šifra int primary key identity (1, 1) not null,
    Naziv varchar (100) not null,
    Cijena decimal(18,2) not null,
    Trajanje int null
);

create table POSJETA (
    Šifra int primary key identity (1,1) not null,
    Datum datetime not null,
	Djelatnik int not null,
	Korisnik int not null,
	Usluga int not null
	);

   alter table POSJETA add foreign key (USLUGA) references usluga (šifra);
   alter table POSJETA add foreign key (DJELATNIK) references djelatnik(šifra);
   alter table POSJETA add foreign key (KORISNIK) references korisnik (šifra);

   insert into DJELATNIK (Ime, Prezime, OIB, Kontakt) 
		values 
		('Pero', 'Perić', '20751953568', '0989746781'),
        ('Marko', 'Marković', '12345678901', '0999746781');

	Insert into KORISNIK (Ime, Prezime, Spol, Kontakt) 
		values ('Martina', 'Martinović', '1', '09112345678'),
				('Ivana', 'Ivanić', '1', '09212345678'),
				('Petra', 'Petrić', '1', '09912345678');

	Insert into USLUGA (Naziv, Cijena, Trajanje) 
		values ('Pedikura', '50', 3),
				('Solarij', '30', 2),
				('Manikura', '20', 1);

	insert into POSJETA (Datum, Djelatnik, Korisnik, Usluga) values
                    ('2023-04-24', 1, 1, 3),
                    ('2023-04-24', 2, 2, 1),
                    ('2023-04-24', 1, 3, 1);

			update USLUGA set naziv='šminkanje' where šifra=1;
			update POSJETA set datum='2023-06-16' where šifra=3;

			select * from KORISNIK;
			select * from USLUGA;
			select * from POSJETA;




	
