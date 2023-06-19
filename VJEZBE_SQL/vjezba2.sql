use master;
drop database if exists VJEŽBE_SQL_2;
go
create database VJEŽBE_SQL_2 collate Croatian_CI_AS;
go
use VJEŽBE_SQL_2;

create table SVEKAR(
    Šifra int primary key identity(1,1) not null,
	Stil_frizura varchar(48),
	Ogrlica int not null,
	Asocijalno bit not null
);

create table PRIJATELJ(
	Šifra int primary key identity(1,1) not null,
	Model_naočala varchar(37),
	Treći_puta datetime not null,
	Ekstrovertno bit not null,
	Prvi_puta datetime,
	Svekar int not null
);

create table DEČKO(
	Šifra int Primary key identity(1,1) not null,
	Indiferentno bit,
	Vesta varchar(34),
	Asocijalno bit not null
);

create table ZARUČNICA (
	Šifra int primary key identity(1,1) not null,
	Narukvica int,
	Boja_kose varchar(37) not null,
	Novčića decimal(15,9),
	Lipa decimal(15,8) not null,
	Indiferentno bit not null
);

create table DEČKO_ZARUČNICA(
	Šifra int primary key identity(1,1) not null,
	Dečko int not null,
	Zaručnica int not null
);

create table CURA(
	šifra int primary key identity(1,1) not null,
	haljina varchar(33) not null,
	Drugi_puta datetime not null,
	Suknja varchar(38),
	Narukvica int,
	introvertno bit,
	Majica varchar(40) not null,
	Dečko int
);

create table NEPRIJATELJ (
	Šifra int primary key identity(1,1) not null,
	Majica varchar(32),
	Haljina varchar(43) not null,
	Lipa decimal(16,8),
	Model_naočala varchar(49) not null,
	Kuna decimal(12,6) not null,
	Jmbag char(11),
	Cura int 
);

create table BRAT(
	Šifra int primary key identity(1,1) not null,
	Suknja varchar(47),
	Ogrlica int not null,
	Asocijalno bit not null,
	Neprijatelj int not null
);

alter table CURA add foreign key (DEČKO) references dečko (šifra);
alter table NEPRIJATELJ add foreign key (CURA) references cura (šifra);
alter table BRAT add foreign key (NEPRIJATELJ) references neprijatelj (šifra);
alter table PRIJATELJ add foreign key (SVEKAR) references svekar (šifra);
alter table DEČKO_ZARUČNICA add foreign key (DEČKO) references dečko (šifra);
alter table DEČKO_ZARUČNICA add foreign key (ZARUČNICA) references zaručnica (šifra);


	select * from ZARUČNICA;

	insert into ZARUČNICA (Boja_kose, lipa, Indiferentno) 
		values
			('crvena', '40.37', '0'),
			('plava', '39.99', '0'),
			('smeđa', '42.99', '0');

	select * from DEČKO;

		insert into DEČKO (Indiferentno, Vesta, Asocijalno)
			values
				('1', 'Smeđa pamučna', '0'),
				('0', 'Crna pamučna', '1'),
				('0', 'Bijela pamučna', 0);
	
	select * from DEČKO_ZARUČNICA;
	
	insert into DEČKO_ZARUČNICA (dečko, zaručnica) 
		values
			(1,1),
			(2,2),
			(3,3);
		
		select * from CURA;

		insert into CURA (Haljina, Drugi_puta, Suknja, Narukvica, Introvertno, Majica, Dečko)
			values
				('kratka', '2023-04-24', 'kratka', 1, 0, 'kratka', 1),
				('kratka', '2023-04-24', 'dugačka', 2,0, 'dugačka', 2 ),
				('dugačka', '2023-04-24', 'kratka', 1, 0, 'kratka', 3 );

		select * from NEPRIJATELJ;
		
		insert into NEPRIJATELJ (Majica, Haljina, Model_naočala, Kuna, Jmbag, Cura)
			values
				('široka', 'kratka', 'kockaste', '80.99', '11121314156', 1),
				('kratka', 'dugačka', 'okrugle', '105.50', '12131415167', 2),
				('kratka', 'kratka_lepršava', 'pravokutne', '99.99', '13141516178', 3);

		select * from BRAT;

		insert into BRAT (Suknja,Ogrlica,Asocijalno,Neprijatelj)
	values
			('Škotski_kilt','6','0',1),
			('Bijelo_crveniHR kilt', '2', '0', 2),
			('Kratka traper suknja', '3', '0', 3);

			select * from SVEKAR

		insert into SVEKAR (Stil_frizura, Ogrlica, asocijalno)
			values
				('kratka kosa', '1', '0'),
				('duga kosa sa repom', '2', 0);


	update PRIJATELJ set Treći_puta='2020-04-30';
	delete from BRAT where Ogrlica<>'14';
	select SUKNJA from CURA where Drugi_puta is null;


select a. novčića, f.neprijatelj, e.haljina
from ZARUČNICA a 
inner join DEČKO_ZARUČNICA b	on b.zaručnica=a.Šifra
inner join DEČKO c				on c.Šifra=b.Dečko
inner join CURA d				on d.dečko=c.šifra
inner join NEPRIJATELJ e		on e.cura=d.šifra
inner join BRAT f			    on f.Neprijatelj=e.Šifra
where d.Drugi_puta is not null and c.Vesta like '%ba%'
order by e.Haljina desc;


select distinct dečko.vesta, dečko.Asocijalno from DEČKO where Šifra not in (select šifra from DEČKO_ZARUČNICA);