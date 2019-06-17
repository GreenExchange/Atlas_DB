USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[SP_WS_UPLOAD_DOCUMENT]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[SP_WS_UPLOAD_DOCUMENT]  
(  
 @SZ_CASE_ID AS NVARCHAR(20) = NULL,  
 @SZ_COMPANY_ID AS NVARCHAR(20)  = NULL,  
 @SZ_FILE_NAME AS NVARCHAR(500) = NULL,  
 @SZ_FILE_PATH AS NVARCHAR(500) = NULL,  
 @I_TAG_ID AS INT = NULL,  
 @SZ_USER_ID AS INT = NULL,
 @SZ_USER_NAME AS NVARCHAR(100) = NULL,
 @SZ_SCAN_DATE AS DATETIME = NULL
)  
AS
BEGIN  

INSERT INTO tbldocimages(FILENAME,FILEPATH,STATUS)   
VALUES(@SZ_FILE_NAME,@SZ_FILE_PATH,1)  
  
DECLARE @I_IMAGE_ID AS INT  
SET @I_IMAGE_ID = (SELECT MAX(IMAGEID) FROM TBLDOCIMAGES WHERE FilePath=@SZ_FILE_PATH and Filename=@SZ_FILE_NAME)  

IF @SZ_USER_ID IS NULL
BEGIN
	SET @SZ_USER_ID = (SELECT TOP 1 CONVERT(VARCHAR(MAX),pk_user_id) from IRIS.dbo.tbl_user where username=@SZ_USER_NAME)
END

IF @SZ_SCAN_DATE IS NOT NULL
BEGIN
	INSERT INTO TBLIMAGETAG(IMAGEID,TAGID,LOGINID,DateInserted,DateScanned)VALUES(@I_IMAGE_ID,@I_TAG_ID,@SZ_USER_ID,GETDATE(),@SZ_SCAN_DATE)  
END
ELSE
BEGIN
	INSERT INTO TBLIMAGETAG(IMAGEID,TAGID,LOGINID,DateInserted)VALUES(@I_IMAGE_ID,@I_TAG_ID,@SZ_USER_ID,GETDATE())  
END
  
END
GO
