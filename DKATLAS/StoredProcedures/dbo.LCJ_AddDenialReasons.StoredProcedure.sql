USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_AddDenialReasons]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_AddDenialReasons]    
(  
 @DenialReasons_Type  nvarchar(100),  
 @I_CATEGORY_ID int  
)    
AS    
BEGIN    
 BEGIN    
  BEGIN TRAN    
 INSERT INTO tblDenialReasons    
 (    
  DenialReasons_Type,  
  I_CATEGORY_ID  
 )    
    
 VALUES(    
   @DenialReasons_Type,  
   @I_CATEGORY_ID    
 )  
  COMMIT TRAN  
 END -- END of ELSE  
END
GO
