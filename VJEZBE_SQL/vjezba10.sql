use master;
drop database if exists vjezba_sql10;
go
create database vjezba_sql10 collate Croatian_CI_AS;
go
use vjezba_sql10;

create table ZARUČNICA (
	Šifra int primary key identity (1,1) not null,
	Treći_puta datetime,
	Prvi_puta datetime,
	Suknja varchar(32) not null,
	Eura decimal(16,10)
	);

create table NEPRIJATELJ (
	Šifra int primary key identity (1,1) not null,
	Gustoća decimal (15,10) not null,
	Dukserica varchar(32) not null,
	Maraka decimal (15,7),
	Stil_frizura varchar(49) not null
	);

create table SESTRA (
	Šifra int primary key identity (1,1) not null,
	Suknja varchar(46) not null,
	Boja_očiju varchar(49),
	Indiferentno bit,
	Dukserica varchar(32) not null,
	Drugi_puta datetime,
	Prvi_puta datetime not null,
	Zaručnica int
	);

create table PUNAC (
	Šifra int primary key identity (1,1) not null,
	Lipa decimal (15,9),
	Eura decimal (15,10) not null,
	Stil_frizura varchar(37)
	);

create table PUNAC_NEPRIJATELJ (
	Šifra int primary key identity (1,1) not null,
	Punac int not null,
	Neprijatelj int not null
	);

create table SVEKRVA (
	Šifra int primary key identity (1,1) not null,
	Eura decimal (17,9),
	Čarape varchar (43),
	Kuna decimal (13,9),
	Majica varchar(30),
	Intovertno bit not null,
	Punac int
	);

create table MLADIĆ (
	Šifra int primary key identity (1,1) not null,
	Hlače varchar(48) not null,
	Lipa decimal (18,6),
	Stil_frizura varchar(35) not null,
	Prstena int,
	Maraka decimal (12,6) not null,
	Svekrva int
	);

create table ŽENA (
	Šifra int primary key identity (1,1) not null,
	Boja_očiju varchar(49) not null,
	Maraka decimal (13,9) not null,
	Majica varchar (45),
	Indiferentno bit,
	Prvi_put datetime,
	Mladić int
	);

	alter table ŽENA add foreign key (MLADIĆ) references mladić(šifra);
	alter table SESTRA add foreign key (ZARUČNICA) references zaručnica(šifra);
	alter table MLADIĆ add foreign key (SVEKRVA) references svekrva(šifra);
	alter table SVEKRVA add foreign key (PUNAC) references punac (šifra);
	alter table PUNAC_NEPRIJATELJ add foreign key (PUNAC) references punac (šifra);
	alter table PUNAC_NEPRIJATELJ add foreign key (NEPRIJATELJ) references neprijatelj (šifra);

	select * from SVEKRVA;
	
	insert into SVEKRVA (Intovertno) values
	(0),
	(0),
	(1);

	select * from PUNAC;
	insert into PUNAC (Eura) values

	(15.99),
	(45.99),
	(15.99);

	select * from MLADIĆ;
	insert into MLADIĆ (Hlače, Stil_frizura, Maraka, Svekrva) values
		('Plave hlače', 'dreadlocks', 14.99, 2),
		('Bijele hlače', 'kratka', 20.99, 1),
		('Crvene hlače', 'ćelava', 15.99, 3);

	select * from NEPRIJATELJ;
	insert into NEPRIJATELJ(Gustoća, Dukserica, Stil_frizura) values
	(19.99, 'Bijela', 'kratka'),
	(30.99, 'Smeđa', 'dugačka'),
	(20.99, 'Crna', 'dreadlocks');

	select * from PUNAC_NEPRIJATELJ;
	insert into PUNAC_NEPRIJATELJ (punac, neprijatelj) values
		(1,3),
		(2,1),
		(3,2);

	select * from ZARUČNICA;
	insert into ZARUČNICA(suknja) values
	('Bijela'),
	('Crvena'),
	('Plava');

	select * from SESTRA;
	insert into SESTRA (suknja, dukserica, prvi_puta, zaručnica) values
	('Bijela', 'Bijela', '2023-08-20', 1),
	('Crvena', 'Crvena', '2023-08-21', 2),
	('Plava', 'Plava', '2023-07-12', 3);


	update SESTRA set Boja_očiju='Osijek';

	select * from ŽENA;
	insert into ŽENA (Boja_očiju, MARAKA, Mladić) values

	('Smeđa', 50.55, 2),
	('Plava', 40.55, 1),
	('Zelena', 35.55, 3);

	delete from ŽENA where Maraka !=14.81;

	select Kuna from SVEKRVA where Čarape like '%Ana%';

	select a.maraka , f.indiferentno , e.lipa 
from neprijatelj a
inner join punac_neprijatelj  b on a.Šifra      = b.neprijatelj 
inner join punac              c on b.punac      = c.Šifra
inner join svekrva            d on c.Šifra      = d.punac 
inner join MLADIĆ             e on d.Šifra      = e.Svekrva 
inner join ŽENA               f on e.Šifra      = f.Mladić
where d.Čarape like 'a&' and c.eura != 22
order by e.lipa desc;


select	a.eura , a.Stil_frizura 
from	punac a left join punac_neprijatelj b on b.punac = a.Šifra
where	b.punac is null; 