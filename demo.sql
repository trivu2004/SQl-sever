use master;
create database demo;
use demo;

declare @chieudai int,@chieurong int,@dientich int
set @chieudai = 10 -- gán cho bien chiều dài = 10
set @chieurong = 6 -- gán cho bien chieu rông = 6
set @dientich = @chieudai*@chieurong -- tính giá trị của diện tích

select @dientich -- hiển thị kết quả 


use master
drop database demo;

declare @Max_luong int;
set @Max_luong = 300000;
print 'The maximum salary is ' + convert(char(10),@Max_luong);
select @Max_luong;
