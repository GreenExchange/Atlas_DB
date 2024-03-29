USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[BX_SPROC_IMAGE_MOVE_SINGLE]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BX_SPROC_IMAGE_MOVE_SINGLE] 
	
	@IMAGEID INT,@documentid int, @new_documentid	 INT
AS
declare @imagepath nvarchar(255),@filename nvarchar(100),@case_id int,@scandate smalldatetime,@userid VARCHAR(50),
@recorddescriptor varchar(220), @deleteflag int , @page_count int , @notes nvarchar(100),@ACCT_IMAGE BIT,@ACCT_ID INT ,@BILL_ID INT
BEGIN
	
	SET NOCOUNT ON;



SELECT @IMAGEPATH=IMAGEPATH,@FILENAME=FILENAME,@CASE_ID=CASE_ID,@SCANDATE=SCANDATE,@USERID = USERID,
@RECORDDESCRIPTOR=RECORDDESCRIPTOR , @PAGE_COUNT =PAGE_COUNT , @NOTES=NOTES ,@ACCT_IMAGE=ACCT_IMAGE,@ACCT_ID=ACCT_ID,@BILL_ID=BILL_ID
FROM BX_IMAGES WHERE  IMAGEID = @IMAGEID  AND  DOCUMENTID=@DOCUMENTID


SET @NOTES = @NOTES +'MOVED TO '+ CONVERT(VARCHAR(20),@NEW_DOCUMENTID)+'|||'


UPDATE BX_IMAGES
SET DELETEFLAG = 1 , NOTES = @NOTES
FROM BX_IMAGES WHERE  IMAGEID = @IMAGEID AND DOCUMENTID=@DOCUMENTID

SET @NOTES = 'OLD IMG/DOC ID:'+CONVERT(VARCHAR(20),@IMAGEID)+'/'+CONVERT(VARCHAR(20),@DOCUMENTID)+'|||'

INSERT INTO BX_IMAGES (IMAGEPATH,FILENAME,DOCUMENTID,CASE_ID,SCANDATE,USERID,RECORDDESCRIPTOR,PAGE_COUNT,NOTES,COPIED,ACCT_IMAGE ,ACCT_ID  ,BILL_ID)
VALUES (@IMAGEPATH,@FILENAME,@NEW_DOCUMENTID,@CASE_ID,@SCANDATE,@USERID,@RECORDDESCRIPTOR,@PAGE_COUNT,@NOTES,'1',@ACCT_IMAGE ,@ACCT_ID ,@BILL_ID)









END
GO
