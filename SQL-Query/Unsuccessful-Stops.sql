use crime
go
select
	replace(mc.ConstabularyID,1,4) constabularyID --Groups city of london with met
	,month(mc.Date) MonthOfStop
	,year(mc.date) YearOfStop
	,count(*) [Number Of Stops]
from masterCrimeData mc
where mc.OutcomeID not in (3,4)
Group by replace(mc.ConstabularyID,1,4),month(mc.Date),year(mc.date)
