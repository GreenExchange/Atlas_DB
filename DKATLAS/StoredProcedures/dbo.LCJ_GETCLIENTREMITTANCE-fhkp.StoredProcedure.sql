USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_GETCLIENTREMITTANCE-fhkp]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_GETCLIENTREMITTANCE-fhkp]
AS 
begin
       
select distinct A.provider_id,B.providername_long,        
count(distinct transactions_id) AS COUNTCHECKS,        
(SELECT ISNULL(sum(transactions_Amount),0.00) FROM TBLTRANSACTIONS C   
WHERE C.PROVIDER_ID=A.provider_id 
--AND (TRANSACTIONS_STATUS IS NULL or TRANSACTIONS_STATUS = 'CONFIRMED')   
AND TRANSACTIONS_TYPE IN ('C','I','Prec') AND c.Provider_Id NOT IN (SELECT Provider_Id FROM tblProviderFinancial)  
) AS SUMCHECKS,        
sum(transactions_fee) AS SUMFEES        
from tbltransactions A inner join LCJ_VW_CASESEARCHDETAILS B         
ON A.Case_Id = B.Case_Id   
WHERE
Transactions_Date >='03/01/2014'
-- (TRANSACTIONS_STATUS IS NULL or TRANSACTIONS_STATUS = 'CONFIRMED')        
AND TRANSACTIONS_TYPE IN ('C','I','Prec')        
and invoice_type  = 'E' AND A.provider_id NOT IN (SELECT Provider_Id FROM tblProviderFinancial)  
and A.provider_id not in ('1911')  
GROUP BY B.providername_long,A.provider_id  
 
UNION  
  
select distinct A.provider_id,B.providername_long,        
count(distinct transactions_id) AS COUNTCHECKS,        
(SELECT ISNULL(sum(transactions_Amount),0.00) FROM TBLTRANSACTIONS C   
WHERE C.PROVIDER_ID=A.provider_id 
and Transactions_Date >='03/01/2014'
--AND (TRANSACTIONS_STATUS IS NULL or TRANSACTIONS_STATUS = 'CONFIRMED')   
AND TRANSACTIONS_TYPE IN ('C','I','PreC') AND (c.Provider_Id IN (SELECT Provider_Id FROM tblProviderFinancial))  
) AS SUMCHECKS,        
sum(transactions_fee) AS SUMFEES        
from tbltransactions A inner join LCJ_VW_CASESEARCHDETAILS B         
ON A.Case_Id = B.Case_Id       
WHERE 
Transactions_Date >='03/01/2014'
--(TRANSACTIONS_STATUS IS NULL or TRANSACTIONS_STATUS = 'CONFIRMED')        
AND TRANSACTIONS_TYPE IN ('C','I','PreC')        
and invoice_type  = 'E' AND (A.provider_id IN (SELECT Provider_Id FROM tblProviderFinancial))  
and A.provider_id not in ('1911')  
GROUP BY B.providername_long,A.provider_id  
ORDER BY B.providername_long,A.provider_id          
end
GO
