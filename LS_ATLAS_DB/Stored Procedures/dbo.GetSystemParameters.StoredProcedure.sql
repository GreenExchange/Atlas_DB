USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[GetSystemParameters]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetSystemParameters] 
AS  
BEGIN  
 SET NOCOUNT ON;    
 Select * from tblApplicationSettings;  
 select * from tblBasePath 
 --Select * from tblCompanyBasePathMapping 
END
GO
