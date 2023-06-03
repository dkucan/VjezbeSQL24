Use master;
drop database if exists Urarska_radnja_Silvija;
go
create database Urarska_radnja_Silvija;
go
use Urarska_radnja_Silvija;

create table URAR_SILVIJA (
	SIFRA int not null primary key identity (1,1),
	IME varchar (50) not null,
	PREZIME varchar (50) not null, 
	POPRAVAK int, 
	KORISNIK int
	);
create table KORISNIK (
	SIFRA int not null primary key identity (1,1),
	IME varchar (50) not null,
	PREZIME varchar(50) not null,
	POPRAVAK INT,
	KORISNIK INT
	);
 create table POPRAVAK (
	SIFRA int not null primary key identity (1,1),
	KORISNIK INT,
	URAR_SILVIJA int,
	SAT int,
	CIJENA decimal (18,2) not null,
	OPIS varchar (20) not null
	);

  create table SAT (
	SIFRA int not null primary key identity (1,1),
	URAR_SILVIJA int,
	KORISNIK int
	);

	alter table SAT add foreign key (KORISNIK) references korisnik (sifra);
	alter table SAT add foreign key (URAR_SILVIJA) references urar_silvija(sifra);
	alter table POPRAVAK add foreign key (SAT) references sat (sifra);

