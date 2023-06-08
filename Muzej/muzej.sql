use master;
drop database if exists Muzej;
go
create database Muzej collate Croatian_CI_AS;
go
use Muzej;


create table SPONZOR (
    Sifra int not null primary key identity(1,1),
    Naziv varchar(100) not null,
    OIB char(11) null
);

create table IZLOZBA (
    Sifra int not null primary key identity(1,1),
    Naziv varchar(100) not null,
    Datum_od datetime,
    Datum_do datetime,
	kustos int,
	sponzor int,
	djelo int
);


create table KUSTOS (
    Sifra int not null primary key identity(1,1),
    Ime varchar(50) not null,
    Prezime varchar(50) not null,
    OIB char(11) null
);

create table DJELO (
    Sifra int not null primary key identity(1,1),
    Naziv varchar(100) not null,
    Procjenjena_vrijednost decimal (18,2)
);
alter table IZLOZBA add foreign key (KUSTOS) references kustos (sifra);
alter table IZLOZBA add foreign key (SPONZOR) references sponzor (sifra);
alter table IZLOZBA add foreign key (DJELO) references djelo (sifra);

insert into SPONZOR (Naziv, OIB) values ('SAPONIA', '12345678910');
insert into SPONZOR (Naziv, OIB) values ('KANDIT', '12345678911');
insert into SPONZOR (Naziv, OIB) values ('ZITO', '12345678912');

select * from SPONZOR;

insert into KUSTOS (Ime, Prezime, OIB) values ('Pero', 'Perić', '12345678913');
insert into KUSTOS (Ime, Prezime, OIB) values ('Marko', 'Marković', '12345678914');
insert into KUSTOS (Ime, Prezime, OIB) values ('Iva', 'Ivić', '12345678915');

select * from KUSTOS;

insert into DJELO (Naziv, Procjenjena_vrijednost) values ('Picasso', '185.30');
insert into DJELO (Naziv, Procjenjena_vrijednost) values ('Monet', '180.43');
insert into DJELO (nAZIV, Procjenjena_vrijednost) values ('Rembrandt', '200.00');

select * From DJELO;

insert into IZLOZBA (Naziv, Datum_od, Datum_do, kustos, sponzor, djelo) values ('Picasso', '2023-05-28', '2023-08-28', 1, 2, 1);
insert into IZLOZBA (Naziv, Datum_od, Datum_do, kustos, sponzor, djelo) values ('Monet', '2023-08-28', '2023-11-28', 2, 1, 2);
insert into IZLOZBA (Naziv, Datum_od, Datum_do, kustos, sponzor, djelo) values ('Rembrandt', '2023-11-28', '2024-02-28', 3, 3, 3);

select * from IZLOZBA;

update KUSTOS set prezime ='Petrovic'
where sifra=1;

select * from KUSTOS;




