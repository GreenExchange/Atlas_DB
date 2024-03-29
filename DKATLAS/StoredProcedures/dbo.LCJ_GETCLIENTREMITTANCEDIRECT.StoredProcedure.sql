USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_GETCLIENTREMITTANCEDIRECT]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_GETCLIENTREMITTANCEDIRECT]      
AS      
	select distinct B.provider_id,B.providername_long,      
	count(distinct transactions_id) AS COUNTCHECKS,      
	(SELECT ISNULL(sum(transactions_Amount),0.00) FROM TBLTRANSACTIONS C WHERE C.PROVIDER_ID=B.PROVIDER_ID AND 
	(TRANSACTIONS_STATUS IS NULL or TRANSACTIONS_STATUS = 'CONFIRMED') AND TRANSACTIONS_TYPE IN ('C','I','PreC') AND (C.Provider_Id NOT IN (SELECT Provider_Id FROM tblProviderFinancial))) AS SUMCHECKS,      
	sum(transactions_fee) AS SUMFEES      
	from tbltransactions A inner join LCJ_VW_CASESEARCHDETAILS B       
	ON A.CASE_ID=B.CASE_ID      
	WHERE (TRANSACTIONS_STATUS IS NULL or TRANSACTIONS_STATUS = 'CONFIRMED')      
	AND TRANSACTIONS_TYPE IN ('C','I','PreC')       
	and invoice_type  = 'D' 
	-- AND (B.Provider_Id NOT IN (SELECT Provider_Id FROM tblProviderFinancial))
	GROUP BY B.providername_long,B.provider_id      




	
GO
