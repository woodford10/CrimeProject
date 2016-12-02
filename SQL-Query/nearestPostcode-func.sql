USE [Crime]
GO

CREATE FUNCTION [dbo].[ufn_closestPostcode](@latitude varchar(9), @longitude varchar(9))
	returns varchar(8) 
as
begin
	declare @location geography = 'POINT('+@latitude+' '+@longitude+')'
	declare @postcode varchar(8)
	select top 1
		@postcode = [postcode]
	from dbo.dimLocation 
	order by @location.STDistance(cast('POINT('+cast(latitude as varchar(9))+' '+cast(longitude as varchar(9))+')' as geography)) asc
	return @postcode
end
GO


