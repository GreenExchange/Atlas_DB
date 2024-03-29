USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[get_docs_for_azure_upload]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[get_docs_for_azure_upload]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	If Exists(Select * from tblBasePath(NOLOCK) where BasePathType = 2 and  BasePathId = (Select ParameterValue from tblApplicationSettings(NOLOCK) where ParameterName ='BasePathId' ))
	BEGIN
		Select  ImageId, Filename, FilePath, PhysicalBasePath+'\'+FilePath+Filename As PhysicalFilePath, d.BasePathId, BasePathType
		from
		tblDocImages(NOLOCK) d left join tblBasePath(NOLOCK) b on b.BasePathId=d.BasePathId
		where b.BasePathType=1 and d.statusdone is null and DomainId='AF' --and (FilePath like '%Denial%' or FilePath like '%Verification%')
	END
END
GO
