﻿create database COM2034_PS31493_TinTuc
							(N' Thế Giới',' 2023-01-01'),
							(N'Khoa Học', '2023-01-01'),
							(N' Giải Trí', '2023-01-01'),
							(N'Kinh Doanh',' 2023-01-01');
						(N'Bảo Ngọc: Tôi đẹp hơn nhờ bị chê nhiều','2023-01-04',N'Tường Vân', 4),
						(N'Mourinho bị buộc tội lăng mạ trọng tài','2023-05-02',N'Thúy Vi', 1),
						(N'Ông Biden: Mỹ thoát thảm họa nhờ thỏa thuận trần nợ' ,'2023-05-05',N'Tường Vân', 2),
						(N'Máy ảnh AI chụp không cần ống kính','2023-04-02',N'Nhân Đạt', 3),
						(N'Người sống sót kể khoảnh khắc ba đoàn tàu Ấn Độ va chạm','2023-04-08',N'Nhân Đạt', 2),
						(N'Căng thẳng Mỹ - Trung phủ bóng Đối thoại Shangri-La','2023-04-02',N'Thúy Vi', 2),
						(N'Ten Hag: Man Utd cần đoạt Cup FA không phải để cản Man City ăn ba','2023-05-03',N'Thúy Vi', 1),
						( N'Chứng khoán lên cao nhất 4 tháng', '2023-04-02',N'Tường Vân', 5),
						( N'Ukraine nói Nga điều đặc nhiệm tới tăng viện tỉnh Belgorod','2023-01-04',N'Nhân Đạt', 2);
--hiện với điều kiện có tác giả đăng nhiều nhất qua tham số idLoaiTin, thông tin
--gồm có: idTinTuc, TenTinTuc, NgayDang, TenLT
--bài viết thì thực hiện xóa tất cả các bài viết thuộc loại tin đó.
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