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


 select * from PRIJATELJ;

insert into PRIJATELJ(prstena,Stil_frizura)
  values
  
	(2,'Dugačka'),
	(4,'Ćelava'),
	(6,'Kratka');
              
select * from BRAT;

insert into BRAT(Naušnica,Treći_puta,narukvica)
values

		(8,'2023-04-09',1),
        (5,'2023-04-24',5),
        (8,'2023-06-24',9);      
       
select * from ŽENA;

insert into ŽENA(novčića,narukvica,dukserica,brat)
   values  

	(20.75,2,'Plava',3),
	(30.88,1,'Zelena',1),
	(45.44,3,'Crna',2);        
       
select * from OSTAVLJENA;

insert into OSTAVLJENA (prvi_puta,kratka_majica)
values  

	('2020-12-03','Plava kratka'),
	('2019-04-23','Zelena duga'),
	('2018-11-13','Crna kratka');
               
select * from PRIJATELJ;

insert into PRIJATELJ_OSTAVLJENA (prijatelj,ostavljena)
	values  
	(2,2),
	(1,3),
	(3,1);


select * from PUNAC;

insert into PUNAC(ekstrovertno,suknja,majica,Prvi_puta)
	values
	
	(0,'Crvena kratka','kratkih rukava','2023-06-13'),
	(1,'Žuta kratka','bez rukava','2023-06-24'),
	(1,'bijela kratka','kratkih','2023-05-27');
        
select * from SVEKRVA;

insert into SVEKRVA (hlače,suknja,ogrlica,treći_puta,dukserica,narukvica,punac)
values  

	('Crvene','Bijela',1,'2023-04-24','Bijela',2,1),
	('Bijele','Plava',2,'2023-06-23','Crvena',1,1),
	('Plave','Crvena',3,'2023-05-27','Plava',3,1);
        
update svekrva set suknja='Osijek';


delete from DEČKO where Model_naočala<'AB';

select Narukvica from BRAT where Treći_puta is null;


	