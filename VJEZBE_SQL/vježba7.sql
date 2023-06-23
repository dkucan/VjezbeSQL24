use master;
drop database if exists VJEŽBE_SQL_7;
go
create database VJEŽBE_SQL_7 collate Croatian_CI_AS;
go
use VJEŽBE_SQL_7;

create table SESTRA (
	Šifra int primary key identity (1,1) not null,
	Boja_kose varchar(34) not null,
	Hlače varchar(36) not null,
	Lipa decimal(15,6),
	Stil_frizura varchar(40) not null,
	Maraka decimal not null,
	Prijateljica int
	);

create table PRIJATELJICA (
	Šifra int primary key identity (1,1) not null,
	Haljina varchar(45),
	Gustoća decimal(15,10) not null,
	Ogrlica int,
	Novčića decimal (12,5),
	Ostavljen int 
	);

create table PUNICA (
	Šifra int primary key identity (1,1) not null,
	Majica varchar(40),
	Eura decimal (12,6) not null,
	Prstena int,
	Cura int not null,
	);

create table CURA (
	Šifra int primary key identity (1,1) not null,
	Lipa decimal (12,8) not null,
	Introvertno bit,
	Model_naočala varchar(40),
	Narukvica int,
	Treći_puta datetime,
	Kuna decimal(14,9),
	);

create table OSTAVLJEN (
	Šifra int primary key identity (1,1) not null,
	Lipa decimal (14,6),
	Introvertno bit not null,
	Kratka_majica varchar(38) not null,
	Prstena int not null,
	Zaručnik int
	);

create table ZARUČNIK (
	Šifra int primary key identity (1,1) not null,
	Vesta varchar(34),
	Asocijalno bit not null,
	Model_naočala varchar(43),
	Narukvica int not null,
	Novčića decimal(15,6) not null
	);

create table ZARUČNIK_MLADIĆ (
	Šifra int primary key identity (1,1) not null,
	Zaručnik int not null,
	Mladić int not null
	);

create table MLADIĆ (
	Šifra int primary key identity (1,1) not null,
	Prstena int,
	Lipa decimal (14,5) not null,
	Narukvica int not null,
	Drugi_puta datetime
	);

	alter table ZARUČNIK_MLADIĆ add foreign key (MLADIĆ) references mladić (šifra);
	alter table ZARUČNIK_MLADIĆ add foreign key (ZARUČNIK) references zaručnik (šifra);
	alter table OSTAVLJEN add foreign key (ZARUČNIK) references zaručnik (šifra);
	alter table PRIJATELJICA add foreign key (OSTAVLJEN) references ostavljen (šifra);
	alter table SESTRA add foreign key (PRIJATELJICA) references prijateljica (šifra);
	alter table PUNICA add foreign key (CURA) references cura (šifra);

	--1. U tablice prijateljica, ostavljen i zarucnik_mladic unesite po 3 retka.

select * from ZARUČNIK;

insert into ZARUČNIK (asocijalno,narukvica,Novčića)
	values
	
	(1,6,15.78),
	(0,3,25.98),
	(1,9,35.79);
              
select * from OSTAVLJEN;

insert into OSTAVLJEN (introvertno,Kratka_majica,prstena)
	values  

	(0,'Plava kratka',7),
	(1,'Zelena kratka',3),
	(1,'Crna kratka',11);
              
select * from PRIJATELJICA;

insert into PRIJATELJICA(Gustoća,ostavljen)
	values  

	(22.23,3),
	(29.54,1),
	(43.25,2);
              
select * from MLADIĆ;

insert into MLADIĆ(lipa,narukvica,drugi_puta)
	values  

	(12.55,4,'2023-06-05'),
	(18.78,8,'2023-05-05'),
	(15.99,2,'2023-04-10');
              
select * from ZARUČNIK_MLADIĆ;

insert into ZARUČNIK_MLADIĆ(Zaručnik,Mladić)
	values  

	(3,2),
	(1,3),
	(2,1);


select * from CURA;

insert into cura(lipa)
values

(25.22),
(38.39),
(50.50);

select * from PUNICA;
insert into PUNICA(eura,cura)
values

(55.44,1),
(13.55,2),
(23.55,3);
        
update PUNICA set eura=15.77;


select * from SESTRA;

insert into SESTRA (Boja_kose,Hlače,Stil_frizura,maraka,prijateljica)
values 
		('Plava','Žute','Duga',32.35,1),
        ('Smeđa','Zelene','Kratka',33.47,2),
        ('Crna','Crvene','Kratka',50.42, 2);
       
delete from SESTRA where  Hlače<'AB';


select Kratka_majica from ostavljen where introvertno is null;
