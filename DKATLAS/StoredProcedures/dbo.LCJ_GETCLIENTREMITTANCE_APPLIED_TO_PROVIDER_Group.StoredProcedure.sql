USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_GETCLIENTREMITTANCE_APPLIED_TO_PROVIDER_Group]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LCJ_GETCLIENTREMITTANCE_APPLIED_TO_PROVIDER_Group]    
(
	@clientid varchar(50)
)
AS
BEGIN  
IF @clientid<>'1909'  
	 select distinct 
		B.provider_id,
		C.provider_name,
		B.CASE_ID,
		B.InjuredParty_FirstName + ' ' +B.InjuredParty_LastName[INJUREDPARTY_NAME],
		ins.INSURANCECOMPANY_NAME,
		B.ACCIDENT_DATE,
		B.DATEOFSERVICE_START,
		B.DATEOFSERVICE_END,
		CONVERT(MONEY,B.CLAIM_AMOUNT)-CONVERT(MONEY,B.PAID_AMOUNT) AS CLAIM_AMOUNT,
		B.INDEXORAAA_NUMBER,
		B.Served_On_Date,
		A.TRANSACTIONS_TYPE,
		A.TRANSACTIONS_AMOUNT,
		A.TRANSACTIONS_DATE,
		A.TRANSACTIONS_dESCRIPTION
	 from 
		tbltransactions A 
		inner join tblcase B ON A.Case_Id = B.Case_Id
		inner join tblprovider C on C.Provider_Id=B.Provider_Id
		inner join tblInsuranceCompany ins on ins.InsuranceCompany_Id=B.InsuranceCompany_Id
	 WHERE 
		(TRANSACTIONS_STATUS IS NULL or TRANSACTIONS_STATUS = 'CONFIRMED')    
		AND TRANSACTIONS_TYPE IN ('EXPF','EXPP','EXPC') 
		AND C.Provider_GroupName		=	@clientid 
		AND C.PROVIDER_RETURNFF =	1    
		and C.Provider_SeesRFF	=	1 
	ORDER BY 
		TRANSACTIONS_DATE
ELSE -- 2007-02-02: The idea is for this query to not return any results.
	 select distinct 
		B.provider_id,
		B.provider_name,
		B.CASE_ID,
		B.INJUREDPARTY_NAME,
		B.INSURANCECOMPANY_NAME,
		B.ACCIDENT_DATE,
		B.DATEOFSERVICE_START,
		B.DATEOFSERVICE_END,
		CONVERT(MONEY,B.CLAIM_AMOUNT)-CONVERT(MONEY,B.PAID_AMOUNT) AS CLAIM_AMOUNT,
		B.INDEXORAAA_NUMBER,
		B.Served_On_Date,
		A.TRANSACTIONS_TYPE,
		A.TRANSACTIONS_AMOUNT,
		A.TRANSACTIONS_DATE,
		A.TRANSACTIONS_dESCRIPTION
	from 
		tbltransactions A 
		inner join LCJ_VW_CASESEARCHDETAILS B ON A.CASE_ID=B.CASE_ID AND A.CASE_ID<>B.CASE_ID 
		Where B.Provider_GroupName='Classic Medical Diagnostic Rehab PC'  
	ORDER BY 
		TRANSACTIONS_DATE
END
GO
