USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[STP_UID_ASSOCIATESCANNEDIMAGES]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* -----------------------------------------------------------------------------------------------------------------  
/ ABBREVIATIONS USED    : START, A-ADD, U-UPDATE, D-DELETE, E-END   
/        (E.G. SA1001 FOR START ADDING NEW CONTENTS AND EA1001 FOR END ADDING)  
/------------------------------------------------------------------------------------------------------------------  
/ NAME OF PROCEDURE  : DBO.STP_UID_ASSOCIATESCANNEDIMAGES  
/ PURPOSE    : THIS STORED PROCEDURE TAGS SCANNED IMAGES WITH THE GIVEN CASE  
/ DEVELOPED BY   : ADARSH KR. BAJPAI  
/ START DATE   :  18 FEBRUARY 2008  
/  
/ PARAMETER(S)   : (A) INPUT : CASEID NVARCHAR(255)  
           DOCUMENTTYPEID INT  
/       (B) OUTPUT : N.A.  
/  
/ EXECUTION PROCEDURE : EXEC STP_UID_ASSOCIATESCANNEDIMAGES 3,'2' ,3, 'Intake Sheet', '_0614152207_003.tif', 'XXX'  
         
  
/-------------------------------------------------- CHANGE HISTORY -------------------------------------------------  
/ CHANGE ID CALL NO. CHANGE DATE DEVELOPER'S NAME PURPOSE OF CHANGE  
/-------------------------------------------------------------------------------------------------------------------  
/   
/------------------------------------------------------------------------------------------------------------------*/  
  
CREATE PROCEDURE  [dbo].[STP_UID_ASSOCIATESCANNEDIMAGES]  
@SCANNEDIMAGEID INT,  
@CASEID NVARCHAR(255),  
@DOCUMENTTYPEID INT,  
@DOCUMENTNAME NVARCHAR(255),  
@FILENAME NVARCHAR(255),  
@LOGINID AS NVARCHAR(255)  
  
AS  
  
DECLARE @PATH AS NVARCHAR(255)  
DECLARE @NODEID AS INT  
DECLARE @IMAGEID AS INT  
  
BEGIN  
 SET @NODEID=0  
 --SELECT @NODEID=ISNULL(NODEID,0) FROM TBLTAGS WHERE CASEID=(SELECT ID FROM TBLCASE WHERE CASEID=@CASEID) AND NODENAME=@DOCUMENTNAME  
 SELECT @NODEID=ISNULL(NODEID,0) FROM TBLTAGS WHERE CASEID=@CASEID AND NODENAME=@DOCUMENTNAME  
   
 print @NODEID  
  
 IF @NODEID<>0  
 BEGIN  
  
  BEGIN TRANSACTION  
    
  EXEC STP_DSP_NODEROOTPATH @NODEID, @PATH OUT  
  
  print @PATH  
  
  IF @@ERROR<>0  
  BEGIN   
   ROLLBACK TRANSACTION  
   RETURN  
  END  
  
  INSERT INTO TBLDOCIMAGES(FILENAME, FILEPATH,STATUS, OCRDATA)  
     VALUES (@FILENAME, @PATH,1, NULL)  
  
  IF @@ERROR<>0  
  BEGIN   
   ROLLBACK TRANSACTION  
   RETURN  
  END  
  
  SET @IMAGEID=@@IDENTITY  
  
  INSERT INTO TBLIMAGETAG(IMAGEID, TAGID, LOGINID)  
     VALUES (@IMAGEID, @NODEID, @LOGINID)  
  
  IF @@ERROR<>0  
  BEGIN   
   ROLLBACK TRANSACTION  
   RETURN  
  END  
  
  UPDATE TBLSCANNEDIMAGES SET CASE_ID=@CASEID, DOCUMENTID=@DOCUMENTTYPEID WHERE IMAGEID=@SCANNEDIMAGEID  
  
  IF @@ERROR<>0  
  BEGIN   
   ROLLBACK TRANSACTION  
   RETURN  
  END  
    
  COMMIT TRANSACTION  
 END  
END  
    
--SELECT * FROM TBLSCANNEDIMAGES  
--SELECT * FROM TBLIMAGETAG  
--SELECT * FROM TBLDOCIMAGES  
--SELECT * FROM TBLTAGS
GO
