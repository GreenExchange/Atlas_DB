USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_GETCLIENTREMITTANCEREPORT_Group]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LCJ_GETCLIENTREMITTANCEREPORT_Group] -- LCJ_GETCLIENTREMITTANCEREPORT @CLIENTID = '141'  
(    
	@clientid varchar(50)    
)    
AS
BEGIN   

	select distinct B.provider_id,C.provider_name, dbo.fncGetAccountNumber(B.CASE_ID) as ACT_NO,   
	B.CASE_ID,B.CASE_CODE,B.InjuredParty_FirstName + ' ' +B.InjuredParty_LastName[INJUREDPARTY_NAME],ins.INSURANCECOMPANY_NAME,B.ACCIDENT_DATE,    
	B.DATEOFSERVICE_START,B.DATEOFSERVICE_END,ISNULL(B.FEE_SCHEDULE,0.00) AS FEE_sCHEDULE,ISNULL(CONVERT(MONEY,ISNULL(B.CLAIM_AMOUNT,0.00))-CONVERT(MONEY,ISNULL(B.PAID_AMOUNT,0.00)),0.00) AS CLAIM_AMOUNT,A.TRANSACTIONS_TYPE,    
	A.TRANSACTIONS_AMOUNT,--A.TRANSACTIONS_fee,
	ISNULL(convert(money,(A.TRANSACTIONS_AMOUNT*(SELECT  Provider_Billing FROM TBLPROVIDER WHERE PROVIDER_ID=A.Provider_Id)/100 )),0.00)  as TRANSACTIONS_fee,
	A.TRANSACTIONS_DATE,A.TRANSACTIONS_dESCRIPTION    ,A.TRANSACTIONS_ID
	from tbltransactions A inner join tblcase B
	ON A.Case_Id = B.Case_Id   
	inner join tblprovider C         
	on C.Provider_Id=B.Provider_Id 
	inner join tblInsuranceCompany ins
	on ins.InsuranceCompany_Id=B.InsuranceCompany_Id   
	WHERE (TRANSACTIONS_STATUS IS NULL or TRANSACTIONS_STATUS = 'CONFIRMED')    
	AND TRANSACTIONS_TYPE IN ('C','I','PreC')    
	AND C.Provider_GroupName=@clientid   
	And ISNULL(C.Provider_GroupName,'') <> ''
	ORDER BY TRANSACTIONS_DATE  
END
GO
