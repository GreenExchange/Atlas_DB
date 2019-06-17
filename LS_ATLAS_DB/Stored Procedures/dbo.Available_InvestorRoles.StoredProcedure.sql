USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Available_InvestorRoles]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Available_InvestorRoles]  --  'priya'    
(    
@DomainId varchar(50)    
 )     
AS        
BEGIN      
   SELECT '0' as Id,' ---Select Investor Role--- ' as RoleName    
 UNION        
    select RoleId as Id ,RoleName from  [dbo].IssueTracker_Roles where DomainId=@DomainId and  RoleType='I'  
END  
GO
