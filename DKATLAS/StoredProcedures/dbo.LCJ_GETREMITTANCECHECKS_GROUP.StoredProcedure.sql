USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_GETREMITTANCECHECKS_GROUP]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_GETREMITTANCECHECKS_GROUP] -- [LCJ_GETREMITTANCECHECKS_GROUP]'2/9/2012','2/9/2013'

(
@dt1 datetime,
@dt2 datetime
)
as
begin

	select * ,last_printed as lp 
	from 
	tblClientAccountGroup b 
	where
	cast(floor(convert( float,b.account_date)) as datetime)>= @dt1 and cast(floor(convert( float,b.account_date)) as datetime) <= @dt2
	order by Provider_GroupName,Last_Printed

	--select
	--	TPG.ID,
	--	sum(GROSS_AMOUNT) as GROSS_AMOUNT,
	--	SUM(FIRM_FEES) as FIRM_FEES,
	--	SUM(FINAL_REMIT) as FINAL_REMIT ,
	--	MAX(account_id) as account_id,
	--	MAX(account_date) as account_date
	--	,last_printed as lp 
		
	--from tblprovider a 
	--inner JOIN TblProvider_Groups TPG on a.Provider_GroupName = TPG.ID
	--inner join tblClientAccountGroup b on a.Provider_GroupName=b.Provider_GroupName 
	--where TPG.ID <> '' and
	--cast(floor(convert( float,b.account_date)) as datetime)>= @dt1 
	--and cast(floor(convert( float,b.account_date)) as datetime) <= @dt2
	--GROUP BY TPG.ID,last_printed
	
	
	--select * from TblProvider_Groups
	--select * from tblprovider
	--LEFT OUTER JOIN TblProvider_Groups on tblProvider.Provider_GroupName = TblProvider_Groups.ID
	
--	select * from tblclientaccount where Account_Id ='7598'
END
GO
