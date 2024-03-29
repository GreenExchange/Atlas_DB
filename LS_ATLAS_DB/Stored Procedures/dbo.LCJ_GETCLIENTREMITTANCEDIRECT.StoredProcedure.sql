USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_GETCLIENTREMITTANCEDIRECT]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_GETCLIENTREMITTANCEDIRECT]     --[LCJ_GETCLIENTREMITTANCEDIRECT] 'glf'  
@DomainId NVARCHAR(50)
AS      
	select distinct B.provider_id,
		B.Provider_Name + ISNULL(N' [Group: ' + B.Provider_GroupName + N' ]', N'') AS ProviderName_Long,      
		count(distinct A.ChequeNo) AS COUNTCHECKS,      
		ISNULL(sum(transactions_Amount),0.00) AS SUMCHECKS,      
		SUM(transactions_fee) AS SUMFEES      
	from tbltransactions A inner join tblProvider B ON A.provider_id=B.provider_id  
	left outer join tblcase c on c.Case_Id=A.Case_Id       
	WHERE (TRANSACTIONS_STATUS IS NULL or TRANSACTIONS_STATUS = 'CONFIRMED')      
	AND TRANSACTIONS_TYPE IN ('C','I','PreC')       
	and invoice_type  = 'D' 
	and A.DomainId=@DomainId
	GROUP BY B.provider_id,Provider_GroupName,Provider_Name 
		
GO
