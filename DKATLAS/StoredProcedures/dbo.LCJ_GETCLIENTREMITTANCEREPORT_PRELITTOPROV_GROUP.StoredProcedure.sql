USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_GETCLIENTREMITTANCEREPORT_PRELITTOPROV_GROUP]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_GETCLIENTREMITTANCEREPORT_PRELITTOPROV_GROUP] --'40558'    
(    
	@dt1 datetime,
	@dt2 datetime,
	@provider_group varchar(50)       
)    
AS
BEGIN   

	select
		tbltransactions.Case_Id, Provider_name,
		ISNULL(dbo.tblcase.InjuredParty_FirstName, N'') + N'  ' + ISNULL(dbo.tblcase.InjuredParty_LastName, N'') AS InjuredParty_Name, 
		dbo.tblcase.Accident_Date,
		CONVERT(varchar(12), dbo.tblcase.DateOfService_Start, 1) AS DateOfService_Start, 
		CONVERT(varchar(12), dbo.tblcase.DateOfService_End, 1) AS DateOfService_End,
		ISNULL(CONVERT(MONEY,ISNULL(tblcase.CLAIM_AMOUNT,0.00))-CONVERT(MONEY,ISNULL(tblcase.PAID_AMOUNT,0.00)),0.00) AS CLAIM_AMOUNT,
		TRANSACTIONS_TYPE,
		TRANSACTIONS_DESCRIPTION,
		TRANSACTIONS_AMOUNT,
		TRANSACTIONS_Fee,
		TRANSACTIONS_dATE
	 from tbltransactions 
	 inner join tblcase on tblcase.Case_Id = tblTransactions.Case_Id
	 inner join tblProvider on tblcase.Provider_Id = tblProvider.Provider_Id
	WHERE Invoice_Id in 
	(select Account_Id from tblclientaccount 
	where Provider_id in (select Provider_Id from tblProvider where Provider_GroupName =@provider_group)
	and cast(floor(convert( float,account_date)) as datetime)>= @dt1
	and cast(floor(convert( float,account_date)) as datetime) <= @dt2)
	and TRANSACTIONS_TYPE IN ('PreCToP')  
	 
	--select distinct B.provider_id,B.provider_name,    
	--B.CASE_ID,B.CASE_CODE,B.INJUREDPARTY_NAME,B.INSURANCECOMPANY_NAME,B.ACCIDENT_DATE,    
	--B.DATEOFSERVICE_START,B.DATEOFSERVICE_END,ISNULL(CONVERT(MONEY,ISNULL(B.CLAIM_AMOUNT,0.00))-CONVERT(MONEY,ISNULL(B.PAID_AMOUNT,0.00)),0.00) AS CLAIM_AMOUNT,A.TRANSACTIONS_TYPE,    
	--A.TRANSACTIONS_AMOUNT,A.TRANSACTIONS_DATE,A.TRANSACTIONS_dESCRIPTION    ,A.TRANSACTIONS_ID
	--from tbltransactions A inner join LCJ_VW_CASESEARCHDETAILS B     
	--ON A.CASE_ID=B.CASE_ID    
	--WHERE (TRANSACTIONS_STATUS IS NULL or TRANSACTIONS_STATUS = 'CONFIRMED')    
	--AND TRANSACTIONS_TYPE IN ('PreCToP')    
	--AND A.PROVIDER_ID=@clientid    
	--ORDER BY TRANSACTIONS_DATE  
END
GO
