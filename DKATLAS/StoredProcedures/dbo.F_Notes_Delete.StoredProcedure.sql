USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_Notes_Delete]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_Notes_Delete]   --[dbo].[F_Notes_Delete]  
(  
@Notes_ID INT
)  
   
AS  
  
BEGIN  
  DECLARE @s_l_message NVARCHAR(500)
		
	INSERT INTO dbo.tbl_Deleted_Notes (Notes_ID,Notes_Desc,Notes_Type,Notes_Priority,Case_Id,Notes_Date,User_Id,Deleted_By)
	SELECT Notes_ID,Notes_Desc,Notes_Type,Notes_Priority,Case_Id,Notes_Date,User_Id,User_Id FROM tblNotes WHERE Notes_ID = @Notes_ID 
		
   DELETE FROM tblNotes WHERE Notes_ID = @Notes_ID  
   
   SET @s_l_message	=  'Notes Deleted successfuly'
   
   
   
   SELECT @s_l_message AS [MESSAGE]
  
END
GO
