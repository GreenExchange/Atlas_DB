USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_UPLOAD_DOCUMENT_FOR_DELETE]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UPLOAD_DOCUMENT_FOR_DELETE]  -- @SZ_CASE_ID = 'F', @SZ_PROCESS_ID='PROC-001',@Flag='DOCUMENTLIST_FOR_DELETE'
@DomainId nvarchar(50),
@I_ID int=null,
@SZ_PROCESS_ID nvarchar(20)=null,
@SZ_USER_ID nvarchar(50)=null,
@SZ_FILENAME nvarchar(500)=null,
@DT_UPLOAD_TIME datetime=null,
@SZ_CASE_ID nvarchar(50)=null,
@SZ_NOTES_DESC nvarchar(3000)=null,
@FLAG nvarchar(50)=null
	
AS
BEGIN

	

	IF @FLAG='DELETE'
	BEGIN
		
	-- BACKUP LOGIC
		   INSERT INTO H_tblNotes
		   SELECT Notes_ID, Notes_Desc,	Notes_Type,	Notes_Priority,	Case_Id,	Notes_Date,	User_Id,	DomainId FROM TBLNOTES
		   WHERE  Notes_ID = ( SELECT I_NOTES_ID FROM TXN_DOCUMENT_UPLOAD WHERE I_ID = @I_ID AND DomainId = @DomainId)


			INSERT INTO H_TXN_DOCUMENT_UPLOAD
			SELECT TXN_DOCUMENT_UPLOAD.*,GETDATE(),@SZ_USER_ID FROM TXN_DOCUMENT_UPLOAD AS TXN_DOCUMENT_UPLOAD
			WHERE I_ID = @I_ID AND DomainId = @DomainId

	   --- DELETE LOGIC

		   DELETE FROM TBLNOTES
		   WHERE  Notes_ID = ( SELECT I_NOTES_ID FROM TXN_DOCUMENT_UPLOAD WHERE I_ID = @I_ID AND DomainId = @DomainId)
	 		
		   DELETE FROM TXN_DOCUMENT_UPLOAD
		   WHERE I_ID = @I_ID AND DomainId = @DomainId

	END

	IF @FLAG='REVERT'
	BEGIN
		
	-- BACKUP LOGIC

		SET IDENTITY_INSERT TXN_DOCUMENT_UPLOAD  ON
		 
		   INSERT INTO TXN_DOCUMENT_UPLOAD 
		   (DomainId, I_ID,SZ_PROCESS_ID,SZ_USER_ID,SZ_FILENAME,DT_UPLOAD_TIME,SZ_CASE_ID,I_NOTES_ID)	
		    SELECT DomainId, I_ID,SZ_PROCESS_ID,SZ_USER_ID,SZ_FILENAME,DT_UPLOAD_TIME,SZ_CASE_ID,I_NOTES_ID 
			FROM H_TXN_DOCUMENT_UPLOAD
		    WHERE I_ID = @I_ID AND DomainId = @DomainId		

		SET IDENTITY_INSERT TXN_DOCUMENT_UPLOAD  OFF

		SET IDENTITY_INSERT TBLNOTES  ON

		   INSERT INTO TBLNOTES
		   (DomainId, Notes_ID,Notes_Desc,Notes_Type,Notes_Priority,Case_Id,Notes_Date,User_Id)	
		   SELECT DomainId, Notes_ID,Notes_Desc,Notes_Type,Notes_Priority,Case_Id,Notes_Date,User_Id 
			FROM  H_tblNotes
		   WHERE  Notes_ID = ( SELECT I_NOTES_ID FROM TXN_DOCUMENT_UPLOAD WHERE I_ID = @I_ID AND DomainId = @DomainId)

		SET IDENTITY_INSERT TBLNOTES  OFF

	   --- DELETE LOGIC

		   DELETE FROM H_tblNotes
		   WHERE  Notes_ID = ( SELECT I_NOTES_ID FROM TXN_DOCUMENT_UPLOAD WHERE I_ID = @I_ID AND DomainId = @DomainId)
	 		
		   DELETE FROM H_TXN_DOCUMENT_UPLOAD
		   WHERE I_ID = @I_ID
		   AND DomainId = @DomainId

	END

	IF @FLAG='DOCUMENTLIST_FOR_DELETE'
	BEGIN
		Declare @szPath As varchar(100)
		set @szPath = ( select ParameterValue from tblapplicationsettings 
					where ParameterName='MapUploadFileLocation')
		Begin
			Select 	TXN_DOCUMENT_UPLOAD.DomainId, I_ID,SZ_PROCESS_NAME,
				'<a href="http://fhkp-nofault'+@szPath+SZ_FILENAME+'">'+SZ_FILENAME+'</a>' [FileName],
				SZ_USER_ID,
				NOTES_DESC,
				DT_UPLOAD_TIME [DT_UPLOAD_TIME]
			From TXN_DOCUMENT_UPLOAD AS TXN_DOCUMENT_UPLOAD,TBLNOTES AS TBLNOTES,MST_PROCESS AS MST_PROCESS
			WHERE TXN_DOCUMENT_UPLOAD.I_NOTES_ID = TBLNOTES.Notes_ID AND
				  TXN_DOCUMENT_UPLOAD.SZ_PROCESS_ID=MST_PROCESS.SZ_PROCESS_CODE AND
				  TXN_DOCUMENT_UPLOAD.SZ_CASE_ID like +'%' + 	@SZ_CASE_ID + '%' 
				  AND TXN_DOCUMENT_UPLOAD.SZ_PROCESS_ID = @SZ_PROCESS_ID
			ORDER BY DT_UPLOAD_TIME DESC
		End
	END
END

GO
