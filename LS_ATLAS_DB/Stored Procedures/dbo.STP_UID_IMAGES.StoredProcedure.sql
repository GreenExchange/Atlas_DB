USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[STP_UID_IMAGES]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* -----------------------------------------------------------------------------------------------------------------  
/ ABBREVIATIONS USED    : START, A-ADD, U-UPDATE, D-DELETE, E-END   
/        (E.G. SA1001 FOR START ADDING NEW CONTENTS AND EA1001 FOR END ADDING)  
/------------------------------------------------------------------------------------------------------------------  
/ NAME OF PROCEDURE  : DBO.STP_UID_IMAGES  
/ PURPOSE    : INSERTS/UPDATES/DELETS IMAGES DATA INTO TBLDOCIMAGES  
/ DEVELOPED BY   : ADARSH KR. BAJPAI  
/ START DATE   :  11 DECEMBER 2007  
/  
/ PARAMETER(S)   : (A) INPUT : IMAGEID   
/             FILE NAME  
           FILE PATH  
           OCRDATA  
/       (B) OUTPUT : IMAGEID  
/  
/ EXECUTION PROCEDURE  : EXEC STP_DSP_ROLEMASTER '','CUSTOMER'  
  
/-------------------------------------------------- CHANGE HISTORY -------------------------------------------------  
/ CHANGE ID CALL NO. CHANGE DATE DEVELOPER'S NAME PURPOSE OF CHANGE  
/-------------------------------------------------------------------------------------------------------------------  
/   
/------------------------------------------------------------------------------------------------------------------*/  
  
CREATE PROCEDURE [dbo].[STP_UID_IMAGES]  
@IMAGEID INT OUTPUT,  
@FILENAME NVARCHAR(255),  
@FILEPATH NVARCHAR(255),  
@OCRDATA TEXT,  
@STATUS BIT,  
@OPERATION CHAR(6)  
  
AS  
  
IF @OPERATION='INSERT'  
BEGIN  
 INSERT INTO TBLDOCIMAGES   
    (FILENAME, FILEPATH,OCRDATA, STATUS)  
  VALUES (@FILENAME, @FILEPATH, @OCRDATA, @STATUS)  
 IF(@@ERROR>0)  
 BEGIN  
  RAISERROR('AN ERROR HAS OCCURED WHILE SAVING DATA', 16, 1)  
  RETURN  
 END  
  
 SET @IMAGEID=SCOPE_IDENTITY()  
END  
  
IF @OPERATION='UPDATE'  
BEGIN  
 UPDATE TBLDOCIMAGES  
  SET FILENAME=@FILENAME,   
   FILEPATH=@FILEPATH,  
   OCRDATA=@OCRDATA,   
   STATUS=@STATUS  
  WHERE IMAGEID=@IMAGEID  
   
 IF(@@ERROR>0)  
 BEGIN  
  RAISERROR('AN ERROR HAS OCCURED WHILE UPDATING DATA', 16, 1)  
  RETURN  
 END  
END  
  
IF @OPERATION='DELETE'  
BEGIN  
 DELETE FROM TBLDOCIMAGES  
  WHERE IMAGEID=@IMAGEID  
   
 IF(@@ERROR>0)  
 BEGIN  
  RAISERROR('AN ERROR HAS OCCURED WHILE DELETING DATA', 16, 1)  
  RETURN  
 END  
END

GO
