USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[STP_DSP_BULKIMAGEFILEPATH]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* -----------------------------------------------------------------------------------------------------------------
/ ABBREVIATIONS USED  		:	START, A-ADD, U-UPDATE, D-DELETE, E-END 
/								(E.G. SA1001 FOR START ADDING NEW CONTENTS AND EA1001 FOR END ADDING)
/------------------------------------------------------------------------------------------------------------------
/ NAME OF PROCEDURE		:	DBO.[STP_DSP_BULKIMAGEFILEPATH]
/ PURPOSE				:	THIS PROCEDURE WILL RETURN LIST OF ALL IMAGE/FILES ASSOCIATED WITH THE GIVEN TAG
/ START DATE			: 	12 DECEMBER 2007
/ REVIEWED BY			:	
/ REVIEW DATE			:	
/ PARAMETER(S)			:	(A) INPUT	: TAG ID
/									  											
/							(B) OUTPUT	: RESULTSET CONTAINING FILE NAME AND FILEPATH
/
/ EXECUTION PROCEDURE	:	STP_DSP_BULKIMAGEFILEPATH 21
							
/-------------------------------------------------- CHANGE HISTORY -------------------------------------------------
/ CHANGE ID	CALL NO.	CHANGE DATE	DEVELOPER'S NAME	PURPOSE OF CHANGE
/-------------------------------------------------------------------------------------------------------------------
/ 
/------------------------------------------------------------------------------------------------------------------*/
CREATE PROCEDURE   [dbo].[STP_DSP_BULKIMAGEFILEPATH] 
	@TAGID AS INT

AS
SET NOCOUNT ON
DECLARE @BASEFOLDER AS NVARCHAR(255)

BEGIN
	SELECT @BASEFOLDER=PARAMETERVALUE FROM tblApplicationSettings WHERE PARAMETERNAME='DocumentUploadLocation'

	SELECT I.FILENAME,@BASEFOLDER+I.FILEPATH, I.IMAGEID FROM TBLIMAGETAG T
	INNER JOIN TBLDOCIMAGES I  ON I.IMAGEID=T.IMAGEID
	WHERE T.TAGID=@TAGID

END
GO
