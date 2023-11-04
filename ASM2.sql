create database QuanLyNhaTro_PS31493;
use QuanLyNhaTro_PS31493;
drop database QuanLyNhaTro_PS31493;
CREATE TABLE LOAINHA (
    MaLN INT PRIMARY KEY,
    TenLN NVARCHAR(50) NOT NULL
);

CREATE TABLE NGUOIDUNG (
    MaND INT PRIMARY KEY,
    TenND NVARCHAR(50) NOT NULL,
    Gioitinh NVARCHAR(10) NOT NULL CHECK (Gioitinh IN ('Nam', N'Nữ')),
    SDT int NOT NULL,
    DiaChi NVARCHAR(150) NOT NULL,
    Quan NVARCHAR(50) NOT NULL,
    Email NVARCHAR(50) NOT NULL
);
CREATE TABLE NHATRO (
    MaNT INT PRIMARY KEY,
    MaLN INT NOT NULL,
    DienTich FLOAT NOT NULL CHECK (DienTich >= 0),
    Giaphong FLOAT NOT NULL,
    DiaChi NVARCHAR(150) NOT NULL,
    Quan NVARCHAR(50) NOT NULL,
    MoTa NVARCHAR(MAX) NOT NULL,
    Ngaydang DATE NOT NULL,
    NguoiLH INT NOT NULL,
    FOREIGN KEY (MaLN) REFERENCES LOAINHA(MaLN),
    FOREIGN KEY (NguoiLH) REFERENCES NGUOIDUNG(MaND)
);
CREATE TABLE DANHGIA (
    ID INT PRIMARY KEY,
    NguoiDG INT NOT NULL,
    MaNT INT NOT NULL,
    Danhgia BIT NOT NULL CHECK (Danhgia IN (0, 1)),
    NoidungDG NVARCHAR(MAX) NOT NULL,
    FOREIGN KEY (NguoiDG) REFERENCES NGUOIDUNG(MaND),
    FOREIGN KEY (MaNT) REFERENCES NHATRO(MaNT)
);
INSERT INTO LOAINHA (MaLN, TenLN) VALUES
(1, N'Phòng trọ'),
(2, N'Chung cư mini'),
(3, N'Nhà nguyên căn');
INSERT INTO NGUOIDUNG (MaND, TenND, Gioitinh, SDT, DiaChi, Quan, Email) VALUES
(17, N'Nguyễn Đỗ Hoàng Vũ', 'Nam', '0987654321', N'123 Đường A', N'Quận 1', 'nguyendohoangvu@gmail.com'),
(18, N'Nguyễn Đỗ Hoàng Vũ', 'Nam', '0987654321', N'123 Đường A', N'Quận 1', 'nguyendohoangvu@gmail.com'),
(19, N'Nguyễn Đỗ Hoàng Vũ', 'Nam', '0987654321', N'123 Đường A', N'Quận 1', 'nguyendohoangvu@gmail.com'),
(20, N'Nguyễn Đỗ Hoàng Vũ', 'Nam', '0987654321', N'123 Đường A', N'Quận 1', 'nguyendohoangvu@gmail.com'),
(1, N'Nguyễn Đỗ Hoàng Vũ', 'Nam', '0987654321', N'123 Đường A', N'Quận 1', 'nguyendohoangvu@gmail.com'),
(2, N'Nguyễn Ngọc Thảo Vy', N'Nữ', '0123456789', N'456 Đường B', N'Quận 2', 'nguyenngocthaovy@gmail.com'),
(3, N'Trần Văn Đốc', 'Nam', '0901234567', N'789 Đường C', N'Quận 3', 'tranvandoc@gmail.com'),
(4, N'Nguyễn Ngọc Kim Uyên', N'Nữ', '0912345678', N'321 Đường D', N'Quận 4', 'nguyenngockimuyend@gmail.com'),
(5, N'Lã Minh Đức', 'Nam', '0987654321', N'654 Đường E', N'Quận 5', 'laminhduc@gmail.com'),
(6, N'Nguyễn Huỳnh Mai Trâm', N'Nữ', '0123456789', N'879 Đường F', N'Quận 6', 'nguyenhuynhmaitram@gmail.com'),
(7, N'Phạm Tuấn Anh', 'Nam', '0901234567', N'246 Đường G', N'Quận 7', 'phamtuananh@gmail.com'),
(8, N'Đặng Thùy Phương Uyên', N'Nữ', '0912345678', N'357 Đường H', N'Quận 8', 'dangthuyphuonguyen@gmail.com'),
(9, N'Nguyễn Lê Hoàng Như', 'Nam', '0987654321', N'468 Đường I', N'Quận 9', 'nguyenlehoangnhu@gmail.com'),
(10, N'Đinh Ngọc Bảo Trân', N'Nữ', '0123456789', N'579 Đường K', N'Quận 10', 'dinhngocbaotran@gmail.com'),
(11, N'Đinh Ngọc Bảo Hân', N'Nữ', '0128569489', N'579 Đường H', N'Quận 12', 'dinhngocbaohan@gmail.com'),
(12, N'Đinh Ngọc Bảo Trúc', N'Nữ', '01312465213', N'579 Đường L', N'Quận 7', 'dinhngocbaotruc@gmail.com'),
(13, N'Đinh Ngọc Linh', N'Nữ', '0135633114', N'579 Đường Số 3', N'Quận 8', 'dinhngoclinh@gmail.com'),
(14, N'Đinh Ngọc Ngân', N'Nữ', '0156956995', N'579 Đường Số 2', N'Quận 7', 'dinhngocngan@gmail.com'),
(15, N'Đinh Ngọc Mai', N'Nữ', '0135684112', N'579 Đường Số 4', N'Quận 7', 'dinhngocmai@gmail.com');
INSERT INTO NHATRO (MaNT, MaLN, DienTich, Giaphong, DiaChi, Quan, MoTa, Ngaydang, NguoiLH) VALUES
(1, 1, 30, 3000000, N'456 Đường B', N'Quận 2', N'Chung cư mini cao cấp, gần trung tâm thành phố', '2023-05-02', 1),
(17, 1, 20, 2000000, N'123 Đường A', N'Quận 1', N'Phòng trọ mới xây, có sẵn đầy đủ tiện nghi', '2020-01-01', 17),
(18, 1, 20, 2000000, N'123 Đường A', N'Quận 1', N'Phòng trọ mới xây, có sẵn đầy đủ tiện nghi', '2020-01-05', 18),
(19, 1, 20, 2000000, N'123 Đường A', N'Quận 1', N'Phòng trọ mới xây, có sẵn đầy đủ tiện nghi', '2020-01-10', 19),
(20, 1, 20, 2000000, N'123 Đường A', N'Quận 1', N'Phòng trọ mới xây, có sẵn đầy đủ tiện nghi', '2020-01-20', 20),
(2, 2, 30, 3000000, N'456 Đường B', N'Quận 2', N'Chung cư mini cao cấp, gần trung tâm thành phố', '2023-05-02', 2),
(3, 3, 50, 5000000, N'789 Đường C', N'Quận 3', N'Nhà nguyên căn rộng rãi, có sân vườn', '2023-05-03', 3),
(4, 1, 25, 2500000, N'321 Đường D', N'Quận 4', N'Phòng trọ sạch sẽ, thoáng mát', '2023-05-04', 4),
(5, 2, 35, 3500000, N'654 Đường E', N'Quận 5', N'Chung cư mini tiện nghi, view đẹp', '2023-05-05', 5),
(6, 3, 55, 5500000, N'879 Đường F', N'Quận 6', N'Nhà nguyên căn yên tĩnh, an ninh', '2023-05-06', 6),
(7, 1, 30, 3000000, N'246 Đường G', N'Quận 7', N'Phòng trọ gần trung tâm, thuận tiện đi lại', '2023-05-07', 7),
(8, 2, 40, 4000000, N'357 Đường H', N'Quận 8', N'Chung cư mini mới xây, đầy đủ tiện nghi', '2023-05-08', 8),
(9, 3, 60, 6000000, N'468 Đường I', N'Quận 9', N'Nhà nguyên căn rộng rãi, có view đẹp', '2023-05-09', 9),
(10, 1, 35, 3500000, N'579 Đường K', N'Quận 10', N'Phòng trọ sạch sẽ, an ninh tốt', '2023-05-10', 10),
(11, 1, 85, 6500000, N'579 Đường O', N'Quận 10', N'Nhà nguyên căn rộng rãi, có view đẹp', '2023-05-10', 11),
(12, 1, 35, 7500000, N'579 Đường A', N'Quận 10', N'Phòng trọ sạch sẽ, an ninh tốt', '2023-05-10', 12),
(13, 1, 35, 8500000, N'579 Đường B', N'Quận 10', N'Nhà nguyên căn rộng rãi, có view đẹp', '2023-05-10', 13),
(14, 1, 35, 9500000, N'579 Đường E', N'Quận 10', N'Phòng trọ sạch sẽ, an ninh tốt', '2023-05-10', 14),
(15, 1, 35, 9500000, N'579 Đường E', N'Quận 10', N'Phòng trọ sạch sẽ, an ninh tốt', '2023-05-10', 15);

INSERT INTO DANHGIA (ID, NguoiDG, MaNT, Danhgia, NoidungDG) VALUES
(1, 1, 1, 1, N'Phòng trọ rất tốt, sạch sẽ và thoáng mát'),
(21, 1, 1, 0, N'Phòng trọ rất tốt, sạch sẽ và thoáng mát'),
(22, 1, 1, 0, N'Phòng trọ rất tốt, sạch sẽ và thoáng mát'),
(23, 1, 1, 0, N'Phòng trọ rất tốt, sạch sẽ và thoáng mát'),
(24, 1, 1, 0, N'Phòng trọ rất tốt, sạch sẽ và thoáng mát'),
(25, 1, 1, 0, N'Phòng trọ rất tốt, sạch sẽ và thoáng mát'),
(17, 1, 1, 1, N'Phòng trọ rất tốt, sạch sẽ và thoáng mát'),
(2, 2, 2, 0, N'Không hài lòng về chất lượng dịch vụ'),
(3, 3, 3, 1, N'Nhà nguyên căn rộng rãi, giá cả hợp lý'),
(4, 4, 4, 1, N'Phòng trọ ở vị trí thuận tiện, gần chợ'),
(5, 5, 5, 0, N'Không thích cách bài trí trong căn hộ'),
(6, 6, 6, 1, N'Nhà nguyên căn yên tĩnh, phù hợp cho gia đình nhỏ'),
(7, 7, 7, 1, N'Phòng trọ sạch sẽ, chủ nhà thân thiện'),
(8, 8, 8, 0, N'Không hài lòng về chất lượng đồ nội thất trong căn hộ'),
(9, 9, 9, 1, N'Nhà nguyên căn có view đẹp, thoáng mát'),
(10, 10, 10, 1, N'Phòng trọ sạch sẽ, an ninh tốt'),
(11,11,11, 0, N'Không hài lòng về chất lượng đồ nội thất trong căn hộ'),
(12,12,12, 1, N'Nhà nguyên căn có view đẹp, thoáng mát'),
(13,13,13, 1, N'Phòng trọ sạch sẽ, an ninh tốt'),
(14,14,14, 0, N'Nhà nguyên căn có view đẹp, thoáng mát'),
(15,15,15, 0, N'Phòng trọ sạch sẽ, an ninh tốt'),
(20, 1, 1, 1, N'Phòng trọ rất tốt, sạch sẽ và thoáng mát'),
(18, 1, 1, 1, N'Phòng trọ rất tốt, sạch sẽ và thoáng mát'),
(19, 1, 1, 1, N'Phòng trọ rất tốt, sạch sẽ và thoáng mát');


select * 
from LOAINHA

select *
from DANHGIA


select *
from NHATRO

select *
from NGUOIDUNG

if OBJECT_ID('sp_y3_1') is not null
drop proc sp_y3_1
go
create proc sp_y3_1 @mand int , @tennd nvarchar(50),@gioitinh nvarchar(10),@sdt int,@diachi nvarchar(150),@quan nvarchar(50),@email nvarchar(50)
as
	if(@mand is null) or (@tennd is null)
	begin
		print N'Lỗi'
		print N'Thiếu thông tin đầu vào'
	end
	else 
	begin
	insert into NGUOIDUNG(MaND,TenND,Gioitinh,SDT,DiaChi,Quan,Email)
	values(@mand,@tennd,@gioitinh,@sdt,@diachi,@quan,@email)
	print N'Thêm thành công'
	end

exec sp_y3_1  null,N'Trần Quốc Thuận',N'Nam',0333744441,N'224 Hà Đặc Phường Trung Mỹ Tây',N'Quận 12','thuanpss1111@gmail.com';


if OBJECT_ID('sp_y3_2') is not null
drop proc sp_y3_2
go
create proc sp_y3_2 @mant int,@maln int,@dientich float,@giaphong float,@diachi nvarchar(150),@quan nvarchar(50),@mota nvarchar(max),@ngaydang date,@nguoilh int
as
	if(@mant is null) or (@maln is null)
	begin
		print N'Lỗi'
		print N'Thiếu thông tin đầu vào'
	end
	else
	begin
	insert into NHATRO(MaNT,MaLN,DienTich,Giaphong,DiaChi,Quan,MoTa,Ngaydang,NguoiLH)
	values(@mant,@maln,@dientich,@giaphong,@diachi,@quan,@mota,@ngaydang,@nguoilh)
		print N'Thêm thành công'
	end

exec sp_y3_2 null,1,'36','9500000',N'579 Đường L',N'Quận 10',N'Phòng trọ sạch sẽ, an ninh tốt','2023-05-10','16';

if OBJECT_ID('sp_y3_3') is not null
drop proc sp_y3_3
go
create proc sp_y3_3 @id int,@nguoidg int,@mant int,@danhgia bit,@noidungdg nvarchar(max)
as
	if(@nguoidg is null) or (@mant is null)
	begin
		print N'Lỗi'
		print N'Thiếu thông tin đầu vào'
	end
	else
	begin
	insert into DANHGIA(ID,NguoiDG,MaNT,Danhgia,NoidungDG)
	values(@id,@nguoidg,@mant,@danhgia,@noidungdg)
	print N'Thêm thành công'
	end

exec sp_y3_3 39,39,39,'False',N'Phòng trọ sạch sẽ, an ninh tốt';

select N'Cho thuê tại: ' +DiaChi+ ' ' + Quan from NHATRO

select Replace(CONVERT(nvarchar,DienTich),'.',',') + ' m2 ' as N'Diện tich' from NHATRO	

select convert(varchar,Giaphong,1) from NHATRO	

select replace(LEFT(convert(varchar,Giaphong,1),LEN(convert(varchar,Giaphong,1))-3),',','.') as N'Tiền Trọ'
from NHATRO

select MoTa from NHATRO

select CONVERT(varchar,Ngaydang,105) as N'Ngày đăng'
from NHATRO	

select case Gioitinh 
when N'Nam' then 'A. ' + TenND
when N'Nữ' then 'C. ' + TenND
end 
as N'Người Đăng Tin'	
from NHATRO join NGUOIDUNG
on NGUOIDUNG.MaND = NHATRO.MaNT	 


select SDT from NGUOIDUNG

select DiaChi +' ' +  Quan from NGUOIDUNG		

select N'Cho thuê tại: ' +NhaTro.DiaChi+ ' ' + NhaTro.Quan ,
Replace(CONVERT(nvarchar,DienTich),'.',',') + ' m2 ' as N'Diện tich',
convert(varchar,Giaphong,1),
replace(LEFT(convert(varchar,Giaphong,1),LEN(convert(varchar,Giaphong,1))-3),',','.') as N'Tiền Trọ',
MoTa as N'Thông tin mô tả phòng trọ',
CONVERT(varchar,Ngaydang,105) as N'Ngày đăng',
case Gioitinh 
when N'Nam' then 'A. ' + TenND
when N'Nữ' then 'C. ' + TenND
end 
as N'Người Đăng Tin',
SDT as N'Số điện thoai liên hệ',
NguoiDung.DiaChi + ' ' + NguoiDung.Quan as N'Địa chỉ người liên hệ'
from NHATRO join NGUOIDUNG
on NGUOIDUNG.MaND = NHATRO.MaNT

if OBJECT_ID('sp_TimKiem_NhaTro') is not null
drop proc sp_TimKiem_NhaTro
go
create proc sp_TimKiem_NhaTro
	@quan nvarchar(50) = N'%',
	@LoaiNhaTro nvarchar(50) = N'%',
	@DienTichMin real = null,
	@DienTichMax real = null,
	@GiaPhongMin money = null,
	@GiaPhongMax money = null,
	@NgayDangMin date = null,
	@NgayDangMax date = null

as
begin
if(@DienTichMin is null) select @DienTichMin = MIN(DienTich) from NHATRO
if(@DienTichMax is null) select @DienTichMax = Max(DienTich) from NHATRO
if(@GiaPhongMin is null) select @GiaPhongMin = MIN(GiaPhong) from NHATRO
if(@GiaPhongMax is null) select @GiaPhongMax = Max(GiaPhong) from NHATRO
if(@NgayDangMin is null) select @NgayDangMin = Min(Ngaydang) from NHATRO
if(@NgayDangMax is null) select @NgayDangMax = Max(Ngaydang) from NHATRO
select N'Cho thuê tại: ' +NhaTro.DiaChi+ ' ' + NhaTro.Quan ,
Replace(CONVERT(nvarchar,DienTich),'.',',') + ' m2 ' as N'Diện tich',
convert(varchar,Giaphong,1),
replace(LEFT(convert(varchar,Giaphong,1),LEN(convert(varchar,Giaphong,1))-3),',','.') as N'Tiền Trọ',
MoTa as N'Thông tin mô tả phòng trọ',
CONVERT(varchar,Ngaydang,105) as N'Ngày đăng',
case Gioitinh 
when N'Nam' then 'A. ' + TenND
when N'Nữ' then 'C. ' + TenND
end 
as N'Người Đăng Tin',
SDT as N'Số điện thoai liên hệ',
NguoiDung.DiaChi + ' ' + NguoiDung.Quan as N'Địa chỉ người liên hệ'
from NHATRO join NGUOIDUNG
on NGUOIDUNG.MaND = NHATRO.MaNT
join LOAINHA on	LOAINHA.MaLN = NHATRO.MaLN
where (NhaTro.Quan like '%'+@quan+'%')
and LOAINHA.TenLN like '%'+@LoaiNhaTro+'%'
and (DienTich between @DienTichMin and @DienTichMax)
and (Giaphong between @GiaPhongMin and @GiaPhongMax)
and (Ngaydang >= @NgayDangMin and Ngaydang <= @NgayDangMax)
end
	
exec sp_TimKiem_NhaTro N'Quận 10',N'Phòng trọ'

--Yêu cầu 3 phần b
if OBJECT_ID('fn_MaNguoiDung') is not null
drop function fn_MaNguoiDung
go
create function fn_MaNguoiDung(
	@tennd nvarchar(50) = N'%' ,
	@sdt int,
	@quan nvarchar(50) = N'%')	

	returns table
	return(select MaND from NGUOIDUNG
	where TenND like @tennd and SDT = @sdt
	and '%'+Quan+'%' like @quan)

	
	select N'Cho thuê tại: ' +NhaTro.DiaChi+ ' ' + NhaTro.Quan ,
Replace(CONVERT(nvarchar,DienTich),'.',',') + ' m2 ' as N'Diện tich',
replace(LEFT(convert(varchar,Giaphong,1),LEN(convert(varchar,Giaphong,1))-3),',','.') as N'Tiền Trọ',
MoTa as N'Thông tin mô tả phòng trọ',
CONVERT(varchar,Ngaydang,105) as N'Ngày đăng',
case Gioitinh 
when N'Nam'	then 'A. ' + TenND
when N'Nữ' then 'C. ' + TenND
end		
as N'Người Đăng Tin',
SDT as N'Số điện thoai liên hệ',
N'Số nhà: ' +NguoiDung.DiaChi + NguoiDung.Quan 
from NHATRO join NGUOIDUNG
on NHATRO.MaND	 = NGUOIDUNG.MaND
join LOAINHA on	LOAINHA.MaLN = NHATRO.MaLN
where NGUOIDUNG.MaND in (select MaND from dbo.fn_MaNguoiDung(DEFAULT,DEFAULT,N'Quận 12'))	


-- Yêu cầu 3 c 
select COUNT(*) from DANHGIA where MaNT = 1 and Danhgia =1

create function fn_TongLike(@MaNT int)
returns	int
as
begin
	return(select COUNT(*) from DANHGIA where MaNT = @MaNT and Danhgia =1)
end

alter function fn_TongDisLike(@MaNT int)
returns	int
as
begin
	return(select COUNT(*) from DANHGIA where MaNT = @MaNT and Danhgia = 0)
end

print N'Tổng like: ' +convert(varchar,dbo.fn_TongLike(1))

-- yêu cầu 3 d
if OBJECT_ID('vw_Top10NhaTro') is not null
drop view vw_Top10NhaTro
go
alter view Top10NhaTro
as
select top 10 
dbo.fn_TongLike(MaNT) as N'Tổng Like',
Replace(CONVERT(nvarchar,DienTich),'.',',') + ' m2 ' as N'Diện tich',
replace(LEFT(convert(varchar,Giaphong,1),LEN(convert(varchar,Giaphong,1))-3),',','.') as N'Tiền Trọ',
MoTa as N'Thông tin mô tả phòng trọ',
CONVERT(varchar,Ngaydang,105) as N'Ngày đăng',
case Gioitinh 
when N'Nam' then 'A. ' + TenND
when N'Nữ' then 'C. ' + TenND
end 
as N'Người Đăng Tin',
SDT as N'Số điện thoai liên hệ',
NguoiDung.DiaChi as N'Địa chỉ người liên hệ',
NguoiDung.Quan as  N'Quận',
NGUOIDUNG.Email as N'Email người dùng'
from NHATRO join NGUOIDUNG
on NGUOIDUNG.MaND = NHATRO.MaNT
join LOAINHA on	LOAINHA.MaLN = NHATRO.MaLN
order by N'Tổng Like' desc

select * from Top10NhaTro

-- yêu cầu 3 e

select DANHGIA.MaNT as N'Mã Nhà Trọ',MaND,TenND as N'Tên Người Dùng' ,
case DANHGIA.Danhgia
when 1 then 'Like'
when 0 then 'Dislike'
end as N'Đánh Giá' ,NoidungDG as N'Nội Dung Đánh Giá'
from DANHGIA join NGUOIDUNG 
on NGUOIDUNG.MaND = DANHGIA.MaNT
where MaNT = 1

create proc Yeu3_e @mant int
as
if not exists(select * from NHATRO where MaNT = @mant)
begin
	print N'Nhà trọ này không tồn tại'
end
else
begin
	if not exists(select * from DANHGIA where MaNT = @mant)
	begin
		print N'Mã nhà trọ này chưa được đánh giá'
	end
	else
	begin
		select DANHGIA.MaNT as N'Mã Nhà Trọ',MaND,TenND as N'Tên Người Dùng' ,
		case DANHGIA.Danhgia
		when 1 then 'Like'
		when 0 then 'Dislike'
		end as N'Đánh Giá' ,NoidungDG as N'Nội Dung Đánh Giá'
		from DANHGIA join NGUOIDUNG 
		on NGUOIDUNG.MaND = DANHGIA.MaNT
		where MaNT = @mant
	end
end

exec Yeu3_e 1


select MaNT,dbo.fn_TongDisLike(MaNT) from NhaTro
-- Yêu cầu 3 câu 3
if OBJECT_ID('Yeucau3_31') is not null
drop proc Yeucau3_31
go
create proc Yeucau3_31 @dislike int
as
begin try
		declare @tbNhaTro table(mant int)
		insert into @tbNhaTro
		select MaNT from NHATRO where dbo.fn_TongDisLike(MaNT) >=@dislike
		begin tran
			delete	from DANHGIA where MaNT in(select MaNT from @tbNhaTro)
			delete	from NHATRO where MaNT in(select MaNT from @tbNhaTro)
			print N'Xóa thành công'
		commit tran
end try
begin catch
		rollback tran
		print N'Xóa không thành công'
end catch
	
exec Yeucau3_31 5	

-- Yêu cầu 3 câu 3.2
select MaNT,Ngaydang from NHATRO where Ngaydang between	'2020-01-01' and '2020-01-20'
if OBJECT_ID('Yeucau3_32') is not null
drop proc Yeucau3_32
go
create proc Yeucau3_32 @tungay date,@denngay date
as
begin try
		declare	@tbNT table(mant int)
		insert into @tbNT
		select	MaNT from NHATRO where Ngaydang between @tungay and @denngay
		begin tran
			delete	from DANHGIA where MaNT in(select MaNT from @tbNT)
			delete	from NHATRO where MaNT in(select MaNT from @tbNT)
			print N'Xóa thành công'
		commit tran
end try
begin catch
		rollback tran
		print N'Xóa không thành công'
end catch

exec Yeucau3_32 '2020-01-01' ,'2020-01-15'