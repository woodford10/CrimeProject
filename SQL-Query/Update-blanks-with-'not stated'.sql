/****** Script for SelectTopNRows command from SSMS  ******/
use Crime
go

update [Crime-Data]
	set Ethnicity  = 'not stated (NS)'
where Ethnicity  = ''

UPDATE [Crime-Data]
SET AgeRange='not stated'
WHERE AgeRange=''

UPDATE [Crime-Data]
SET Constabulary='not stated'
WHERE Constabulary=''

UPDATE [Crime-Data]
SET TypeOfSearch='not stated'
WHERE TypeOfSearch=''

UPDATE [Crime-Data]
SET Outcome='not stated'
WHERE Outcome=''

UPDATE [Crime-Data]
SET ObjectOfSearch='not stated'
WHERE ObjectOfSearch=''

UPDATE [Crime-Data]
SET Gender='not stated'
WHERE gender=''