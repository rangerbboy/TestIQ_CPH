create database WebIQ
use WebIQ

create table Users
(
	IDUser int identity(1,1) primary key,
	Hoten nvarchar(50) not null,
	Email nvarchar(50),
	SDT int,
	Namsinh int check (Namsinh > 1900 and Namsinh < 2018),
	Nghenghiep nvarchar(50),
	Sothich nvarchar(200)
)
drop table Tests
create table Tests
(
	MaTests varchar(20) primary key,
	TenTests nvarchar (50),
	SLcau int not null,
	Tgianlam int not null,
)
drop table Questions
create table Questions
(	
	MaCHoi varchar(8) primary key,
	MaTests varchar(20) foreign key references Tests(MaTests) not null,
	STT int,
	Noidung nvarchar(400) not null,
)

drop table Answers
create table Answers
(
	keys int identity(1,1) primary key,
	MaCHoi varchar(8) foreign key references Questions(MaCHoi) not null,
	DAchinhxac nvarchar(20),
	DAn1 nvarchar(200),
	DAn2 nvarchar(200),
	DAn3 nvarchar(200),
	DAn4 nvarchar(200),
	DAn5 nvarchar(200),
	DAn6 nvarchar(200),
)	

drop table Thanhtich
create table Thanhtich
(
	MaTTich int primary key,
	Diem float,
	Ngaylam datetime,
	TgianHT int,
	IDUser int foreign key references Users(IDUser) not null,
	MaTests varchar(20) foreign key references Tests(MaTests) not null,
)
drop table BXH
create table BXH
(
	STT int,
	MaTTich int foreign key references Thanhtich(MaTTich) not null,
)