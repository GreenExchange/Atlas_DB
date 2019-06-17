USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_GETCLIENTREMITTANCECOST_GroupNew]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LCJ_GETCLIENTREMITTANCECOST_GroupNew]  
(      
@clientid varchar(50)      
)      
AS
BEGIN    
 
 select distinct B.provider_id,C.provider_name,      
 B.CASE_ID,B.InjuredParty_FirstName + ' ' +B.InjuredParty_LastName[INJUREDPARTY_NAME],ins.INSURANCECOMPANY_NAME,B.ACCIDENT_DATE,      
 B.DATEOFSERVICE_START,B.DATEOFSERVICE_END,
isnull(CONVERT(MONEY,isnull(B.CLAIM_AMOUNT,0.00))-CONVERT(MONEY,isnull(B.PAID_AMOUNT,0.00)),0.00) AS CLAIM_AMOUNT,B.INDEXORAAA_NUMBER,      
 B.Served_On_Date,
 A.TRANSACTIONS_TYPE,      
 A.TRANSACTIONS_AMOUNT,      
 A.TRANSACTIONS_DATE,      
 A.TRANSACTIONS_dESCRIPTION      
 from tbltransactions A inner join tblcase B
	ON A.Case_Id = B.Case_Id   
	inner join tblprovider C         
	on C.Provider_Id=B.Provider_Id 
	inner join tblInsuranceCompany ins
	on ins.InsuranceCompany_Id=B.InsuranceCompany_Id    
 WHERE (TRANSACTIONS_STATUS IS NULL or TRANSACTIONS_STATUS = 'CONFIRMED')      
 AND TRANSACTIONS_TYPE IN ('EXP','FFB')  AND C.PROVIDER_FF = 1  AND C.PROVIDER_SEESFF = 1   
 AND C.Provider_GroupName=@clientid   
 And ISNULL(C.Provider_GroupName,'') <> '' 
     
END
GO
