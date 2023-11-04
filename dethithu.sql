create database PS31493_QuanLyDatHang
drop database PS31493_QuanLyDatHang

create table KhachHang(
	MaKH varchar(3) primary key	not null,
	HoTenKH	 varchar(50) not null,
	DiaChi varchar(50) not  null
);

create table DonDatHang(
	SoDH varchar(4) primary key not null,
	NgayDat datetime not null,
	MaKH varchar(3) not null
);
create table CTDatHang(
	SoDH varchar(4) not null,
	MaSP varchar(5) not null,
	SoLuong int not null,
	DonGia money not null,
	primary key(SoDH,MaSP)
);

alter table DonDatHang add foreign key (MaKH) references KhachHang(MaKH);

alter table CTDatHang add foreign key (SoDH) references DonDatHang(SoDH);

insert into KhachHang values('A01',N'Trần Thị Phương Trang',N'111 Nguyễn Trãi'),
							('A02',N'Lê Thu Thủy',N'222 Lê Lợi'),
							('A03',N'Trần Quốc Thái',N'220 Trần Quốc Thảo'),
							('A04',N'Đỗ Thị Mộng Thu',N'18 Lê Hồng Phong'),
							('A05',N'Lê Ngô Minh Tâm',N'255 Trần Hưng Đạo');

insert into DonDatHang values('D001','2007-2-15','A01'),
							('D002','2007-2-20','A02'),
							('D003','2007-2-3','A01');


insert into CTDatHang values('D001','JAC02','1','1200000'),
							('D001','SMN01','2','180000'),
							('D001','VES01','1','700000'),
							('D002','QTY02','1','150000'),
							('D002','SMN01','2','180000');


create view Bai2_1
as
	select MaKH,HoTenKH,DiaChi from KhachHang

select * from Bai2_1

insert into KhachHang values('A06',N'Trần Thị Phương Thủy',N'223 Lê Thánh Tông');

create view Bai2_2 
as
	select khachhang.MaKH,HoTenKH,DiaChi from KhachHang join DonDatHang
	on KhachHang.MaKH = DonDatHang.MaKH
	where MONTH(NgayDat) = 2 and YEAR(NgayDat) = 2007;

select * from Bai2_2

alter function Bai2_3(@makh nvarchar(3))
returns int
as
begin
	declare @i int
	select @i = count(*) from DonDatHang
	where MaKH = @makh
	return @i
end

select dbo.Bai2_3('A02')

CREATE PROCEDURE Bai2_4
AS
BEGIN
    SELECT DonDatHang.SoDH, DonDatHang.NgayDat, KhachHang.HoTenKH,KhachHang.MaKH,
           dbo.Bai2_3(KhachHang.Makh) AS TongSoLanDatHang,
           SUM(CTDatHang.SoLuong * CTDatHang.DonGia) AS TongThanhTien
    FROM DonDatHang JOIN KhachHang ON DonDatHang.Makh = KhachHang.Makh
                 JOIN CTDatHang ON DonDatHang.SoDH = CTDatHang.SoDH
    GROUP BY DonDatHang.SoDH, DonDatHang.NgayDat, KhachHang.HoTenKH,KhachHang.MaKH;
END;

exec Bai2_4

alter PROCEDURE Bai2_5
    @Masp varchar(5)
AS
BEGIN
    UPDATE CTDatHang SET DonGia = DonGia * 0.9 WHERE MaSP = @MaSP;
END;

exec Bai2_5 'SMN01'