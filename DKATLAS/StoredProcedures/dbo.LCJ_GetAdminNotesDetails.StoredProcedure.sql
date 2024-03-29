USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_GetAdminNotesDetails]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_GetAdminNotesDetails] -- [LCJ_GetAdminNotesDetails]'Add Box Detail','06122012_1'
(  
@Notes_Type nvarchar(100),
@batch_num nvarchar(100)
)  
   
AS    
BEGIN 
 SELECT   Notes_Id,SUBSTRING (Notes_Desc , CHARINDEX('s', Notes_Desc) + 12, LEN(Notes_Desc)) as Notes_Desc, User_Id, Notes_Date
   FROM       AdminNotes where Type  = +@Notes_Type and Notes_Desc like '%'+@batch_num+'%'
   
   ORDER BY Notes_Date desc  
END
GO
