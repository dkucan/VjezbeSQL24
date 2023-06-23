use master;
drop database if exists VJEŽBE_SQL_8;
go
create database VJEŽBE_SQL_8 collate Croatian_CI_AS;
go
use VJEŽBE_SQL_8;

create table PRIJATELJICA (
Šifra int primary key identity (1,1) not null,
Vesta varchar(50),
Naušnica int not null,
Introvertno bit not null
);

create table CURA (
Šifra int primary key identity (1,1) not null,
Naušnica int not null,
Indiferentno bit,
Ogrlica int not null,
Gustoća decimal (12,6),
Drugi_puta datetime,
Vesta varchar(33),
Prijateljica int
);

create table NEPRIJATELJ (
Šifra int primary key identity (1,1) not null,
Kratka_majica varchar(44),
Introvertno bit,
Indiferentno bit,
Ogrlica int not null,
Bećar int not null
);

create table BEĆAR (
Šifra int primary key identity (1,1) not null,
Eura decimal (15,10) not null,
Treći_puta datetime,
Prvi_puta datetime,
Muškarac int not null
);

create table MUŠKARAC (
Šifra int primary key identity (1,1) not null,
Haljina varchar(47),
Drugi_puta datetime not null,
Treći_puta datetime
);

create table MUŠKARAC_DEČKO (
Šifra int primary key identity(1,1) not null,
Muškarac int not null,
Dečko int not null
);

create table BRAT (
Šifra int primary key identity (1,1) not null,
Introvertno bit,
Novčića decimal (14,7) not null,
Treći_puta datetime,
Neprijatelj int
);

create table DEČKO (
Šifra int primary key identity (1,1) not null,
Kuna decimal (12,10), 
Lipa decimal(17,10),
Boja_kose varchar(44),
Treći_puta datetime not null,
Ogrlica int not null,
Ekstrovertno bit not null
);

alter table CURA add foreign key (PRIJATELJICA) references prijateljica (šifra);
alter table NEPRIJATELJ add foreign key (BEĆAR) references bećar (šifra);
alter table BEĆAR add foreign key (MUŠKARAC) references muškarac (šifra);
alter table MUŠKARAC_DEČKO add foreign key (MUŠKARAC) references muškarac (šifra);
alter table MUŠKARAC_DEČKO add foreign key (DEČKO) references dečko (šifra);
alter table BRAT add foreign key (NEPRIJATELJ) references neprijatelj (šifra);

select * from MUŠKARAC; 

insert into MUŠKARAC (Drugi_puta)
values

	('2023-06-19'),
	('2023-05-27'),
	('2022-06-23');
     
select * from BEĆAR;

insert into BEĆAR(eura,muškarac)
values 

	(34.22,1),
	(35.27,2),
	(47.50,1);

select * from NEPRIJATELJ;

insert into NEPRIJATELJ(ogrlica,bećar)
	values  

	(3,3),
	(5,1),
	(7,2);
               
select * from DEČKO;

insert into DEČKO (treći_puta,ogrlica,ekstrovertno)
	values  

	('2023-06-10',6,0),
	('2023-06-13',5,1),
	('2023-06-23',2,1);
               
select * from MUŠKARAC_DEČKO;
insert into MUŠKARAC_DEČKO(muškarac,dečko)
	values  

	(1,3),
	(2,2),
	(3,1);


select * from PRIJATELJICA;  

insert into PRIJATELJICA(Naušnica,introvertno)
	values  
	(5,0),
	(3,0),	
	(7,1);

select * from CURA;

insert intO CURA (Naušnica,ogrlica,prijateljica)
	values  
	(3,5,1),
	(1,4,2),
	(6,1,3);
        
update CURA set indiferentno=0;

select * from BRAT;

delete from BRAT where Novčića!='12.75';

select prvi_puta from bećar where Treći_puta is null;
	
