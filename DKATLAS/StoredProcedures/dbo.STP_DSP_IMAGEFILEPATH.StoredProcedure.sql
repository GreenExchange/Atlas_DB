USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[STP_DSP_IMAGEFILEPATH]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* -----------------------------------------------------------------------------------------------------------------
/ ABBREVIATIONS USED  		:	START, A-ADD, U-UPDATE, D-DELETE, E-END 
/								(E.G. SA1001 FOR START ADDING NEW CONTENTS AND EA1001 FOR END ADDING)
/------------------------------------------------------------------------------------------------------------------
/ NAME OF PROCEDURE		:	DBO.[STP_DSP_IMAGEFILEPATH]
/ PURPOSE				:	THIS PROCEDURE WILL RETURN IMAGEID AND FILEPATH ASSOCIATED TO A NODE
/ DEVELOPED BY			:	BHILENDRA YEDE
/ START DATE			: 	12 DECEMBER 2007
/ REVIEWED BY			:	
/ REVIEW DATE			:	
/ PARAMETER(S)			:	(A) INPUT	: IMAGE ID
/									  											
/							(B) OUTPUT	: FILE PATH
/
/ EXECUTION PROCEDURE	:	DECLARE @FILEPATH AS NVARCHAR(255)
							EXEC STP_DSP_IMAGEFILEPATH 14, @FILEPATH OUT
							SELECT @FILEPATH
/-------------------------------------------------- CHANGE HISTORY -------------------------------------------------
/ CHANGE ID	CALL NO.	CHANGE DATE	DEVELOPER'S NAME	PURPOSE OF CHANGE
/-------------------------------------------------------------------------------------------------------------------
/ 
/------------------------------------------------------------------------------------------------------------------*/
CREATE PROCEDURE   [dbo].[STP_DSP_IMAGEFILEPATH] --'24770','C:'
	@IMAGEID AS INT ,
	@FILEPATH AS NVARCHAR(255) OUTPUT

AS
SET NOCOUNT ON

DECLARE @BASEFOLDER AS NVARCHAR(255)

BEGIN

	SELECT @BASEFOLDER=PARAMETERVALUE FROM tblApplicationSettings WHERE PARAMETERNAME='DocumentUploadLocation'

	SELECT @FILEPATH=@BASEFOLDER+FILEPATH + FILENAME FROM TBLDOCIMAGES WHERE IMAGEID=@IMAGEID
	--print(@FILEPATH)

END
GO
