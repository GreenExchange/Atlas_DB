USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Cases_By_CloseOutDate]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[Cases_By_CloseOutDate]  
(  
@DomainId NVARCHAR(50),  
@SZ_USER_ID  NVARCHAR(50)=''  
)  
AS begin  
DECLARE @InvestorId AS INT = 0  
SELECT @InvestorId=InvestorId FROM Tbl_Investor WHERE UserId = @SZ_USER_ID  
  
DECLARE @ProviderId AS INT = 0  
SELECT @ProviderId=Provider_id FROM TXN_PROVIDER_LOGIN WHERE user_id = @SZ_USER_ID  
  
  
SELECT LEFT(DATENAME(MONTH,Date_Closed),3) as CloseOutMonth,  
   sum(Fee_Schedule) as Fee_Schedule_Amt   
FROM [dbo].[tblcase]    
where  Year(Date_Closed) =YEAR(getdate())   
AND  STATUS IN('CLOSED','AAA - SETTLED - AWAITING PAYMENTS')   
AND  DomainId = @DomainId    
AND  (@ProviderId = '' or Provider_Id = @ProviderId)  
AND (@InvestorId = 0   
     OR portfolioid in (SElect portfolioid   
         from tbl_InvestorPortfolio IP   
         WHERE IP.InvestorId =@InvestorId))  
Group By  DATENAME(MONTH,Date_Closed)  order by DATENAME(MONTH,Date_Closed);  
  
END  
  
GO
