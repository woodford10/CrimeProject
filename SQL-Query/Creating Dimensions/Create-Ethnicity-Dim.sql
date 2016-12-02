
create table dbo.dimEthnicity
	(
		EthnicityID varchar(5) not null primary key
		,Ethnicity varchar(100)
	)


insert into dbo.dimEthnicity
	(EthnicityID, Ethnicity)

select distinct
	right(Ethnicity, 4) [Code]
	,left(Ethnicity,charindex(' (', Ethnicity)) [Codeless Ethinicity]
from crime.dbo.[Crime-Data]
where Ethnicity != ''