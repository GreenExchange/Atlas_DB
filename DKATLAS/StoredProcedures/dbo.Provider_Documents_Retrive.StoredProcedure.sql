USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Provider_Documents_Retrive]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- DROP  PROCEDURE [dbo].[LCJ_GetProviderDocs] 
CREATE PROCEDURE [dbo].[Provider_Documents_Retrive] -- Provider_Documents_Retrive 'localhsot',''
	-- Add the parameters for the stored procedure here
 
	@Provider_Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT (ParameterValue+File_Path+FileName) as File_Path
		, FileName
		, CreatedDate
		, ProviderDoc_Type
		, UserName 
	from Provider_Documents 
	INNER JOIN Provider_Document_Type on Provider_Documents.DocType_ID=Provider_Document_Type.Doc_Id
	LEFT OUTER JOIN IssueTracker_Users on Provider_Documents.CreatedBy=IssueTracker_Users.UserName 
	LEFT OUTER JOIN tblApplicationSettings settings ON ParameterName = 'DocumentUploadLocation' 
	where Provider_Id=@Provider_Id
END

GO
