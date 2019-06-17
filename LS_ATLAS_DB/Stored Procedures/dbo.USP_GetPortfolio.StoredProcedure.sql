USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[USP_GetPortfolio]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GetPortfolio]    
(
@DomainId varchar(50)
 ) 
AS    
BEGIN  
  SELECT '0' as ID,' ---Select Portfolio--- ' as Name
	UNION
  select Id,Name from  [dbo].[tbl_portfolio] where DomainId=@DomainId
END
GO
