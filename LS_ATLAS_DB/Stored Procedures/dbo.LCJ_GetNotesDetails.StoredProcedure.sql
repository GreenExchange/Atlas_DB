USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_GetNotesDetails]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_GetNotesDetails]    
(    
@DomainId NVARCHAR(50),  
@Case_Id nvarchar(100),    
@Notes_Type nvarchar(100),    
@UserType nvarchar(10)    
)    
     
AS    
    
BEGIN    
      
       
   SELECT   Notes_Desc, User_Id, Convert(NVARCHAR(15), Notes_Date, 101)+' '+ Format(Notes_Date, 'hh:mm tt') AS Notes_Date, Notes_Type    
   FROM       tblNotes (NOLOCK) where Case_Id = +@Case_Id  and DomainId=@DomainId  
   and (@Notes_Type=' ---ALL--- '  or Notes_Type=@Notes_Type)  
   ORDER BY Notes_Id Desc,Notes_Date desc  
    
-- END    
    
END  
  
GO
