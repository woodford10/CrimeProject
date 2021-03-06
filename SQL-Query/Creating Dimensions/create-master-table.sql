--drop table Crime.dbo.masterCrimeData

create table [Crime].[dbo].[masterCrimeData]
(
CrimeID int identity(1,1) not null primary key
,TypeOfSearchID int
,[Date] datetime
,Latitude numeric(9,6)
,Longitude numeric(9,6)
,GenderID int
,AgeRangeID int
,EthnicityID varchar(5)
,ObjectOfSearchID int
,OutcomeID int
,ConstabularyID int
)
insert into dbo.masterCrimeData
(TypeOfSearchID,[date],Latitude,Longitude,GenderID,AgeRangeID,EthnicityID,ObjectOfSearchID,OutcomeID,ConstabularyID)
SELECT 
	  dt.TypeOfSearchID
      ,cast(replace(replace(cd.[date], 'T', ' '), '+00:00', '') as datetime) [Date]
      ,Case cd.latitude
			when'' then null
			else cast(cd.[Latitude] as numeric(9,6))
		end
      ,Case cd.Longitude
			when'' then null
			else cast(cd.Longitude as numeric(9,6))
		end
      ,dg.GenderID
      ,da.AgeRangeID
      ,de.EthnicityID
      ,dob.ObjectOfSearchid
      ,do.outcomeID
      ,dc.constabularyID
  FROM [Crime].[dbo].[Crime-Data] cd
  join dimAge da on cd.AgeRange = da.AgeRange
  join DimConstabulary dc on lower(replace(cd.constabulary, '-',' ')) = dc.constabulary
  join dimEthnicity de on left(cd.Ethnicity,charindex(' (', cd.Ethnicity)) = lower(de.Ethnicity)
  join dimGender dg on cd.Gender = dg.Gender
  join DimOutcome do on cd.Outcome=do.outcome
  join DimTypeOfSearch dt on lower(replace(cd.TypeOfSearch, ' search',''))=dt.TypeOfSearch
  join dimObjectOfSearch dob on cd.ObjectOfSearch=dob.ObjectOfSearch
 