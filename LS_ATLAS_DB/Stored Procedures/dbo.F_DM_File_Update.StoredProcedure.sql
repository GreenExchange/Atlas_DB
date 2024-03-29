USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[F_DM_File_Update]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_DM_File_Update]  
	@DomainId				NVARCHAR(50),
	@i_a_IMAGEID			INT ,
	@s_a_FILENAME			NVARCHAR(255), 
	@s_a_FILEPATH			NVARCHAR(255),
	@dt_a_revisedDate		DATETIME	,
	@i_a_revisedUserid		INT			,
	@i_a_from_flag			INT	
	
AS
BEGIN 
SET NOCOUNT ON
	IF((SELECT ISNULL(COUNT(*),0) FROM dbo.tblDocImages WHERE IMAGEID=@i_a_IMAGEID AND DomainId	= @DomainId) <> 0)  
	BEGIN  
		UPDATE
			dbo.tblDocImages
		SET
			FILENAME		=	@s_a_FILENAME, 
			FILEPATH		=	@s_a_FILEPATH,
			STATUS			=	1  ,
			Revisededdate	=	@dt_a_revisedDate,
			Revisededuser	=	@i_a_revisedUserid,
			from_flag		=	@i_a_from_flag
		WHERE 
			IMAGEID			=	@i_a_IMAGEID		AND
			DomainId		=	@DomainId

		UPDATE
				dbo.tblImageTag
		SET
				DateModified	=	GETDATE()
		WHERE
				ImageID			=	@i_a_IMAGEID 
				AND @DomainId	=	DomainId
				
				
		DECLARE @i_l_duplicate INT = 0	
		SELECT @i_l_duplicate	=	COUNT(*) FROM  dbo.tbl_ImageTag_Modifiedby	WHERE ImageId	=	@i_a_IMAGEID AND DomainId=@DomainId
		IF(@i_l_duplicate = 0)
		BEGIN
				INSERT INTO dbo.tbl_ImageTag_Modifiedby VALUES(@i_a_IMAGEID,@i_a_revisedUserid,@DomainId)
		END
		ELSE
		BEGIN
				UPDATE
					dbo.tbl_ImageTag_Modifiedby
				SET
					modified_by		=	@i_a_revisedUserid
				WHERE
					ImageId			=	@i_a_IMAGEID AND
					DomainId		=	@DomainId
		END

		SELECT '1' AS result 
	END
	ELSE
	BEGIN
		SELECT '0' AS result 
	END 
		
 SET NOCOUNT OFF
END 
  --select top 10 * from tblImageTag
GO
