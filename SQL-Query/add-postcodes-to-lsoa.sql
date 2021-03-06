use Crime
go
with LSOAtoPOSTCODE as
(
SELECT distinct
	LSOA11CD code,
      CASE
         WHEN PCD8 LIKE '% %' THEN LEFT(PCD8, Charindex(' ', PCD8) - 1)
		 ELSE PCD8
	   end as postcode
FROM [Crime].[dbo].[LSOA-Postcode]
)
update dimDetailedPop
	set Postcode = lp.postcode
from dbo.dimDetailedPop dp
left join LSOAtoPOSTCODE lp on
	dp.[Area Codes] = lp.code