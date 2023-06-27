use master;
drop database if exists SQL_Vježbe_4;
go
create database SQL_Vježbe_4 collate Croatian_CI_AS;
go
use SQL_Vježbe_4;

create table PUNAC (
	Šifra int primary key identity (1,1) not null,
	Treći_puta datetime,
	Majica varchar(46),
	JMBAG char(11) not null,
	NOVČIĆA decimal(18,7) not null,
	MARAKA decimal(12,6) not null,
	OSTAVLJEN int not null
	);
create table OSTAVLJEN (
	Šifra int primary key identity (1,1) not null,
	Model_naočala varchar(43),
	Introvertno bit,
	Kuna decimal(14,10)
	);
create table SNAŠA (
	Šifra int primary key identity (1,1) not null,
	Intvorertno bit,
	Treći_puta datetime, 
	Haljina varchar(44) not null,
	Žena int not null
	);
create table BEĆAR (
	Šifra int primary key identity (1,1) not null,
	Novčića decimal(14,8),
	Kratka_majica varchar(48) not null,
	Boja_očiju varchar(36) not null,
	Snaša int not null
	);
create table PRIJATELJ (
	Šifra int primary key identity (1,1) not null,
	Eura decimal(16,9),
	Prstena int not null,
	Gustoća decimal(16,5),
	JMBAG char(11) not null,
	Suknja varchar(47) not null,
	Bećar int not null
	);
create table ŽENA (
	Šifra int primary key identity (1,1) not null,
	Suknja varchar(39) not null,
	Lipa decimal(18,7),
	Prstena int not null
	);
create table ŽENA_MLADIĆ (
	Šifra int primary key identity (1,1) not null,
	Žena int not null,
	Mladić int not null
	);
create table MLADIĆ (
	Šifra int primary key identity (1,1) not null,
	Kuna decimal(15,9),
	Lipa decimal(18,5),
	Naušnica int,
	Stil_frizura varchar(49),
	Vesta varchar(34) not null
	);

	alter table ŽENA_MLADIĆ add foreign key (MLADIĆ) references mladić (šifra);
	alter table ŽENA_MLADIĆ add foreign key (ŽENA) references žena (šifra);
	alter table SNAŠA add foreign key (ŽENA) references žena (šifra);
	alter table BEĆAR add foreign key (SNAŠA) references snaša (šifra);
	alter table PRIJATELJ add foreign key (BEĆAR) references bećar (šifra);
	alter table PUNAC add foreign key (OSTAVLJEN) references ostavljen (šifra);


select * from ŽENA;

insert into ŽENA(suknja,prstena)
	values  
	
	('Bijela suknja',3),
	('Zelena suknja',2),
	('Žuta suknja',1);        
       
select * from SNAŠA;

insert into SNAŠA(haljina,žena)
	values  
	
	('Bijela haljina',1),
	('Žuta haljina',2),
	('Crvena haljina',3);

select * from BEĆAR

insert into BEĆAR (kratka_majica,boja_očiju,Snaša)    
	values  
	
	('Bijela','Smeđa',2),
	('Žuta','Plava',1),
	('Crvena','Zelena',3);

select * from MLADIĆ;

insert into MLADIĆ(vesta)
	 values  
	
	('Smeđa'),
	('Bijela'),
	('Žuta');
             
select * from ŽENA_MLADIĆ;

insert into ŽENA_MLADIĆ(Žena,Mladić)
	values 

	(1,3),
	(3,1),
	(2,2);


select * from OSTAVLJEN;

insert into OSTAVLJEN(Model_naočala)

	values

	('Naočale_1');

select * from PUNAC;

insert into punac(jmbag,NOVČIĆA,maraka,ostavljen)
	values
	(12345678910,20.25,30.32,1),
	(12345678911,30.32,40.99,1),
	(12345678912, 50.23,50.99,1);

update PUNAC set Majica='Osijek';


select * from PRIJATELJ;

insert into PRIJATELJ (prstena,jmbag ,suknja,Bećar)
	values  
	
	(10,34567890,'Bijela',3),
	(12,45678910,'Žuta',1),
	(32,56789101,'Zelena',2);
        
delete from PRIJATELJ where Prstena > 17;

select * from SNAŠA;
select HALJINA from SNAŠA where treći_puta is null;


