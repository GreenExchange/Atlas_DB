USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_AddAction]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_AddAction]    
(  
@DomainId nvarchar(50),
@DenialReason_ID int,
 @Action_Type  nvarchar(100)  
 
)    
AS    
BEGIN    
 BEGIN    
  BEGIN TRAN    
 INSERT INTO tblaction    
 (    
 DomainId,
  DenialReasons_Id,  
  Action_type  
 )    
    
 VALUES
(    
  @DomainId,
   @DenialReason_ID,      
	@Action_Type 
 )  
  COMMIT TRAN  
 END -- END of ELSE  
END

GO
