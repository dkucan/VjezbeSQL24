-- ovo je komentar i neæe se izvesti
use master;
drop database if exists ŽUPANIJE;
go
create database ŽUPANIJE collate Croatian_CI_AS;
go
use ŽUPANIJE;

create table ŽUPANIJA (

	Šifra int not null primary key identity(1,1),
	Naziv varchar(50) not null,
	Župan varchar(50) not null,
);
create table OPĆINA(

	Šifra int not null primary key identity(1,1),
	Županija int not null,
	Naziv varchar(50)
);
create table MJESTO(
	Šifra int not null primary key identity(1,1),
	Općina int not null,
	Naziv varchar(50) not null
);
create table ŽUPAN(

	Šifra int not null primary key identity(1,1),
	Ime varchar(50) not null,
	Prezime varchar(50) not null,
	Županija int
);
alter table OPĆINA add foreign key (ŽUPANIJA) references županija (šifra); 
alter table MJESTO add foreign key (OPĆINA) references općina (šifra);
alter table ŽUPAN add foreign key (ŽUPANIJA) references županija (šifra);

	insert into ŽUPANIJA (Naziv, Župan) 
		values 
			('Osječko_baranjska', 'Pero Perić'),
	        ('Primorsko_goranska', 'Đuro Đurić');

	insert into OPĆINA (Županija, Naziv) 
		values 
			    (1, 'Osijek'),
			   (2, 'Delnice'),
			   (1, 'Đakovo');

	insert into MJESTO (Općina, Naziv)
		values
			(1, 'Gorjani'),
			(1, 'Osijek'),
			(2,'Delnice');

	insert into ŽUPAN (Ime, Prezime, Županija) 
		values
		('Pero','Perić', 1),
		('Đuro', 'Đurić', 2);

	select * from ŽUPAN;

	update ŽUPANIJA set naziv='Virovitičko_podravska' where šifra=1;
    delete ŽUPAN where šifra=2;

	select * from ŽUPANIJA;
	select * from ŽUPAN;
	select * from OPĆINA;