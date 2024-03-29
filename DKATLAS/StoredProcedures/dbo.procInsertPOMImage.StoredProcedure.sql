USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[procInsertPOMImage]    Script Date: 6/17/2019 2:54:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procInsertPOMImage] --1,'test.pdf','2010\Sep\13','admin','12'
(
 @POM_ID INT,
 @filename varchar(200),
 @filepath varchar(40),
 @userid varchar(40),
 @doctype varchar(40)
)
as
Begin
declare @cid varchar(100)
DECLARE POM_CASE_CURSOR CURSOR FOR
SELECT CASE_ID FROM TBLPOMCASE WHERE POM_ID = @POM_ID

OPEN POM_CASE_CURSOR
FETCH NEXT FROM POM_CASE_CURSOR INTO @cid

WHILE @@FETCH_STATUS = 0
BEGIN

INSERT INTO 
	tblimages
	(
		ImagePath,
		FileName,
		DocumentId,
		Case_Id,
		ScanDate,
		UserId,
		RecordDescriptor,
		DeleteFlag
	)
	VALUES 
	(
		@filepath,
		@filename,
		@doctype,
		@cid,
		getDate(),
		@userid,
		'',
		0
	)

UPDATE TBLCASE SET STATUS='POM-RECEIVED' WHERE CASE_ID=@cid

FETCH NEXT FROM POM_CASE_CURSOR INTO @cid

END

CLOSE POM_CASE_CURSOR
DEALLOCATE POM_CASE_CURSOR

UPDATE TBLPOM SET pom_scan_date = GETDATE(), pom_scan_by = @userid WHERE pom_id = @POM_ID

End
GO
