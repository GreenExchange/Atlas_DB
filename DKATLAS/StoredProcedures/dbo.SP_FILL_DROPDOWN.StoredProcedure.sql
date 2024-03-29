USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[SP_FILL_DROPDOWN]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_FILL_DROPDOWN]  
 @FLAG NVARCHAR(50)  
AS  
BEGIN  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 SET NOCOUNT ON;  
  
    IF @FLAG = 'MST_PROCESS'  
 BEGIN  
  SELECT upper(sz_process_code) [CODE], upper(sz_process_name) [DESCRIPTION] FROM MST_process ORDER BY SZ_process_NAME  
 END  
END
GO
