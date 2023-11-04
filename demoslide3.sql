declare @fullname varchar(20)
set @fullname = 'fptpolytechnic'
select SUBSTRING(@fullname,4,4);

select 'Today''s date is ' + CAST(GETDATE() as varchar);

select 'Today''s date is ' + convert(varchar,GETDATE(),101); --101 = mm-dd-yyyy

select 'Today''s date is ' + convert(varchar,GETDATE(),103); --103 = dd/mm/yyyy

 
 select 'Today''s date is ' + convert(varchar,GETDATE(),105); --105 = dd-mm-yyyy
 select 'Today''s date is ' + convert(varchar,GETDATE(),107); --107 = Mon dd, yyyy select 'Today''s date is ' + convert(varchar,GETDATE(),110); --110 = mm-dd-yyyy
