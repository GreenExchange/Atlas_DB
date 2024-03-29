USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_GETCLIENTREMITTANCEREPORT]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_GETCLIENTREMITTANCEREPORT] -- LCJ_GETCLIENTREMITTANCEREPORT 'glf'  ,'3786'
(    
	@DomainId NVARCHAR(50),
	@clientid varchar(50)    
)    
AS
BEGIN     
	select distinct B.provider_id
	,A.Transactions_Id
	, C.provider_name, dbo.fncGetAccountNumber(B.CASE_ID) as ACT_NO
	, B.CASE_ID,B.CASE_CODE,B.InjuredParty_FirstName + ' ' +B.InjuredParty_LastName[INJUREDPARTY_NAME]
	, ins.INSURANCECOMPANY_NAME
	, B.ACCIDENT_DATE
	, B.DATEOFSERVICE_START
	, B.DATEOFSERVICE_END
	, ISNULL(B.FEE_SCHEDULE,0.00) AS FEE_sCHEDULE
	, CASE WHEN  B.CASE_ID LIKE 'ACT%'  THEN CONVERT(MONEY,ISNULL(B.CLAIM_AMOUNT,0.00))
		   ELSE ISNULL(CONVERT(MONEY,ISNULL(B.CLAIM_AMOUNT,0.00))-CONVERT(MONEY,ISNULL(B.PAID_AMOUNT,0.00)),0.00) END AS CLAIM_AMOUNT
	, A.TRANSACTIONS_TYPE
	, A.TRANSACTIONS_AMOUNT --A.TRANSACTIONS_fee,
	, CASE 	   
		   WHEN TRANSACTIONS_TYPE IN ('PreC') 
				THEN ISNULL(convert(money,(A.TRANSACTIONS_AMOUNT * ISNULL(Provider_Initial_Billing,1) /100 )),0.00)
			WHEN TRANSACTIONS_TYPE IN ('PreCToP') 
				THEN ISNULL(convert(money,(A.TRANSACTIONS_AMOUNT * ISNULL(Provider_Initial_Billing,1) /100 )),0.00)
		   WHEN TRANSACTIONS_TYPE IN ('C')
				THEN ISNULL(convert(money,(A.TRANSACTIONS_AMOUNT * ISNULL(Provider_Billing,1) /100 )),0.00)
		   WHEN TRANSACTIONS_TYPE IN ('I')  AND B.CASE_ID LIKE 'ACT%' 
				THEN ISNULL(convert(money,(A.TRANSACTIONS_AMOUNT *  ISNULL(Provider_Initial_IntBilling,1)/100 )),0.00)
		   WHEN TRANSACTIONS_TYPE IN ('I') 
				THEN ISNULL(convert(money,(A.TRANSACTIONS_AMOUNT * ISNULL(Provider_IntBilling,1) /100 )),0.00) END as TRANSACTIONS_FEE
	, A.TRANSACTIONS_DATE
	, ISNULL(A.ChequeNo,'')  + ISNULL(A.TRANSACTIONS_dESCRIPTION    ,'') as TRANSACTIONS_dESCRIPTION
	, A.TRANSACTIONS_ID,

	
	 CASE 	   
		   WHEN Vendor_Fee_Type ='Flat Fee'
		   AND Transactions_Id =(select Top 1 Transactions_Id from tblTransactions where Case_Id=A.Case_Id AND Transactions_Type='C' AND (A.Case_Id NOT IN (Select Case_Id from tblTransactions where Transactions_status='FREEZED' AND Transactions_Type='C'))  AND (TRANSACTIONS_STATUS IS NULL or TRANSACTIONS_STATUS = 'CONFIRMED') order by Transactions_Id )
		   THEN 			
				ISNULL(Vendor_Fee,0.00)
				
			WHEN Vendor_Fee_Type ='%'
			AND Transactions_Id =(select Top 1 Transactions_Id from tblTransactions where Case_Id=A.Case_Id AND Transactions_Type='C' AND (A.Case_Id NOT IN (Select Case_Id from tblTransactions where Transactions_status='FREEZED' AND Transactions_Type='C'))  AND (TRANSACTIONS_STATUS IS NULL or TRANSACTIONS_STATUS = 'CONFIRMED') order by Transactions_Id ) 
			THEN 
				ISNULL(ABS(ISNULL(convert(money,(A.TRANSACTIONS_AMOUNT * ISNULL(Vendor_Fee,0.00) /100 )),0.00)),0.00)
			WHEN Vendor_Fee_Type IS NULL
				THEN
				0.00
				ELSE
				0.00
				END AS  VENDOR_FEE




	--, ISNULL(C.BX_PSTG,0.00) AS FEE_POSTAGE
	--, ISNULL(Vendor_Fee_Type,'') AS Vendor_Fee_Type
	--, ISNULL(Vendor_Fee,0.00) AS Vendor_Fee
	--, Initial_Status
	--, Provider_Initial_Billing
	from tbltransactions A 
	inner join tblcase B ON A.Case_Id = B.Case_Id   
	inner join tblprovider C on C.Provider_Id=B.Provider_Id 
	inner join tblInsuranceCompany ins on ins.InsuranceCompany_Id = B.InsuranceCompany_Id   
	WHERE (TRANSACTIONS_STATUS IS NULL or TRANSACTIONS_STATUS = 'CONFIRMED')  
	and B.DomainId=@DomainId  
	AND TRANSACTIONS_TYPE IN ('C','I','PreC','PreCToP')    
	AND A.PROVIDER_ID=@clientid    
	--ORDER BY TRANSACTIONS_DATE  
END

GO
