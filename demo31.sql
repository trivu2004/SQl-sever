
declare @a int , @b int;
set @a =(
select top 3 TenPHG, AVG(Luong)
from PhongBan p 
join NhanVien n
on p.MaPHG = n.PHG
group by TenPHG
order by AVG(Luong) desc);

set @b=(
select distinct top 2 TenPHG, AVG(Luong)
from PhongBan p 
join NhanVien n
on p.MaPHG = n.PHG
group by TenPHG
order by AVG(Luong) desc);

select @a
except
select @b

SELECT DISTINCT TOP 3 TenPHG, AVG(Luong)
FROM PhongBan p JOIN NhanVien n ON p.MaPHG = n.PHG
GROUP BY TenPHG
ORDER BY AVG(Luong) DESC
SELECT TOP 2 TenPHG, AVG(Luong)
FROM PhongBan p JOIN NhanVien n ON p.MaPHG = n.PHG
GROUP BY TenPHG
ORDER BY AVG(Luong) DESC;
