use master;
drop database if exists VJEŽBE_sql_5;
go
create database VJEŽBE_sql_5 collate Croatian_CI_AS;
go
use VJEŽBE_sql_5;

create table MLADIĆ (
	Šifra inT primary key identity (1,1) not null,
	Kratka_majica varchar(48) not null,
	Haljina varchar(30) not null,
	Asocijalno bit,
	Zaručnik int
	);

create table ZARUČNIK (
	Šifra int primary key identity (1,1) not null,
	JMBAG char(11),
	Lipa decimal (12,8),
	Indiferentno bit not null
	);

create table PUNAC (
	Šifra int primary key identity (1,1) not null,
	Dukserica varchar(33),
	Prvi_puta datetime not null,
	Majica	varchar(36),
	Svekar int not null
	);

create table SVEKAR (
	Šifra int primary key identity (1,1) not null,
	Boja_kose varchar(33),
	Majica varchar(31),
	Čarape varchar(31) not null,
	Haljina varchar(43),
	Narukvica int,
	Eura decimal(14,5) not null
	);

create table SVEKAR_CURA (
	Šifra int primary key identity not null,
	Svekar int not null,
	Cura int not null
	);

create table CURA (
	Šifra int primary key identity not null,
	Čarape varchar(41) not null,
	Maraka decimal(17,10) not null,
	Asocijalno bit,
	Vesta varchar(47) not null
	);

create table PUNICA (
	Šifra int primary key identity not null,
	Hlače varchar(43) not null,
	Naušnica int not null,
	Ogrlica int,
	Vesta varchar(49) not null, 
	Model_naočala varchar(31) not null,
	Treći_puta datetime not null,
	Punac int not null
	);

create table OSTAVLJENA (
	Šifra int primary key identity not null,
	Majica varchar(33),
	Ogrlica int not null,
	Čarape varchar(44),
	Stil_frizura varchar(42),
	Punica int
	);

	alter table MLADIĆ add foreign key (ZARUČNIK) references zaručnik (šifra);
	alter table PUNAC add foreign key (SVEKAR) references svekar (šifra);
	alter table SVEKAR_CURA add foreign key (SVEKAR) references svekar (šifra);
	alter table SVEKAR_CURA add foreign key (CURA) references cura (šifra);
	alter table PUNICA add foreign key (PUNAC) references punac (šifra);
	alter table OSTAVLJENA add foreign key (PUNICA) references punica (šifra);

	select * from SVEKAR;

insert into SVEKAR (Čarape,eura)
	values  
	
	('Žute',25.09),
	('Crvene',10.10),	
	('Smeđe',15.09);

select * from PUNAC;

insert into PUNAC (prvi_puta,svekar)
 values 

	('2023-06-24',3),
	('2023-06-13',1),
	('2023-04-24',2);
             
select * from PUNICA;

insert into PUNICA(hlače,Naušnica,vesta,model_naočala,treći_puta,punac)
values  

	('Bijele',2,'Bijela','Okrugle_dioptrijske','2023-06-24',3),
	('Traperice',4,'Smeđa','Kockaste_dioptrijske','2023-06-13',1),
	('Smeđe',4,'Crna','Sunčane','2023-04-24',2);
 
select * from CURA;

insert into CURA(Čarape,maraka,vesta)
	values  

	('Bijele',10.00,'Bijela'),
	('Smeđe',10.99,'Smeđa'),
	('Crne',6.99,'Bijela');
              
select * from SVEKAR_CURA;

insert into SVEKAR_CURA(svekar,cura)
	values 

	(3,1),
	(1,3),
	(2,2);

select * from MLADIĆ;

insert into MLADIĆ(Kratka_majica,haljina)
	values

	('Crvena','Bijela'),
	('Bijela','Plava'),
	('Plava','Crvena');

update MLADIĆ set haljina='OSIJEK';


select * from OSTAVLJENA;

insert into OSTAVLJENA(ogrlica,punica)
values  

(21,3),
(17,1),
(14,2);
        
delete from OSTAVLJENA where Ogrlica =17; 


select majica from punac where prvi_puta is null;
