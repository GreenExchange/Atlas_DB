USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Insert_Associated_Pdf_Notes]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_Associated_Pdf_Notes]
@File_Name varchar(5000),
@File_Path varchar(5000),
@Page_Number int,
@Case_Id	varchar(200),
@AssociatedBy	varchar(200)
AS
BEGIN
INSERT INTO [dbo].[Associated_Pdf_Notes]
           ([File_Name]
           ,[File_Path]
           ,[Page_Number]
           ,[Case_Id]
           ,[DateAssociated]
           ,[AssociatedBy])
     VALUES
           (@File_Name,
		   @File_Path,
		   @Page_Number,
		   @Case_Id,
		   GETDATE(),
		   @AssociatedBy)
END
GO
