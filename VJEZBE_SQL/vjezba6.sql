use master;
drop database if exists VJEŽBE_sql_6;
go
create database VJEŽBE_sql_6 collate Croatian_CI_AS;
go
use VJEŽBE_sql_6;

create table BRAT (
	Šifra int primary key identity (1,1) not null,
	Naušnica int not null,
	Treći_puta datetime not null,
	Narukvica int not null,
	Hlače varchar(31),
	Prijatelj int
	);

	create table PRIJATELJ (
		Šifra int primary key identity (1,1) not null,
		Haljina varchar(35),
		Prstena int not null,
		Introvertno bit,
		Stil_frizura varchar(36)
		);

	create table PRIJATELJ_OSTAVLJENA (
		Šifra int primary key identity (1,1) not null,
		Prijatelj int not null,
		Ostavljena int not null
		);

	create table OSTAVLJENA (
		Šifra int primary key identity (1,1) not null,
		Prvi_puta datetime not null,
		Kratka_majica varchar(39) not null,
		Drugi_puta datetime,
		Maraka decimal (14,10)
		);

	create table ŽENA (
		Šifra int primary key identity (1,1) not null,
		Novčića decimal (14,8) not null,
		Narukvica int not null,
		Dukserica varchar(40) not null,
		Haljina varchar(30),
		Hlače varchar(32),
		Brat int not null
		);

	create table DEČKO (
		Šifra INT primary key identity (1,1) not null,
		Prvi_puta datetime,
		Model_naočala varchar(41),
		Naušnica int,
		Žena int not null
		);

	create table SVEKRVA (
		Šifra int primary key identity (1,1) not null,
		Hlače varchar(48) not null,
		Suknja varchar(42) not null,
		Ogrlica int not null,
		Treći_puta datetime not null,
		Dukserica varchar(32) not null,
		Narukvica int not null,
		Punac int
		);

	create table PUNAC (
		Šifra int primary key identity (1,1) not null,
		Ekstrovertno bit not null,
		Suknja varchar(30) not null,
		Majica varchar(44) not null,
		Prvi_puta datetime not null
		);

	alter table DEČKO add foreign key (ŽENA) references žena (šifra);
	alter table ŽENA add foreign key (BRAT) references brat (šifra);
	alter table PRIJATELJ_OSTAVLJENA add foreign key (OSTAVLJENA) references ostavljena (šifra);
	alter table PRIJATELJ_OSTAVLJENA add foreign key (PRIJATELJ) references prijatelj (šifra);
	alter table SVEKRVA add foreign key (PUNAC) references punac (šifra);
	alter table BRAT add foreign key (PRIJATELJ) references prijatelj (šifra);

	