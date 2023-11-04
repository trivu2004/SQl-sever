create database COM2034_PS31493_TinTucuse COM2034_PS31493_TinTucdrop database COM2034_PS31493_TinTuccreate table LoaiTin(	idLoaiTin int identity(1,1) primary key not null,	TenLT nvarchar(50) not null,	NgayTao date not null);create table TinTuc(	idTinTuc int identity(1,1) not null,	TenTinTuc nvarchar(255) not null,	NgayDang date not null,	TacGia nvarchar(50) not null,	idLoaiTin int not null);alter table TinTuc add foreign key (idLoaiTin) references LoaiTin(idLoaiTin)insert into LoaiTin values ( N'Thể Thao', '2023-01-01'),
							(N' Thế Giới',' 2023-01-01'),
							(N'Khoa Học', '2023-01-01'),
							(N' Giải Trí', '2023-01-01'),
							(N'Kinh Doanh',' 2023-01-01');insert into TinTuc values (N'Djokovic thắng nhọc ở vòng ba Roland Garros',' 2023-03-02',N' Nhân Đạt', 1),
						(N'Bảo Ngọc: Tôi đẹp hơn nhờ bị chê nhiều','2023-01-04',N'Tường Vân', 4),
						(N'Mourinho bị buộc tội lăng mạ trọng tài','2023-05-02',N'Thúy Vi', 1),
						(N'Ông Biden: Mỹ thoát thảm họa nhờ thỏa thuận trần nợ' ,'2023-05-05',N'Tường Vân', 2),
						(N'Máy ảnh AI chụp không cần ống kính','2023-04-02',N'Nhân Đạt', 3),
						(N'Người sống sót kể khoảnh khắc ba đoàn tàu Ấn Độ va chạm','2023-04-08',N'Nhân Đạt', 2),
						(N'Căng thẳng Mỹ - Trung phủ bóng Đối thoại Shangri-La','2023-04-02',N'Thúy Vi', 2),
						(N'Ten Hag: Man Utd cần đoạt Cup FA không phải để cản Man City ăn ba','2023-05-03',N'Thúy Vi', 1),
						( N'Chứng khoán lên cao nhất 4 tháng', '2023-04-02',N'Tường Vân', 5),
						( N'Ukraine nói Nga điều đặc nhiệm tới tăng viện tỉnh Belgorod','2023-01-04',N'Nhân Đạt', 2);-- Tạo Stored Procedure hiển thị thông tin về các tin tức (bài viết) được thực
--hiện với điều kiện có tác giả đăng nhiều nhất qua tham số idLoaiTin, thông tin
--gồm có: idTinTuc, TenTinTuc, NgayDang, TenLTcreate proc Bai2_1(@idtintuc int)asbegin	select top 1 idTinTuc,TenTinTuc,NgayDang,TenTinTuc From TinTuc	where idTinTuc = @idtintucendexec Bai2_1 3-- Tạo Trigger thực hiện xóa dữ liệu trong bảng LoaiTin, nếu loại tin đó đã có
--bài viết thì thực hiện xóa tất cả các bài viết thuộc loại tin đó.alter trigger Bai2_2on LoaiTinfor deleteasbegin	delete from TinTuc where idLoaiTin in (select idLoaiTin from deleted)endselect * from LoaiTin where idLoaiTin = 5delete from TinTuc where idLoaiTin = 5delete from LoaiTin where idLoaiTin = 5--Tạo View thông tin trả về gồm các trường: TenTinTuc, NgayDang, TacGia.
--Viết truy vấn Chỉnh Sửa (Update) Tác Giả cho bảng View (mục 3) với Tên tác
--giả mới

create view Bai2_3
as
	select TenTinTuc,NgayDang,TacGia from TinTuc

go
update Bai2_3
set TacGia = N'Tên Tác Giả Mới'
where TacGia = N'Tường Vân'

--Viết Function nhập vào tên tác giả trả về: TenTinTuc, NgayDang, TenLT (của tác giả đó trong tháng 4.
create function Bai2_4(@tentacgia nvarchar(50))
returns table
as
return
	select TenTinTuc,NgayDang,TenLT from TinTuc join LoaiTin
	on TinTuc.idLoaiTin = LoaiTin.idLoaiTin
	where MONTH(NgayDang) = 4 and TacGia = @tentacgia


select *from dbo.Bai2_4(N'Thúy Vi')