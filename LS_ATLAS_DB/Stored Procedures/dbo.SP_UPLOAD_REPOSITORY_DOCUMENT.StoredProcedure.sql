USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_UPLOAD_REPOSITORY_DOCUMENT]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UPLOAD_REPOSITORY_DOCUMENT] -- @SZ_USER_ID='39451',@SZ_CASE_ID='FH08-51723',@Flag='DOCUMENTLIST'  
 @DomainId nvarchar(50)=null,
 @I_ID int=null,  
 @SZ_PROCESS_ID nvarchar(150)=null,  
 @SZ_USER_ID nvarchar(50)=null,  
 @SZ_FILENAME nvarchar(500)=null,  
 @DT_UPLOAD_TIME datetime=null,  
 @SZ_NOTES_DESC nvarchar(3000)=null,  
 @FLAG nvarchar(50)=null,  
 @SZ_CAPTION nvarchar(255)=null  
AS  
BEGIN  
	DECLARE @UPLOAD_DOCUMENT_ID INT  
	IF @FLAG='ADD'  
	Begin  
		Insert Into TXN_REPOSITORY_UPLOAD
		(  
			DomainId,
			SZ_PROCESS_ID,  
			SZ_USER_ID,  
			SZ_FILENAME,  
			DT_UPLOAD_TIME,  
			SZ_CAPTION,  
			SZ_NOTES  
		)  
		values  
		(  
			@DomainId,
			@SZ_PROCESS_ID,  
			@SZ_USER_ID,  
			@SZ_FILENAME,  
			getdate(),  
			@SZ_CAPTION,  
			@SZ_NOTES_DESC  
		)  
		END
END

GO
