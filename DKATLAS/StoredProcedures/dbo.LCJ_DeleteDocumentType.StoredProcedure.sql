USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DeleteDocumentType]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_DeleteDocumentType]
(

@Doc_Name nvarchar(100)

)


AS

DELETE from tblDocs where Doc_Name = + Rtrim(Ltrim(@Doc_Name))
GO
