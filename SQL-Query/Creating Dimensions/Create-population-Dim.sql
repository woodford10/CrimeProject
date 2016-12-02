drop table dbo.dimpopulation
create table dbo.dimPopulation
(
	populationID int not null primary key
	,[Area(sq/km)] int not null
	,[Population mid-2001] int not null
	,[Population mid-2002] int not null 
	,[Population mid-2003] int not null 
	,[Population mid-2004] int not null 
	,[Population mid-2005] int not null 
	,[Population mid-2006] int not null
	,[Population mid-2007] int not null
	,[Population mid-2008] int not null 
	,[Population mid-2009] int not null 
	,[Population mid-2010] int not null 
	,[Population mid-2011] int not null 
	,[Population mid-2012] int not null
	,[Population mid-2013] int not null   
	,[Population mid-2014] int not null 
	,[Population mid-2015] int not null 
)
insert into dbo.dimPopulation
	(PopulationID
	,[Area(sq/km)]
	,[Population mid-2001]
	 ,[Population mid-2002]
	 ,[Population mid-2003]
	 ,[Population mid-2004]
	 ,[Population mid-2005]
	 ,[Population mid-2006]
	 ,[Population mid-2007]
	 ,[Population mid-2008]
	 ,[Population mid-2009]
	 ,[Population mid-2010]
	 ,[Population mid-2011]
	 ,[Population mid-2012]
	 ,[Population mid-2013]
	 ,[Population mid-2014]
	 ,[Population mid-2015]
	 )

Select

	CASE Name
		WHEN 'City of London' THEN 1
		WHEN 'Greater Manchester (Met County)' THEN 2
		WHEN 'Merseyside (Met County)' THEN 3
		WHEN 'LONDON' THEN 4
		WHEN 'West Midlands (Met County)' THEN 6
		WHEN 'West Yorkshire (Met County)' THEN 7
		ELSE 5
	END [Population IDs]
	,cast(replace([Area (sq km)], ',', '') as int)
	,cast(replace([Estimated population mid-2001], ',', '') as int)
	,cast(replace([Estimated population mid-2002], ',', '') as int)
	,cast(replace([Estimated population mid-2003], ',', '') as int)
	,cast(replace([Estimated population mid-2004], ',', '') as int)
	,cast(replace([Estimated population mid-2005], ',', '') as int)
	,cast(replace([Estimated population mid-2006], ',', '') as int)
	,cast(replace([Estimated population mid-2007], ',', '') as int)
	,cast(replace([Estimated population mid-2008], ',', '') as int)
	,cast(replace([Estimated population mid-2009], ',', '') as int)
	,cast(replace([Estimated population mid-2010], ',', '') as int)
	,cast(replace([Estimated population mid-2011], ',', '') as int)
	,cast(replace([Estimated population mid-2012], ',', '') as int)
	,cast(replace([Estimated population mid-2013], ',', '') as int)
	,cast(replace([Estimated population mid-2014], ',', '') as int)
	,cast(replace([Estimated population mid-2015], ',', '') as int)

From dbo.[population-data]