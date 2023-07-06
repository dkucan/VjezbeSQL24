use master;
drop database if exists vježba_SQL_9;
go
create database vježba_SQL_9 collate Croatian_CI_AS;
go
use vježba_SQL_9;


create table OSTAVLJENA(
	Šifra int not null primary key identity(1,1),
	Model_naočala varchar(34) not null,
	Suknja varchar(32),
	Eura decimal(18,7) not null,
	Lipa decimal(15,7) not null,
	Treći_puta datetime not null,
	Drugi_puta datetime not null
);

create table SNAŠA(
	Šifra int not null primary key identity(1,1),
	Prstena int,
	Drugi_puta datetime not null,
	Haljina varchar(38) not null,
	Ostavljena int
);

create table PRIJATELJICA(
	Šifra int not null primary key identity(1,1),
	Treći_puta datetime,
	Novčića decimal(16,7),
	Kuna decimal(14,10) not null,
	Drugi_puta datetime,
	Haljina varchar(45),
	Kratka_majica varchar(49)
);

create table PUNAC(
	Šifra int not null primary key identity(1,1),
	narukvica int not null,
	model_naočala varchar(30),
	Kuna decimal(12,8),
	boja_očiju varchar(33),
	suknja varchar(45)
);

create table PUNAC_PRIJATELJICA(
	Šifra int not null primary key identity(1,1),
	punac int not null,
	prijateljica int not null
);

create table CURA(
	Šifra int not null primary key identity(1,1),
	vesta varchar(49) not null,
	ekstrovertno bit,
	čarape varchar(37),
	suknja varchar(37) not null,
	punac int not null
);

create table BRAT(
	Šifra int not null primary key identity(1,1),
	novčića decimal(18,9) not null,
	ekstrovertno bit,
	vesta varchar(32) not null,
	cura int 
);

create table ZARUČNIK(
	šifra int not null primary key identity(1,1),
	gustoća decimal(17,6),
	haljina varchar(40),
	kratka_majica varchar(48) not null,
	naušnica int not null,
	brat int not null
);

alter table SNAŠA add foreign key(OSTAVLJENA) references ostavljena(šifra);
alter table ZARUČNIK add foreign key(BRAT) references brat(šifra);
alter table BRAT add foreign key(CURA) references cura(šifra);
alter table CURA add foreign key(PUNAC) references punac(šifra);
alter table PUNAC_PRIJATELJICA add foreign key(PUNAC) references punac (šifra);
alter table PUNAC_PRIJATELJICA add foreign key(PRIJATELJICA) references prijateljica(šifra);


select * from PUNAC;
insert into PUNAC(narukvica)
values  
(5),
(2),
(4);

select * from CURA;
insert into CURA(vesta,suknja,punac)
values  
('Smeđa','Crvena',3),
('Crna','Bijela',2),
('Bijela','Žuta',1);
                 
select * from BRAT;
insert into BRAT(novčića,vesta,cura)
values  
(58.67,'Bijela',3),
(47.88,'Žuta',1),
(35.86,'Zelena',2);
              
select * from PRIJATELJICA;
insert into PRIJATELJICA(kuna)
values 
(28.67),
(99.99),
(88.88);

select * from PUNAC_PRIJATELJICA;
insert into PUNAC_PRIJATELJICA(punac,prijateljica)
values  
(3,2),
(1,3),
(2,1);


select * from OSTAVLJENA;
insert into OSTAVLJENA(model_naočala,eura,lipa,Treći_puta,drugi_puta)
values  
('Sunčane',425.25,158.22,'2023-04-24','2023-05-12'),
('Dioptrijske',322.53,182.15,'2023-06-13','2023-07-05'),
('Pepeljarke',80.35,52.22,'2023-05-14','2023-07-12');
        
select * from SNAŠA;
insert into SNAŠA(Drugi_puta,haljina,ostavljena)
values  
('2012-08-23','Crvena',3),
('2016-08-23','Bijela',1),
('2015-08-23','Plava',2);
        
update SNAŠA set Drugi_puta = '2020-04-24';


delete from ZARUČNIK where haljina='AB';


select čarape from cura where ekstrovertno is null;


select a.kuna , f.naušnica , e.ekstrovertno 
from PRIJATELJICA a
inner join PUNAC_PRIJATELJICA   b on a.Šifra      = b.prijateljica 
inner join PUNAC                c on b.punac      = c.Šifra
inner join CURA                 d on c.Šifra      = d.punac
inner join BRAT                 e on d.Šifra      = e.cura
inner join ZARUČNIK             f on e.Šifra      = f.brat
where d.ekstrovertno is not null and c.model_naočala like '%ba%'
order by e.ekstrovertno;

select	a.model_naočala , a.kuna 
from	PUNAC a left join PUNAC_PRIJATELJICA b on b.punac = a.Šifra 
where	b.punac is null; 