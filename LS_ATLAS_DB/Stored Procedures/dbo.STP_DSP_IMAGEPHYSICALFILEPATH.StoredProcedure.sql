USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[STP_DSP_IMAGEPHYSICALFILEPATH]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[STP_DSP_IMAGEPHYSICALFILEPATH] --'24770'
	@DomainId nvarchar(50),
	@IMAGEID AS VARCHAR(200)
AS
SET NOCOUNT ON

DECLARE @BASEFOLDER AS NVARCHAR(255)
DECLARE @FILEPATH AS VARCHAR(MAX)

BEGIN

	--SELECT @BASEFOLDER=PARAMETERVALUE FROM tblApplicationSettings  WHERE PARAMETERNAME='DocumentUploadLocationPhysical' and DomainId=@DomainId
	--print(@BASEFOLDER)
	
	--print(@FILEPATH)

	------------------For  Physical File
	--SELECT  B.PhysicalBasePath +FILEPATH + FILENAME as [InputFilePath] FROM tblDocImages I Left Join tblBasePath B ON B.BasePathId=I.BasePathId
	--WHERE IMAGEID=@IMAGEID and DomainId=@DomainId

	----------------------For Azure File
    SELECT FILEPATH + FILENAME as [InputFilePath],I.BasePathId FROM tblDocImages I Left Join tblBasePath B ON B.BasePathId=I.BasePathId
	WHERE IMAGEID=@IMAGEID and DomainId=@DomainId

	


END

GO
