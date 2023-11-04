


declare @dem nvarchar(100) = 'The gaming cool'
	declare @i int = 0,@k int = 1,@previous int = 1
	while(@i<len(@dem))
	begin
	set @k = CHARINDEX(' ',@dem,@i+1)
	if(@k=0)
	break;
	else 
	set @k = @i 
	print substring(@dem,@previous,@k-@previous)
		set @previous = @k
	end
	print @i



























	DECLARE @dem NVARCHAR(100) = 'The quick brown fox jumps over the lazy dog'
SELECT SUBSTRING(@dem, CHARINDEX('dog', @dem), LEN('dog'))

DECLARE @String varchar(1000) = 'The quick brown fox jumps over the lazy dog';
SELECT REVERSE(SUBSTRING(REVERSE(@String), 1, CHARINDEX(' ', REVERSE(@String)) - 1));