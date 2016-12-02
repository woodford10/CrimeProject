create table dbo.dimAge
	(AgeRangeID int identity(1,1) not null primary key
	,AgeRange varchar(10)
	)

insert into dbo.dimAge
	(AgeRange)

select distinct
	Case agerange 
		When '' THEN 'not stated'
		Else Agerange
	End [Ages]
from crime.dbo.[Crime-Data]km