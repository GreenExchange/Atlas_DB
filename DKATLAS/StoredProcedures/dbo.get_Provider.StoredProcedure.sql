USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[get_Provider]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[get_Provider] -- 'FH10-73690'
 (  
	@case_id NVarChar(50) 
 )  
AS  
  
begin  
  
 SELECT provider_id from tblcase where case_id=@case_id
  
end
GO
