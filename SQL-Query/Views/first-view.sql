use Crime
go
alter view dbo.vw_highest_stop_rate as 
with numberOfStops as
(
select
	replace(mc.ConstabularyID,1,4) constabularyID --Groups city of london with met
	,month(mc.Date) MonthOfStop
	,year(mc.date) YearOfStop
	,count(*) [Number Of Stops]
from masterCrimeData mc
Group by replace(mc.ConstabularyID,1,4),month(mc.Date),year(mc.date)
)
select
	dc.constabulary,
	DateName( month , DateAdd( month , nos.MonthOfStop , 0 ) - 1 ) as MonthOfStop, --month name instead of num
	nos.YearOfStop,
	nos.[Number Of Stops],
	case nos.YearOfStop
		when 2016 then dp.[Population mid-2015]^2/dp.[Population mid-2014] --estimation
		when 2015 then dp.[Population mid-2015] 
		when 2014 then dp.[Population mid-2014]
	end as [Population]
from numberOfStops nos
join DimConstabulary dc on nos.ConstabularyID = dc.constabularyID
join dimPopulation dp on nos.ConstabularyID = dp.populationID
