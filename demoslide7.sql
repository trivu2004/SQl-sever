create function fDemNv()
returns int 
begin
	return(select count(MaNV) from NhanVien)
end
-- G?i hàm cách 1
print N'T?ng s? l??ng nhân viên: ' + convert(varchar,dbo.fDemNv())

-- G?i hàm cách 2
declare @tong int
select @tong = dbo.fDemNv()
print N'T?ng s? l??ng nhân viên: ' + convert(varchar,@tong)

print N'Tổng số lượng nhân viên nam' +convert(varchar,dbo.FDemNv_GioiTinh(N'Nữ'))

select * from FNhanVien_PB(005);

create function [dbo].[fListPhong] (@phong int)
returns @ProdList Table
(ten nvarchar(15),ma int,trphg nvarchar(9),ngay date)
as
begin
if @phong is null
begin
insert into @ProdList(ten,ma,trphg,ngay)
select TenPHG,MaPhg,TrPhg,Ng_NhanChuc
from PhongBan
end
else 
begin
insert into @ProdList(ten,ma,trphg,ngay)
select TenPHG,MaPhg,TrPhg,Ng_NhanChuc
from PhongBan
where MaPhg = @phong
end
return
end

select * from dbo.fListPhong(null)

create view NV_PB
as
select TenNV,TenPhg
from NhanVien join PhongBan
on NhanVien.Phg = PhongBan.MaPhg

select * from NV_PB

create view ThongTin_Phong
as
select TenPhg,MaPhg
from PhongBan
where MaPhg = 6

update ThongTin_Phong
set TenPhg = 'IT'

select * from ThongTin_Phong

alter view ThongtinNV
as
select TenNV,Luong, year(getdate()) - year(NhanVien.NgSinh) as 'Tuoi'
from NhanVien
where  year(getdate()) - year(NhanVien.NgSinh) < 57

select * from ThongtinNV

drop view ThongtinNV

alter function fdemoslide71()
returns @result table (Tháng int,Tổng int)
as
begin
	insert into @result
	select MONTH(NgSinh) as N'Tháng',count(*) as total
	from NhanVien
	group by MONTH(NgSinh)
	order by MONTH(NgSinh)

	return
end

select * from fdemoslide71()

CREATE FUNCTION dbo.fn_SumBirthdaysByMonth(@Year INT)
RETURNS @Result TABLE (Month INT, Total INT)
AS
BEGIN
    DECLARE @Month INT = 1;
    WHILE @Month <= 12
    BEGIN
        INSERT INTO @Result (Month, Total)
        SELECT @Month, COUNT(*) FROM NhanVien
        WHERE MONTH(NgSinh) = @Month AND YEAR(NgSinh) = @Year;
        SET @Month = @Month + 1;
    END;
    RETURN;
END;

select * from dbo.fn_SumBirthdaysByMonth(1995);

create view myView
as
select HoNV + ' ' + TenNV as N'Họ Tên NV', year(NgSinh) as N'Năm sinh'
from NhanVien

select * from myView

alter proc vidu(@bien int)
as
begin
	if @bien % 2 = 0
	print N'Số chẵn'
	else 
	print N'Số lẻ'
end

exec vidu 10

CREATE FUNCTION calculateTax(@income FLOAT)
RETURNS FLOAT
AS
BEGIN
    DECLARE @tax FLOAT;
    IF @income <= 5
        SET @tax = @income * 0.05;
    ELSE IF @income <= 10
        SET @tax = @income * 0.1 - 0.25;
    ELSE IF @income <= 18
        SET @tax = @income * 0.15 - 0.75;
    ELSE IF @income <= 32
        SET @tax = @income * 0.2 - 1.65;
    ELSE IF @income <= 52
        SET @tax = @income * 0.25 - 3.25;
    ELSE IF @income <= 80
        SET @tax = @income * 0.3 - 5.85;
    ELSE
        SET @tax = @income * 0.35 - 9.85;
    RETURN @tax;
END

select dbo.calculateTax(10)