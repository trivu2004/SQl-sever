CREATE PROC sp_demo @BirthYear INT
AS
BEGIN
    SELECT HoNV, TenLot,TenNV,NgSinh
    FROM NhanVien
    WHERE YEAR(NgSinh) = @BirthYear
END

drop proc sp_demo
EXEC sp_demo 1995

select *
from NhanVien
where Phg in (select Phg
from NhanVien
group by Phg
having AVG(Luong) >(select top 1 SUM(Luong) as 'Tổng Lương'
from NhanVien
group by Phg
order by SUM(Luong)));

CREATE PROCEDURE sp_demo3 @n INT
AS
BEGIN
    DECLARE @i INT = 1, @sum INT = 0;
    WHILE @i <= @n
    BEGIN
        SET @sum = @sum + POWER(-1, @i) * @i;
        SET @i = @i + 1;
    END
    SELECT @sum AS Sn;
END

exec sp_demo3 2


alter function ac(@n int)
returns int
begin
	declare @sum int =0
	declare @i int  = 2
	while @i < @n
	begin
	set @sum = @sum + @i
	set @i = @i + 2
	end
	return @sum
end

select dbo.ac(10)

