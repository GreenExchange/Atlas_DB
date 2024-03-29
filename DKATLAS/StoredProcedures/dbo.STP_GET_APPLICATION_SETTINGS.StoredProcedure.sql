USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[STP_GET_APPLICATION_SETTINGS]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* -----------------------------------------------------------------------------------------------------------------  
 ABBREVIATIONS USED    : START, A-ADD, U-UPDATE, D-DELETE, E-END   
     (E.G. SA1001 FOR START ADDING NEW CONTENTS AND EA1001 FOR END ADDING)  
------------------------------------------------------------------------------------------------------------------  
 NAME OF PROCEDURE  :	DBO.STP_GET_APPLICATION_SETTINGS  
  
 PURPOSE			:	THIS PROCEDURE WILL BE USED TO RETRIEVE APPLICATION SETINGS VALUE FOR  
						SPECIFIED PARAMETER  
  
 DEVELOPED BY		:	ADARSH KR. BAJPAI  
  
 START DATE			:	12 DECEMBER 2007  
  
 PARAMETER(S)		:	(A) INPUT : PARAMETER NAME  
  
						(B) OUTPUT : PARAMETER VALUE  
  
EXECUTION PROCEDURE	: 	DECLARE @PARAMETERVALUE VARCHAR(512)  
     					EXEC STP_GET_APPLICATION_SETTINGS 'TempMailAttachmentFileStoragePath',@PARAMETERVALUE OUT  
     					SELECT @PARAMETERVALUE  
  
-------------------------------------------------- CHANGE HISTORY -------------------------------------------------  
 CHANGE ID CALL NO. CHANGE DATE DEVELOPER'S NAME PURPOSE OF CHANGE  
-------------------------------------------------------------------------------------------------------------------  
   
------------------------------------------------------------------------------------------------------------------*/  
  
CREATE PROCEDURE   [dbo].[STP_GET_APPLICATION_SETTINGS]  
@PARAMETERNAME VARCHAR(50),  
@PARAMETERVALUE VARCHAR(512) OUTPUT  
AS  
  
SET NOCOUNT ON  
BEGIN  
	SET @PARAMETERVALUE=''

 	SELECT @PARAMETERVALUE=PARAMETERVALUE FROM tblAPPLICATIONSETTINGS WHERE UPPER(PARAMETERNAME)=UPPER(@PARAMETERNAME)
END
GO
