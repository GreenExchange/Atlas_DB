USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[USP_GetPortfolioForProvider]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_GetPortfolioForProvider]    
(
@ProviderId INT,
@DomainId VARCHAR(50)
 ) 
AS    
BEGIN  

  SELECT '0' AS ID,' ---Select Portfolio--- ' AS Name
  UNION
  SELECT   Id,Name 
  FROM     [dbo].[tbl_portfolio] 
  WHERE    Id in (SELECT    PortfolioId 
				  FROM      tblcase 
				  WHERE     Provider_Id = @ProviderId
				  ) 
				  AND DomainId=@DomainId

END
GO
