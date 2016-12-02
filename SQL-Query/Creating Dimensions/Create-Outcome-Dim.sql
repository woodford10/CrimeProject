use crime
go
create table dbo.DimOutcome
(
	outcomeID int identity(1,1) not null primary key
	,outcome varchar(500)
)
insert into dbo.DimOutcome
(outcome)
select distinct
	case
		when lower(outcome)='' then 'not stated'
		else lower(outcome)
	end
from dbo.[Crime-Data]
