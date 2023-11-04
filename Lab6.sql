
-- Ràng buộc khi thêm mới nhân viên thì mức lương phải lớn hơn 15000, nếu vi phạm thì xuất thông báo “luong phải >15000’

create trigger Bai1_a on NhanVien for insert as
if exists(select * from inserted where Luong <=15000)
begin
	print N'Lương phải lớn hơn 15000'
	rollback transaction
end

insert into NhanVien values('000000026',N'Trần',N'Quốc',N'Thuận','3','2004-05-01',N'Long An','Nam','17000','000000007')

--Ràng buộc khi thêm mới nhân viên thì độ tuổi phải nằm trong khoảng 18 <= tuổi <=65.
drop trigger Bai1_b
create trigger Bai1_b on NhanVien
for insert
as
begin
	DECLARE @TUOI INT  = 0;
	SELECT @TUOI = YEAR(GETDATE()) - YEAR(NgSinh) from inserted
	if(@TUOI < 18 OR @TUOI > 65)
		BEGIN
			PRINT N'Loi tuoi roi'
			ROLLBACK TRAN
		END
end

insert into NhanVien values('000000034',N'Dương',N'Trí',N'Dũng','4','2009-05-01',N'Củ Chi','Nam','17000','000000005')

-- Ràng buộc khi cập nhật nhân viên thì không được cập nhật những nhân viên ở TP HCM
create trigger Bai1_c on NhanVien for update as
if exists(select * from inserted where DChi like '%TP HCM%')
begin 
print N'Không thể cập nhật bản ghi này'
rollback transaction
end

update NhanVien set DChi = N'TP HCM' where MaNV = '000000022'


drop trigger Bai2_b

-- Hiển thị tổng số lượng nhân viên nữ, tổng số lượng nhân viên nam mỗi khi có hành động thêm mới nhân viên.
create trigger Bai2_a on NhanVien after insert as
begin
declare @num nchar,@sum nchar;
select @num = count(*) from inserted where Phai like 'Nam'
select @sum = count(*) from inserted where Phai like N'Nữ'
print N'Số lượng nhân viên nam đã thêm = '+@num
print N'Số lượng nhân viên nữ đã thêm = '+@sum
rollback transaction
end

insert into NhanVien values('000000023',N'Dương',N'Trí',N'Dũng','4','2003-05-01',N'Củ Chi','Nam','17000','000000005'),
							('000000024',N'Dương',N'Trí',N'Dũng','4','2003-05-01',N'Củ Chi','Nữ','17000','000000005')

-- Hiển thị tổng số lượng nhân viên nữ, tổng số lượng nhân viên nam mỗi khi có hành động cập nhật phần giới tính nhân viên
alter trigger Bai2_b on NhanVien after update as
begin
declare @num int,@sum int;
select @num = count(*) from NhanVien where Phai = 'Nam'
select @sum = count(*) from NhanVien where Phai = N'Nữ'
print N'Số lượng nhân viên nam đã update = '+cast(@num as varchar(30))
print N'Số lượng nhân viên nữ đã update = '+cast(@sum as varchar(30))

end

update NhanVien set Phai = N'Nữ' where MaNV like '000000020'
update NhanVien set Phai = N'Nữ' where MaNV like '000000022'


-- Hiển thị tổng số lượng đề án mà mỗi nhân viên đã làm khi có hành động xóa trên bảng DEAN
create trigger Bai2_c on DeAn after delete as
begin
	select Ma_NV ,COUNT(MaDA) as 'SoLuong'
	from PhanCong
	group by Ma_NV
end
select * from DeAn
delete from DeAn where MaDA = 22


--
alter trigger Bai3_a on NhanVien instead of delete
as
begin
	delete from ThanNhan where Ma_NVien in(select MaNV from deleted)
	delete from	NhanVien where MaNV in(select MaNV from deleted)
end

delete NhanVien where MaNV = '000003'

drop trigger Bai3_b
create trigger Bai3_b on NhanVien instead of insert
as
begin
	insert into PhanCong values((select MaNV from inserted),1,1,100)
end

insert into NhanVien values('000000026',N'Dương',N'Trí',N'Dũng',1,'2003-05-01',N'Củ Chi','Nam','17000','000000005')


