-- ovo je komentar i neæe se izvesti
use master;
drop database if exists ZUPANIJE;
go
create database ZUPANIJE;
go
use ZUPANIJE;
create table ZUPANIJA(
	Sifra int not null primary key identity(1,1),
	Naziv varchar(50) not null,
	Zupan varchar(50) not null,
);
create table OPCINA(
	sifra int not null primary key identity(1,1),
	Zupanija int not null,
	Naziv varchar(50)
);
create table MJESTO(
	Sifra int not null primary key identity(1,1),
	Opcina int not null,
	Naziv varchar(50) not null
);
create table ZUPAN(
	Sifra int not null primary key identity(1,1),
	Ime varchar(50) not null,
	Prezime varchar(50) not null,
	Zupanija int
);
alter table OPCINA add foreign key (ZUPANIJA) references zupanija (sifra); 
alter table MJESTO add foreign key (OPCINA) references opcina (sifra);
alter table ZUPAN add foreign key (ZUPANIJA) references zupanija (sifra);

	insert into ZUPANIJA (Naziv, Zupan) values ('Osjecko_baranjska', 'Pero Peric');
	insert into ZUPANIJA (Naziv, Zupan) values ('Primorsko_goranska', 'Djuro Djuric');

	insert into OPCINA (Zupanija, Naziv) values ('1', 'Osijek');
	insert into OPCINA (Zupanija, Naziv) values ('2', 'Delnice');
	insert into OPCINA (Zupanija, Naziv) values ('1', 'Djakovo');

