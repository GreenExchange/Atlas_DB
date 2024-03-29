USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_ADD_DENIAL_CATEGORY]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ADD_DENIAL_CATEGORY] 
@DomainId NVARCHAR(50), 
 @I_CATEGORY_ID INT = NULL,  
 @SZ_CATEGORY NVARCHAR(50),  
 @SZ_COLOR NVARCHAR(10)  
AS  
  
BEGIN  
 IF EXISTS (SELECT I_CATEGORY_ID FROM MST_DENIAL_CATEGORY  
   WHERE I_CATEGORY_ID = @I_CATEGORY_ID and DomainId=@DomainId)  
 BEGIN  
  UPDATE MST_DENIAL_CATEGORY  
  SET   
   SZ_CATEGORY_NAME = @SZ_CATEGORY,  
   SZ_CATEGORY_COLOR = @SZ_COLOR  ,
   DomainId = @DomainId
  WHERE I_CATEGORY_ID = @I_CATEGORY_ID  
 END  
 ELSE  
 BEGIN  
  INSERT INTO MST_DENIAL_CATEGORY (SZ_CATEGORY_NAME,SZ_CATEGORY_COLOR, DomainId)  
   VALUES(@SZ_CATEGORY,@SZ_COLOR, @DomainId)  
 END  
END

GO
