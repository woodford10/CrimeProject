use Crime
go
create table #bucketLatLong
(
	lat decimal(9,6)
	,long decimal(9,6)
	,postcode varchar(10)
)	
insert into #bucketLatLong
(lat,long,postcode)
select
	lat
	,Long
	,dbo.ufn_closestPostcode([lat], [Long])
from dbo.vw_bucketed_lat_longs

create table dbo.bucketLatLong
(
	lat decimal(9,6)
	,long decimal(9,6)
	,postcode varchar(10)
	,primary key(lat,long)
)	

select lat,long,postcode from #bucketLatLong group by lat,long,postcode having count(*) >1

insert into bucketLatLong
(lat,long,postcode)
select * from #bucketLatLong
where lat is not null and long is not null
group by lat,long,postcode