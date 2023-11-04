

-- S? d?ng c? s? d? li?u QLDA. Th?c hi?n các câu truy v?n sau, s? d?ng if…else và case
--Vi?t ch??ng trình xem xét có t?ng l??ng cho nhân viên hay không. Hi?n th? c?t th? 1 là TenNV, c?t th? 2 nh?n giá tr?

declare @BTLuong table(MaPB int, LuongTB float)
insert into @BTLuong
select PHG,AVG(Luong) from NhanVien group by PHG

--select * from @BTLuong

select TenNV,Luong,LuongTB ,
Tong = case 
when Luong > LuongTB then 'Khong Tang Luong'
else 'Tang Luong'
end
from NhanVien a
inner join @BTLuong b
on a.PHG = b.MaPB;

-- Nếu lương nhân viên nhỏ hơn trung bình lương mà nhân viên đó đang làm việc thì xếp loại “nhanvien”, ngược lại xếp loại “truongphong”

select TenNV,Luong,LuongTB ,
ChucVu = case 
when Luong > LuongTB then 'Truong Phong'
else 'NhanVien'
end
from NhanVien a
inner join @BTLuong b
on a.PHG = b.MaPB;

-- Viết chương trình hiển thị TenNV như hình bên dưới, tùy vào cột phái của nhân viên
select TenNV = case 
when Phai = 'Nam' then 'Mr.' + [TenNV]
when Phai = N'Nữ' then 'MS.' + [TenNV]
end
from NhanVien;


-- Viết chương trình tính thuế mà nhân viên phải đóng theo công thức:
-- 0<luong<25000 thì đóng 10% tiền lương
--25000<luong<30000 thì đóng 12% tiền lương
--30000<luong<40000 thì đóng 15% tiền lương
-- 40000<luong<50000 thì đóng 20% tiền lương
-- Luong>50000 đóng 25% tiền lương

select TenNV,Luong,
Thue = case 
when Luong between 0 and 25000 then Luong * 0.1
when Luong between 25000 and 30000 then Luong * 0.12
when Luong between 30000 and 40000 then Luong * 0.15
when Luong between 40000 and 50000 then Luong * 0.2
	else Luong *0.25
	end
from NhanVien


-- Cho biết thông tin nhân viên (HONV, TENLOT, TENNV) có MaNV là số chẵn.
select HoNV,TenLot,TenNV,MaNV,
Tong = case
when MaNV%2 = 0 then 'SoChan'
else 'SoLe'
end
from NhanVien

declare @i int = 2 , @dem int;
set @dem = (select count(*) from NhanVien)
while(@i < @dem + 1 )
begin 
	select MaNV, HoNV,TenLot,TenNV from NhanVien
	where CAST(MaNV as int) = @i;
	set @i = @i + 2;
end


--Cho biết thông tin nhân viên (HONV, TENLOT, TENNV) có MaNV là số chẵn nhưng không tính nhân viên có MaNV là 4.
declare @i1 int = 2 , @dem1 int;
set @dem1 = (select count(*) from NhanVien)
while(@i1 < @dem1 + 1)
begin 
	if(@i1 = 4)
	begin 
		set @i1 = @i1 + 2;
		continue;
	end
	select MaNV, HoNV,TenLot,TenNV from NhanVien
	where CAST(MaNV as int) = @i1;
	set @i1 = @i1 + 2;
end

-- Thực hiện chèn thêm một dòng dữ liệu vào bảng PhongBan theo 2 bước
-- Nhận thông báo “ thêm dư lieu thành cong” từ khối Try
begin try
insert PhongBan(TenPHG,MaPHG,TrPHG,NG_NhanChuc)
values('Nghiên cứu',2,'008','1978-05-08')
print N'Chèn thành công'
end try
begin catch
	print N'Lỗi' + convert(varchar, Error_Number(),1) + '=>' + Error_message()
end catch

-- Chèn sai kiểu dữ liệu cột MaPHG để nhận thông báo lỗi “Them dư lieu that bai” từ khối Catch
begin try
insert PhongBan(TenPHG,MaPHG,TrPHG,NG_NhanChuc)
values('Nghiên cứu',2,'009','1978-05-08')
print N'Chèn thành công'
end try
begin catch
	print N'Lỗi' + convert(varchar, Error_Number(),1) + '=>' + Error_message()
end catch

--Viết chương trình khai báo biến @chia, thực hiện phép chia @chia cho số 0 và dùng RAISERROR để thông báo lỗi.


begin try
	declare @a int = 4 , @b int = 0, @result int;
	set @result = @a / @b;
end try
begin catch
	declare @ErMessage nvarchar(2048),
			@ErSeverity int,
			@ErState int
	select @ErMessage = ERROR_MESSAGE(),
			@ErSeverity = ERROR_SEVERITY(),
			@ErState = ERROR_STATE()
	raiserror (@ErMessage,@ErSeverity,@ErState);
end catch