USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_GETCLIENTREMITTANCE_APPLIED_TO_PROVIDER]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_GETCLIENTREMITTANCE_APPLIED_TO_PROVIDER]    
(
	@DomainId NVARCHAR(50),
	@clientid varchar(50)
)
AS
BEGIN  

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
		AND TRANSACTIONS_TYPE IN ('EXPF','EXPP','EXPC','EXP') 
		AND A.PROVIDER_ID		=	@clientid 
		AND C.PROVIDER_RETURNFF =	1    
		and C.Provider_SeesRFF	=	1 
		and B.DomainId=@DomainId
	ORDER BY 
		TRANSACTIONS_DATE

END

GO
