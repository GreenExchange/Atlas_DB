USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Get_ClientCompany_Type]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_ClientCompany_Type]    
(@DomainId varchar(50)	) 
AS    
BEGIN   
 SELECT CompanyType from [dbo].[tbl_Client]  where DomainId = @DomainId  
END
GO
