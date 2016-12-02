use crime
go
create table dbo.DimConstabulary
(
	constabularyID int identity(1,1) not null primary key
	,constabulary varchar(500)
)
insert into dbo.Dimconstabulary
(constabulary)
select distinct
	lower(replace(constabulary, '-',' '))
from dbo.[Crime-Data]
union
select 'not stated'