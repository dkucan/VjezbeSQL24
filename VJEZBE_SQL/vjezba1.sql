use master;
drop database if exists VJEZBE_SQL1;
go
create database VJEZBE_SQL1 collate Croatian_CI_AS;
GO
use VJEZBE_SQL1;

create table ŽENA (
	Šifra int primary key identity (1,1) not null,
	Treci_puta datetime,
	Hlače varchar(46),
	Kratka_majica varchar(31) not null,
	Jmbag char(11) not null,
	Boja_očiju varchar(39) not null,
	Haljina varchar(44),
	Sestra int not null
	);

create table SESTRA (
    Šifra int primary key identity(1,1) not null,
	Introvertno bit,
	Haljina varchar(31) not null,
	Maraka decimal(16,6),
	Hlace varchar(46) not null,
	Narukvica int not null
	);

	create table MLADIĆ (
	Šifra int not null primary key identity(1,1),
	Suknja varchar(50) not null,
	Kuna decimal(16,8) not null,
	Drugi_put datetime,
	Asocijalno bit,
	Ekstrovertno bit not null,
	Dukserica varchar(48) not null,
	Muškarac int
	);

create table MUŠKARAC (
    Šifra int primary key identity(1,1) not null,
	Bojaociju varchar(50) not null,
	Hlače varchar(30),
	Model_naocala varchar(43),
	Maraka decimal(14,5) not null,
	Žena int not null
	);

create table PUNAC (
	Šifra int not null primary key identity(1,1),
	Ogrlica int,
	Gustoća decimal(14,9),
	Hlače varchar(41) not null
);

create table CURA (
	Šifra int not null primary key identity(1,1),
	Novčića decimal(16,5) not null,
	Gustoća decimal(18,6) not null,
	Lipa decimal(13,10),
	Ogrlica int not null,
	Boja_kose varchar(38),
	Suknja varchar(36),
	Punac int
);

create table SVEKAR (
	Šifra int primary key identity(1,1) not null,
	Boja_očiju varchar(40) not null,
	Prstena int,
	Dukserica varchar(41),
	Lipa decimal(13,8),
	Eura decimal(12,7),
	Majica varchar(35)
);

create table SESTRA_SVEKAR(
	sifra int primary key identity(1,1) not null,
	sestra int not null,
	svekar int not null
);

alter table MLADIĆ add foreign key (MUŠKARAC) references muškarac(šifra);
alter table MUŠKARAC add foreign key (ŽENA) references žena(šifra);
alter table ŽENA add foreign key (SESTRA) references sestra (šifra);
alter table CURA add foreign key (PUNAC) references punac (šifra);
alter table SESTRA_SVEKAR add foreign key (sestra) references sestra (šifra);
alter table SESTRA_SVEKAR add foreign key (svekar) references svekar (šifra);





