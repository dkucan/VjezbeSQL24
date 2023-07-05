use master;
drop database if exists VJEŽBA_SQL3;
go
create database VJEŽBA_SQL3 collate Croatian_CI_AS;
go
use VJEŽBA_SQL3;

create table CURA(
	Šifra int primary key identity(1,1) not null,
	Dukserica varchar(49),
	Maraka decimal(13,7),
	Drugi_puta datetime,
	Majica varchar(49),
	Novčića decimal(15,8),
	Ogrlica int not null
);

create table OSTAVLJENA (
	Šifra int primary key identity(1,1) not null,
	Kuna decimal(17,5),
	Lipa decimal(15,6),
	Majica varchar(36),
	Model_naočala varchar(31) not null,
	Prijatelj int
	);

	create table PUNICA (
	Šifra int primary key identity(1,1) not null,
	Asocijalno bit,
	Kratka_majica varchar(44),
	Kuna decimal(13,8) not null,
	Vesta varchar(32) not null,
	Snaša int
	);

create table SVEKAR(
	Šifra int primary key identity(1,1) not null,
	Novčića decimal(16,8) not null,
	Suknja varchar(44) not null,
	Boja_kose varchar(36),
	Prstena int,
	Narukvica int not null,
	Cura int not null
);

create table BRAT (
	Šifra int primary key identity(1,1) not null,
	Jmbag char(11),
	Ogrlica int not null,
	Ekstrovertno bit not null
);

create table PRIJATELJ(
	Šifra int primary key identity(1,1) not null,
	Kuna decimal(16,10),
	Haljina varchar(37),
	Lipa decimal(13,10),
	Dukserica varchar(31),
	Indiferentno bit not null
);

create table PRIJATELJ_BRAT(
	Šifra int primary key identity(1,1) not null,
	Prijatelj int not null,
	Brat int not null
);

create table SNAŠA(
	Šifra int primary key identity(1,1) not null,
	Introvertno bit,
	Kuna decimal(15,6) not null,
	Eura decimal(12,9) not null,
	Treći_puta datetime,
	Ostavljena int not null
);

alter table SVEKAR add foreign key (CURA) references cura (šifra);
alter table SNAŠA add foreign key (OSTAVLJENA) references ostavljena (šifra);
alter table OSTAVLJENA add foreign key (PRIJATELJ) references prijatelj (šifra);
alter table PUNICA add foreign key (SNAŠA) references snaša (šifra);
alter table PRIJATELJ_BRAT add foreign key (PRIJATELJ) references prijatelj (šifra);
alter table PRIJATELJ_BRAT add foreign key (BRAT) references brat (šifra);


select * from OSTAVLJENA;

insert into OSTAVLJENA (Model_naočala)
	values  
		('Calvin_Klein'),
        ('Versace'),
        ('BOSS');
              
select * from SNAŠA;

insert into SNAŠA (kuna,eura,ostavljena)
	values  
	(5.99,35.99,1),
	(3.43,24.99,2),
	(7.99,56.99,3);     
             
select * from PRIJATELJ;

insert into PRIJATELJ(indiferentno)
	values  
		(1),
		(1),
		(0);

select * from BRAT;

insert into BRAT (ogrlica, ekstrovertno)
	values  
		(1,1),
		(2,0),
		(3,1);
            
select * from PRIJATELJ_BRAT;

insert into PRIJATELJ_BRAT(prijatelj,brat)
	values  

		(3,2), 
		(1,1), 
		(2,3);


select * from CURA;

insert into CURA(ogrlica)
	values 
	
	(4),
	(6),
	(8);

select* from SVEKAR;

insert into SVEKAR(novčića,suknja,narukvica,cura)
values  
(22.22,'Plava',7,1),
(33.11,'Zelena',4,2),
(44.55,'Crna',3,3);
       
update SVEKAR set Suknja = 'Osijek';


select * from SNAŠA;

insert into SNAŠA(kuna,eura,ostavljena)
	values  

	(29.99, 5,3),	
	(39.99, 6,2),
	(49.99, 7, 1);
        
select * from PUNICA;

insert into PUNICA(kuna,vesta,Snaša)
	values  
	(45.27,'Bijela',3),
	(27.99,'Žuta', 1),
	(32.99,'Crvena',2);
        
delete from PUNICA where Kratka_majica='AB';


select Majica from OSTAVLJENA where lipa not in (9,10,20,30,35);

select a.Ekstrovertno, f.vesta, e.kuna
from brat a
inner join prijatelj_brat b on a.Šifra=b.Šifra
inner join prijatelj c on b.Šifra=c.Šifra
inner join ostavljena d on d.Šifra=c.šifra
inner join SNAŠA e on d.Šifra=e.šifra
inner join punica f on e.Šifra=f.Šifra
where d.lipa!='91' and c.haljina like '%nt%'
order by e.kuna desc;

/* 6. Prikažite kolone haljina i lipa iz tablice prijatelj èiji se primarni kljuè 
ne nalaze u tablici prijatelj_brat. */

select prijatelj.haljina, prijatelj.lipa from prijatelj
where šifra not in (select šifra from prijatelj_brat);