use crime
go
alter view dbo.vw_bucketed_lat_longs as 
select
	dc.constabulary
	, cast(ROUND(mc.Latitude,4) as decimal(4,2)) Lat
	, cast(ROUND(mc.Longitude,4) as decimal(4,2)) Long
	, count (*) FrequencyOfStops
from masterCrimeData mc
join DimConstabulary dc on replace(mc.ConstabularyID,1,4) = dc.constabularyID
group by  cast(ROUND(mc.Latitude,4) as decimal(4,2)), cast(ROUND(mc.Longitude,4) as decimal(4,2)),dc.constabulary
