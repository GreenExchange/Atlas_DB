USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Get_Associated_PDF_Notes]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_Associated_PDF_Notes]
	@File_Name varchar(5000),
	@File_Path varchar(5000)
AS
BEGIN
SELECT [Pdf_ID]
      ,[File_Name]
      ,[File_Path]
      ,[Page_Number]
      ,[Case_Id]
      ,[DateAssociated]
      ,[AssociatedBy]
  FROM [dbo].[Associated_Pdf_Notes]
  where File_Name=@File_Name
  and File_Path=@File_Path
  order by Page_Number,Case_Id
END
GO
