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

INSERT INTO NHANVIEN VALUES ('trần','quốc','thuận','ps31471','2004-03-17','long an','nam','20000','001','1'),
							('nguyễn','văn','phúc','ps31472','2004-03-18','tp hcm','nam','30000','002','2'),
							('lê','thanh','trúc','ps31473','2004-03-19','đà lạt','nữ','40000','003','3'),
							('ngô','văn','nam','ps31474','2004-03-15','lâm đồng','nam','50000','004','4'),
							('đinh','ba','tiên','ps31475','2004-03-13','tiền giang','nam','60000','005','5');

INSERT INTO PHONGBAN VALUES ('phong1','ps31471','tp1','2023-03-17'),
							('phong2','ps31472','tp2','2023-04-18'),
							('phong3','ps31473','tp3','2023-05-19'),
							('phong4','ps31474','tp4','2023-06-15'),
							('phong5','ps31475','tp5','2023-07-13');


select *
from NhanVien
where PHG = 4;

select *
from NhanVien
where luong >30000;

select *
from NhanVien
where Luong > 25000 
and PHG = 4
or Luong > 30000
and PHG = 5;

select CONCAT(HoNV,' ',TenLot,' ',TenNV) as 'Họ Tên'
from NhanVien
where DiaChi like '%tp hcm%';

select CONCAT(HoNV,' ',TenLot,' ',TenNV) as 'Họ Tên'
from NhanVien
where HoNV like 'n%';

select NgaySinh, DiaChi
from NhanVien
where HoNV like 'đinh%';