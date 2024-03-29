USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_GETCLIENTREMITTANCE_Group]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LCJ_GETCLIENTREMITTANCE_Group]        
AS      
    
 select distinct C.Provider_GroupName,C.Provider_Name + ISNULL(N' [Group: ' + C.Provider_GroupName + N' ]', N'')providername_long,        
 count(distinct transactions_id) AS COUNTCHECKS,        
 --(SELECT ISNULL(sum(transactions_Amount),0.00) FROM TBLTRANSACTIONS C   
 --WHERE (TRANSACTIONS_STATUS IS NULL or TRANSACTIONS_STATUS = 'CONFIRMED')   
 --AND TRANSACTIONS_TYPE IN ('C','I','Prec')  AND c.Provider_Id NOT IN (SELECT Provider_Id FROM tblProviderFinancial)
 --) AS SUMCHECKS,    
 ISNULL(sum(transactions_Amount),0.00) As SUMCHECKS,    
 sum(transactions_fee) AS SUMFEES
 from tbltransactions A inner join tblcase B
 ON A.Case_Id = B.Case_Id   
  inner join tblprovider C         
  on C.Provider_Id=B.Provider_Id
 WHERE (TRANSACTIONS_STATUS IS NULL or TRANSACTIONS_STATUS = 'CONFIRMED')        
 AND TRANSACTIONS_TYPE IN ('C','I','Prec')         
 and invoice_type  = 'E'
  And ISNULL(C.Provider_GroupName,'') <>''
 GROUP BY C.Provider_Name,C.Provider_GroupName
  
GO
