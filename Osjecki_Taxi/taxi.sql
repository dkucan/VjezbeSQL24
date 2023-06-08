use master;
drop database if exists Osjecki_Taxi;
go
create database Osjecki_Taxi collate Croatian_CI_AS;
go
use Osjecki_Taxi;


create table VOZILO (
    Sifra int primary key identity (1, 1) not null,
    Marka varchar(20) not null,
    Reg_oznaka varchar(20) not null
);

create table VOZAC (
    Sifra int primary key identity (1, 1) not null,
    Ime varchar(20) not null,
    Prezime varchar(20) not null,
    OIB char(11) not null,
    Mobitel varchar(20) not null,
    Vozilo int not null
);

create table VOZNJA (
    Sifra int primary key identity (1, 1) not null,
    Datum datetime not null,
    Kilometraza decimal(18,2) not null,
    Cijena decimal(18,2) not null,
    Vozac int not null
);

create table PUTNIK (
    Sifra int primary key identity (1, 1) not null,
    Ime varchar(20) not null,
    Prezime varchar(20) not null,
    Mobitel varchar(20) not null
);

create table VOZNJA_PUTNIK (
    Voznja int not null,
    Putnik int not null
	);

	alter table VOZNJA_PUTNIK add foreign key (PUTNIK) references putnik (sifra);
	alter table VOZNJA_PUTNIK add foreign key (VOZNJA) references voznja (sifra);
	alter table VOZNJA add foreign key (VOZAC) references vozac (sifra);
	alter table VOZAC add foreign key (VOZILO) references vozilo (sifra);