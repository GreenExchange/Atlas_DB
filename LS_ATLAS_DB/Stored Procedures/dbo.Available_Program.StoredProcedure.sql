USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Available_Program]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Available_Program]    
(
@DomainId varchar(50)
	) 
AS    
BEGIN  
  select Id,Name from  [dbo].[tbl_Program] where DomainId=@DomainId
END
GO
