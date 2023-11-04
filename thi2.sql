create database COM2034_PS31493
use COM2034_PS31493
drop database COM2034_PS31493

create table DoiBong (
	MaDoi nvarchar(2) primary key not null,
	TenDoi nvarchar(100) not null,
	NamThanhLap int not null

);

create table CauThu (
	MaCauThu nvarchar(2) primary key not null,
	TenCauThu nvarchar(100) not null,
	Phai nvarchar(3) not null,
	NgaySinh date not null,
	NoiSinh nvarchar(50) not null

);

create table CT_DoiBong(
	MaDoi nvarchar(2) not null,
	MaCauThu nvarchar(2) not null,
	NgayVaoCLB date not null,
	primary key(MaDoi,MaCauThu)
);
select * from CauThu
select * from DoiBong
select * from CT_DoiBong
alter table CT_DoiBong add foreign key (MaDoi) references DoiBong(MaDoi)
alter table CT_DoiBong add foreign key (MaCauThu) references CauThu(MaCauThu)


insert into DoiBong  values('D1',N'Đội 1',2020),
						('D2',N'Đội 2',2021),
						('D3',N'Đội 3',2020),
						('D4',N'Đội 4',2022),
						('D5',N'Đội 5',2021);	

insert into CauThu values('C1',N'Nguyễn Văn An',N'Nam','2000-05-24',N'Bến Tre'),
						('C2',N'Lê Văn Bé',N'Nam','2001-06-19',N'TP HCM'),
						('C3',N'Trần Thị Bảy',N'Nữ','2001-07-15',N'Long An'),
						('C4',N'Nguyễn Thị Lan',N'Nữ','2002-05-17',N'Bến Tre'),
						('C5',N'Lê Văn Nhàn',N'Nam','2000-12-24',N'TP HCM');
						
insert into CT_DoiBong values('D1','C1','2022-06-01'),
							('D1','C2','2022-11-28'),
							('D2','C3','2023-03-05'),
							('D2','C4','2023-02-01'),
							('D3','C5','2021-04-01'),
							('D3','C2','2021-11-01');
							

--Bài 2
create PROCEDURE Cau1 @MaDoi nvarchar(2)
AS
BEGIN
    SELECT MaDoi, COUNT(*) AS SoLuongCauThu
    FROM CT_DoiBong
    WHERE MaDoi = @MaDoi
    GROUP BY MaDoi;
END;

exec Cau1 D3

alter function Cau2(@madoi nvarchar(2))
returns table
as
	return
	select TenCauThu,YEAR(GETDATE()) - YEAR(NgaySinh) as N'Tuổi' from CauThu join CT_DoiBong
	on CauThu.MaCauThu = CT_DoiBong.MaCauThu
	where MaDoi = @madoi

select * from dbo.Cau2('D2')

alter TRIGGER Cau3
ON CauThu
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE YEAR(GETDATE()) - YEAR(NgaySinh) < 18)
    BEGIN
        print N'Lỗi Tuổi rồi'
        ROLLBACK TRANSACTION;
    END;
END;

insert into CauThu values ('C6',N'Nguyễn Thị My',N'Nữ','2009-05-17',N'Bến Tre')


create view Cau4
as
	select TenCauThu,Phai,NoiSinh,TenDoi,NgayVaoCLB,YEAR(GETDATE()) - YEAR(NgaySinh) as N'Tuổi'
	from CauThu join CT_DoiBong 
	on CauThu.MaCauThu = CT_DoiBong.MaCauThu
	join DoiBong
	on CT_DoiBong.MaDoi = DoiBong.MaDoi

select * from Cau4