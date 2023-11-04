
--In ra dòng ‘Xin chào’ + @ten với @ten là tham số đầu vào là tên Tiếng Việt có dấu của bạn. Gợi ý:
--o sử dụng UniKey để gõ Tiếng Việt ♦
--o chuỗi unicode phải bắt đầu bởi N (vd: N’Tiếng Việt’) ♦
--o dùng hàm cast (<biểuThức> as <kiểu>) để đổi thành kiểu <kiểu> của<biểuThức>.
create proc sp_Lab5_Bai1_a @ten nvarchar(20)
as 
begin
	print 'Xin Chào: ' + @ten
end

exec sp_Lab5_Bai1_a N'Trí Vũ'

-- Nhập vào 2 số @s1,@s2. In ra câu ‘Tổng là : @tg’ với @tg=@s1+@s2.
create proc sp_Bai1_b @so1 int,@so2 int
as
begin
declare @tong int = 0
	set @tong=@so1+@so2
	print N'Tổng là: ' +cast(@tong as varchar(20))
end

exec sp_Bai1_b 4,5
--Nhập vào số nguyên @n. In ra tổng các số chẵn từ 1 đến @n.
create proc sp_Bai1_c @n int 
as 
begin
	declare @sum int = 0 , @i int = 0
	while(@i<@n)
	begin
	set @sum = @sum + @i
	set @i = @i + 2
	end
	print N'Tổng số chẵn là: ' +  cast(@sum as nvarchar(30))
end

exec sp_Bai1_c 10

-- Nhập vào 2 số. In ra ước chung lớn nhất của chúng theo gợi ý dưới đây:
--o b1. Không mất tính tổng quát giả sử a <= A 
--o b2. Nếu A chia hết cho a thì : (a,A) = a ngược lại : (a,A) = (A%a,a) hoặc (a,A) = (a,A-a) 
--o b3. Lặp lại b1,b2 cho đến khi điều kiện trong b2 được thỏa

create proc sp_Bai1_d @a int , @b int
as
begin
	while(@a!=@b)
	begin
	if(@a>@b)
		set @a = @a - @b
	else
		set @b = @b - @a
	end
	return @a;
end

declare @c int
exec @c = sp_Bai1_d 7,5
print  N'Ước chung là : '+ cast(@c as nvarchar(20))


-- Nhập vào @Manv, xuất thông tin các nhân viên theo @Manv.
create proc sp_Bai2_a @Manv nvarchar(20)
as
begin
	select *
	from NhanVien 
	where MaNV = @Manv
end
go
exec sp_Bai2_a '000000005'

-- Nhập vào @MaDa (mã đề án), cho biết số lượng nhân viên tham gia đề án đó
alter proc sp_Bai2_b @Mada nvarchar(20)
as
begin
	select MaDA,count(MaNV) as N'Tống số nhân viên',TenPHG
	from NhanVien as nv join PhongBan as pb
	on pb.MaPhg = nv.Phg join DeAn as da
	on da.Phong = pb.MaPhg
	where MaDA = 2
	group by TenPhg,MaDA
end

exec sp_Bai2_b 2

-- Nhập vào @MaDa và @Ddiem_DA (địa điểm đề án), cho biết số lượng nhân viên tham 
--gia đề án có mã đề án là @MaDa và địa điểm đề án là @Ddiem_DA

alter proc sp_Bai2_c @Mada nvarchar(20)
as
begin
	select MaDA,count(MaNV) as N'Tống số nhân viên',DDiem_DA
	from NhanVien as nv join PhongBan as pb
	on pb.MaPhg = nv.Phg join DeAn as da
	on da.Phong = pb.MaPhg
	where MaDA = 1 -- hoặc MaDA = @manv
	and DDiem_DA like N'Vũng Tàu'
	group by DDiem_DA,MaDA
end

exec sp_Bai2_c 2

--Nhập vào @Trphg (mã trưởng phòng), xuất thông tin các nhân viên có trưởng phòng là 
--@Trphg và các nhân viên này không có thân nhân.

create proc sp_Bai2_d @MaTP nvarchar(5)
as 
begin
select HoNV,TenLot,TenNV,TenPHG,nv.MaNV
from NhanVien as nv join PhongBan as pb
on nv.PHG = pb.MaPHG
left outer join ThanNhan as tn
on tn.Ma_NVien = nv.MaNV
where tn.Ma_NVien is null and TrPHG = @MaTP
end

exec sp_Bai2_d '008'

--Nhập vào @Manv và @Mapb, kiểm tra nhân viên có mã @Manv có thuộc phòng ban có mã @Mapb hay không

create proc sp_Bai2_e @Manv nvarchar(5),@Mapb nvarchar(5)
as 
begin
if exists(select * from NhanVien where MaNV = @Manv and PHG = @Mapb)
print N'Nhân viên ' + @Manv +' có trong phòng ban '+@Mapb
else
print N'Nhân viên ' + @Manv +' không có trong phòng ban '+@Mapb
end

exec sp_Bai2_e '001',4


--Thêm phòng ban có tên CNTT vào csdl QLDA, các giá trị được thêm vào dưới dạng 
--tham số đầu vào, kiếm tra nếu trùng Maphg thì thông báo thêm thất bại

create proc sp_Bai3_a @mapb int , @Tenpb nvarchar(15) , @Trphg char(9),@diadiem nvarchar(15), @ngnhanchuc date
as
begin 
	if (exists(select * from PhongBan where MaPHG = @mapb))
	print N'Thêm Thất Bại'
	else 
	begin
	insert into PhongBan(MaPHG,TenPHG,TrPHG,DiaDiem,NG_NhanChuc)
	values(@mapb,@Tenpb,@Trphg,@diadiem,@ngnhanchuc)
	print N'Thêm Thành Công'
	end
end

exec sp_Bai3_a '8','CNTT','008','Quận 1' ,'2020-05-08'

--Cập nhật phòng ban có tên CNTT thành phòng IT

update PhongBan set TenPhg = 'IT', TrPhg = '008',DiaDiem = 'Quận 1 ',Ng_NhanChuc = '2020-05-08'
where MaPhg = '6'
create proc sp_Bai3_b @mapb int , @Tenpb nvarchar(15) , @Trphg char(9),@diadiem nvarchar(15), @ngnhanchuc date
as
begin 
	if (exists(select * from PhongBan where MaPHG = @mapb))
	update PhongBan set TenPhg =@Tenpb, TrPhg = @Trphg,DiaDiem = @diadiem,Ng_NhanChuc = @ngnhanchuc
where MaPhg = @mapb
	else 
	begin
	insert into PhongBan(MaPHG,TenPHG,TrPHG,DiaDiem,NG_NhanChuc)
	values(@mapb,@Tenpb,@Trphg,@diadiem,@ngnhanchuc)
	print N'Thêm Thành Công'
	end
end
exec sp_Bai3_b '8','IT2','007','Quận 3' ,'2018-05-08'

--Thêm một nhân viên vào bảng NhanVien, tất cả giá trị đều truyền dưới dạng tham số đầu vào với điều kiện:
--o nhân viên này trực thuộc phòng IT
--o Nhận @luong làm tham số đầu vào cho cột Luong, nếu @luong<25000 thì nhân viên này do nhân viên có mã 009 quản lý, ngươc lại do nhân viên có mã 005 quản lý
--o Nếu là nhân viên nam thi nhân viên phải nằm trong độ tuổi 18-65, nếu là nhân viên nữ thì độ tuổi phải từ 18-60.

select MaNV,HoNV,TenLot,TenNV,Phg,NgSinh,DChi,Phai,Luong,Ma_Nql from NhanVien
insert into NhanVien(MaNV,HoNV,TenLot,TenNV,Phg,NgSinh,DChi,Phai,Luong,Ma_Nql)
values('000000016','Phan','Như','Ý'	,'2','1992-03-23','3 Nguyễn Thị Thập Q8',N'Nữ','20000','000000003')

create proc sp_Bai3_c @Manv int,@Honv nvarchar(15),
			@Tenlot nvarchar(15),@Tennv nvarchar(15),@Phg int,@Ngsinh date,
			@DChi nvarchar(100),@Phai nvarchar(3),@Luong float,@Manql nvarchar(15) = null
as
begin
	declare @tuoi int
	set @tuoi = YEAR(GETDATE()) -Year(@Ngsinh)
	if @Phg = (select MaPHG from PhongBan where TenPhg = 'IT')
	begin
	 -- thuộc phòng IT
		if @Luong < 25000
		set @Manql = '009'
		else
		set @Manql = '005'

		if(@Phai = 'Nam' and (@tuoi >= 18 and @tuoi <= 65))
		or (@Phai = N'Nữ' and (@tuoi >= 18 and @tuoi <= 60))
		begin -- độ tuổi lao động
			-- insert into
			insert into NhanVien(MaNV,HoNV,TenLot,TenNV,Phg,NgSinh,DChi,Phai,Luong,Ma_Nql)
			values(@Manv,@Honv,@Tenlot,@Tennv,@Phg,@NgSinh,@DChi,@Phai,@Luong,@Manql)
		end -- độ tuổi lao động
		else 
		print N'Không Thuộc Độ Tuổi Lao Động'

	end
	else
	print N'Không thuộc phòng IT'
end

exec sp_Bai3_c '000000016','Phan','Như','Ý'	,'2','1992-03-23','3 Nguyễn Thị Thập Q8',N'Nữ','20000','000000003'