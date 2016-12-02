use Crime
go
alter proc dbo.usp_closestPostcode
	@latitude varchar(9)
	,@longitude varchar(9)
	--,@postcode varchar(8) output
as
begin
	declare @location geography = 'POINT('+@latitude+' '+@longitude+')'
	select top 1
		[postcode]
	from dbo.dimLocation 
	order by @location.STDistance(cast('POINT('+cast(latitude as varchar(9))+' '+cast(longitude as varchar(9))+')' as geography)) asc
end