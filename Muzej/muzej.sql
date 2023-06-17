use master;
drop database if exists Muzej;
go
create database Muzej collate Croatian_CI_AS;
go
use Muzej;


create table SPONZOR (
    Šifra int not null primary key identity(1,1),
    Naziv varchar(100) not null,
    OIB char(11) null
);

create table IZLOŽBA (
    Šifra int not null primary key identity(1,1),
    Naziv varchar(100) not null,
    Datum_od datetime,
    Datum_do datetime,
	kustos int,
	sponzor int,
	djelo int
);


create table KUSTOS (
    Šifra int not null primary key identity(1,1),
    Ime varchar(50) not null,
    Prezime varchar(50) not null,
    OIB char(11) null
);

create table DJELO (
    Šifra int not null primary key identity(1,1),
    Naziv varchar(100) not null,
    Procjenjena_vrijednost decimal (18,2)
);
alter table IZLOŽBA add foreign key (KUSTOS) references kustos (šifra);
alter table IZLOŽBA add foreign key (SPONZOR) references sponzor (šifra);
alter table IZLOŽBA add foreign key (DJELO) references djelo (šifra);

insert into SPONZOR (Naziv, OIB) 
	values 
	('SAPONIA', '12345678910'),
    ('KANDIT', '12345678911'),
     ('ŽITO', '12345678912');

select * from SPONZOR;

insert into KUSTOS (Ime, Prezime, OIB) 
      values 
	  ('Pero', 'Perić', '12345678913'),
	  ('Marko', 'Marković', '12345678914'),
	  ('Iva', 'Ivić', '12345678915');

select * from KUSTOS;

insert into DJELO (Naziv, Procjenjena_vrijednost) 
	values 
	('Picasso', '185.30'),
	('Monet', '180.43'),
	('Rembrandt', '200.00');

select * From DJELO;

insert into IZLOŽBA (Naziv, Datum_od, Datum_do, kustos, sponzor, djelo) 
	values 
		('Picasso', '2023-05-28', '2023-08-28', 1, 2, 1),
		('Monet', '2023-08-28', '2023-11-28', 2, 1, 2),
		('Rembrandt', '2023-11-28', '2024-02-28', 3, 3, 3);

select * from IZLOŽBA;

update KUSTOS set prezime ='Petrović'
where šifra=1;

select * from KUSTOS;




