USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[SP_UPLOAD_DOCUMENT]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UPLOAD_DOCUMENT] -- @SZ_USER_ID='39451',@SZ_CASE_ID='FH08-51723',@Flag='DOCUMENTLIST'
@I_ID int=null,
@SZ_PROCESS_ID nvarchar(150)=null,
@SZ_USER_ID nvarchar(50)=null,
@SZ_FILENAME nvarchar(500)=null,
@DT_UPLOAD_TIME datetime=null,
@SZ_CASE_ID nvarchar(50)=null,
@SZ_NOTES_DESC nvarchar(3000)=null,
@FLAG nvarchar(50)=null,
@SZ_CAPTION nvarchar(255)=null

AS
BEGIN
DECLARE @UPLOAD_DOCUMENT_ID INT
	IF @FLAG='ADD'
	Begin
		-- CHECK FOR ALREADY EXIST
		DECLARE @TEMP_NOTE_ID AS INT
		DECLARE @TEMP_I_ID AS INT

		SELECT @TEMP_I_ID = I_ID ,
			   @TEMP_NOTE_ID=I_NOTES_ID 
		FROM   TXN_DOCUMENT_UPLOAD
		WHERE  --SZ_USER_ID = @SZ_USER_ID AND
			   SZ_PROCESS_ID = @SZ_PROCESS_ID AND
			   SZ_CASE_ID = @SZ_CASE_ID AND
			   SZ_FILENAME = @SZ_FILENAME
						  

		IF @TEMP_I_ID > 0
		BEGIN 
			-- UPDATE NOTES DESCRIPTION FROM TBLNOTES
			UPDATE TBLNOTES
			SET NOTES_DESC = @SZ_NOTES_DESC , NOTES_DATE = GETDATE() , User_Id=@SZ_USER_ID
			WHERE NOTES_ID = @TEMP_NOTE_ID
			-- UPDATE UPLOADED DATE AND TIME FROM TXN_DOCUMENT_UPLOAD
			UPDATE TXN_DOCUMENT_UPLOAD
			SET DT_UPLOAD_TIME = GETDATE() , SZ_USER_ID = @SZ_USER_ID,SZ_CAPTION = @SZ_CAPTION
			WHERE I_ID = @TEMP_I_ID
		END
		-- End of Check
		ELSE
		BEGIN
		
			Insert Into dbo.tblNotes
			(
				Notes_Desc,
				Case_Id,
				Notes_Date,
				User_Id,
				Notes_Type,
				Notes_Priority 
				
			)
			values
			(
				@SZ_NOTES_DESC,
				@SZ_CASE_ID,
				getdate(),
				@SZ_USER_ID,
				'Activity',
				'0'
			)
		
			
			SET @UPLOAD_DOCUMENT_ID = ( SELECT MAX(Notes_ID) FROM dbo.tblNotes )

			Insert Into TXN_DOCUMENT_UPLOAD
				(
					SZ_PROCESS_ID,
					SZ_USER_ID,
					SZ_FILENAME,
					DT_UPLOAD_TIME,
					SZ_CASE_ID,
					I_NOTES_ID,
					SZ_CAPTION
				)
				values
				(
					@SZ_PROCESS_ID,
					@SZ_USER_ID,
					@SZ_FILENAME,
					getdate(),
					@SZ_CASE_ID,
					@UPLOAD_DOCUMENT_ID,
					@SZ_CAPTION
				)
			End
		END


	IF @FLAG='DOCUMENTLIST'
	BEGIN
		Declare @szPath As varchar(100)
		set @szPath = ( select ParameterValue from tblapplicationsettings 
					where ParameterName='MapUploadFileLocation')
		Declare @szHyperLink As varchar(100)
		IF EXISTS (select * from IssueTracker_Users where (usertype = 'OSS' OR UserName like 'la-%' or UserName like 'tech')  and UserName = @SZ_USER_ID)
			SET @szHyperLink = 'http://nofault.fhkplaw.com'
		ELSE
			SET @szHyperLink = 'http://fhkp-nofault1'
		
		

		Begin
			Select 	SZ_PROCESS_NAME,
				'<a href="'+@szHyperLink+@szPath+SZ_FILENAME+'">'+SZ_FILENAME+'</a>' [FileName],
				SZ_USER_ID,
				NOTES_DESC,
				DT_UPLOAD_TIME [DT_UPLOAD_TIME],
				SZ_CAPTION
			From TXN_DOCUMENT_UPLOAD,TBLNOTES,MST_PROCESS
			WHERE TXN_DOCUMENT_UPLOAD.I_NOTES_ID = TBLNOTES.Notes_ID AND
				  TXN_DOCUMENT_UPLOAD.SZ_PROCESS_ID=MST_PROCESS.SZ_PROCESS_CODE AND
				  TXN_DOCUMENT_UPLOAD.SZ_CASE_ID = 	@SZ_CASE_ID
			ORDER BY DT_UPLOAD_TIME DESC
		End
	END
END
GO
