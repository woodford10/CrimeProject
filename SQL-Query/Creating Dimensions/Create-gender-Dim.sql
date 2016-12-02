create table [Crime].[dbo].[dimGender]
(
	GenderID int identity(1,1) not null primary key,
	Gender varchar(100)
)

insert into [Crime].[dbo].[dimGender]
(Gender)
select distinct
	case Gender
		when '' then 'not stated'
		else lower(Gender)
	end
from [Crime].[dbo].[Crime-Data]