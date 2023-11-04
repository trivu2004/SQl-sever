-- Nhập vào MaNV cho biết tuổi của nhân viên này
create function Bai1_1(@manv int)
returns table
as
	return(select year(getdate()) - year(NhanVien.NgSinh) as 'Tuoi',MaNV from NhanVien
	where @manv=MaNV)
go
 
select * from Bai1_1(000000002)

--Nhập vào Manv cho biết số lượng đề án nhân viên này đã tham gia
create function Bai1_2(@manv int)
returns table 
as
return(select NhanVien.MaNV,PHG,MaDA from NhanVien join DeAn on NhanVien.PHG = DeAn.Phong
		where @manv = MaNV)
go

select * from Bai1_2(000000005)
--Cách 2 
if object_id('fn_DemDeAnNV') is not null
	drop function fn_DemDeAnNV
	go
create function fn_DemDeAnNV(@MaNV varchar(9))
returns int
as
begin
	return(select count(MaDA) from PhanCong where Ma_NV = @MaNV)
end
print N'Số dự án nhân viên đã làm : ' +convert(varchar,dbo.fn_DemDeAnNV('005'))

-- Truyền tham số vào phái nam hoặc nữ, xuất số lượng nhân viên theo phái 
create function Bai1_3(@phai nvarchar(3))
returns table
as
	return(select TenNV,Phai from NhanVien
	where Phai = @phai)
go

select * from Bai1_3(N'Nam')


create function [dbo].[Bai1_31](@phai nvarchar(3))
returns int
begin
	return(select COUNT(MaNV) from NhanVien
	where Phai = @phai)
end

print N'Tổng số lượng nhân viên nam: ' +convert(nvarchar,[dbo].[Bai1_31](N'Nam,'))
print N'Tổng số lượng nhân viên nữ: ' +convert(nvarchar,[dbo].[Bai1_31](N'Nữ'))

-- Truyền tham số đầu vào là tên phòng, tính mức lương trung bình của phòng đó, Cho biết 
--họ tên nhân viên (HONV, TENLOT, TENNV) có mức lương trên mức lương trung bình 
--của phòng đó
create function Bai1_4(@tenpb nvarchar(15))
RETURNS @tbluongnv TABLE (fullname nvarchar(50),luong float)
AS 
BEGIN
declare @LuongTB float
SELECT @LuongTB=AVG(Luong)
FROM NHANVIEN NV JOIN PHONGBAN PB ON NV.Phg = PB.MAPHG
WHERE TenPhg = @tenpb
--print N'Lương trung bình: ' +convert(nvarchar,@LuongTB)
insert into @tbluongnv
select HoNV + ' ' +TenLot+' '+TenNV,Luong from NhanVien
where Luong>@LuongTB
 return
END

select * from Bai1_4('IT')

-- Tryền tham số đầu vào là Mã Phòng, cho biết tên phòng ban, họ tên người trưởng phòng và số lượng đề án mà phòng ban đó chủ trì.
create function Bai1_5(@mapb int)
returns @tbListPB table(TenPB nvarchar(20),MaTP nvarchar(10),TenTP nvarchar(50),soluong int)
as
begin
	insert into @tbListPB
	select TenPHG,TrPHG,HoNV+' '+TenLot+' '+TenNV as 'Ten Truong Phong',COUNT(MaDA) as 'SoLuongDeAn'
	from PhongBan join DeAn on PhongBan.MaPHG = DeAn.Phong
	join NhanVien on NhanVien.MaNV = PhongBan.TrPHG
	where PhongBan.MaPHG =  @mapb
	group by TenPHG,TrPHG,HoNV,TenLot,TenNV
	return
end 

select * from Bai1_5(1)
select * from Bai1_5(4)
select * from Bai1_5(5)


--Hiển thị thông tin HoNV,TenNV,TenPHG, DiaDiemPhg.
create view Bai2_1
as 
	select HoNV,TenNV,TenPHG,DiaDiem from NhanVien join PhongBan
	on NhanVien.PHG = PhongBan.MaPHG

select * from Bai2_1

--Hiển thị thông tin TenNv, Lương, Tuổi.
create view Bai2_2
as
select TenNV,Luong,YEAR(getdate()) - YEAR(NgSinh) as 'Tuổi' from NhanVien

select * from Bai2_2

--Hiển thị tên phòng ban và họ tên trưởng phòng của phòng ban có đông nhân viên nhất

create view Bai2_3
as
select top 1 TenPhg,B.HoNV+' ' +B.TenLot+' '+B.TenNV as N'Họ TênT TP',MaPhg,count(A.MaNV) as N'Tổng số nhân viên' from NhanVien A join PhongBan on A.Phg = PhongBan.MaPhg
join NhanVien B on B.MaNV  = PhongBan.TrPhg
group by TenPhg,B.HoNV,B.TenLot,B.TenNV,MaPhg
order by count(A.MaNV) desc
select * from Bai2_3