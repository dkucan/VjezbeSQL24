use master;
drop database if exists POSTOLAR;
go
create database POSTOLAR collate Croatian_CI_AS;
GO
use POSTOLAR;

create table ZAPOSLENIK (
ŠIFRA int primary key identity (1,1) not null,
IME varchar (50) not null,
PREZIME varchar (50) not null,
OIB char(11) not null,
KONTAKT varchar(30) not null,
STRUČNA_SPREMA varchar(50)
);

create table  STRUČNA_SPREMA (
ŠIFRA int primary key identity (1,1) not null,
NAZIV varchar (50) not null,
ZAPOSLENIK int
);

create table KORISNIK (
ŠIFRA int primary key identity (1,1) not null,
IME varchar (50) not null,
PREZIME varchar(50) not null,
KONTAKT varchar(30) not null,
OBUĆA varchar(50) not null
);

create table OBUĆA (
ŠIFRA int primary key identity (1,1) not null,
VRSTA varchar(50) not null,
KORISNIK int not null,
BROJ_POPRAVKA int not null
);

create table POPRAVAK (
ŠIFRA int primary key identity (1,1) not null,
ZAPOSLENIK int not null,
DATUM datetime not null,
OBUĆA int not null
);

create table OBUĆA_POPRAVAK (
	OBUĆA int not null,
	POPRAVAK int not null
	);

	alter table OBUĆA_POPRAVAK add foreign key (POPRAVAK) references popravak (šifra);
	alter table OBUĆA_POPRAVAK add foreign key (OBUĆA) references obuća (šifra);
	alter table OBUĆA add foreign key (KORISNIK) references korisnik (šifra);
	alter table POPRAVAK add foreign key (ZAPOSLENIK) references zaposlenik (šifra);
	alter table STRUČNA_SPREMA add foreign key (ZAPOSLENIK) references zaposlenik (šifra);

	select * from KORISNIK;
		
		insert into KORISNIK (ime, prezime, kontakt, obuća) 
			values 
				('Marko','Marković', '0959746781', 'zenge'),
				('Ana', 'Anić', '0919746781', 'crvene štikle'),
				('Petra', 'Petrić', '0929746781', 'balerinke');

		select * from ZAPOSLENIK;
	
	insert into ZAPOSLENIK (IME, PREZIME, OIB, KONTAKT, STRUČNA_SPREMA) 
		values 
				('Franjo', 'Franjić', '12345678910', '123-456', 'srednja'),
				('Jozo', 'Jozić', '12345678911', '123-456', 'srednja'),
				('Pero', 'Perić', '12345678912', '123-456', 'srednja');

		select * from OBUĆA;
	
	insert into	OBUĆA (vrsta, korisnik, broj_popravka)	
		values
			('visoke cipele', 1, 1),
			('štikle', 2, 2),
			('balerinke', 3, 3);

		select * from POPRAVAK;
	
	insert into POPRAVAK (ZAPOSLENIK, DATUM, OBUĆA)
		values 
			(1, '2023-05-11', 1),
			(2, '2023-05-08', 3),
			(3, '2023-05-10', 2);

			delete from POPRAVAK where šifra=3;

		select * from OBUĆA;

			update OBUĆA set vrsta='cipele s visokom petom' where šifra=2;
			delete OBUĆA where šifra=1;
			