USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[CLIENT_DETAILS]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CLIENT_DETAILS]  
(  
 @DomainId NVARCHAR(20)  
)  
AS  
BEGIN  
 SELECT   
		LawFirmName AS [LawFirmName],  
		isnull(Client_Billing_Address,'') [SZ_ADDRESS1],  
		isnull(Client_Billing_City,'') + ', '+ISNULL(Client_Billing_State,'') + ' ' + isnull(Client_Billing_Zip,'') [SZ_ADDRESS2]  
    
 FROM tbl_Client  
 WHERE   
  DomainId = @DomainId  
    
END

GO
