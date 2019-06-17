USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_FILE_PATH]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[SP_GET_FILE_PATH] --19471
@NODEID NVARCHAR(200)=NULL
AS
BEGIN

	DECLARE @SZ_PHYSICALPATH NVARCHAR(2000)


	SET @SZ_PHYSICALPATH =(SELECT PARAMETERVALUE FROM TBLAPPLICATIONSETTINGS
	WHERE PARAMETERNAME='DocumentUploadLocationPhysical') 


	SELECT @SZ_PHYSICALPATH +''+ ISNULL(FILEPATH,'') FROM TBLDOCIMAGES
	where imageid=@NODEID--(substring(@NODEID,5,len(@NODEID)))
	
END
GO
