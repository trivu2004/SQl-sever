use master
create database lab2;
use lab2;

create table NhanVien(
	HoNV nvarchar(15) null,
	TenLot nvarchar(15) null,
	TenNV nvarchar(15) null,
	MaNV nvarchar(9) not null primary key,
	NgSinh date null,
	DChi nvarchar(45) null,
	Phai nvarchar(3) null,
	Luong float(10) null,
	Ma_NQl nvarchar(9) null,
	PHG int null,
);

create table PhongBan(
	TenPHG nvarchar(15) null,
	MaPHG int not null primary key,
	TrPHG nvarchar(9) null,
	NG_NhanChuc date null,
);

create table DiaDiem_PHG(
	DiaDiem nvarchar(15) not null,
	MaPHG int not null,
	primary key (DiaDiem,MaPHG)
);

create table ThanNhan(
	Ma_NVien nvarchar(9)not null,
	TenTN nvarchar(15) not null,
	Phai nvarchar(3) null,
	NgSinh date null,
	QuanHe nvarchar(15) null,
	primary key(Ma_NVien,TenTN),
);

create table DeAn(
	TenDA nvarchar(15) null,
	MaDA int not null primary key,
	DDiem_DA nvarchar(15) null,
	Phong int null,
);

create table CongViec(
	MaDA int not null,
	STT int not null,
	TenCongViec nvarchar(50) null,
	primary key(MaDA,STT),
);

create table PhanCong(
	Ma_NV nvarchar(9) not null,
	MaDA int not null,
	STT int not null,
	ThoiGian int not null,
	primary key(Ma_NV,MaDA,STT),
);


insert into NhanVien values (N'Đinh',N'Bá','Tiên','009','1960/02/11',N'119 Cống Quỳnh, TP.HCM','Nam','30000','005',5),
							(N'Nguyễn',N'Thanh','Tùng','005','1962/08/20',N'222 Nguyễn Văn Cừ, TP.HCM','Nam','40000','006',5),
							(N'Bùi',N'Ngọc','Hằng','007','1954/03/11',N'332 Nguyễn Thái Học, TP.HCM','Nam','25000','001',4),
							(N'Lê',N'Quỳnh','Như','001','1967/02/01',N'291 Hồ Văn Huê, TP.HCM',N'Nữ','43000','006',4),
							(N'Nguyễn',N'Mạnh','Hùng','004','1967/03/04',N'95 Bà Rịa, Vũng Tàu','Nam','38000','005',5),
							(N'Trần',N'Thanh','Tâm','003','1957/05/04',N'34 Mai Thị Lự, TP.HCM','Nam','25000','005',5),
							(N'Trần',N'Hồng','Quang','008','1967/09/01',N'80 Lê Hồng Phong, TP.HCM','Nam','25000','001',4),
							(N'Phạm',N'Văn','Vinh','006','1965/01/01',N'45 Trưng Vương, Hà Nội',N'Nữ','55000',null,1);

insert into PhongBan values('Nghiên cứu',5,'005','1978/05/22'),
						   ('Điều hành',4,'008','1985/01/01'),
						   ('Quản lý',1,'006','1971/06/19');

insert into DiaDiem_PHG values('TP HCM',1),
							  ('Hà Nội',4),
							  ('TAU',5),
							  ('NHA TRANG',5),
							  ('TP HCM',5);

insert into ThanNhan values('005',N'Trinh',N'Nữ','1976/04/05',N'Con gái'),
						   ('005',N'Khang','Nam','1973/10/25','Con Trai'),
						   ('005',N'Phương',N'Nữ','1948/05/03',N'Vợ Chồng'),
						   ('001',N'Minh','Nam','1932/02/29',N'Vợ Chồng'),
						   ('009',N'Tiến','Nam','1978/01/01',N'Con Trai'),
						   ('009',N'Châu',N'Nữ','1978/12/30',N'Con gái'),
						   ('009',N'Phương',N'Nữ','1957/05/05',N'Vợ Chồng');

insert into DeAn values(N'Sản Phẩm X',1,N'Vũng Tàu',5),
					   (N'Sản Phẩm Y',2,N'Nha Trang',5),
					   (N'Sản Phẩm Z',3,N'TP HCM',5),
					   (N'Tin học hóa',10,N'Hà Nội',4),
					   (N'Cáp Quang',20,N'TP HCM',1),
					   (N'Đào Tạo',30,N'Hà Nội',4);

insert into CongViec values(1,1,N'Thiết kế sản phẩm X'),
						   (1,2,N'Thử nghiệm sản phẩm X'),
						   (2,1,N'Sản xuất sản phẩm Y'),
						   (2,2,N'Quảng cáo sản phẩm Y'),
						   (3,1,N'Khuyễn mãi sản phẩm Z'),
						   (10,1,N'Tin học hóa phòng nhân sự'),
						   (10,2,N'Tin học hóa phòng kinh doanh'),
						   (20,1,N'Láp đặt cáp quang'),
						   (30,1,N'Đào tạo nhân viên Maketing'),
						   (30,2,N'Đào tạo nhân viên thiết kế');

insert into PhanCong values('009',1,1,32),
						   ('009',2,2,8),
						   ('004',3,1,40),
						   ('003',1,2,20.0),
						   ('003',2,1,20.0),
						   ('008',10,1,35),
						   ('008',30,2,5),
						   ('001',30,1,20),
						   ('001',20,1,15),
						   ('006',20,1,30),
						   ('005',3,1,10),
						   ('005',10,2,10),
						   ('005',20,1,10),
						   ('007',30,2,30),
						   ('007',10,2,10);

alter table NhanVien add foreign key (PHG) references PhongBan(MaPHG),
						 foreign key (Ma_NQl) references NhanVien(MaNV);

alter table PhongBan add foreign key (TrPHG) references NhanVien(MaNV);

alter table DiaDiem_PHG add foreign key (MaPHG) references PhongBan(MaPHG);

alter table ThanNhan add foreign key (Ma_NVien) references NhanVien(MaNV);

alter table DeAn add foreign key (Phong) references PhongBan(MaPHG);

alter table CongViec add foreign key (MaDA) references DeAn(MaDA);

alter table PhanCong add foreign key (Ma_NV) references NhanVien(MaNV),
						 foreign key (MaDA,STT) references CongViec(MaDA,STT);
						 
select *
from NhanVien;


select *
from PhongBan;

select sum(nv.MaNV)
from PhongBan as pb inner join NhanVien as nv
on pb.MaPHG = nv.MaNV;

declare @chieudai int,@chieurong int,@dientich int,@chuvi int
set @chieudai = 10 -- gán cho bien chiều dài = 10
set @chieurong = 6 -- gán cho bien chieu rông = 6
set @dientich = @chieudai*@chieurong -- tính giá trị của diện tích
print 'Dien tich la' +convert(char(10),@dientich);
select @dientich
set @chuvi = (@chieudai+@chieurong)*2
print 'Chu vi la' +convert(char(10),@chuvi);
select @chuvi

declare @Max_luong int
set @Max_luong = (select MAX(Luong) from NhanVien
);
select * 
from NhanVien
where Luong = @Max_luong;


select *
from NhanVien
where Luong > (select AVG(Luong)
from NhanVien as nv inner join PhongBan as pb
on nv.PHG = pb.MaPHG
where pb.TenPHG = N'Nghiên cứu')
GO

declare @luong_trungbinh int
set @luong_trungbinh = (select AVG(Luong)
from NhanVien as nv inner join PhongBan as pb
on nv.PHG = pb.MaPHG
where pb.TenPHG = N'Nghiên cứu');	
select *
from NhanVien
where Luong > @luong_trungbinh


declare @soluong_trungbinh int
set @soluong_trungbinh = (select sum(MaDA)
from DeAn as da inner join PhongBan as pb
on da.MaDA = pb.MaPHG
where pb.TenPHG = N'Nghiên cứu');	
select *
from DeAn
where Phong = 5;

declare @SoThanNhan int
set @SoThanNhan = (select count(Ma_NVien) as 'SoThanNhan'
from ThanNhan);
select *
from ThanNhan
where Ma_NVien = '005';

use master
drop database lab2

declare @chuvi float ,@bankinh float
set @bankinh = 15
set @chuvi = @bankinh*3.14*2
print 'Chu vi là:' +convert(char(10),@chuvi);
select @chuvi

-- 3. Với các phòng ban có mức lương trung bình trên 30,000, liệt kê tên phòng ban và số lượng nhân viên của phòng ban đó.
Declare @TrungBinh table(TENPB nvarchar(20), SOLUONG int, LUONGTB int)
insert into @TrungBinh
select TenPHG, COUNT(MaNV) as 'Số Lượng', AVG(Luong) as'Lương Trung Bình'
from NhanVien inner join PhongBan
on NHANVIEN.PHG = PHONGBAN.MAPHG
group by TENPHG
having AVG(LUONG) > 30000   
Select * from @TrungBinh

--4. Với mỗi phòng ban, cho biết tên phòng ban và số lượng đề án mà phòng ban đó chủ trì
Declare @SoLuong table(TENPB nvarchar(20), LOLUONG int )
insert into @SoLuong
Select TENPHG ,
COUNT(MADA) as'Số lượng' 
from DEAN
inner join PHONGBAN on PHONGBAN.MAPHG = DEAN.PHONG   
group by PHONG,TENPHG
Select * from @SoLuong
