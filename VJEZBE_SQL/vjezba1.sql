use master;
drop database if exists VJEZBE_SQL1;
go
create database VJEZBE_SQL1 collate Croatian_CI_AS;
GO
use VJEZBE_SQL1;

create table ŽENA (
	Šifra int primary key identity (1,1) not null,
	Treći_puta datetime,
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
	Hlače varchar(46) not null,
	Narukvica int
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
	Boja_očiju varchar(50) not null,
	Hlače varchar(30),
	Model_naočala varchar(43),
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
	šifra int primary key identity(1,1) not null,
	sestra int not null,
	svekar int not null
);

alter table MLADIĆ add foreign key (MUŠKARAC) references muškarac(šifra);
alter table MUŠKARAC add foreign key (ŽENA) references žena(šifra);
alter table ŽENA add foreign key (SESTRA) references sestra (šifra);
alter table CURA add foreign key (PUNAC) references punac (šifra);
alter table SESTRA_SVEKAR add foreign key (sestra) references sestra (šifra);
alter table SESTRA_SVEKAR add foreign key (svekar) references svekar (šifra);

	
			select * from SVEKAR; 

		insert into SVEKAR (Boja_očiju, prstena, dukserica, lipa, eura, majica)
			values
				('smeđa', '1', 'dugačka', '25', '30.32', 'dugačka'),
				('zelena', '2', 'kratka', '30', '40.99', 'kratka'),
				('plava', '3', 'dugačka', '35', '25.99', 'kratka');

	select * from SESTRA;

		insert into SESTRA (haljina, maraka, hlače, narukvica) 
			values
				('kratka', '43.52', 'dugačke', null),
				('dugačka', '80.35', 'kratke', null),
				('kratka', '34.99', 'kratke', null);

				
       select * from sestra_svekar;

		insert into sestra_svekar (sestra,svekar)
			values
					(1,1),
					(2,2),
					(3,3);

     select * from ŽENA; 

insert into ŽENA (Treći_puta, hlače, Kratka_majica,Jmbag, Boja_očiju, haljina, Sestra) 
	values
		('2023-05-19', 'sportske_kratke', 'polo_kratka', 10111213145, 'zelena','kratka', 2),
		('2023-06-01', 'dugačke', 'dugačka_s_rukavima', 11121314151, 'plava', 'kratka', 1),
		('2023-04-24', 'dugačke_traperice', 'nogometni_dres', 12131415167, 'smeđa', 'kratka', 3);

		select * from MUŠKARAC;


		insert into MUŠKARAC (Boja_očiju, hlače, Model_naočala, maraka, žena)
			values
				('smeđa', 'traperice', 'pravokutne', '40.37', 1),
				('plava', 'kratke', 'okrugle', '35.42', 2),
				('zelena', 'kratke_traperice', 'kockaste', '43.23', 3);

	update cura set gustoća=15.77;
	delete from MLADIĆ where Kuna>'15.78';

	select Kratka_Majica from ŽENA where Hlače like '%ana%';


select a.dukserica, f.asocijalno, e.Hlače
from svekar a
inner join sestra_svekar b on a.šifra=b.svekar
inner join sestra c on c.Šifra=b.sestra
inner join ŽENA d on c.Šifra=d.sestra
inner join MUŠKARAC e on d.šifra=e.žena
inner join MLADIĆ f on e.šifra=f.muškarac
where d.Hlače like 'a%' and c.haljina like '%ba%'
order by e.Hlače desc;

select sestra.haljina, sestra.maraka from sestra
where šifra not in (select šifra from sestra_svekar);
		
	
		
				


				




