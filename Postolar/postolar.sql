use master;
drop database if exists POSTOLAR;
go
create database POSTOLAR collate Croatian_CI_AS;
GO
use POSTOLAR;

create table ZAPOSLENIK (
SIFRA int primary key identity (1,1) not null,
IME varchar (50) not null,
PREZIME varchar (50) not null,
OIB char(11) not null,
KONTAKT varchar(30) not null,
STRUCNA_SPREMA varchar(50)
);

create table  STRUCNA_SPREMA (
SIFRA int primary key identity (1,1) not null,
NAZIV varchar (50) not null,
ZAPOSLENIK int
);

create table KORISNIK (
SIFRA int primary key identity (1,1) not null,
IME varchar (50) not null,
PREZIME varchar(50) not null,
KONTAKT varchar(30) not null,
OBUCA varchar(50) not null
);

create table OBUCA (
SIFRA int primary key identity (1,1) not null,
VRSTA varchar(50) not null,
KORISNIK int not null,
BROJ_POPRAVKA int not null
);

create table POPRAVAK (
SIFRA int primary key identity (1,1) not null,
ZAPOSLENIK int not null,
DATUM datetime not null,
OBUCA int not null
);

create table OBUCA_POPRAVAK (
	OBUCA int not null,
	POPRAVAK int not null
	);

	alter table OBUCA_POPRAVAK add foreign key (POPRAVAK) references popravak (sifra);
	alter table OBUCA_POPRAVAK add foreign key (OBUCA) references obuca (sifra);
	alter table OBUCA add foreign key (KORISNIK) references korisnik (sifra);
	alter table POPRAVAK add foreign key (ZAPOSLENIK) references zaposlenik (sifra);
	alter table STRUCNA_SPREMA add foreign key (ZAPOSLENIK) references zaposlenik (sifra);

	select * from KORISNIK;
		
		insert into KORISNIK (ime, prezime, kontakt, obuca) 
			values 
				('Marko','Marković', '0959746781', 'zenge'),
				('Ana', 'Anić', '0919746781', 'crvene štikle'),
				('Petra', 'Petrić', '0929746781', 'balerinke');

		select * from ZAPOSLENIK;
	
	insert into ZAPOSLENIK (IME, PREZIME, OIB, KONTAKT, STRUCNA_SPREMA) 
		values 
				('Franjo', 'Franjić', '12345678910', '123-456', 'srednja'),
				('Jozo', 'Jozić', '12345678911', '123-456', 'srednja'),
				('Pero', 'Perić', '12345678912', '123-456', 'srednja');

		select * from OBUCA;
	
	insert into	OBUCA (vrsta, korisnik, broj_popravka)	
		values
			('visoke cipele', 1, 1),
			('štikle', 2, 2),
			('balerinke', 3, 3);

		select * from POPRAVAK;
	
	insert into POPRAVAK (ZAPOSLENIK, DATUM, OBUCA)
		values 
			(1, '2023-05-11', 1),
			(2, '2023-05-08', 3),
			(3, '2023-05-10', 2);

			delete from POPRAVAK where sifra=3;
			