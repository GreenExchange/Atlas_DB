USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_GetNotesDetails]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_GetNotesDetails]  
(  
@Case_Id nvarchar(100),  
@Notes_Type nvarchar(100),  
@UserType nvarchar(10)  
)  
   
AS  
  
BEGIN  
  
--IF @UserType = 'P'  
  
-- BEGIN  
  
--  IF @Notes_Type <> 'ALL'  
   
--   SELECT   Notes_Desc, User_Id, Convert(NVARCHAR(15), Notes_Date, 101) AS Notes_Date, Notes_Type  
--   FROM       tblNotes where Case_Id = +@Case_Id AND Notes_Type = +@Notes_Type AND Notes_Desc LIKE 'File Viewed%'  
--   ORDER BY Notes_Date desc, Notes_Id Desc  
--  ELSE  
     
--   SELECT   Notes_Desc, User_Id, Convert(NVARCHAR(15), Notes_Date, 101) AS Notes_Date, Notes_Type  
--   FROM       tblNotes where Case_Id = +@Case_Id AND Notes_Desc LIKE 'File Viewed%'  
--   ORDER BY Notes_Date desc, Notes_Id Desc  
  
-- END  
  
--ELSE  
  
-- BEGIN  
   
--  IF @Notes_Type <> 'ALL'  
--   
--   SELECT   Notes_Desc, User_Id, Convert(NVARCHAR(15), Notes_Date, 101) AS Notes_Date, Notes_Type  
--   FROM       tblNotes where Case_Id = +@Case_Id AND Notes_Type = +@Notes_Type  
--   ORDER BY Notes_Date desc, Notes_Id Desc  
--  ELSE  
     
   SELECT   Notes_Desc, User_Id, Convert(NVARCHAR(15), Notes_Date, 101) AS Notes_Date, Notes_Type  
   FROM       tblNotes where Case_Id = +@Case_Id  
   ORDER BY Notes_Id Desc,Notes_Date desc
  
-- END  
  
END
GO
