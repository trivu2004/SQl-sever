create database QuanLyNhaTro_PS31493;
use QuanLyNhaTro_PS31493;
drop database QuanLyNhaTro_PS31493;
CREATE TABLE LOAINHA (
    MaLN INT PRIMARY KEY,
    TenLN NVARCHAR(50) NOT NULL
);

CREATE TABLE NGUOIDUNG (
    MaND INT PRIMARY KEY,
    TenND NVARCHAR(50) NOT NULL,
    Gioitinh NVARCHAR(10) NOT NULL CHECK (Gioitinh IN ('Nam', N'Nữ')),
    SDT int NOT NULL,
    DiaChi NVARCHAR(150) NOT NULL,
    Quan NVARCHAR(50) NOT NULL,
    Email NVARCHAR(50) NOT NULL
);
CREATE TABLE NHATRO (
    MaNT INT PRIMARY KEY,
    MaLN INT NOT NULL,
    DienTich FLOAT NOT NULL CHECK (DienTich >= 0),
    Giaphong FLOAT NOT NULL,
    DiaChi NVARCHAR(150) NOT NULL,
    Quan NVARCHAR(50) NOT NULL,
    MoTa NVARCHAR(MAX) NOT NULL,
    Ngaydang DATE NOT NULL,
    NguoiLH INT NOT NULL,
    FOREIGN KEY (MaLN) REFERENCES LOAINHA(MaLN),
    FOREIGN KEY (NguoiLH) REFERENCES NGUOIDUNG(MaND)
);
CREATE TABLE DANHGIA (
    ID INT PRIMARY KEY,
    NguoiDG INT NOT NULL,
    MaNT INT NOT NULL,
    Danhgia BIT NOT NULL CHECK (Danhgia IN (0, 1)),
    NoidungDG NVARCHAR(MAX) NOT NULL,
    FOREIGN KEY (NguoiDG) REFERENCES NGUOIDUNG(MaND),
    FOREIGN KEY (MaNT) REFERENCES NHATRO(MaNT)
);
INSERT INTO LOAINHA (MaLN, TenLN) VALUES
(1, N'Phòng trọ'),
(2, N'Chung cư mini'),
(3, N'Nhà nguyên căn');
INSERT INTO NGUOIDUNG (MaND, TenND, Gioitinh, SDT, DiaChi, Quan, Email) VALUES
(1, N'Nguyễn Đỗ Hoàng Vũ', 'Nam', '0987654321', N'123 Đường A', N'Quận 1', 'nguyendohoangvu@gmail.com'),
(2, N'Nguyễn Ngọc Thảo Vy', N'Nữ', '0123456789', N'456 Đường B', N'Quận 2', 'nguyenngocthaovy@gmail.com'),
(3, N'Trần Văn Đốc', 'Nam', '0901234567', N'789 Đường C', N'Quận 3', 'tranvandoc@gmail.com'),
(4, N'Nguyễn Ngọc Kim Uyên', N'Nữ', '0912345678', N'321 Đường D', N'Quận 4', 'nguyenngockimuyend@gmail.com'),
(5, N'Lã Minh Đức', 'Nam', '0987654321', N'654 Đường E', N'Quận 5', 'laminhduc@gmail.com'),
(6, N'Nguyễn Huỳnh Mai Trâm', N'Nữ', '0123456789', N'879 Đường F', N'Quận 6', 'nguyenhuynhmaitram@gmail.com'),
(7, N'Phạm Tuấn Anh', 'Nam', '0901234567', N'246 Đường G', N'Quận 7', 'phamtuananh@gmail.com'),
(8, N'Đặng Thùy Phương Uyên', N'Nữ', '0912345678', N'357 Đường H', N'Quận 8', 'dangthuyphuonguyen@gmail.com'),
(9, N'Nguyễn Lê Hoàng Như', 'Nam', '0987654321', N'468 Đường I', N'Quận 9', 'nguyenlehoangnhu@gmail.com'),
(10, N'Đinh Ngọc Bảo Trân', N'Nữ', '0123456789', N'579 Đường K', N'Quận 10', 'dinhngocbaotran@gmail.com'),
(11, N'Đinh Ngọc Bảo Hân', N'Nữ', '0128569489', N'579 Đường H', N'Quận 12', 'dinhngocbaohan@gmail.com'),
(12, N'Đinh Ngọc Bảo Trúc', N'Nữ', '01312465213', N'579 Đường L', N'Quận 7', 'dinhngocbaotruc@gmail.com'),
(13, N'Đinh Ngọc Linh', N'Nữ', '0135633114', N'579 Đường Số 3', N'Quận 8', 'dinhngoclinh@gmail.com'),
(14, N'Đinh Ngọc Ngân', N'Nữ', '0156956995', N'579 Đường Số 2', N'Quận 7', 'dinhngocngan@gmail.com'),
(15, N'Đinh Ngọc Mai', N'Nữ', '0135684112', N'579 Đường Số 4', N'Quận 7', 'dinhngocmai@gmail.com');
INSERT INTO NHATRO (MaNT, MaLN, DienTich, Giaphong, DiaChi, Quan, MoTa, Ngaydang, NguoiLH) VALUES
(1, 1, 20, 2000000, N'123 Đường A', N'Quận 1', N'Phòng trọ mới xây, có sẵn đầy đủ tiện nghi', '2023-05-01', 1),
(2, 2, 30, 3000000, N'456 Đường B', N'Quận 2', N'Chung cư mini cao cấp, gần trung tâm thành phố', '2023-05-02', 2),
(3, 3, 50, 5000000, N'789 Đường C', N'Quận 3', N'Nhà nguyên căn rộng rãi, có sân vườn', '2023-05-03', 3),
(4, 1, 25, 2500000, N'321 Đường D', N'Quận 4', N'Phòng trọ sạch sẽ, thoáng mát', '2023-05-04', 4),
(5, 2, 35, 3500000, N'654 Đường E', N'Quận 5', N'Chung cư mini tiện nghi, view đẹp', '2023-05-05', 5),
(6, 3, 55, 5500000, N'879 Đường F', N'Quận 6', N'Nhà nguyên căn yên tĩnh, an ninh', '2023-05-06', 6),
(7, 1, 30, 3000000, N'246 Đường G', N'Quận 7', N'Phòng trọ gần trung tâm, thuận tiện đi lại', '2023-05-07', 7),
(8, 2, 40, 4000000, N'357 Đường H', N'Quận 8', N'Chung cư mini mới xây, đầy đủ tiện nghi', '2023-05-08', 8),
(9, 3, 60, 6000000, N'468 Đường I', N'Quận 9', N'Nhà nguyên căn rộng rãi, có view đẹp', '2023-05-09', 9),
(10, 1, 35, 3500000, N'579 Đường K', N'Quận 10', N'Phòng trọ sạch sẽ, an ninh tốt', '2023-05-10', 10),
(11, 1, 85, 6500000, N'579 Đường O', N'Quận 10', N'Nhà nguyên căn rộng rãi, có view đẹp', '2023-05-10', 11),
(12, 1, 35, 7500000, N'579 Đường A', N'Quận 10', N'Phòng trọ sạch sẽ, an ninh tốt', '2023-05-10', 12),
(13, 1, 35, 8500000, N'579 Đường B', N'Quận 10', N'Nhà nguyên căn rộng rãi, có view đẹp', '2023-05-10', 13),
(14, 1, 35, 9500000, N'579 Đường E', N'Quận 10', N'Phòng trọ sạch sẽ, an ninh tốt', '2023-05-10', 14),
(15, 1, 35, 9500000, N'579 Đường E', N'Quận 10', N'Phòng trọ sạch sẽ, an ninh tốt', '2023-05-10', 15);

INSERT INTO DANHGIA (ID, NguoiDG, MaNT, Danhgia, NoidungDG) VALUES
(1, 1, 1, 1, N'Phòng trọ rất tốt, sạch sẽ và thoáng mát'),
(2, 2, 2, 0, N'Không hài lòng về chất lượng dịch vụ'),
(3, 3, 3, 1, N'Nhà nguyên căn rộng rãi, giá cả hợp lý'),
(4, 4, 4, 1, N'Phòng trọ ở vị trí thuận tiện, gần chợ'),
(5, 5, 5, 0, N'Không thích cách bài trí trong căn hộ'),
(6, 6, 6, 1, N'Nhà nguyên căn yên tĩnh, phù hợp cho gia đình nhỏ'),
(7, 7, 7, 1, N'Phòng trọ sạch sẽ, chủ nhà thân thiện'),
(8, 8, 8, 0, N'Không hài lòng về chất lượng đồ nội thất trong căn hộ'),
(9, 9, 9, 1, N'Nhà nguyên căn có view đẹp, thoáng mát'),
(10, 10, 10, 1, N'Phòng trọ sạch sẽ, an ninh tốt'),
(11,11,11, 0, N'Không hài lòng về chất lượng đồ nội thất trong căn hộ'),
(12,12,12, 1, N'Nhà nguyên căn có view đẹp, thoáng mát'),
(13,13,13, 1, N'Phòng trọ sạch sẽ, an ninh tốt'),
(14,14,14, 0, N'Nhà nguyên căn có view đẹp, thoáng mát'),
(15,15,15, 0, N'Phòng trọ sạch sẽ, an ninh tốt');


select * 
from LOAINHA

select *
from DANHGIA


select *
from NHATRO

select *
from NGUOIDUNG