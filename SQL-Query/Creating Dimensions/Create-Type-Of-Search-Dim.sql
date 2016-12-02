use crime
go
create table dbo.DimTypeOfSearch
(
	TypeOfSearchID int identity(1,1) not null primary key
	,TypeOfSearch varchar(500)
)
insert into dbo.DimTypeOfSearch
(TypeOfSearch)
select distinct
	lower(replace(TypeOfSearch, ' search',''))
from dbo.[Crime-Data]
union
select 'not stated'

