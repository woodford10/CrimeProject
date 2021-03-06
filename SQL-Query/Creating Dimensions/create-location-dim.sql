use crime
go
create table dbo.dimLocation
(
	postcode varchar(8) not null primary key
	,latitude decimal(9,6) not null
	,longitude decimal(9,6) not null
	,town varchar(50)
	,region varchar(40) not null
	,country varchar(20) not null
)
insert into dbo.dimLocation
(postcode,latitude,longitude, town, region,country)
SELECT
	  [postcode]
      ,[latitude]
      ,[longitude]
      ,nullif([town],'') town
      ,[region]
      ,[country_string] country
FROM [Crime].[dbo].[locations]