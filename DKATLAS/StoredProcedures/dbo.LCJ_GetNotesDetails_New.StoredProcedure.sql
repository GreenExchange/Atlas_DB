USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_GetNotesDetails_New]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_GetNotesDetails_New]  
(  
@Case_Id NVARCHAR(100),  
@Notes_Type NVARCHAR(100),  
@UserType NVARCHAR(10)  
)  
   
AS  
  
BEGIN  
  
--IF @UserType = 'P'  
  
-- BEGIN  
  
--  IF @Notes_Type <> 'ALL'  
   
--   SELECT   Notes_Desc, User_Id, Convert(NVARCHAR(15), Notes_Date, 101) AS Notes_Date, Notes_Type  
--   FROM       tblNotes WHERE Case_Id = +@Case_Id AND Notes_Type = +@Notes_Type AND Notes_Desc LIKE 'File Viewed%'  
--   ORDER BY Notes_Date DESC, Notes_Id DESC  
--  ELSE  
     
--   SELECT   Notes_Desc, User_Id, Convert(NVARCHAR(15), Notes_Date, 101) AS Notes_Date, Notes_Type  
--   FROM       tblNotes WHERE Case_Id = +@Case_Id AND Notes_Desc LIKE 'File Viewed%'  
--   ORDER BY Notes_Date DESC, Notes_Id DESC  
  
-- END  
  
--ELSE  
  
-- BEGIN  
   
--  IF @Notes_Type <> 'ALL'  
--   
--   SELECT   Notes_Desc, User_Id, Convert(NVARCHAR(15), Notes_Date, 101) AS Notes_Date, Notes_Type  
--   FROM       tblNotes WHERE Case_Id = +@Case_Id AND Notes_Type = +@Notes_Type  
--   ORDER BY Notes_Date DESC, Notes_Id DESC  
--  ELSE  
     
   --SELECT   Notes_ID,Notes_Desc, User_Id, Convert(NVARCHAR(15), Notes_Date, 101) AS Notes_Date, Notes_Type  
   --FROM       tblNotes WHERE Case_Id = +@Case_Id  
   --ORDER BY Notes_Id DESC,Notes_Date DESC
   
    SELECT   Notes_ID,Notes_Desc, User_Id, Convert(NVARCHAR(15), Notes_Date, 101) AS Notes_Date, tblNotes.Notes_Type, tblNotesType.NotesType_Id NTID
   FROM       tblNotes  left outer join tblNotesType on tblNotes.Notes_Type=tblNotesType.Notes_Type
    WHERE Case_Id = +@Case_Id  
   ORDER BY Notes_Id DESC,Notes_Date ASC
  
-- END  
  
END
GO
