-- ovo je komentar i neæe se izvesti
use master;
drop database if exists ZUPANIJE;
go
create database ZUPANIJE;
go
use ZUPANIJE;
create table ZUPANIJA(
	sifra int not null primary key identity(1,1),
	naziv varchar(50) not null,
	zupan varchar(50) not null,
);
create table OPCINA(
	sifra int not null primary key identity(1,1),
	zupanija int not null,
	naziv varchar(50)
);
create table MJESTO(
	sifra int not null primary key identity(1,1),
	opcina int not null,
	naziv varchar(50) not null
);
create table ZUPAN(
	sifra int not null primary key identity(1,1),
	Ime varchar(50) not null,
	Prezime varchar(50) not null
);
alter table OPCINA add foreign key (ZUPANIJA) references zupanija (sifra); 
alter table MJESTO add foreign key (OPCINA) references opcina (sifra);
alter table ZUPAN add foreign key (ZUPANIJA) references zupanija (sifra);

