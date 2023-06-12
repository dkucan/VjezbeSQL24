use master;
drop database if exists VJEŽBE_SQL_2;
go
create database VJEŽBE_SQL_2 collate Croatian_CI_AS;
go
use VJEŽBE_SQL_2;

create table SVEKAR(
    Šifra int primary key identity(1,1) not null,
	Stil_frizura varchar(48),
	Ogrlica int not null,
	Asocijalno bit not null
);

create table PRIJATELJ(
	Šifra int primary key identity(1,1) not null,
	Model_naočala varchar(37),
	Treći_puta datetime not null,
	Ekstrovertno bit not null,
	Prvi_puta datetime,
	Svekar int not null
);

create table DEČKO(
	Šifra int Primary key identity(1,1) not null,
	Indiferentno bit,
	Vesta varchar(34),
	Asocijalno bit not null
);

create table ZARUČNICA (
	Šifra int primary key identity(1,1) not null,
	Narukvica int,
	Bojakose varchar(37) not null,
	Novčića decimal(15,9),
	Lipa decimal(15,8) not null,
	Indiferentno bit not null
);

create table DEČKO_ZARUČNICA(
	Šifra int primary key identity(1,1) not null,
	Dečko int not null,
	Zaručnica int not null
);

create table CURA(
	šifra int primary key identity(1,1) not null,
	haljina varchar(33) not null,
	Drugi_puta datetime not null,
	Suknja varchar(38),
	Narukvica int,
	introvertno bit,
	Majica varchar(40) not null,
	Dečko int
);

create table NEPRIJATELJ (
	Šifra int primary key identity(1,1) not null,
	Majica varchar(32),
	Haljina varchar(43) not null,
	Lipa decimal(16,8),
	Model_naočala varchar(49) not null,
	Kuna decimal(12,6) not null,
	Jmbag char(11),
	Cura int 
);

create table BRAT(
	Šifra int primary key identity(1,1) not null,
	Suknja varchar,
	Ogrlica int not null,
	Asocijalno bit not null,
	Neprijatelj int not null
);

alter table CURA add foreign key (DEČKO) references dečko (šifra);
alter table NEPRIJATELJ add foreign key (CURA) references cura (šifra);
alter table BRAT add foreign key (NEPRIJATELJ) references neprijatelj (šifra);
alter table PRIJATELJ add foreign key (SVEKAR) references svekar (šifra);
alter table DEČKO_ZARUČNICA add foreign key (DEČKO) references dečko (šifra);
alter table DEČKO_ZARUČNICA add foreign key (ZARUČNICA) references zaručnica (šifra);
