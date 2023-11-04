
declare @export table (MaPhg int , NumberOfEmployee int, GhiChu nvarchar(100))
insert into @export
select MaPhg, count(MaNV) as N'Tổng' , GhiChu = case
when count(MaNV) >4 then N'Quá Đông'
when count(MaNV) >= 2 then N'TB'
else N'Thiếu'
end
from PhongBan p left join NhanVien n
on p.MaPhg = n.Phg
group by MaPhg

select * from @export


declare @sum int = 0 , @i int = 0
while(@i < 12)
begin 
	set @sum = @sum + @i;
	set @i = @i+2;
	if(@i = 4)
	set @i = @i +2
end
print N'Sum of order even number:' + convert(nvarchar(50), @sum);


declare @sum1 int = 0 , @i1 int = 0
while(@i1 < 12)
begin 
	set @i1 = @i1 +2
		if(@i1 = 4)
		continue;
	set @sum1 = @sum1+ @i1;
end
print N'Sum of order even number:' + convert(nvarchar(50), @sum1);

begin try
	--insert into DuAn values(19,N'Xây dựng web site đánh giá kết quả',N'Phú Nhuận',1)
	declare @a float = -100, @b float;
	set @b = SQRT(abs(@a));
	print cast(@b as varchar)
end try
begin catch
	select ERROR_NUMBER() as error_number,
			ERROR_MESSAGE() as error_message
end catch

alter proc demo1
as
begin
	declare @i int = 2
	while @i < 21
	begin
	print @i
	set @i = @i +2
	end
end

exec demo1

alter function demo2(@tong1 int)
returns nvarchar
as
begin
	declare @tong nvarchar(Max) = '';
	declare @i int = 0
	while @i < @tong1
	begin
	if @i % 2 = 0
	set @tong = @tong + CAST(@i as nvarchar)+''
	set @i = @i+2
	end
	return @tong
end

select dbo.demo2(20)