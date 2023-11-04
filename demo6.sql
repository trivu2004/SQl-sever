drop trigger CheckLuong_NV
alter trigger CheckLuong_NV on NhanVien for insert as
if (select Luong from inserted )<5000
begin
print N'Lương tối thiểu lớn hơn 5000'
rollback transaction
end

insert into NhanVien values('000000040',N'Vũ','Cao',N'Trí','2','2004-05-08',N'Đồng Nai','Nam','4000','000000005');

create trigger Xoa_NV on NhanVien for delete as
if '000000017' in(select MaNV from deleted )
begin
print N'Không thể xóa bản ghi này'
rollback transaction
end

delete from NhanVien where MaNV like '000000017'	

create trigger Luong_NV on NhanVien for update as
if exists(select * from inserted where Luong <= 5000)
begin
print N'Lương tối thiểu lớn hơn 5000'
rollback transaction
end

update NhanVien set Luong = 9000 where MaNV like '000000017'

create trigger Xoa_NV1 on NhanVien after delete as
begin
declare @num nchar;
select @num = count(*) from deleted
print N'Số lượng nhân viên đã xóa = '+@num
rollback transaction
end

delete from NhanVien where MaNV = '000000018'

create trigger delete_NV_TN
on NhanVien
instead of delete
as
begin
delete from ThanNhan where MaNV in(select MaNV from deleted)
delete from NhanVien where MaNV in(select MaNV from deleted)
end

delete from NhanVien where MaNV like '000000024'

create trigger update_Record_edited 
on NhanVien
instead of update
as 
begin
	update NhanVien
	set NgaySinh = GETDATE()
	where MaNV =(select MaNV from inserted)
end

update NhanVien
set DiaChi = N'Quận 12'
where MaNV = 'ps31471'
select * from NhanVien

alter TRIGGER vidu1
ON NhanVien
AFTER INSERT
AS
BEGIN
    DECLARE @dia_chi nvarchar(255);
    SELECT @dia_chi = DChi FROM inserted;
    DECLARE @count int;
    SELECT @count = COUNT(*) FROM NhanVien WHERE DChi = @dia_chi;
    PRINT N'Số lượng nhân viên đăng nhập ở quận ' + @dia_chi + ': ' + CAST(@count as nvarchar(10));
END;

select * from NhanVien
insert into NhanVien values('000000023',N'Trần',N'Quốc',N'Thuận','3','2002-05-01',N'Long An','Nam','17000','000000007'),
						   ('000000024',N'Trần',N'Quốc',N'Thuận','2','2001-05-01',N'Trường Chinh Q2','Nam','17000','000000006'),
						   ('000000025',N'Trần',N'Quốc',N'Thuận','5','2000-05-01',N'Long An','Nam','17000','000000002'),
						   ('000000026',N'Trần',N'Quốc',N'Thuận','1','2002-05-01',N'Long An','Nam','17000','000000008'),
						   ('000000027',N'Trần',N'Quốc',N'Thuận','4','2000-05-01',N'Long An','Nam','17000','000000001');
