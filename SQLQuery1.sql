create database lab1;
use lab1;

create table NhanVien(
	HoNV varchar(7) not null,
	TenLot varchar(20) not null,
	TenNV varchar(10),
	MaNV varchar(7) primary key not null,
	NgaySinh date,
	DiaChi varchar(250),
	Phai varchar(3),
	Luong int ,
	Ma_NQL varchar(10),
	PHG int
);
create table PhongBan(
	TenPHG varchar(20),
	MaPHG varchar(7) primary key not null,
	TRPHG varchar(20),
	Ng_NhanChuc varchar(10),
	foreign key (MaPHG) references NhanVien(MaNV)
);

