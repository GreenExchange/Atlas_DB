USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_LIST_DENIAL_CATEGORY]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LIST_DENIAL_CATEGORY]  
AS  
BEGIN  
 SELECT   
  I_CATEGORY_ID,  
  SZ_CATEGORY_NAME,  
  SZ_CATEGORY_COLOR  
 FROM MST_DENIAL_CATEGORY  
END

GO
