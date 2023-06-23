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
Treći_puta datetime not null
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
