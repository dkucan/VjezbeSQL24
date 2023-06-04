use master;
drop database if exists KUD;
go
create database KUD collate Croatian_CI_AS;
go
use KUD;

create table CLAN (
    SIFRA int primary key identity (1, 1) not null,
    IME varchar(20) not null,
    PREZIME varchar(20) not null
);

create table NASTUP (
    SIFRA int primary key identity (1, 1) not null,
    DATUM datetime null,
    MJESTO int not null
	);

create table MJESTO (
    SIFRA int primary key identity (1, 1) not null,
    NAZIV varchar(50) not null
);


create table CLAN_NASTUP (
    Clan int not null,
    Nastup int not null
);

alter table CLAN_NASTUP add foreign key (CLAN) references clan (sifra);
alter table CLAN_NASTUP add foreign key (NASTUP) references nastup (sifra);
alter table NASTUP add foreign key (MJESTO) references mjesto (sifra);

