USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Earliest_Services]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  
  
CREATE PROCEDURE [dbo].[Earliest_Services]  
@DomainId NVARCHAR(50),  
@SZ_USER_ID  NVARCHAR(50)=''  
AS  
BEGIN  
DECLARE @InvestorId AS INT = 0  
SELECT @InvestorId=InvestorId FROM Tbl_Investor WHERE UserId = @SZ_USER_ID  
  
DECLARE @ProviderId AS INT = 0  
SELECT @ProviderId=Provider_id FROM TXN_PROVIDER_LOGIN WHERE user_id = @SZ_USER_ID  
  
  
 SELECT TOP 10 year(DateOfService_Start) as YearOfService_Start,  
  count(Case_Id) as Case_count  
  ,sum(Fee_Schedule) as Fee_Schedule_Amt   
  FROM [dbo].[tblcase] where  DomainId=@DomainId   
        AND (@ProviderId = '' or Provider_Id = @ProviderId)   
     AND (@InvestorId = 0   
     OR portfolioid in (SElect portfolioid   
         from tbl_InvestorPortfolio IP   
         WHERE IP.InvestorId =@InvestorId))  
  Group By year(DateOfService_Start) order by year(DateOfService_Start)  
END  






GO
