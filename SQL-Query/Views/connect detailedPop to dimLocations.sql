create view dbo.vw_locationPop
as
with pop2014 as
(
SELECT 
      [Postcode]
	  ,sum(cast([All Ages] as int)) [Pop-2014]
  FROM [Crime].[dbo].[dimDetailedPop]
  where Year = 2014
  group by Postcode
),
pop as 
(
SELECT 
      p.[Postcode]
	  ,p.[Pop-2014]
	  ,sum(cast(ddp.[All Ages] as int)) [Pop-2015]
 FROM [Crime].[dbo].[dimDetailedPop] ddp
 join pop2014 p on p.Postcode = ddp.Postcode
 where Year = 2015
 group by p.Postcode, p.[Pop-2014]
 )
 select
	dl.*
	,p.[Pop-2014]
	,p.[Pop-2015]
 from dimLocation dl
 left  outer join pop p on
	dl.Postcode = p.postcode