USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[STP_UID_IMAGESTAGS]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* -----------------------------------------------------------------------------------------------------------------  
/ ABBREVIATIONS USED    : START, A-ADD, U-UPDATE, D-DELETE, E-END   
/        (E.G. SA1001 FOR START ADDING NEW CONTENTS AND EA1001 FOR END ADDING)  
/------------------------------------------------------------------------------------------------------------------  
/ NAME OF PROCEDURE  : DBO.STP_UID_IMAGESTAGS  
/ PURPOSE    : INSERTS/UPDATES/DELETS IMAGES TAGS MAPPING DATA INTO TBLIMAGE_TAGS  
/ DEVELOPED BY   : ADARSH KR. BAJPAI  
/ START DATE   :  11 DECEMBER 2007  
/  
/ PARAMETER(S)   : (A) INPUT : IMAGEID   
/             TAGID  
  
/       (B) OUTPUT : N.A.  
/  
/ EXECUTION PROCEDURE :   
  
/-------------------------------------------------- CHANGE HISTORY -------------------------------------------------  
/ CHANGE ID CALL NO. CHANGE DATE DEVELOPER'S NAME PURPOSE OF CHANGE  
/-------------------------------------------------------------------------------------------------------------------  
/   
/------------------------------------------------------------------------------------------------------------------*/  
  
  
CREATE PROCEDURE [dbo].[STP_UID_IMAGESTAGS]  
@DomainId NVARCHAR(50),
@IMAGEID INT ,  
@TAGID INT,  
@LOGINID VARCHAR(20),  
@OPERATION CHAR(6)  
  
AS  
  
IF @OPERATION='INSERT'  
BEGIN  
 INSERT INTO TBLIMAGETAG    
    (DomainId,IMAGEID, TAGID,LoginID,DATEINSERTED)  
  VALUES (@DomainId,@IMAGEID, @TAGID,@LOGINID,GETDATE())  
 IF(@@ERROR>0)  
 BEGIN  
  RAISERROR('AN ERROR HAS OCCURED WHILE SAVING DATA', 16, 1)  
  RETURN  
 END  
  
 SET @IMAGEID=SCOPE_IDENTITY()  
END  
  
IF @OPERATION='UPDATE'  
BEGIN  
 UPDATE TBLIMAGETAG   
  SET TAGID=@TAGID,  
   LOGINID=@LOGINID,  
   DATEMODIFIED=GETDATE()  
  WHERE IMAGEID=@IMAGEID
  AND DomainId = @DomainId
   
 IF(@@ERROR>0)  
 BEGIN  
  RAISERROR('AN ERROR HAS OCCURED WHILE UPDATING DATA', 16, 1)  
  RETURN  
 END  
END  
  
IF @OPERATION='DELETE'  
BEGIN  
 DELETE FROM TBLIMAGETAG   
  WHERE IMAGEID=@IMAGEID AND TAGID=@TAGID  and DomainId=@DomainId
   
 IF(@@ERROR>0)  
 BEGIN  
  RAISERROR('AN ERROR HAS OCCURED WHILE DELETING DATA', 16, 1)  
  RETURN  
 END  
END

GO
