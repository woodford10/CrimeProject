create table [Crime].[dbo].[dimObjectOfSearch]
(
ObjectOfSearchid int identity(1,1) not null primary key,
ObjectOfSearch varchar(100)
)

insert into [Crime].[dbo].[dimObjectOfSearch]
(ObjectOfSearch)
select distinct
	case ObjectOfSearch
	when '' then 'not stated'
	else ObjectOfSearch
	end
from [Crime].[dbo].[Crime-Data]
