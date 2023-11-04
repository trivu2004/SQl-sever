declare @Nhanvien_hcm table(
	MaNV nvarchar(15),
	TenNV nvarchar(15)
);
insert into @Nhanvien_hcm
select MaNV,TenNV
from NhanVien
where DChi like '%Hồng Gấm'

select *
from @Nhanvien_hcm;